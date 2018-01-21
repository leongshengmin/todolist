Rails.application.routes.draw do
	#session
	get '/login_path', to: 'sessions#new'
	post '/login_path', to: 'sessions#create'

	#task
	get '/user/:user_id/new_task', to: 'task#new'
	post '/user/:user_id/new_task', to: 'task#create'
	get '/user/:user_id/edit_task/:task_id', to: 'task#edit'
	post '/user/:user_id/task/:task_id', to: 'task#update'
	patch '/user/:user_id/edit_task/:task_id', to: 'task#update'
	delete '/user/:user_id/task/:task_id', to: 'task#destroy'
	
	#tasklist
	get '/user/:user_id/new_tasklist', to: 'tasklist#new'
	get '/user/:user_id/show_tasklist', to: 'tasklist#show'
	post '/user/:user_id/new_tasklist', to: 'tasklist#create'
	get '/user/:user_id/show_tasklist/:tasklist_id', to: 'tasklist#destroy'
	delete '/user/:user_id/show_tasklist/:tasklist_id', to: 'tasklist#destroy'

	#user
	get '/signup', to: 'user#new'
	post '/signup', to: 'user#create'

	resources :sessions
	resources :user do
		resources :tasklist do
			resources :task
		end
	end

	root to: 'static_pages#home'
end
