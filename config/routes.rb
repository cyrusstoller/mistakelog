Rails.application.routes.draw do
  unauthenticated do
    root to: 'pages#home'
  end
  authenticate :user do
    root to: 'mistakes#index', as: :authenticated_root
  end

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    omniauth: 'users/omniauth',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }
  get 'about', to: 'pages#about'
  resources :mistakes do
    member do
      get :add_reflection
    end
  end
  resources :tags, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
