Template.collectionDetails.helpers
  selectedCollection: -> Collections.findOne(Session.get("collectionId"))