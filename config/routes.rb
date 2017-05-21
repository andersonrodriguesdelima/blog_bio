Rails.application.routes.draw do
  get 'sessions/new'

	resources :posts
	resources :usuarios
	root 'index#home'
	get '/show_post/:id' => 'index#show_post'

	get    'sign_in'   => 'sessions#new'
	post   'sign_in'   => 'sessions#create'
	delete 'sign_out'  => 'sessions#destroy'
end