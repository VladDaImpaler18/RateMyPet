Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #devise_for :views
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'callbacks'}

  nancy did this below : #These are for creating shotcut routes. so localhost:3000/login goes to 'devise/sessions#new'. Must make sure links reflect change
   devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'signout', to:
    get 'dashboard',
   end
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post] #Do i need?
  root to: 'application#welcome'
  
  
end
