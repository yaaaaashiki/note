'use strict'

###*
 # @ngdoc overview
 # @name notefrontApp
 # @description
 # # notefrontApp
 #
 # Main module of the application.
###
angular
  .module 'notefrontApp', [
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: '/service/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .when '/post',
        templateUrl: '/service/posts/new.html'
        controller: 'PostCtrl'
        controllerAs: 'post'
      .when '/posts',
        templateUrl: '/service/posts.html'
        controller: 'PostsCtrl'
        controllerAs: 'posts'
      .when "/posts/:id",
        templateUrl: "/service/posts/show.html"
        controller: 'PostsCtrl'
        controllerAs: "post"
      .when '/about',
        templateUrl: '/service/about.html'
        controller: 'AboutCtrl'
        controllerAs: 'about'
      .otherwise
        redirectTo: '/'

