Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :articles do                 #, except: [:show]
    resources :comments
  end  
  resources :tags
  root 'articles#index'
  
  # get 'articles/:id' => 'articles#show', as: 'articles_show'
  # Defines the root path route ("/")
  # root "articles#index"
end
