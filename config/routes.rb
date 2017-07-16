Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :galleries
  resources :posts do
    resources :comments
  end
end
