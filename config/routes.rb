Rails.application.routes.draw do
  resources :service_details
  resources :quote_details
  resources :process_details
  resources :project_details
  resources :users
  resources :uom_details
  resources :currency_types
  resources :project_types
  resources :user_roles
  resources :user_types
  namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
          get 'users/login'
          get 'users/user_type'
          get 'users/update_password'
          get 'users/client'
          post 'users/signup'
          get 'quote_details/dashboard'
          get 'quote_details/invoice_page'
          get 'quote_details/search'
          get 'project_types/project_type'
          get 'process_details/processdata'
        resources :quote_details
        resources :process_details
        resources :project_details
        resources :uom_details
        resources :currency_types
        resources :project_types
        resources :user_roles
        resources :user_types
        resources :users
        resources :service_details
      end
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
