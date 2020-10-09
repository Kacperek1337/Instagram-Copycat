Rails.application.routes.draw do
  root 'home#index', as: 'index'

  devise_for :users, path: 'auth'
  devise_scope :user do
    get 'login' => 'devise/sessions#new'
    get 'logout' => 'devise/sessions#destroy'
    get 'register' => 'devise/registrations#new'
  end

  get 'profile/:nickname' => 'profile#show', as: 'profile'

  resources :posts, except: :index do
    get 'comments' => 'comments#index', as: 'comments'
    post 'comment/create' => 'comments#create', as: 'create_comment'
    delete 'comment/delete' => 'comments#destroy', as: 'destroy_comment'
  end

  get 'hashtag/:name' => 'hashtag#show', as: 'hashtag'

  get 'search' => 'search#show', as: 'search'

  post 'like/create/:post_id' => 'like#create', as: 'create_like'
  delete 'like/destroy/:post_id' => 'like#destroy', as: 'destroy_like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
