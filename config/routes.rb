SubwayEntrances::Application.routes.draw do

  root :to => 'home#index'
  get '/populate' => 'home#new'
  post '/populate' => 'home#create', :as => 'populate_post'
  get '/entrances' => 'home#show'
  post '/search' => 'home#search'

end
