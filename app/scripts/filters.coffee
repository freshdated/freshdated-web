'use strict'

### Filters ###

angular.module('app.filters', [])

.filter 'statusIcon', ->
  (text) ->
    if text == 'updated'
      'fa fa-chevron-circle-up'
    else if text == 'outdated'
      'fa fa-chevron-circle-down'
    else
      'fa fa-question-circle'


.filter 'statusDescription', ->
  (pkg) ->
    if pkg.status == 'updated'
      ' Freshdated'
    else if pkg.status == 'outdated'
      ' Outdated'
    else if pkg.last_version == null
      ' Not checked'

