Rails.application.routes.draw do
	#session
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#logout'

	#user
	get '/signup', to: 'user#new'
	post '/signup', to: 'user#create'

	#task
	get '/completed/:id', to: 'task#completed', as: 'completed'

	#modals
	#task
	get '/modal_for_new_task' , to: 'task#modal_for_new_task'
	get '/modal_for_search', to: 'task#modal_for_search'
	post '/modal_for_search', to: 'task#modal_for_search', default: { format: :js }

	resources :sessions
	resources :user do
		resources :task
	end

	resources :user do
		resources :tasklist
	end

	root to: 'static_pages#home'
end
