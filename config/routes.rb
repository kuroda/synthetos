Synthetos::Application.routes.draw do
  scope path: ":current_date", constraints: { current_date: /(19|20)\d\d-\d\d-\d\d/ } do
    resources :departments do
      resources :products
    end
  end
end
