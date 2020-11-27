Rails.application.routes.draw do

  get 'home/top'
  post "posts/create"=>"posts#create"
  get 'posts/index'=>"posts#index"
  get 'posts/:id/edit'=>"posts#edit"
  post 'posts/:id/:id_update'=>'posts#update'
  get 'posts/new'=>"posts#new"
  get 'posts/:id'=>"posts#show"


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

  get "top"=>"home#top"
  root "home#top"
# root 'application#hello'
end
