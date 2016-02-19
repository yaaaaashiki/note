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
  .config ($locationProvider) ->
    $locationProvider.html5Mode(true)

