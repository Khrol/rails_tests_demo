Rails.application.routes.draw do
  get 'average/rate'
  post 'average/calculate'
  get 'average/calculate_api'

  resources :developers
end
