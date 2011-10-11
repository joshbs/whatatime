Whatatime::Application.routes.draw do
  devise_for :users

  as :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end

  resources :time_entries
  resource :home, except: [:index, :new, :create, :destroy]

  authenticate :user do
    root :to => "time_entries#index"
  end

  root :to => 'home#show'
end
