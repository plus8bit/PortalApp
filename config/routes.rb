Rails.application.routes.draw do
  
  resources :blogs
  get 'about', to: 'blogs#about'
  root 'blogs#index'
end
