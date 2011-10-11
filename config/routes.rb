Whatatime::Application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      sign_in: "login",
      sign_out: "logout",
      sign_up: "register"
    }

  resources :time_entries
  resource :home, controller: 'home', except: [:index, :new, :create, :destroy]

  root :to => 'time_entries#index', :constraints => lambda {|r| r.env["warden"].authenticate? }
  root :to => 'home#show'
end
