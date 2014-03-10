'use strict'

### Filters ###

angular.module('app.filters', [])

.filter 'iconStatus', ->
  (text) ->
    if text == 'updated'
      'icon-ok-sign'
    else if text == 'outdated'
      'icon-exclamation-sign'
