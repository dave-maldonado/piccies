(function() {
    var app, controllers;

    app = angular.module('Gallery', ['templates', 'ngRoute', 'controllers']);

    app.config([
	'$routeProvider', function($routeProvider) {
	    return $routeProvider.when('/', {
		templateUrl: "index.html",
		controller: 'GalleryController'
	    });
	}
    ]);

    controllers = angular.module('controllers', []);

    controllers.controller("GalleryController", ['$scope', function($scope) {}]);
})();
