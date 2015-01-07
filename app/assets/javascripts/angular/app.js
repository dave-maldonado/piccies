// Angular.js 'picture gallery' application

(function() {
    var app, controllers;

    app = angular.module('Gallery', ['templates', 'ngRoute', 'angularFileUpload']);

    // routes
    app.config([
	'$routeProvider', function($routeProvider) {
	    return $routeProvider
		.when('/', {
		    templateUrl: 'index.html',
		    controller: 'HelloWorldCtrl'
		})
	        .when('/upload', {
		    templateUrl: 'upload.html',
		    controller: 'UploadCtrl'
		})
		.otherwise({
		    redirectTo: '/'
		});
	}
    ]);

    // controllers
    app.controller('HelloWorldCtrl', function($scope) {
	$scope.greeting = 'Hello World!';
    });

    app.controller('UploadCtrl', function($scope, FileUploader) {
	$scope.uploader = new FileUploader({url: 'http://localhost:3000/api/albums/5/pictures'});
    });
})();
