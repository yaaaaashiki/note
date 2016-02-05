'use strict'
angular.module 'notefrontApp'
  .directive "postView", ($compile) ->
    restrict: "E",
    templateUrl: "service/posts/post_view.html",
