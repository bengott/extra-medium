@Collections = new Meteor.Collection("collections",
  schema: new SimpleSchema(
    name:
      type: String
    description:
      type: String
      optional: true
    ownerId:
      type: String
    followerCount:
      type: Number
  )
)

@Posts = new Meteor.Collection("posts",
  schema: new SimpleSchema(
    title:
      type: String
    subtitle:
      type: String
      optional: true
    createdAt:
      type: Date
      denyUpdate: true
    collectionIds:
      type: [String]
      regEx: SimpleSchema.RegEx.Id
  )
)

# Helpers
Collections.helpers
  owner: -> Meteor.users.findOne(@ownerId)
  posts: -> Posts.find({collectionIds: @_id}).fetch()

Posts.helpers
  collections: -> Collections.find({_id: {$in: @collectionIds}}).fetch()

Meteor.users.helpers
  collections: -> Collections.find({owner: @_id}).fetch()