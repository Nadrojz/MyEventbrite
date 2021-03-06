Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
