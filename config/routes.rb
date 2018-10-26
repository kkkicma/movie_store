Rails.application.routes.draw do
  resources :movies, only:[:index, :show]

  resources :search, only: [:index] do
    collection do
      get 'results'
    end 
  end  

  get 'static_about', to: 'pages#about', as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'movies#index'
end
