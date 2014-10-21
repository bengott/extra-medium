schema = new SimpleSchema
  username:
    type: String
    regEx: /^[a-z0-9A-Z_]{3,15}$/
  emails:
    type: [Object]
    optional: true
  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email
  "emails.$.verified":
    type: Boolean
  createdAt:
    type: Date
    defaultValue: new Date
  profile:
    type: Object
    optional: true
    blackbox: true
  "profile.followedCollectionIds":
    type: [String]
    regEx: SimpleSchema.RegEx.Id
    defaultValue: []
  services:
    type: Object
    optional: true
    blackbox: true

Meteor.users.attachSchema schema

Meteor.users.helpers
  collections: -> Collections.find({ownerId: @_id}).fetch()
  followedCollections: -> Collections.find({_id: {$in: @profile.followedCollectionIds}}).fetch()