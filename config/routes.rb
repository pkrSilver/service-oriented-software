Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check
    root to: 'home#index'

    get 'sign_up', to: 'user#new'

    post 'sign_up', to: 'user#create'
    
    resource :session, only: [:new, :create, :destroy]
    resource :user, only: [:new, :create]
    resource :main, only: [:new, :create, :destroy]
    resource :hobby, only: [:new, :create]
    resources :group_chats, only: [:new, :create, :show]
    resources :chats, only: [:index, :show, :create]
    resources :messages, only: [:create]
    resources :group_chatrooms, only: [:index, :new, :create, :show]
    
    get    '/log_in',   to: 'sessions#new'
    post   '/log_in',   to: 'sessions#create'
    delete '/log_out',  to: 'sessions#destroy'
    
    get 'main', to: 'main#new', as: 'main_new'
    delete 'main', to: 'main#destroy', as: 'main_destroy'
    
    get '/fetch_user_info_path', to: 'main#fetch_user_info'
    get '/hobby', to: 'hobbies#new'
    get '/chat', to: 'chats#index'
    get 'group_chats/:id/search', to: 'group_chats#search', as: 'search_group_chat'
    
    resources :group_chats do
      get 'search', on: :member
      resources :posts do
        resources :comments
        resources :likes
      end
    end

    resources :chats do
      resources :messages
    end
    
    resources :group_chatrooms do
      post 'create_message', on: :collection
    end
  # Defines the root path route ("/")
  # root "posts#index"
end
