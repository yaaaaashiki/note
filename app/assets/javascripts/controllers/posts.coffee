'use strict'

###*
 # @ngdoc function
 # @name notefrontApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the notefrontApp
###
angular.module 'notefrontApp'
  .controller 'PostsCtrl', ($scope, Post, CurrentUser) ->
    @awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    $scope.init = ->
      @postService = new Post(serverErrorHandler)
      @currentUserService = new CurrentUser(serverErrorHandler)
      $scope.posts = @postService.all()
      $scope.currentUser = @currentUserService.find()

    $scope.postDelete = (post) ->
      @postService.delete post
      $scope.posts.splice $scope.posts.indexOf(post), 1

    $scope.preview = (post) ->
      $scope.post = post
      $scope.previewHtml= marked $scope.post.body

    serverErrorHandler = ->
        alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")
    return

