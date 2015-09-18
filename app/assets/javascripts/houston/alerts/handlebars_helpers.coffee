ICONS =
  itsm: 'fa-fire-extinguisher'
  cve: 'fa-bank'
  err: 'fa-bug'

Handlebars.registerHelper 'iconForAlert', (alertType)->
  icon = ICONS[alertType]
  """<i class="fa fa-lg #{icon}"></i>"""

Handlebars.registerHelper 'ifEql', (value1, value2, options)->
  if value1 == value2
    options.fn(@)

Handlebars.registerHelper 'formatAlertDeadline', (deadline)->
  deadline = new Date(Date.parse(deadline)) if _.isString(deadline)
  return "Past" if deadline < new Date()
  d3.time.format('%-I:%M %p<span class="weekday">%A</span>')(deadline).replace /AM|PM/, (s)-> s.toLowerCase()
