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
          "body" : "本文...",
          "aasm_state" : "new"
        }
        $scope.previewHtml = marked $scope.post.body

      $scope.templates =[
        {
          "path" : "#{new Date().getFullYear()}/#{new Date().getMonth() + 1}/#{new Date().getDate()}:議事録",
          "template_body" : "
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

      $scope.selectedTemplate = "テンプレートを選択してください"
      $scope.wip = false

      $scope.selectTemplate = ->
        $scope.post.path = $scope.selectedTemplate.path
        $scope.post.body = $scope.selectedTemplate.template_body
        $scope.previewHtml= marked $scope.post.body

      $scope.changeBody = ->
        $scope.previewHtml= marked $scope.post.body

      $scope.wipPost = (post) ->
        if post.aasm_state == "new"
          @postService.create post
          $scope.post.aasm_state = "wip"
          $scope.wip = true
        else if  post.aasm_state == "wip"
          @postService.update post, post

    serverErrorHandler = ->
        alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")
    return

