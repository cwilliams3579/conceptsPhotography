Rails.application.routes.draw do
 # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'posts#index'
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :galleries
  resources :posts do
    resources :comments, only: [:new, :show]
  end
end
