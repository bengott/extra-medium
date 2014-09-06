AutoForm.hooks
  insertCollectionForm:
    before:
      insert: (doc, template) ->
        doc.ownerId = Meteor.userId()
        return doc