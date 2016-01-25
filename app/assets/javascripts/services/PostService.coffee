angular.module('notefrontApp').factory 'Post', ($resource, $http) ->
  class Post
    constructor: (errorHandler) ->
      @service = $resource('/posts/:id',
        { id: '@id' },
        { update: { method: 'PUT' }})
      @errorHandler = errorHandler

    all: ->
      @service.query((-> null), @errorHandler)

    find: (id, successHandler) ->
      @service.get(id: id, ((post)->
        successHandler?(post)
        list),
        @errorHandler)

    create: (attrs) ->
      new @service(posts: attrs).$save ((post) -> attrs.id = post.id), @errorHandler
      attrs

    delete: (post) ->
      new @service().$delete { id: post.id }, (-> null), @errorHandler
