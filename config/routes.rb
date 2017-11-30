Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # get "users" => "users#index"
  # get "users/new" => "users#new"
  post "users" => "users#create", as: :users_create # Route to create new user
  # get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit", as: :users_edit # Route to form to update user profile
  patch "users/:id" => "users#update", as: :users_update # Route to update user profile
  # delete "users/:id" => "users#destroy"

  get "events" => "events#index", as: :events # shows user and events in state and out of state.  Includes form to add event.
  post "events" => "events#create", as: :events_create # event creation method route
  get "events/:id" => "events#show", as: :events_show # shows event and all attendees.  Includes discussion posts
  get "events/:id/edit" => "events#edit", as: :events_edit # show event edit page only if creator logged in
  patch "events/:id" => "events#update", as: :events_update # route to method to update event
  delete "events/:id" => "events#destroy", as: :events_destroy # route to destroy(cancel) entire event if current user is creator

  get "/" => "sessions#index", as: :sessions # Login/registration page
  post "sessions" => "sessions#create", as: :sessions_create # Login/registration method route
  delete "sessions/:id" => "sessions#destroy", as: :sessions_destroy # Logout method route

  post "events/:id/attending_events" => "attending_events#create", as: :attending_events_create # route to method to join an event
  delete "attending_events/:id" => "attending_events#destroy", as: :attending_events_destroy # route to cancel attendance at event

  post "events/:id/comments" => "comments#create", as: :comments_create

  # RESTFUL ROUTES
  # get "users" => "users#index"
  # get "users/new" => "users#new"
  # post "users" => "users#create"
  # get "users/:id" => "users#show"
  # get "users/:id/edit" => "users#edit"
  # patch "users/:id" => "users#update"
  # delete "users/:id" => "users#destroy"
end
