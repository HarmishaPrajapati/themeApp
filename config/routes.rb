Rails.application.routes.draw do
  devise_for :users 
  devise_scope :user do
    authenticated  do
      root to: 'customers#main'
      get '/users/sign_out' => 'devise/sessions#destroy'     
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end
  get 'customers/main'
 
  resources :bookings
  resources :cleaners
  resources :customers  
  
end
