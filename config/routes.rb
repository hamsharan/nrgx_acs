Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #Rails.application.routes.draw do
  root to: 'site#index'

    namespace :api do
      namespace :v1 do
        resources :persons, only: [:index, :create, :destroy, :update]
        resources :accounts, only: [:new_transaction, :change_status, :index, :create, :destroy, :update]
      end
    end
end
