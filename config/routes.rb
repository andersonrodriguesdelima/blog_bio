Rails.application.routes.draw do
  resources :posts
	root 'index#home'
	get '/show_post/:id' => 'index#show_post'
end