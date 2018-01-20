Rails.application.routes.draw do

	#task
	get '/new_task/:id', to: 'task#new'
	post '/new_task/:id', to: 'task#create'
	get '/edit_task/:id', to: 'task#edit'
	post '/task/:id', to: 'task#update'
	patch '/edit_task/:id', to: 'task#update'
	delete '/task/:id', to: 'task#destroy'
	
	#user
	get '/signup', to: 'user#new'
	post '/signup', to: 'user#create'

	#tasklist
	get '/new_tasklist', to: 'tasklist#new'
	get '/show_tasklist', to: 'tasklist#show'
	post '/new_tasklist', to: 'tasklist#create'
	delete 'show_tasklist/:id', to: 'tasklist#destroy'

	resources :user do
		resources :tasklist do
			resources :task
		end
	end

	root to: 'static_pages#home'
end
