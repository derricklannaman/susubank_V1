Susubank::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root to: 'info#index'

  #loops thru info pages in home controller
  %w(how_it_works susu101 about).each do |page|
    get page, controller: 'info', action: page
  end

  # sessions
  get   '/signin'   => 'sessions#new'
  post  '/signin'   => 'sessions#create'
  get   '/signout'  => 'sessions#destroy'


  # sign in with facebook thru omniauth
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'session#destroy', as: 'signout'

  # send text message to members with twilio
  get '/twilio' => 'susus#show'
  post '/twilio' => 'twilio#create'

  match "/stats" => 'susus#stats', via: :get

  get "/dashboard/:id" => "bankers#dashboard", as: 'dashboard'
  resources :bankers do
    resources :susus
  end

  match '/calculate' => 'susus#calculate', as: 'calculate'


  resources :susus do
    resources :members
      member do
      end
  end



end
