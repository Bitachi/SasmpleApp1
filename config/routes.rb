Rails.application.routes.draw do
  get 'sessions/new'
  get 'user/new'
  root "static_pages#home"
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup', to: 'user#new'
  post "/signup", to: "user#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "user#destroy"
  resources :user
end
