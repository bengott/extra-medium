UI.registerHelper "getCollection", ->
  Collections.findOne(Session.get("collectionId"))

Template.main.collections = ->
  Collections.find().fetch()

Template.collectionItem.helpers
  followLabel: -> "follow"

Template.collectionItem.events
  "click .name": (evt, tmpl) ->
    $("#listContainer .name").removeClass("selected")
    tmpl.$(".name").addClass("selected")
    Session.set("collectionId", @_id)
  "click button.follow": ->
    alert "follow " + @name