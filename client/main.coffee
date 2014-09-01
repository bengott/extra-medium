Template.main.helpers
  collections: -> Collections.find().fetch()
  selectedCollection: -> Collections.findOne(Session.get("collectionId"))

Template.collectionItem.helpers
  followLabel: -> "follow"

Template.collectionItem.events
  "click .name": (evt, tmpl) ->
    $("#listContainer .name").removeClass("selected")
    tmpl.$(".name").addClass("selected")
    Session.set("collectionId", @_id)
  "click button.follow": ->
    alert "follow " + @name

AutoForm.hooks
  insertCollectionForm:
    before:
      insert: (doc, template) ->
        doc.ownerId = Meteor.userId()
        return doc
