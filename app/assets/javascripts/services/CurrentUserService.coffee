angular.module('notefrontApp').factory 'CurrentUser', ($resource, $http) ->
  class CurrentUser
    constructor: (errorHandler) ->
      @service = $resource('/current_users/:id',
        { id: '@id' },
        { update: { method: 'PUT' }})
      @errorHandler = errorHandler


    find: (successHandler) ->
      @service.get(id: 1, ((currentUser)->
        successHandler?(currentUser)
        currentUser),
        @errorHandler)

    update: (current_user, attrs) ->
      new @service(currentUser: attrs).$update {id: currentUser.id}, (-> null), @errorHandler
