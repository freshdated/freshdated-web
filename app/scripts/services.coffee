'use strict'

### Sevices ###

angular.module('app.services', [
  'app.constants'
])

.factory('Projects', [
  '$resource'
  'Settings'

($resource, Settings) ->
  $resource(Settings.apiUrl + '/v1/projects.json', {}, {
    get: {method: 'GET', headers: {"Content-Type": "application/json; charset=UTF-8"} }
  })
])
