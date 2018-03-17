Rails.application.routes.draw do
  resources :routes do
    member do
      patch :add_user #tested
      patch :remove_user #tested
      get :check_user #tested
      get :users_in_route #tested
      #get :my_routes
    end

    collection do
      get :my_routes #tested
      get :other_routes #tested
      get :search_my_routes #tested
      get :search_other_routes
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
