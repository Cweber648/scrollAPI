Rails.application.routes.draw do
  resources :scrollios do
    resources :articles
  end

end



