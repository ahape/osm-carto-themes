var fs = require('fs'),
    path = require('path'),
    Tile = require('./Tile.js').Tile,
    MetatileBasedTile = require('./MetatileBasedTile.js').Tile;
var TILEPREFIX = 'tile';

class ProjectServer {
    constructor(project, parent) {
        this.project = project;
        this.parent = parent;
        this._pollQueue = [];
        var self = this,
            onChange = function (type, filename) {
                if (filename) {
                    if (filename.indexOf('.') === 0) return;
                    self.project.config.log('File', filename, 'changed on disk');
                }
                self.addToPollQueue({isDirty: true});
            };
        this.project.when('loaded', function () {
            try {
                self.initMapPools();
            } catch (err) {
                console.log(err.message);
                self.addToPollQueue({error: err.message});
            }
            fs.watch(self.project.filepath, onChange);
            for (var style of self.project.mml.Stylesheet) {
                fs.watch(path.join(project.root, style.id), onChange);
            }
        });
        this.project.load();
    };

    serve(uri, req, res) {
        var urlpath = uri.pathname,
            els = urlpath.split('/'),
            self = this;
        if (!urlpath) this.parent.redirect(this.project.getUrl(), res);
        else if (urlpath === '/') this.main(res);
        else if (urlpath === '/config/') this.config(res);
        else if (urlpath === '/poll/') this.poll(res);
        else if (urlpath === '/reload/') this.reload(res);
        else if (this.parent.hasProjectRoute(urlpath)) this.parent.serveProjectRoute(urlpath, uri, req, res, this.project);
        else if (els[1] === TILEPREFIX && els.length === 5) this.project.when('loaded', function tile () {self.serveTile(els[2], els[3], els[4], res, uri.query);});
        else this.parent.notFound(urlpath, res);
    };

    serveTile(z, x, y, res, query) {
        y = y.split('.');
        y = y[0];
        try {
            this.tile(z, x, y, res);
        } catch (err) {
            this.raise('Project not loaded properly.', res);
        }
    };

    tile(z, x, y, res) {
        var self = this,
            mapScale = this.project.mml.scale || 1,
            size = this.project.tileSize();
        this.mapPool.acquire(function (err, map) {
            var release = function () {self.mapPool.release(map);};
            if (err) return self.raise(err.message, res);
            var tileClass = self.project.metatile() === 1 ? Tile : MetatileBasedTile;
            var tile = new tileClass(z, x, y, {size: size, metatile: self.project.metatile(), mapScale: mapScale});
            return tile.render(self.project, map, function (err, im) {
                if (err) return self.raise(err.message, res, release);
                im.encode('png', (function (err, buffer) {
                    if (err) return self.raise(err.message, res, release);
                    res.writeHead(200, {'Content-Type': 'image/png', 'Content-Length': buffer.length});
                    res.write(buffer);
                    res.end();
                    release();
                }).bind(im));
            });
        });
    };

    config(res) {
        res.writeHead(200, {
            'Content-Type': 'application/javascript'
        });
        var tpl = 'L.K.Config.project = %;';
        res.write(tpl.replace('%', JSON.stringify(this.project.toFront())));
        res.end();
    };

    main(res) {
        var js = this.project.config._js.reduce(function(a, b) {
            return a + '<script src="' + b + '"></script>\n';
        }, '');
        var css = this.project.config._css.reduce(function(a, b) {
            return a + '<link rel="stylesheet" href="' + b + '" />\n';
        }, '');
        fs.readFile(path.join(kosmtik.src, 'front/project.html'), {encoding: 'utf8'}, function(err, data) {
            if(err) throw err;
            data = data.replace('%%JS%%', js);
            data = data.replace('%%CSS%%', css);
            res.writeHead(200, {
                'Content-Type': 'text/html',
                'Content-Length': data.length
            });
            res.end(data);
        });
    };

    addToPollQueue(message) {
        if (this._pollQueue.indexOf(message) === -1) this._pollQueue.push(message);
    };

    raise(message, res, cb) {
        console.trace();
        console.log(message);
        if (message) this.addToPollQueue({error: message});
        res.writeHead(500);
        res.end();
        if (cb) cb();
    };

    poll(res) {
        var data = '', len;
        if (this._pollQueue.length) {
            data = JSON.stringify(this._pollQueue);
            this._pollQueue = [];
        }
        len = Buffer.byteLength(data, 'utf8');
        res.writeHead(len ? 200 : 204, {
            'Content-Type': 'application/json',
            'Content-Length': len,
            'Cache-Control': 'private, no-cache, must-revalidate'
        });
        res.end(data);
    };

    reload(res) {
        var self = this;
        try {
            this.project.reload();
        } catch (err) {
            return this.raise(err.message, res);
        }
        this.project.when('loaded', function () {
            self.mapPool.drain(function() {
                self.mapPool.destroyAllNow();
            });
            try {
                self.initMapPools();
            } catch (err) {
                return self.raise(err.message, res);
            }
            res.writeHead(200, {
                'Content-Type': 'application/json'
            });
            res.end(JSON.stringify(self.project.toFront()));
        });
    };

    initMapPools() {
        this.mapPool = this.project.createMapPool();
    };
}

exports = module.exports = { ProjectServer };
