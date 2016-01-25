'use strict'
angular.module 'notefrontApp'
  .directive "tree", ($compile) ->
    restrict: "E",
    templateUrl: "service/tree.html",

