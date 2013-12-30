
Dropppin::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'home#index'

  post 'places' => 'places#create'
  post 'places/clear_all' => 'places#clear_all', as: :clear_all
  post 'places/clear_done' => 'places#clear_done', as: :clear_done
  put 'places/:id' => 'places#toggle_done'

end
