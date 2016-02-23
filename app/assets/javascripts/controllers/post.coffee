'use strict'

###*
 # @ngdoc function
 # @name notefrontApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the notefrontApp
###
angular.module 'notefrontApp'
  .controller 'PostCtrl', ($scope, $window, Post, Template, CurrentUser) ->
    @awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    $scope.init = ->
      @postService = new Post(serverErrorHandler)
      id = $window.location.pathname.split("/")[2]
      if id is "new"
        $scope.post = {
          "created_user" : {
            "name" : "テストユーザー",
          },
          "path" : "",
          "body" : "",
          "aasm_state" : "new"
        }
        $scope.previewHtml = marked $scope.post.body
        $scope.addedTag = ""
      else if id
        $scope.post = @postService.find id
        $scope.post.$promise.then (post) ->
          $scope.previewHtml = marked post.body
      else
        $scope.post = {
          "created_user" : {
            "name" : "テストユーザー",
          },
          "path" : "",
          "body" : "",
          "aasm_state" : "new"
        }
        $scope.previewHtml = marked $scope.post.body
        $scope.addedTag = ""
      @currentUserService = new CurrentUser(serverErrorHandler)
      $scope.currentUser = @currentUserService.find()

      @templateService = new Template(serverErrorHandler)
      $scope.templates = @templateService.select()
      # $scope.template.forEach (template) ->
      #   template.path

      $scope.selectedTemplate = "テンプレートを選択してください"
      $scope.wip = false

      # タブインデント
      # TODO controllerに書くべきでない
      tabIndent.renderAll()

      # TODO テキストエリアにフォーカスしてると機能しない問題の修正
      # TODO controller 以外に移す
      # TODO command+s でいけるようにする
      Mousetrap.bind 'command+shift+s',   ->
        $scope.wipPost($scope.post)

      $scope.selectTemplate = ->
        $scope.post.path = $scope.selectedTemplate.path_set_date
        $scope.post.body = $scope.selectedTemplate.body
        $scope.previewHtml= marked $scope.post.body

      $scope.changeBody = ->
        $scope.previewHtml= marked $scope.post.body

      $scope.addTag = ->
        $scope.post.tags << $scope.addedTag

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

