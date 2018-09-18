Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :update, :destroy] #index as user login
      resources :pets, only: [:index]
      namespace :users do
        post '/:id/pets', to: 'pets#create'
        get '/:id/pets', to: 'pets#index'
        get '/:id/matches', to: 'matches#index'
        post '/:user_id/matches/:match_id', to: 'matches#update'
        post '/:id/connections', to: 'connections#create'
        delete '/:id/connections', to: 'connections#destroy'
      end
    end
  end
end
