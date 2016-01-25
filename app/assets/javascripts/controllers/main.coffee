'use strict'

###*
 # @ngdoc function
 # @name notefrontApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the notefrontApp
###
angular.module 'notefrontApp'
  .controller 'MainCtrl', ($scope) ->
    @awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    $scope.init = ->
      $scope.tree = {
        "items" : [
          {"name": "A"}, {"name": "B", "children": [{"name": "x", "children": [{"name": "i"}, {"name": "j"}]}, {"name": "y"}]}, {"name": "C"}
        ]
      }
      $scope.resent_posts = [
        {
          "created_user" : {
            "name" : "テストユーザー",
          },
          "path" : "2016/01/13",
          "title" : "議事録",
          "body" : "本文..."
        },
        {
          "created_user" : {
            "name" : "テストユーザー",
          },
          "path" : "2016/01/18",
          "title" : "議事録",
          "body" : "本文..."
        }
      ]

    return

