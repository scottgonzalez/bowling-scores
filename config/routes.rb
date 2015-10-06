Rails.application.routes.draw do
  root "series#index"

  resources :series do
    resources :game
  end
end
