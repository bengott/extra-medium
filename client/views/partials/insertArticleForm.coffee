Template.insertArticleForm.helpers
  addOrSubmitText: ->
    selectedCollection = Collections.findOne(Session.get("collectionId"))
    if Meteor.userId() is selectedCollection.ownerId
      return "Add"
    else
      return "Submit"

AutoForm.hooks
  insertArticleForm:
    before:
      insert: (doc, template) ->
        doc.collectionIds = [Session.get("collectionId")]
        return doc