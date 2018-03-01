# README

## ActiveRecord Playing around
* **Insert em uma relação 1:1** =>
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
* Comando muito bom para verificar erros no Console:
    `exemplo = Contact.create(params[:contact])`
    `exemplo.errors.full_messages.to_sentence`

* **Insert em uma relação 1:N** =>

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

_coding_ boy
