NinetynineCats::Application.routes.draw do
  resources :cats
  resources :cat_rental_requests, only: [:create, :new] do
    patch "/approve", to: "cat_rental_requests#approve"
    patch "/deny", to: "cat_rental_requests#deny"
  end

  resources :users, only: [:create, :new]
  resource :session
end

