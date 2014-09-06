Template.collectionItem.helpers
  followLabel: -> "follow"

Template.collectionItem.events
  "click .name": (evt, tmpl) ->
    $(".collectionItem .name").removeClass("selected")
    tmpl.$(".name").addClass("selected")
    Session.set("collectionId", @_id)
  "click button.follow": ->
    alert "follow " + @name