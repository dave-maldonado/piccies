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
	$scope.add = function() {
	    var file, reader;

	    file = document.getElementById('file').files[0];
	    reader = new FileReader();
	    reader.onloadend = function(e) {
		var data = e.target.result;
		// figure out how to send 'data' to Rails backend
	    }
	    reader.readAsBinaryString(file);
	}
    });
})();
