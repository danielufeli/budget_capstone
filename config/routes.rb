Rails.application.routes.draw do
    authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  devise_for :users
  resources :categories, except: [:show, :update, :edit, :destroy]

  resources :categories, except: [:update, :edit, :destroy] do
    resources :trans, only: [:index, :new, :create]
  end

	devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  root to: 'splash#index'
end
