angular.module('notefrontApp').factory 'Post', ($resource, $http) ->
  class Post
    constructor: (errorHandler) ->
      @service = $resource('/api/posts/:id',
        { id: '@id' },
        { update: { method: 'PUT' }})
      @errorHandler = errorHandler

    all: ->
      @service.query((-> null), @errorHandler)

    search: (attrs) ->
      @service.query(attrs, (->null), @errorHandler)

    find: (id, successHandler) ->
      @service.get(id: id, ((post)->
        successHandler?(post)
        post),
        @errorHandler)

    create: (attrs) ->
      new @service(post: attrs).$save ((post) -> attrs.id = post.id), @errorHandler
      attrs

    delete: (id) ->
      new @service().$delete { id: id }, (-> null), @errorHandler

    update: (post, attrs) ->
      new @service(post: attrs).$update {id: post.id}, (-> null), @errorHandler
