L.Kosmtik.Map = L.Map.extend({

    options: {
        attributionControl: false
    },

    initialize: function (options) {
        options = L.extend({
            center: L.K.Config.project.center,
            zoom: L.K.Config.project.zoom
        }, options);
        L.Map.prototype.initialize.call(this, 'map', options);
        var tilelayerOptions = {
            version: L.K.Config.project.loadTime,
            tileSize: L.K.Config.project.tileSize,
            minZoom: L.K.Config.project.minZoom,
            maxZoom: L.K.Config.project.maxZoom
        };
        this.tilelayer = new L.TileLayer('./tile/{z}/{x}/{y}.png?t={version}', tilelayerOptions).addTo(this);
        this.tilelayer.on('loading', function () { this.setState('loading'); }, this);
        this.tilelayer.on('load', function () { this.unsetState('loading'); }, this);
        L.control.scale().addTo(this);
        this.alert = new L.K.Alert(this);
        this.initPoller();
        if (L.K.Config.project.name.length) document.title = L.K.Config.project.name + ' — Kosmtik';
    },

    setState: function (state) {
        if (!L.DomUtil.hasClass(document.body, state)) {
            L.DomUtil.addClass(document.body, state);
            this.fire(state + ':on');
        }
    },

    unsetState: function (state) {
        if (L.DomUtil.hasClass(document.body, state)) {
            L.DomUtil.removeClass(document.body, state);
            this.fire(state + ':off');
        }
    },

    reload: function () {
        this.setState('loading');
        this.fire('reload');
        L.K.Xhr.post('./reload/', {
            callback: function (status, data) {
                if (status === 200 && data) {
                    L.K.Config.project = JSON.parse(data);
                    this.tilelayer.options.version = L.K.Config.project.loadTime;
                    this.tilelayer.redraw();
                }
                this.unsetState('loading');
            },
            context: this
        });
    },

    initPoller: function () {
        this.poll = new L.K.Poll('./poll/');
        this.poll.on('message', function (e) {
            if (e.isDirty) this.reload();
            if (e.error) this.alert.show({content: e.error, level: 'error'});
        }, this);
        if (L.K.Config.backendPolling) this.poll.start();
    }

});

L.Kosmtik.ZoomIndicator = L.Control.extend({

    options: {
        position: 'topleft'
    },

    onAdd: function (map) {
        this.map = map;
        this.container = L.DomUtil.create('div', 'zoom-indicator');
        map.on('zoomend', this.update, this);
        this.update();
        return this.container;
    },

    update: function () {
        this.container.textContent = this.map.getZoom();
    }

});

L.K.Map.addInitHook(function () {
    this.whenReady(function () {
        (new L.K.ZoomIndicator()).addTo(this);
    });
});
