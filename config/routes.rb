MusicApp::Application.routes.draw do
  resources :bands
  resources :albums
  resources :tracks
  resources :notes
  resource :session

  get "/users/activate", :to => 'users#activate'

  resources :users


end
