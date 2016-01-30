'use strict'

###*
 # @ngdoc function
 # @name notefrontApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the notefrontApp
###
angular.module 'notefrontApp'
  .controller 'PostCtrl', ($scope, $routeParams, Post) ->
    @postService = new Post(serverErrorHandler)
    @awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    $scope.init = ->
      @postService = new Post(serverErrorHandler)
      if angular.isDefined($routeParams.id)
        $scope.post = @postService.find $routeParams.id
        $scope.post.$promise.then (post) ->
          $scope.previewHtml = marked post.body
      else
        $scope.post = {
          "created_user" : {
            "name" : "テストユーザー",
          },
          "path" : "",
          "title" : "",
          "body" : "本文..."
        }
        $scope.previewHtml = marked $scope.post.body

      $scope.templates =[
        {
          "path" : "#{new Date().getFullYear()}/#{new Date().getMonth() + 1}/#{new Date().getDate()}",
          "title" : "議事録",
          "template_body" : "##{new Date().getFullYear()}/#{new Date().getMonth() + 1}/#{new Date().getDate()}\n
          \n
          - - -\n
          \n
          ## 遅刻欠席\n
          ### 遅刻\n
          -\n
          \n
          ### 欠席\n
          -\n
          \n
          ",
        }
      ]

      $scope.selectedTemplate = ""

      $scope.selectTemplate = ->
        $scope.post.title = $scope.selectedTemplate.title
        $scope.post.path = $scope.selectedTemplate.path
        $scope.post.body = $scope.selectedTemplate.template_body

      $scope.changeBody = ->
        $scope.previewHtml= marked $scope.post.body
      $scope.wipPost = ->
        console.log $scope.post

      $scope.wipPost = (post) ->
        createdPost = @postService.create post


    serverErrorHandler = ->
        alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")
    return

