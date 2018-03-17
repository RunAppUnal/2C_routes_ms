Rails.application.routes.draw do
  resources :routes do
    member do
      patch :add_user
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
