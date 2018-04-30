Rails.application.routes.draw do
  resources :routes do
    member do
      patch :add_user #tested Mutation        #GG
      patch :remove_user #tested Mutation     #GG
      get :check_user #tested Query           #charles
      get :users_in_route #tested  Query      #not needed
      #get :my_routes
    end

    collection do
      get :my_routes #tested Query            #GG
      get :other_routes #tested Query         #GG
      get :search_my_routes #tested Query     #GG
      get :search_other_routes #tested Query  #GG
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
