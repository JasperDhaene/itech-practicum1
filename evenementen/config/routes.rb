Rails.application.routes.draw do

  resources :events do
    resources :messages
    resources :people, :controller => "event_people", only: [:create, :destroy]
  end

  resources :messages

  resources :people
  
  #resources :mongols

  root 'homepage#index'
  
  get '/mongol' => 'mongols#index'

end
