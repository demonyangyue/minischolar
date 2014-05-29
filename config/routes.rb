Rails.application.routes.draw do
  resources :articles

  root :to => "visitors#index"
  devise_for :users
  resources :users
end
