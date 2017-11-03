@APP = {}

$(document).on 'turbolinks:load', (e) ->
  initApp()
  action = undefined
  model  = undefined
  b      = $('body')
  if b.hasClass('edit')
    action = 'edit'
  else if b.hasClass('show')
    action = 'show'
  else if b.hasClass('index')
    action = 'index'
  else if b.hasClass('new')
    action = 'new'
  else if b.hasClass('create')
    action = 'create'
  else if b.hasClass('update')
    action = 'update'
  # run the code specific to a model and an action
  for m of APP
    if b.hasClass('admin_' + m)
      if APP[m][action] and typeof APP[m][action] == 'function'
        APP[m][action]()
        break
  return
