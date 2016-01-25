'use strict'

###*
 # @ngdoc function
 # @name notefrontApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the notefrontApp
###
angular.module 'notefrontApp'
  .controller 'PostsCtrl', ($scope, Post) ->
    @awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    $scope.init = ->
      @postService = new Post(serverErrorHandler)
      $scope.posts = @postService.all()
        #[
        #   {
        #     "id" : 1,
        #     "created_user" : {
        #       "name" : "テストユーザー",
        #     },
        #     "path" : "2016/01/13",
        #     "title" : "/:title",
        #     "body" : "本文..."
        #   },
        #   {
        #     "id" : 2,
        #     "created_user" : {
        #       "name" : "テストユーザー",
        #     },
        #     "path" : "2016/01/14",
        #     "title" : "/:title",
        #     "body" : "本文..."
        #   }
      #]
    serverErrorHandler = ->
        alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")
    return

