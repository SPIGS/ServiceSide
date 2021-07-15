Rails.application.routes.draw do
  resources :contacts
  resources :users , only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to:'sessions#create'
  get 'welcome',to:'sessions#welcome'
  get 'signup', to: 'users#new'
  get 'contact', to: 'contacts#new'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => 'sessions#welcome'
end
