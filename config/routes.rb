Rails.application.routes.draw do

  root 'session#index'
# User ==================================================
  get 'user/(:id)' => "user#show", as: "user_show"
  post "/register" => "user#create"
  post 'user/' => "user#create", as: "user_create"
  post 'user/(:id)' => "user#update", as: "user_update"
  # Session =============================================
  get '/login' => 'session#index'
  get '/index' => 'session#index'
  get 'session/index' => 'session#index'
  post '/login' => 'session#create', as: "session_create"
  post 'session/create'
  get 'session/destroy'
  get 'session/index'
  # Song ================================================
  #get 'song/new'
  get 'song/index'
  post '/song' => 'song#create', as: 'song_create'
  get 'song/destroy'
  get 'song/show'
  #get 'song/update'
  # Playlist ============================================
  post 'playlist/(:user_id)/(:song_id)' => 'playlist#create', as: 'playlist_create'
  get 'playlist/show(:user_id)' => 'playlist#show', as: 'playlist_show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
