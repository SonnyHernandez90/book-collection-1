Rails.application.routes.draw do
  resources :books do
    get :delete, on: :member
  end

  root "books#index"
end
