Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/sign_out' => 'devise/sessions#destroy'
  resources :flats do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, except: %i[new index create]
end
