@Collections = new Meteor.Collection("collections",
  schema: new SimpleSchema(
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
  )
)

Collections.helpers
  owner: -> Meteor.users.findOne(@ownerId)
  articles: -> Articles.find({collectionIds: @_id}).fetch()