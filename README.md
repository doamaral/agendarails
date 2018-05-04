# Simple Phone book
![Ruby on Rails](https://d2tycqyw09ngo1.cloudfront.net/be-content/uploads/2017/01/05141844/banner-ruby-on-rails.png "Ruby")
This app was developed using Ruby on Rails framework, PostgreSQL. It's part of an effort in deepen my Programming skills.
Bellow are some appointments done during development. 

### Seed task
* local: lib/utils.rake
```
namespace :utils do
  desc "Popular Banco de dados da aplicação"
  task seed: :environment do
    puts "Iniciando a populaç
```
* chamada `rake utils:seed`
  * `rake namespace:task`

### ActiveRecord Playing around
* **Insert in a 1:1 relation**
```ruby
params = {
          contact:{
            name:"john doe",
            email: "jd@john.corp",
            rmk:"obs...",
            address_attributes:{
              street:"a",
              city:"a",
              state:"b"}
            }
          }
```
* Checking errors in Console:
    `exemplo = Contact.create(params[:contact])`
    `exemplo.errors.full_messages.to_sentence`

* **Insert in a 1:N relation**

  ```ruby
  params = {
            contact:{
              name:"john doe",
              email: "jd@john.corp",
              rmk:"obs...",
              address_attributes:{
                street:"a",
                city:"a",
                state:"b"
              },
              phones_attributes:[
              	{phone:"85 99999-9999"},
              	{phone:"85 98888-8888"},
              	{phone:"85 97777-7777"}
              ]
            }
          }
  ```

### To Do
* Config to a Travis + Heroku Deploy pipeline

### Bugs
* According to https://github.com/rails/coffee-rails/issues/87 coffe-script-source lost 64-bit windows compatibility since it's 1.9.0 version. Thats why we have to downgrade to 1.8 version:
Add `gem ‘coffee-script-source’, ‘1.8.0’` to Gemfile, after run `bundle install` after run `bundle update coffee-script-source`
```
Bundler attempted to update coffee-script-source but its version regressed from 1.12.2 to 1
.8.0
Bundle updated!
```
