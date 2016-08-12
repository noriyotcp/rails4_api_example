json.array! @users do |user|
  json.extract! user, :id, :name, :addr1, :addr2
end