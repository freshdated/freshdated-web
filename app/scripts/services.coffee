'use strict'

### Sevices ###

angular.module('app.services', [
  'app.constants'
])

.factory('Projects', [
  '$resource'
  'Settings'

($resource, Settings) ->
  all: 
    $resource(Settings.apiUrl + '/v1/projects.json', {}, {
      get: {method: 'GET', headers: {"Content-Type": "application/json; charset=UTF-8"} }
    })
  one:
    $resource(Settings.apiUrl + '/v1/projects/:projectId.json', {projectId: '@id'}, {
      get: {method: 'GET', headers: {"Content-Type": "application/json; charset=UTF-8"} }
    })
])

.factory('Packages', [
  '$resource'
  'Settings'

($resource, Settings) ->
  all:
    $resource(Settings.apiUrl + '/v1/projects/:projectId/packages.json', {projectId: '@id'}, {
      get: {method: 'GET', headers: {"Content-Type": "application/json; charset=UTF-8"} }
    })
])
