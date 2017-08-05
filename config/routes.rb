Rails.application.routes.draw do
 mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'posts#index'
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :galleries do
    member do
      put "like" => "galleries#vote"
    end
  end
  resources :posts do
    resources :comments
    member do
      put "like" => "posts#vote"
    end
  end
end
