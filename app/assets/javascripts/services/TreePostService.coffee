angular.module('notefrontApp').factory 'TreePost', ($resource, $http) ->
  class TreePost
    constructor: (errorHandler) ->
      @service = $resource('/api/tree_posts/:id',
        { id: '@id' },
        { update: { method: 'PUT' }})
      @errorHandler = errorHandler

    all: ->
      @service.query((-> null), @errorHandler)

