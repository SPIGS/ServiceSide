Rails.application.routes.draw do
  resources :contacts
  resources :organizations
  resources :events
  resources :users , only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'welcome',to:'sessions#welcome'
  get 'signup', to: 'users#new'
  get 'contact', to: 'contacts#new'
  get 'home', to: 'home#index'
  get 'organization/:id', to: 'organizations#show'
  get 'create_event', to: 'events#new'
  post 'create_event', to: 'events#create'
  get 'event/:id', to: 'event#show'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'sessions#welcome'
end
