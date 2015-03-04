Rails.application.routes.draw do

  resources :events do
    resources :messages
    resources :people, :controller => "event_people", only: [:create, :destroy]
  end

  resources :people
  
  # TODO note: necessary for now to check the json version of the homepage. This can possibly removed later if we leave the JSON views to the machines.
  get '/home' => 'homepage#index'
  
  root 'homepage#index'
  
  
end
