Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :activities
      resources :users
      post 'user_token', to: 'user_token#create'
    end
  end
end
