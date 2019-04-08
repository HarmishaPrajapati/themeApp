Rails.application.routes.draw do
  devise_for :admins
  devise_scope :admin do
    root to: "devise/sessions#new"
  get 'customers/main'
  resources :bookings
  resources :cleaners
  resources :customers
  end
end
