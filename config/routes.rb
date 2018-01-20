Rails.application.routes.draw do


	get '/new_task', to: 'task#new'

	post '/new_task', to: 'task#create'

	get '/task', to: 'task#edit'

	post '/task/:id', to: 'task#update'
	patch '/task/:id', to: 'task#update'

	delete '/task', to: 'task#destroy'

	resources :tasklist do
		resources :task
	end

	root to: 'static_pages#home'
end
