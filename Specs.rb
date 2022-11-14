1 - model
rails g model task title:string details:text completed:boolean
rails db:create db:migrate

2 - controller
rails g controller tasks

3 - list tasks
i   routes.rb -> get "/tasks", to: "tasks#index"
ii  tasks_controller.rb -> def index { @tasks = Task.all } end
iii index.html.erb -> @tasks.each do |task| ... end
