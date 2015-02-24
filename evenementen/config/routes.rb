Rails.application.routes.draw do

  resources :events
 
  resources :messages

  resources :people

  root 'homepage#index'


end
