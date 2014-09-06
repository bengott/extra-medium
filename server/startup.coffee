Meteor.startup ->
  
  # Clean Slate
  Meteor.users.remove {}
  Collections.remove {}
  Articles.remove {}

  # Insert Sample Data
  # First Users  
  benId = Meteor.users.insert
    profile:
      name: "Ben Gott"
    services:
      twitter:
        id: "21739330"
        lang: "en"
        profile_image_url: "http://pbs.twimg.com/profile_images/3531383739/3f75eb8eba76bf70f5da7de8850390a5_normal.jpeg"
        profile_image_url_https: "https://pbs.twimg.com/profile_images/3531383739/3f75eb8eba76bf70f5da7de8850390a5_normal.jpeg"
        screenName: "BenGottAbides"
    emails: [
      { address: "bengott@gmail.com", verified: true }
      { address: "another@different.com", verified: false }
    ]

  johnId = Meteor.users.insert
    profile:
      name: "John Doe"
    emails: [
      { address: "johndoe@email.com", verified: true }
    ]
  
  # Then Collections
  Collections.insert
    name: "My Foo Is Better Than Your Foo"
    ownerId: benId
    followerCount: 100
  Collections.insert
    name: "Bars and Flys"
    ownerId: johnId
    followerCount: 10
  Collections.insert
    name: "Life Is a Baz"
    ownerId: benId
    followerCount: 1000
  Collections.insert
    name: "The Science of Yin"
    ownerId: benId
    followerCount: 0
  Collections.insert
    name: "The Art of Yang"
    ownerId: benId
    followerCount: 42

  # And Then Articles (An den?)
  now = new Date
  Articles.insert
    title: "I See Your Foo Is Pretty Good..."
    subtitle: "But My Foo Is Stronger"
    url: "https://medium.com/about/welcome-to-medium-9e53ca408c48"
    createdAt: now
    collectionIds: [
      Collections.findOne(name: "My Foo Is Better Than Your Foo")._id
    ]
  Articles.insert
    title: "Foo Part 1"
    url: "https://medium.com/about/welcome-to-medium-9e53ca408c48"
    createdAt: now
    collectionIds: [
      Collections.findOne(name: "My Foo Is Better Than Your Foo")._id
    ]
  Articles.insert
    title: "Foo Part 2"
    url: "https://medium.com/about/welcome-to-medium-9e53ca408c48"
    createdAt: now
    collectionIds: [
      Collections.findOne(name: "My Foo Is Better Than Your Foo")._id
    ]
  Articles.insert
    title: "Yin Part 1"
    url: "https://medium.com/about/welcome-to-medium-9e53ca408c48"
    createdAt: now
    collectionIds: [
      Collections.findOne(name: "The Science of Yin")._id
    ]
  Articles.insert
    title: "Yin and Stuff"
    url: "https://medium.com/about/welcome-to-medium-9e53ca408c48"
    createdAt: now
    collectionIds: [
      Collections.findOne(name: "The Science of Yin")._id
    ]
  Articles.insert
    title: "The Life of Yang Bar Baz"
    url: "https://medium.com/about/welcome-to-medium-9e53ca408c48"
    createdAt: now
    collectionIds: [
      Collections.findOne(name: "The Art of Yang")._id
      Collections.findOne(name: "Bars and Flys")._id
      Collections.findOne(name: "Life Is a Baz")._id
    ]
  Articles.insert
    title: "Yin Yang Foo"
    url: "https://medium.com/about/welcome-to-medium-9e53ca408c48"
    createdAt: now
    collectionIds: [
      Collections.findOne(name: "The Science of Yin")._id
      Collections.findOne(name: "The Art of Yang")._id
      Collections.findOne(name: "My Foo Is Better Than Your Foo")._id
    ]
  Articles.insert
    title: "The Art of Yin"
    url: "https://medium.com/about/welcome-to-medium-9e53ca408c48"
    createdAt: now
    collectionIds: [
      Collections.findOne(name: "The Science of Yin")._id
    ]
  Articles.insert
    title: "Foos and Bars and Bazzes"
    url: "https://medium.com/about/welcome-to-medium-9e53ca408c48"
    createdAt: now
    collectionIds: [
      Collections.findOne(name: "My Foo Is Better Than Your Foo")._id
      Collections.findOne(name: "Bars and Flys")._id
      Collections.findOne(name: "Life Is a Baz")._id
    ]
  Articles.insert
    title: "Bars Are Better Than Foos"
    url: "https://medium.com/about/welcome-to-medium-9e53ca408c48"
    createdAt: now
    collectionIds: [
      Collections.findOne(name: "My Foo Is Better Than Your Foo")._id
      Collections.findOne(name: "Bars and Flys")._id
    ]