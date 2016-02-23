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
      $scope.post_path_split = []

    $scope.preview = ($event, id) ->
      if id
        $scope.post = @postService.find id
        $scope.post.$promise.then (post) ->
          $scope.previewHtml= marked post.body
          $scope.post_path_split = post.path.split "/"
      else if $event
        target = angular.element($event.currentTarget)
        target.parent().children("ul").toggle(300)
        return true



    serverErrorHandler = ->
        alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")
    return

