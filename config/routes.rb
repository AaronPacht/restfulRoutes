Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users', to: 'tests#users'
  get '/posts', to: 'tests#posts'
  get '/userPosts', to: 'tests#userPosts'
end
