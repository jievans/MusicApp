MusicApp::Application.routes.draw do
  resources :bands
  resources :albums
  resources :tracks
  resources :notes
end
