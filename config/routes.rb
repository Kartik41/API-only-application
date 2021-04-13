Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  namespace :api do
    namespace :v1 do
      #get 'post/index'
      #get 'posts/index'
      #post 'posts/create'
      
      resources :posts
      post :auth, to: 'authentication#create'
      get '/auth' => 'authentication#fetch'
    end
  end
  #root 'posts#index'
  #resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
