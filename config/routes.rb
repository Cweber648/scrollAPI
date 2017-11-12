Rails.application.routes.draw do
  resources :scrollios, only: [:show] do
    resources :articles, only: [:create]
  end

end



