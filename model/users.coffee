Meteor.users.helpers
  collections: -> Collections.find({owner: @_id}).fetch()