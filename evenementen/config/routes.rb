Rails.application.routes.draw do

  resources :events do
    resources :messages
    resources :people, :controller => "event_people", only: [:create, :destroy]
  end

  resources :people

  root 'homepage#index'

end
