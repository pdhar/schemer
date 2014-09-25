Schemer::Engine.routes.draw do
  resources :surveys
  root "surveys#index"
end
