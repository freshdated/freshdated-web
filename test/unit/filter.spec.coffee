'use strict'

describe "filter", ->
  beforeEach(module "app.filters")

  describe "iconStatus", ->
    describe "updated", ->
      it "should returns icon-ok-sign", inject((iconStatusFilter) ->
        expect(iconStatusFilter("updated")).toEqual "icon-ok-sign"
      )

    describe "outdated", ->
      it "should returns icon-exclamation-sign", inject((iconStatusFilter) ->
        expect(iconStatusFilter("outdated")).toEqual "icon-exclamation-sign"
      )

    describe "null", ->
      it "should returns null", inject((iconStatusFilter) ->
        expect(iconStatusFilter(null)).toEqual null
      )
