Whatatime::Application.routes.draw do
  match '/time_entries/:id/start' => 'time_entries#start', :as => :start_time_entry
  match '/time_entries/:id/stop' => 'time_entries#stop', :as => :stop_time_entry
  resources :time_entries

end
