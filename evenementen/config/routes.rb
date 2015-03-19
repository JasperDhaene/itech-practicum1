Rails.application.routes.draw do

  resources :events do
    # :new and :show actions are embedded in the event page
    resources :messages, :except => [:index, :new, :show]
    # Only :create and :destroy are applicable to attendances
    resources :people, :controller => "event_people", only: [:create, :destroy]
  end

  resources :people
  
  get '/home' => 'homepage#index'
  
  root 'homepage#index'
  
  
end
