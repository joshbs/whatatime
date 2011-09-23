Whatatime::Application.routes.draw do
  devise_for :users

  resources :time_entries

  root :to => 'time_entries#index'
end
