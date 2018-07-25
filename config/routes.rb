Rails.application.routes.draw do

  root 'pages#home'
  devise_for :users,
              path: '', #we don't need pages (we have url right after localhost)
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'}
              # controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  resources :users, only: [:show]


  # Это распознает /rooms/1/listing с GET и направит в экшн listing контроллера RoomController со значением id ресурса, переданного в params[:id]
  # or /rooms/:id/listing(.:format) 
  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
    resources :photos, only: [:create, :destroy]
  end

end
