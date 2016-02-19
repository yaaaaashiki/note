'use strict'

###*
 # @ngdoc function
 # @name notefrontApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the notefrontApp
###
angular.module 'notefrontApp'
  .controller 'TemplatesCtrl', ($scope, $location, $routeParams, CurrentUser, Template) ->
    @awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    $scope.init = ->
      @templateService = new Template(serverErrorHandler)
      id = $location.url().split("/")[2]
      if id is "new"
        $scope.template = {aasm_state: "new"}
        $scope.template.$promise.then (template) ->
          $scope.previewHtml = marked template.body
      else if id
        $scope.template = @templateService.find id
        $scope.template.$promise.then (template) ->
          $scope.previewHtml = marked template.body
      else
        $scope.templates = @templateService.all()
        $scope.template = {aasm_state: "new"}
      @currentUserService = new CurrentUser(serverErrorHandler)
      $scope.currentUser = @currentUserService.find()
    $scope.preview = (template) ->
      $scope.template = template
      $scope.previewHtml= marked $scope.template.body

    $scope.changeBody = ->
      $scope.previewHtml = marked $scope.template.body

    $scope.wipTemplate = (template) ->
      if template.aasm_state == "new"
        @templateService.create template
        $scope.template.aasm_state = "wip"
        $scope.wip = true
      else
        @templateService.update template

    $scope.templateDelete = (template) ->
      @templateService.delete template
      $scope.templates.splice $scope.templates.indexOf(template), 1

    serverErrorHandler = ->
        alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")

    return
