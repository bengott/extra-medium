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

Template.insertArticleForm.helpers
  addOrSubmit: ->
    selectedCollection = Collections.findOne(Session.get("collectionId"))
    if Meteor.userId() is selectedCollection.ownerId
      return "Add"
    else
      return "Submit"

AutoForm.hooks
  insertCollectionForm:
    before:
      insert: (doc, template) ->
        doc.ownerId = Meteor.userId()
        return doc
  insertArticleForm:
    before:
      insert: (doc, template) ->
        doc.collectionIds = [Session.get("collectionId")]
        return doc
