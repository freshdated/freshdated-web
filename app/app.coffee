'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'app.constants'
  'app.services'
  'app.controllers'
  'app.directives'
  'app.filters'
  'partials'
])

App.config([
  '$routeProvider'
  '$locationProvider'
  '$httpProvider'

($routeProvider, $locationProvider, $httpProvider, config) ->
  delete $httpProvider.defaults.headers.common['X-Requested-With']

  $routeProvider
    .when('/projects', {templateUrl: '/partials/projects.html'})

    # Catch all
    .otherwise({redirectTo: '/projects'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])
