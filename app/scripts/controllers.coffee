'use strict'

### Controllers ###

angular.module('app.controllers', ['app.services'])

.controller('AppCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'

($scope, $location, $resource, $rootScope) ->

  # Uses the url to determine if the selected
  # menu item should have the class active.
  $scope.$location = $location
  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path || '/'
  )

  # getClass compares the current url with the id.
  # If the current url starts with the id it returns 'active'
  # otherwise it will return '' an empty string. E.g.
  #
  #   # current url = '/products/1'
  #   getClass('/products') # returns 'active'
  #   getClass('/orders') # returns ''
  #
  $scope.getClass = (id) ->
    if $scope.activeNavId.substring(0, id.length) == id
      return 'active'
    else
      return ''
])


.controller('ProjectsCtrl', [
  '$scope'
  'Projects'

($scope, Projects) ->

  $scope.projects = Projects.all.query()

  $scope.addProject = ->
    $scope.projects.push
      title: $scope.projectTitle
      repo: $scope.projectRepo
      status: null

    $scope.projectTitle = ""
    $scope.projectRepo = ""

  $scope.outdatedCount = ->
    count = 0
    angular.forEach $scope.projects, (project) ->
      count += (if project.status == 'outdated' then 1 else 0)

    count
])

.controller('ProjectCtrl', [
  '$scope'
  '$routeParams'
  'Projects'
  'Packages'

($scope, $routeParams, Projects, Packages) ->

  $scope.project = Projects.one.get({projectId: $routeParams.projectId})
  $scope.packages = Packages.all.query({projectId: $routeParams.projectId})

  $scope.outdatedCount = ->
    count = 0
    angular.forEach $scope.packages, (pkg) ->
      count += (if pkg.status == 'outdated' then 1 else 0)

    count
])
