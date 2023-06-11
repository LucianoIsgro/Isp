Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :clients
  resources :internet_providers do
    collection do 
      resources :plans
      
    end
  end
 
 
  resources :requests
  

end
