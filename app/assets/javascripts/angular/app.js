(function() {
    var app = angular.module('HelloWorld', []);

    app.controller('HelloWorldCtrl', function(){
	this.greeting = 'Hello World!';
    });
})();
