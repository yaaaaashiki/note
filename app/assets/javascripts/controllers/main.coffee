'use strict'

###*
 # @ngdoc function
 # @name notefrontApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the notefrontApp
###
angular.module 'notefrontApp'
  .controller 'MainCtrl', ($scope, TreePost, Post, CurrentUser) ->
    @awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    $scope.init = ->
      @treePostService = new TreePost(serverErrorHandler)
      $scope.treePosts = @treePostService.all()
      @postService = new Post(serverErrorHandler)
      @currentUserService = new CurrentUser(serverErrorHandler)
      $scope.resent_posts = @postService.all()
      $scope.currentUser = @currentUserService.find()

    $scope.preview = (post) ->
      if post
        $scope.post = post
        $scope.previewHtml= marked $scope.post.body

    serverErrorHandler = ->
        alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")
    return

