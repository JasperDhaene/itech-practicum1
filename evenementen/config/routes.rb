Rails.application.routes.draw do

  resources :events do
    resources :messages
  end

  resources :messages

  resources :people
  
  #resources :mongols

  root 'homepage#index'
  
  get '/mongol' => 'mongols#index'


end
