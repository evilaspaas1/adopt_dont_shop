Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'welcome#index'
  get '/', to: 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  get '/shelters/:id/pets', to: 'shelters_pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: 'pets#edit'
  get '/pets', to: 'pets#index'
  get '/shelters/:id/pets/new', to: 'shelters_pets#new'
  post '/pets', to: 'pets#create'
  post '/shelters', to: 'shelters#create'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  # resources :shelters, only: [:create, :new, :show, :index]
end
