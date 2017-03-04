json_escape @message
  json.name @message.user.name
  json.time @message.created_at.strftime('%Y年%m月%d日 %H:%M')
  json.body @message.body
