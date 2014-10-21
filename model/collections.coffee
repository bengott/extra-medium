@Collections = new Mongo.Collection "collections"

schema = new SimpleSchema
  name:
    type: String
  description:
    type: String
    optional: true
  ownerId:
    type: String
    regEx: SimpleSchema.RegEx.Id
  followerCount:
    type: Number
    defaultValue: 0

Collections.attachSchema schema

Collections.helpers
  owner: -> Meteor.users.findOne(@ownerId)
  followers: -> Meteor.users.find({"profile.followedCollectionIds": @_id}).fetch()
  userIsFollower: -> Meteor.user() && _.contains(Meteor.user().profile.followedCollectionIds, @_id) || false
  followButtonText: -> if @userIsFollower() then "unfollow" else "follow"
  followOrUnfollow: ->
    if Meteor.userId()
      if @userIsFollower()
        Meteor.call "unfollowCollection", @_id
      else
        Meteor.call "followCollection", @_id
    else
      alert "Please sign in to follow a collection."
  articles: -> Articles.find({collectionIds: @_id}).fetch()