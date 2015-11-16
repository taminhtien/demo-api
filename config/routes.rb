Rails.application.routes.draw do
  resources :questions, only: [:show] do
    resources :answers, only: [:create]
  end
end
