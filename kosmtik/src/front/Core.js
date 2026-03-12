L.Kosmtik = L.K = {};


/*************/
/*   Utils   */
/*************/
L.Kosmtik.buildQueryString = function (params) {
    var queryString = [];
    for (var key in params) {
        queryString.push(encodeURIComponent(key) + '=' + encodeURIComponent(params[key]));
    }
    return queryString.join('&');
};

L.Kosmtik.Xhr = {

    _ajax: function (settings) {
        var xhr = new window.XMLHttpRequest();
        xhr.open(settings.verb, settings.uri, true);
        xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && settings.callback) {
                settings.callback.call(settings.context || xhr, xhr.status, xhr.responseText, xhr);
            }
        };
        xhr.send(settings.data);
        return xhr;
    },

    get: function(uri, options) {
        options = options || {};
        options.verb = 'GET';
        options.uri = uri;
        return L.K.Xhr._ajax(options);
    },

    post: function(uri, options) {
        options = options || {};
        options.verb = 'POST';
        options.uri = uri;
        return L.K.Xhr._ajax(options);
    }

};

L.Kosmtik.Poll = L.Evented.extend({

    initialize: function (uri) {
        this.uri = uri;
        this.delay = 1;
    },

    poll: function () {
        L.K.Xhr.get(this.uri, {
            callback: this.polled,
            context: this
        });
    },

    polled: function (status, data) {
        if (status === 204 || status === 200) this.fire('polled');
        if (status === 204) return this.loop(1);
        if (status !== 200 || !data) return this.onError({status: status, error: data});
        try {
            data = JSON.parse(data);
        } catch (err) {
            return this.onError({error: err});
        }
        for (var i = 0; i < data.length; i++) {
            this.fire('message', data[i]);
        }
        this.loop(1);
    },

    onError: function (e) {
        this.fire('error', e);
        this.loop(++this.delay);
    },

    loop: function (delay) {
        this.delay = delay;
        this._id = window.setTimeout(L.bind(this.poll, this), this.delay * 1000);
    },

    start: function () {
        if (!this._id) this.loop(1);
        this.fire('start');
        return this;
    },

    stop: function () {
        if (this._id) {
            window.clearTimeout(this._id);
            this._id = null;
        }
        this.fire('stop');
        return this;
    }

});

L.Kosmtik.Alert = L.Class.extend({

    initialize: function (map, options) {
        this._map = map;
        L.setOptions(this, options);
        this.container = L.DomUtil.create('div', 'kosmtik-alert', document.body);
        this.closeButton = L.DomUtil.create('a', 'close', this.container);
        this.content = L.DomUtil.create('div', 'content', this.container);
        this.closeButton.href = '#';
        this.closeButton.innerHTML = 'Close';
        L.DomEvent
            .on(this.closeButton, 'click', L.DomEvent.stop)
            .on(this.closeButton, 'click', this.hide, this);
        this._map.on('reload', this.hide, this);
    },

    show: function (options) {
        this.content.innerHTML = options.content;
        this._map.setState('alert');
    },

    hide: function () {
        this._map.unsetState('alert');
    }

});
