1 - model
rails g model task title:string details:text completed:boolean
rails db:create db:migrate

2 - controller
rails g controller tasks
