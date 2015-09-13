'use strict';

/* Services */

var blogServices = angular.module('blogServices', ['ngResource']);

blogServices.factory('BlogPost', ['$resource',
    function($resource) {
        return $resource("/axes/?format=json", {}, {
            get: {method: 'GET', cache: false, isArray: true},
            save: {method: 'POST', cache: false, isArray: false},
            update: {method: 'PUT', cache: false, isArray: false},
            delete: {method: 'DELETE', cache: false, isArray: false}
        });
    }]);

blogServices.factory("Axis", function($resource) {
    return $resource("/axes/:id", { id: "@id", format: "json" },
        {
            create:  { method: 'POST' },
            index:   { method: 'GET', isArray: true },
            show:    { method: 'GET', isArray: false },
            update:  { method: 'PUT' },
            destroy: { method: 'DELETE' }
        }
    );
});


blogServices.factory('BlogPost2', ['$resource',
    function($resource) {
        return $resource("/axes/", {}, {
            get: {method: 'GET', cache: false, isArray: true},
            save: {method: 'POST', cache: false, isArray: false},
            update: {method: 'PUT', cache: false, isArray: false},
            delete: {method: 'DELETE', cache: false, isArray: false}
        });
    }]);

blogServices.factory('BlogList', ['$resource',
    function($resource) {
        return $resource("http://nodeblog-micbuttoncloud.rhcloud.com/NodeBlog/blogList", {}, {
            get: {method: 'GET', cache: false, isArray: true}
        });
    }]);

