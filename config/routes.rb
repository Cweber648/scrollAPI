Rails.application.routes.draw do

  resources :scrollios, only: [:show, :destroy] do
    resources :articles, only: [:create, :destroy]
  end

end



