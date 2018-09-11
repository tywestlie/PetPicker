Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      namespace :users do
        post '/:id/pets', to: 'pets#create'
      end
    end
  end
end
