## Rails4 API Example

* ruby 2.3.0p0
* Ruby on Rails 4.2.5

### Index
``https://rails-api-noriyotcp.c9users.io/api/v1/users``

It will return all the users.

### Search by query

``https://yourapp.com/api/v1/users?name=神田``

``https://yourapp.com/api/v1/users?addr1=埼玉県``

``https://yourapp.com/api/v1/users?addr2=下新川郡入善町``

or send a request using ``curl``

### Create(Post)

``$ curl -H "Content-Type: application/json" -H "Accept: application/json" -d '{"name": "TEST", "addr1": "東京都", "addr2": "浜田市金屋谷"}' https://yourapp.com/api/v1/users``

### Update(Patch)

``$ curl -H "Content-Type: application/json" -H "Accept: application/json" -d '{"name": "TEST02", "addr1": "東京都", "addr2": "浜田市金屋谷"' --request PATCH https://yourapp.com/api/v1/users/52``

### Destroy(Delete)
``$ curl -H "Content-Type: application/json" -H "Accept: application/json" -XDELETE https://yourapp.com/api/v1/users/52``

#### Notice
I've not tested on production.
