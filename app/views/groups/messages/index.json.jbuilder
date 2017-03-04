json_escape @message do |json|
  json.id @message.id
  json.body @message.body
  json.image @message.image
  json.created_at @message.created_at
  json.updated_at @message.updated_at
end
