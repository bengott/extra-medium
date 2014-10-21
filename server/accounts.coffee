Accounts.onCreateUser (options, user) ->
  if user.services && user.services.twitter
    user.username = user.services.twitter.screenName
  return user