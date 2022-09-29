Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'heart_beat', to: 'application#heart_beat'
  resources :endpoints

  get '/*path', to: 'endpoints#all'
  post '/*path', to: 'endpoints#all'
  delete '/*path', to: 'endpoints#all'
  patch '/*path', to: 'endpoints#all'
  put '/*path', to: 'endpoints#all'

end
