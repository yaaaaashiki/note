angular.module('notefrontApp').factory 'Template', ($resource, $http) ->
  class Template
    constructor: (errorHandler) ->
      @service = $resource('/api/templates/:id'
        { id: '@id' },
        { update: { method: 'PUT' }})
      @errorHandler = errorHandler

    all: ->
      @service.query((-> null), @errorHandler)

    select: ->
      @service.query({select: true}, (->null), @errorHandler)

    search: (attrs) ->
      @service.query(attrs, (->null), @errorHandler)

    find: (id, successHandler) ->
      @service.get(id: id, ((template)->
        successHandler?(template)
        template),
        @errorHandler)

    create: (attrs) ->
      new @service(template: attrs).$save ((template) -> attrs.id = template.id), @errorHandler
      attrs

    delete: (template) ->
      new @service().$delete { id: template.id }, (-> null), @errorHandler

    update: (template) ->
      new @service(template: template).$update {id: template.id}, (-> null), @errorHandler
