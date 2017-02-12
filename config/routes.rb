Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "api/users/omniauth_callbacks" }, skip: :all

  namespace :api do
    namespace :v1 do
      namespace :users do
        devise_scope :user do
          get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
          get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
          #TODO Add confirmation + password update
        end
      end

      resources :activities, only: [:index, :create, :show]

      #TODO JWT Token based auth
    end
  end
end
