Template.collectionDetails.helpers
  selectedCollection: -> Collections.findOne(Session.get("collectionId"))

Template.collectionDetails.events
  "click .followButton": ->
    Collections.findOne(Session.get("collectionId")).followOrUnfollow()