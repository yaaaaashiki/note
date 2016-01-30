'use strict'

###*
 # @ngdoc function
 # @name notefrontApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the notefrontApp
###
angular.module 'notefrontApp'
  .controller 'MainCtrl', ($scope, Post, CurrentUser) ->
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
      @postService = new Post(serverErrorHandler)
      @currentUserService = new CurrentUser(serverErrorHandler)
      $scope.resent_posts = @postService.all()
      $scope.currentUser = @currentUserService.find()

    serverErrorHandler = ->
        alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")
    return

