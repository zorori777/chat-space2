json.messages @messages do |message|
  json.name  message.user.name
  json.body  message.body
  json.time  message.created_at.strftime('%Y年%m月%d日 %H:%M')
  json.image message.image.url
end
