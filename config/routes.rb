Rails.application.routes.draw do

  resources :tasks do
    collection do
      get :sort
      get :search
    end
  end
  root to: 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
