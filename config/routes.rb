Whatatime::Application.routes.draw do
  resources :time_entries

  root :to => 'time_entries#index'
end
