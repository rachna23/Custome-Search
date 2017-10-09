Rails.application.routes.draw do
  resources :categories do
  	collection do
      get :history
      get :search_again
    end
  end	
  root :to => 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
