Rails.application.routes.draw do

  get 'home/top'
  post "posts/create"=>"posts#create"
  get 'posts/index'=>"posts#index"
  get 'posts/:id/edit'=>"posts#edit"
  get 'posts/new'=>"posts#new"
  get "posts/:id/follow_index"=>"posts#follow_index"
  get 'posts/:id'=>"posts#show"
  post "posts/:id/destroy"=>"posts#destroy"
  post 'posts/:id/update'=>'posts#update'


  post "users/create"  => "users#create"
  get "users/new" =>"users#new"
  get "users/login_form" => "users#login_form"
  get 'users/index'=>"users#index"
  get "users/:id/edit"=>"users#edit"
  post "users/login"=>"users#login"
  get "logout"=>"users#logout"
  post "users/:id/destroy"=>"users#destroy"
  post "users/:id/update"=>"users#update"
  get 'users/:id'=>"users#show"
  get "users/:id/show_follow" => "users#show_follow"
  get "users/:id/show_follower" => "users#show_follower"
  get "users/:id/show_likes"=>"users#show_likes"
  resources :users do
    member do
      get :following, :followers
    end
  end

  delete "likes/:id/destroy"=>"likes#destroy"
  post "likes/:id/create"=>"likes#create"

  post "comment/:id/create" => "comments#create"

  get "top"=>"home#top"
  root "home#top"
  resources :relationships, only: [:create, :destroy]

end
