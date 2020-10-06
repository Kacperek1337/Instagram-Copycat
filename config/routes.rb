Rails.application.routes.draw do
  root 'home#index', as: 'index'

  devise_for :users, path: 'auth'
  devise_scope :user do
    get 'login' => 'devise/sessions#new'
    get 'logout' => 'devise/sessions#destroy'
    get 'register' => 'devise/registrations#new'
  end

  get 'profile/:nickname' => 'profile#show', as: 'profile'

  resources :posts, except: :index

  get 'hashtag/:name' => 'hashtag#show', as: 'hashtag'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
