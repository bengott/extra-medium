@Collections = new Meteor.Collection "collections"
@Posts = new Meteor.Collection "posts"

Collections.helpers
  owner: -> Meteor.users.findOne(@ownerId)
  posts: -> Posts.find({collectionIds: @_id}).fetch()

Posts.helpers
  collections: -> Collections.find({_id: {$in: @collectionIds}}).fetch()

Meteor.users.helpers
  collections: -> Collections.find({owner: @_id}).fetch()