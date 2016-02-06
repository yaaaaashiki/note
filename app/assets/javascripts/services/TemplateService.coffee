angular.module('notefrontApp').factory 'Template', ($resource, $http) ->
  class Template
    constructor: (errorHandler) ->
      @service = $resource('/templates/:id'
        { id: '@id' },
        { update: { method: 'PUT' }})
      @errorHandler = errorHandler

    all: ->
      @service.query((-> null), @errorHandler)

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

    update: (template, attrs) ->
      new @service(template: attrs).$update {id: template.id}, (-> null), @errorHandler
