Rails.application.routes.draw do

  get 'home/top'
  post "posts/create"=>"posts#create"
  get 'posts/index'=>"posts#index"
  get 'posts/:id/edit'=>"posts#edit"
  get 'posts/new'=>"posts#new"
  get "posts/:id/follow_index"=>"posts#follow_index"
  get 'posts/:id'=>"posts#show"
  post "posts/:id/destroy"=>"posts#destroy"
  post 'posts/:id/:id_update'=>'posts#update'


  post "users/create"  => "users#create"
  get "users/new" =>"users#new"
  get "users/login_form" => "users#login_form"
  get 'users/index'=>"users#index"
  get "users/:id/edit"=>"users#edit"
  post "users/login"=>"users#login"
  get "logout"=>"users#logout"
  post "users/:id/destroy"=>"users#destroy"
  post "users/:id/:id_update"=>"users#update"
  get 'users/:id'=>"users#show"
  get "users/:id/show_follow" => "users#show_follow"
  get "users/:id/show_follower" => "users#show_follower"
  resources :users do
   member do
     get :following, :followers
   end
 end

  # post "follow/:id" => "relationships#follow", as: "follow"
  # post "unfollow/:id" => "relationships#unfollow", as: "unfollow"

  get "top"=>"home#top"
  root "home#top"
  resources :relationships, only: [:create, :destroy]
# root 'application#hello'
end
