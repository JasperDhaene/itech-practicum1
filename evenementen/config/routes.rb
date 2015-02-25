Rails.application.routes.draw do

  resources :events do
    resources :messages
  end

  resources :messages

  resources :people

  root 'homepage#index'


end
