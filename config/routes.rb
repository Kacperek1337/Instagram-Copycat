Rails.application.routes.draw do
  root 'home#index', as: 'index'
  get 'posts.json' => 'home#index', as: 'json_posts'

  devise_for :users, path: 'auth'
  devise_scope :user do
    get 'login' => 'devise/sessions#new'
    get 'logout' => 'devise/sessions#destroy'
    get 'register' => 'devise/registrations#new'
  end

  get 'profile/:nickname' => 'profile#show', as: 'profile'

  post 'follow/:user_id' => 'followers#create', as: 'create_follow'
  delete 'follow/:user_id' => 'followers#destroy', as: 'destroy_follow'

  resources :posts, except: :index do
    get 'comments' => 'comments#index', as: 'comments'
    post 'comment/create' => 'comments#create', as: 'create_comment'
  end

  delete 'comment/destroy' => 'comments#destroy', as: 'destroy_comment'

  get 'hashtag/:name' => 'hashtag#show', as: 'hashtag'

  get 'search' => 'search#show', as: 'search'

  post 'like/create/:post_id' => 'like#create', as: 'create_like'
  delete 'like/destroy/:post_id' => 'like#destroy', as: 'destroy_like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
