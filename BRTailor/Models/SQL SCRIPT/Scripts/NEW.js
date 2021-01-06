var g;
if (!window.__idm_init__) {
    window.__idm_init__ = !0; Array.prototype.includes || (Array.prototype.includes = function (b, a) { return 0 <= this.indexOf(b, a) }); NodeList.prototype[Symbol.iterator] || (NodeList.prototype[Symbol.iterator] = Array.prototype[Symbol.iterator]); HTMLCollection.prototype[Symbol.iterator] || (HTMLCollection.prototype[Symbol.iterator] = Array.prototype[Symbol.iterator]); navigator.userAgent.includes("Firefox/"); var r = Array.prototype.includes, v = Function.call.bind(Array.prototype.slice), w = Function.apply.bind(Array.prototype.push), x =
    Function.call.bind(Array.prototype.forEach), y = { 16: !0, 17: !0, 18: !0, 45: !0, 46: !0 }, B = ["video", "audio", "object", "embed"], C = r.bind(B), I = /(?!)/, J = window.self === window.top, K = window.origin || document.origin || location.origin; function D() {
        J && (this.M = 0); this.O = []; this.D = []; this.m = {}; this.ma(); window.__idm_connect__ = this.ma.bind(this, !0); this.b(1, window, "resize", this.Na); this.b(1, window, "scroll", this.Ja); this.b(1, window, "blur", this.Ma); this.b(1, window, "keydown", this.ka, !0); this.b(1, window, "keyup", this.ka, !0); this.b(1,
        window, "mousedown", this.Ua, !0); this.b(1, window, "mouseup", this.Sa, !0); this.b(1, window, "mousemove", this.Ta, !0); this.b(1, window, "click", this.Ra, !0); this.b(1, document, "beforeload", this.Ka, !0); this.b(1, document, "DOMContentLoaded", this.ja); "interactive" != document.readyState && "complete" != document.readyState || this.ja()
    } g = D.prototype; g.c = 0; g.g = 0; g.ea = -1; g.fa = -1; g.va = 1; g.f = ""; g.da = ""; g.X = I; g.V = I; g.W = ""; g.A = I; g.h = {}; g.Y = I; g.S = I; g.T = I; g.ca = I; g.R = ":root:empty"; g.Z = ":root:empty"; g.ba = ":root:empty"; g.u = ":root:empty";
    g.aa = ":root:empty"; g.P = ":root:empty"; g.$ = ":root:empty"; g.v = 0; g.U = I; g.ma = function (b) { this.na(-1); this.a = b = browser.runtime.connect({ name: (J ? "top" : "sub") + (b ? ":retry" : "") + ("file:" == location.protocol ? ":file" : "") }); this.J = b.id || b.portId_ || this.J || Math.ceil(1048575 * Math.random()); this.b(-1, b, "onMessage", this.Pa); this.b(-1, b, "onDisconnect", this.Oa) }; g.Oa = function () { browser.runtime.lastError; this.na(); this.a = this.J = null; window.__idm_init__ = !1; window.__idm_connect__ = null }; g.Pa = function (b) {
        switch (b.shift()) {
            case 11: this.Wa.apply(this,
            b); break; case 17: this.Xa.apply(this, b); break; case 12: this.Ca.apply(this, b); break; case 13: this.ya = b.shift(); break; case 14: this.za.apply(this, b); break; case 15: this.Aa.apply(this, b); break; case 16: this.Ba.apply(this, b); break; case 18: this.Da.apply(this, b)
        }
    }; g.Ya = function (b, a) {
        switch (this.K = b) {
            case 1: this.wa = this.ta = !0; this.f = a.shift() || ""; this.X = RegExp(a.shift() || "(?!)"); this.A = RegExp(a.shift() || "(?!)"); this.W = a.shift() || ""; this.h = (a.shift() || "").split(/[|:]/).reduce(L, {}); this.Y = RegExp(a.shift() || "(?!)");
                this.S = RegExp(a.shift() || "(?!)"); this.T = RegExp(a.shift() || "(?!)"); this.V = RegExp(a.shift() || "(?!)"); break; case 2: this.ta = !0; this.f = a.shift() || ""; this.da = a.shift() || ""; this.ca = RegExp(a.shift() || "(?!)"); this.R = a.shift() || ":root:empty"; this.Z = a.shift() || ":root:empty"; this.ba = a.shift() || ":root:empty"; this.u = a.shift() || ":root:empty"; this.aa = a.shift() || ":root:empty"; this.P = a.shift() || ":root:empty"; this.$ = a.shift() || ":root:empty"; this.v = a.shift() || 0; break; case 3: this.U = RegExp(a.shift() || "(?!)")
        } this.f.startsWith("^/") &&
        (this.f = "^(?:" + K.replace(/\./g, "\\.") + ")?" + this.f.substr(1))
    }; g.C = function (b) { if (this.K && this.o(arguments)) switch (this.K) { case 1: this.Fa(b); break; case 2: this.Ga(b); break; case 3: this.Ha(b) } }; g.L = function () { if (!this.xa) { this.xa = !0; this.b(2, window, "message", this.Va); var b = document.createElement("script"); b.src = browser.extension.getURL("document.js"); b.onload = b.remove.bind(b); document.documentElement.appendChild(b) } }; g.Va = function (b) {
        var a = b.data; if (Array.isArray(a) && b.origin == K) switch (a[0]) {
            case 1229212977: window.postMessage([1229212978,
            this.ta, this.wa, this.f, this.da], "/"); break; case 1229212979: this.a.postMessage([36, parseInt(a[1]), a[2]])
        }
    }; g.B = function () { var b = window.devicePixelRatio, a = document.width, c = document.body.scrollWidth; a && c && (b = a == c ? 0 : a / c); return b }; g.j = function (b) { try { var a = parseInt(b.getAttribute("__idm_id__")); a || (a = this.J << 10 | this.va++, b.setAttribute("__idm_id__", a), this.m[a] = b); return a } catch (c) { return null } }; g.Za = function (b, a, c, d, e) {
        try {
            var f = document.activeElement, m = f && C(f.localName) ? f : null; m || (m = (f = document.elementFromPoint(this.ea,
            this.fa)) && C(f.localName) ? f : null); var l = 0, n, h = 0; a: for (; h < B.length; h++) for(f of document.getElementsByTagName(B[h])) if (!(2 <= h && "text/html" == f.type.toLowerCase() || 3 == h && "application/x-shockwave-flash" != f.type.toLowerCase())) {
                if (e && f.getAttribute("__idm_link__") == e) { var k = f; break a } var p = f.src || f.data; if (p) p != b && p != a || (k = f); else if (2 > h) for(var z of f.getElementsByTagName("source")) if ((p = z.src) && (p == b || p == a) && (k = f)) break; if (k) { var q = window.getComputedStyle(f); if ("cover" == q.objectFit) { var M = f; k = null; continue } break a } if (!m &&
                !E) if (!p || p != c && p != d) { var t = f.clientWidth, u = f.clientHeight; if (t && u) { var F = f.getBoundingClientRect(); if (!(0 >= F.right + window.scrollX || 0 >= F.bottom + window.scrollY) && (q = window.getComputedStyle(f), "hidden" != q.visibility && "cover" != q.objectFit)) { var G = t * u; if (G > l && 1.35 * t > u && t < 3 * u) { l = G; var N = f } n || (n = f) } } } else var E = f
            } b = k || M || m || E || N || n; if (!b) return null; if ("embed" == b.localName && !b.clientWidth && !b.clientHeight) { var H = b.parentElement; "object" == H.localName && (b = H) } return this.j(b)
        } catch (O) { }
    }; g.$a = function (b, a,
    c) { var d = null, e; for(e of document.getElementsByTagName("iframe")) { try { var f = parseInt(e.getAttribute("__idm_frm__")) } catch (l) { } if (f == b) { d = e; break } if (!d) { var m = e.src; !m || m != a && m != c || (d = e) } } return d && this.j(d) }; g.l = function (b) {
        var a = null; try {
            var c = b.getBoundingClientRect(), d = Math.round(c.width), e = Math.round(c.height); switch (b.localName) { case "video": (b.videoWidth || b.hasAttribute("__idm_link__")) && document.contains(b) && (a = !1); if (15 > d || 10 > e) return a; break; case "audio": if (!d && !e) return a; var f = !0 } var m =
            document.documentElement, l = m.scrollWidth || m.clientWidth, n = m.scrollHeight || m.clientHeight, h = Math.round(c.left) + b.clientLeft, k = Math.round(c.top) + b.clientTop; if (h >= l || k >= n || f && !h && !k) return a; 0 == h && k == -n && d == l && e == n && (k = 0); a = [h, k, h + d, k + e, this.B()]
        } catch (p) { } return a
    }; g.i = function () { try { var b = window.top.document.title } catch (a) { } b || (b = (b = document.head.querySelector('meta[property="og:title"]')) && b.getAttribute("content")); b && (b = b.replace(/^\(\d+\)/, "").replace(/[ \t\r\n\u25B6]+/g, " ").trim()); return b };
    g.Ea = function () { if (!document.elementsFromPoint) return 0; var b = document.documentElement, a = b.clientWidth || b.offsetWidth; b = (b.clientHeight || window.innerHeight) / 4; var c = document.elementsFromPoint(0, 0), d = 0, e = 0, f = 0, m; for(m of c) if (m.offsetWidth >= a) { var l = window.getComputedStyle(m); .95 <= l.opacity && (c = l.zIndex, "fixed" == l.position ? (l = m.offsetHeight + m.offsetTop, d < l && l < b && (d = l, e = c)) : f < c && (f = c)) } e < f && (d = 0); return d }; g.Wa = function (b, a, c, d, e) {
        if (a) {
            this.M = a; try {
                window.frameElement && window.frameElement.setAttribute("__idm_frm__",
                a)
            } catch (f) { }
        } this.ha(c); e && this.Ya(e, v(arguments, 5)); "loading" == document.readyState ? this.la = !0 : this.C()
    }; g.Xa = function (b) { this.oa && this.c && (this.c = 0, this.pa = window.setTimeout(this.F.bind(this, !1), 3E3)); this.C(!0); b && this.ha() }; g.ha = function (b) { if (this.o(arguments)) { var a = [21, this.bb || location.href, document.referrer]; b && a.push(document.getElementsByTagName("video").length, document.getElementsByTagName("audio").length); this.a.postMessage(a) } }; g.za = function (b) {
        var a = b ? this.o(arguments) : 1; if (0 < a || 0 >
        a && 1 != this.K) { a = this.i(); var c = this.B(), d = this.Ea(); this.a.postMessage([24, a, c, d]) }
    }; g.Ba = function (b, a, c, d, e) { c || (c = this.$a(a, d, e)); d = (d = c && this.m[c]) && this.l(d); this.a.postMessage([22, b, a, c, d]) }; g.Da = function (b, a) { var c = document.getElementsByTagName("a"), d; for(d of c) try { if (d.href == a) { var e = d.download || null; var f = d.innerText.trim() || d.title || null; break } } catch (m) { } this.a.postMessage([35, b, e, f]) }; g.Aa = function (b, a, c, d, e, f, m) {
        if (this.o(arguments)) {
            var l = !a; l && (a = this.Za(c, d, e, f, m)); var n = [23, b, a, !1];
            if (a) { var h = this.m[a]; if (h) { var k = this.l(h); null != k ? (n[4] = k, l && (n[5] = h.localName, n[6] = h.src || h.data, n[7] = h.getAttribute("operadetachedviewtitle"), this.qa.observe(h, { attributes: !0, attributeFilter: ["style"] }))) : document.contains(h) || (delete this.m[a], n[3] = !0) } else n[3] = !0 } l && !n[7] && (n[7] = this.i()); this.a.postMessage(n)
        }
    }; g.Ca = function (b, a, c, d) {
        var e = d ? RegExp(d, "i") : null; d = this.ia(document, e, a); var f = document.getElementsByTagName("iframe"), m; for(m of f) try {
            var l = m.contentDocument; l && !m.src && w(d, this.ia(l,
            e, a))
        } catch (n) { } b = [27, b, this.M, d.length]; c || (b[4] = d, b[5] = location.href, J && (b[6] = location.href, b[7] = document.title)); this.a.postMessage(b)
    }; g.ia = function (b, a, c) {
        var d = [], e = {}, f = "", m = "", l = !c; if (c) { var n = b.getSelection(); if (!n || n.isCollapsed && !n.toString().trim()) return d } for(var h of b.getElementsByTagName("a")) if (l || n.containsNode(h, !0)) try { var k = h.href; k && !e[k] && a.test(k) && (e[k] = d.push([k, 2, h.download || null, h.innerText.trim() || h.title])); c && e[k] && (f += h.innerText, f += "\n") } catch (q) { } for(h of b.getElementsByTagName("area")) if (l ||
        n.containsNode(h, !0)) try { (k = h.href) && !e[k] && a.test(k) && (e[k] = d.push([k, 2, null, h.alt])) } catch (q) { } if (l) for(h of b.getElementsByTagName("iframe")) try { (k = h.src) && !e[k] && a.test(k) && (e[k] = d.push([k, 4])) } catch (q) { } var p = c && n.toString(); if (p) { f = this.s(f); for(k of this.s(p)) k && !e[k] && a.test(k) && !f.includes(k) && (e[k] = d.push([k, 1])) } if (c) for(h of b.getElementsByTagName("textarea")) if (c = h.selectionStart, p = h.selectionEnd, (f = n.isCollapsed && c < p) || n.containsNode(h, !0)) try {
            var z = f ? h.value.substring(c, p) : h.value;
            for(k of this.s(z)) k && !e[k] && a.test(k) && (e[k] = d.push([k, 1]))
        } catch (q) { } if (l || !d.length) for(h of b.getElementsByTagName("img")) if (l || n.containsNode(h, !0)) try { (k = h.src) && !e[k] && a.test(k) && (e[k] = d.push([k, 3, null, "<<<=IDMTRANSMITIMGPREFIX=>>>" + h.alt])), l && h.onclick && (m += h.onclick, m += "\n") } catch (q) { } if (l) { for(h of b.getElementsByTagName("script")) m += h.innerText, m += "\n"; if (m) for(k of this.s(m)) k && !e[k] && a.test(k) && (e[k] = d.push([k, 5])) } return d
    }; g.s = function (b) {
        if (!this.N) {
            var a = "\\b\\w+://(?:[%T]*(?::[%T]*)?@)?[%H.]+\\.[%H]+(?::\\d+)?(?:/(?:(?: +(?!\\w+:))?[%T/~;])*)?(?:\\?[%Q]*)?(?:#[%T]*)?".replace(/%\w/g,
            function (d) { return this[d] }.bind({ "%H": "\\w\\-\u00a0-\ufeff", "%T": "\\w\\-.+*()$!,%\u00a0-\ufeff", "%Q": "^\\s\\[\\]{}()" })); this.N = RegExp(a, "gi")
        } for (var c = []; a = this.N.exec(b) ;) c.push(a.shift()); return c
    }; g.o = function (b) { var a = this.c; a || (b = v(b && b.callee ? b : arguments), b.unshift(arguments.callee.caller), this.D.push(b)); return a }; g.ja = function (b) {
        try { var a = window.top.document.getElementsByTagName("title")[0] } catch (c) { } this.c = b && a ? -1 : 1; a && (b = this.oa, b || (this.oa = b = new MutationObserver(this.F.bind(this))),
        b.observe(a, { childList: !0 })); this.qa = new MutationObserver(this.La.bind(this)); this.la && (this.la = !1, this.C()); for (b = this.D; a = b.shift() ;) a.shift().apply(this, a)
    }; g.La = function (b) { var a = b.length && b[0].target; a && (b = parseInt(a.getAttribute("__idm_id__")), a = this.l(a), b && a && this.a.postMessage([23, null, b, !1, a])) }; g.F = function (b) { if (b) window.clearTimeout(this.pa), this.pa = window.setTimeout(this.F.bind(this, !1), 1E3); else { 0 > this.c ? this.c = 1 : ++this.c; for (var a = this.D; b = a.shift() ;) b.shift().apply(this, b) } }; g.Ka =
    function (b) { var a = b.target, c = a.localName; C(c) && b.url && (a = this.j(a), this.a.postMessage([25, a, c, b.url])) }; g.ka = function (b) { !b.repeat && y[b.keyCode] && this.a.postMessage([31, b.keyCode, "keydown" == b.type]) }; g.Ua = function (b) { this.ya && this.a.postMessage([28]); if (0 == b.button) { var a = b.view.getSelection(); a && a.isCollapsed && !a.toString().trim() && (this.g = 1); this.a.postMessage([32, b.button, !0]) } }; g.Sa = function (b) {
        if (0 == b.button) {
            this.ea = b.clientX; this.fa = b.clientY; this.a.postMessage([32, b.button, !1]); var a = b.view.getSelection();
            a && this.g && (this.g = a.isCollapsed && !a.toString().trim() ? 0 : 2) && this.a.postMessage([26, b.clientX, b.clientY, this.B()])
        }
    }; g.Ta = function () { 2 == this.g && (this.g = 0) }; g.Ra = function (b) { b = b.target; "a" == b.localName && this.a.postMessage([39, b.href, b.download]) }; g.Ja = function () { this.a.postMessage([29]) }; g.Na = function (b) { b = b.target; this.a.postMessage([30, b.innerWidth, b.innerHeight]) }; g.Ma = function () { this.g = 0; this.a.postMessage([33]) }; g.b = function (b, a, c, d, e) {
        var f = v(arguments); f[3] = d.bind(this); this.O.push(f); 0 > b ? (a =
        a[c], a.addListener.apply(a, f.slice(3))) : a.addEventListener.apply(a, f.slice(2))
    }; g.na = function (b) { for (var a = this.O, c = 0; c < a.length; c++) { var d = a[c][0]; if (!b || b == d) { var e = a.splice(c--, 1).pop(), f = e.splice(0, 2).pop(); 0 > d ? (f = f[e.shift()], f.removeListener.apply(f, e)) : f.removeEventListener.apply(f, e) } } }; g.Fa = function (b) {
        if (!b) {
            var a = !0; b = 0; var c; document.getElementsByTagName(this.W).length && this.L(); for(var d of document.getElementsByTagName("script")) {
                if (c = this.A.exec(d.src)) {
                    b |= 1; var e = d.src; this.h[c[1]] &&
                    (a = !1)
                } else if (c = this.V.exec(d.innerText)) { if (b |= 2, this.h[c[1]]) { a = {}; var f = [37, 1, 2, a]; a[118] = parseInt(c[1], 10); this.a.postMessage(f); a = !1 } } else !d.src && this.X.test(d.innerText) && (b |= 4, this.L(), f = [34, !0, this.i(), null, d.outerHTML], this.a.postMessage(f)); if (7 == b) break
            } e && a && (d = new XMLHttpRequest, d.responseType = "text", d.timeout = 1E4, d.onreadystatechange = this.ab.bind(this, e, d), d.open("GET", e, !0), d.send())
        }
    }; g.ab = function (b, a) {
        if (4 == a.readyState) {
            var c = this.A.exec(b); if ((b = (b = this.Y.exec(a.response)) && parseInt(b[1] ||
            b[2], 10)) && (!this.h[b] || !this.h[c[1]])) { var d = this.S.exec(a.response); a = this.T.exec(a.response); if (d && a && d[2] == a[1]) { c = c && c[1]; var e = {}; e[118] = b; e[119] = d[0]; e[120] = a[0]; e[124] = c; this.a.postMessage([37, 1, 1, e]) } }
        }
    }; g.Ga = function d(a, c) {
        if (a) c && a.shift().disconnect(), this.H.disconnect(), this.ra.disconnect(), this.sa.clear(), this.I.clear(); else {
            this.L(); c = 0; for(var e of document.getElementsByTagName("script")) if (!e.src && this.ca.test(e.innerText)) {
                var f = this.i(); this.a.postMessage([34, !0, f, c, e.outerHTML]);
                c += e.outerHTML.length
            } c && this.a.postMessage([34, !0]); this.H = new MutationObserver(this.Qa.bind(this)); this.ra = new MutationObserver(this.Ia.bind(this)); this.sa = new Set; this.I = new Set
        } if (e = this.ua = document.querySelector(this.Z)) { if (a = this.H, a.observe(e, { childList: !0 }), !this.ga(e, !0) && (e = e.querySelector(this.aa))) (c = A(e, this.u)) && a.observe(e, { childList: !0 }), a.observe(c || e.parentNode, { childList: !0 }) } else !a && (e = document.querySelector(this.R)) && (c = new MutationObserver(d.bind(this, a = [])), a.push(c), c.observe(e,
        { childList: !0 }))
    }; g.ga = function (a, c) { var d = this.H, e = this.u, f = this.P, m = this.ra, l = this.sa, n = 0, h; for(h of a.querySelectorAll(f)) l.has(h) || h.querySelector(f) || (l.add(h), m.observe(h, { childList: !0, subtree: !0 }), c && (a = A(h, e)) && (d.observe(a, { childList: !0 }), n++), x(h.getElementsByTagName("video"), this.G.bind(this))); return n }; g.Qa = function (a) { var c = this.ua, d; for(d of a) { a = c.isSameNode(d.target); for(var e of d.addedNodes) 1 == e.nodeType && this.ga(e, a) } }; g.Ia = function (a) {
        var c = this.I, d = this.v, e; for(e of a) for(var f of e.addedNodes) if (1 ==
        f.nodeType) if (a = f.getElementsByTagName("video"), a.length) x(a, this.G.bind(this)); else for(var m of c) { a = m; for (var l = d; a && l--; a = a.parentNode); a && a.contains(f) && this.G(m) }
    }; g.G = function (a) {
        if (!a.hasAttribute("__idm_id__")) {
            var c = this.I, d = this.v, e, f; for (e = a.parentNode; e && d--; e = e.parentNode) {
                var m = e; if ("a" == e.firstChild.localName) { var l = e.firstChild; break } var n = e.previousSibling; if (n && "div" == n.localName) {
                    (f = e.getElementsByTagName("a")).length ? l = f[0] : (f = n.getElementsByTagName("a")).length && (l = f[f.length -
                    1]); break
                }
            } l ? l = l.href : A(a, this.ba) ? l = location.href : m && 1 == (f = m.querySelectorAll(this.$)).length && (l = f[0].href); l ? (c.delete(a), a.setAttribute("__idm_link__", l), c = this.j(a), d = this.l(a), this.qa.observe(a, { attributes: !0, attributeFilter: ["style"] }), this.a.postMessage([41, c, a.localName, a.src || a.data, l, d])) : c.add(a)
        }
    }; g.Ha = function (a) { if (!a) for(var c of document.getElementsByTagName("script")) if (!c.src && this.U.test(c.innerText)) { a = this.i(); this.a.postMessage([34, !0, a, null, c.outerHTML]); break } }; function A(a,
    c) { var d; for (d = 0; "<" == c[d]; d++); for (a = a.closest(c.slice(d)) ; a && d--; a = a.parentNode); return a } function L(a, c) { c && (a[c] = !0); return a } new D
};
