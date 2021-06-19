Rails.application.routes.draw do
  resources :participants
  resources :profiles
  resources :competences
  resources :projects
  resources :users
  post '/login', to: 'users#login'
  post '/join_team/:id', to: 'participants#join_team'
  get  '/pending_participants', to: 'participants#pending_participants'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
