Rails.application.routes.draw do
  resources :posts
	root 'index#home'
end