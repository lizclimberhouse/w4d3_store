Rails.application.routes.draw do

    root "departments#index"

    resources :departments do
      resources :items
    end

    # scope
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
