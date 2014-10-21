Meteor.methods
  
  followCollection: (collectionId) ->
    if Meteor.userId()
      Meteor.users.update(Meteor.userId(), {$addToSet: {"profile.followedCollectionIds": collectionId}})
      Collections.update(collectionId, {$inc: {followerCount: 1}})
  
  unfollowCollection: (collectionId) ->
    if Meteor.userId()
      Meteor.users.update(Meteor.userId(), {$pull: {"profile.followedCollectionIds": collectionId}})
      Collections.update(collectionId, {$inc: {followerCount: -1}})