@Articles = new Meteor.Collection("articles",
  schema: new SimpleSchema(
    title:
      type: String
    subtitle:
      type: String
      optional: true
    url:
      type: String
      label: "URL"
      regEx: SimpleSchema.RegEx.Url
    createdAt:
      type: Date
      defaultValue: new Date
      denyUpdate: true
    collectionIds:
      type: [String]
      regEx: SimpleSchema.RegEx.Id
  )
)

Articles.helpers
  collections: -> Collections.find({_id: {$in: @collectionIds}}).fetch()