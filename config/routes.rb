Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :account do
    resources :orders, only: [:index]
    resources :favourites, only: [:index]
  end

end
