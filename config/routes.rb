Rails.application.routes.draw do

#Casein routes
namespace :casein do
    resources :dishes
    resources :menus
    resources :restaurants
    resources :events
end

  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  get "home", to: "pages#home"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  end

  scope '(:locale)', locale: /en|ar/ do
    get "home", to: "pages#home"
    root to: 'pages#home'
    resources :users do
      resources :restaurants
    end
  end
end
