SubwayEntrances::Application.routes.draw do

  root :to => 'home#index'
  get '/populate' => 'home#new'
  post '/populate' => 'home#create', :as => 'populate_post'
  post '/search' => 'home#search'
  post '/lines' => 'home#lines'

end
