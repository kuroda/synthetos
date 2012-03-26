Synthetos::Application.routes.draw do
  resources :departments do
    resources :products
  end
end
