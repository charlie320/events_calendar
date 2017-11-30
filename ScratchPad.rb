remeber to install gems:
rails-footnotes
simple_form
rspec
validates_timeliness

Authentication versus Authorization
Authentication = logging in and having access to certain pages
Authorization = Who can change what?
Check all model controllers for authentication and Authorization

Models:
User - first_name, last_name, email, city, state, password_digest, password_confirm
has_many events - events that user has created - user is the host
has_many attending_events, dependent: :destroy - events that user has joined
has_many events_joined, through: attending_events, source:event - attending_event objects that connect user to event

Event - name, date, city, state, user_id
belongs_to user, required: true - an event that the user is hosting
has_many attending_events, dependent: :destroy - events that users are coming to
has_many users, through: :attending_events - events that the users are coming to

Attending_event - user_id, event_id
belongs_to user, required: true - event connected to user that has joined
belongs_to event, required: true - event that user is attending

Comment - user_id, event_id
belongs_to user
belongs_to event

Controllers:
User controller
Event controller
Session controller
ApplicationController already created

Restful Routes:
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

get "/" => "sessions#new", as: :sessions # Login/registration page
post "sessions" => "sessions#create", as: :sessions_create # Login/registration method route
delete "sessions/:id" => "sessions#destroy", as: :sessions_destroy # Logout method route

post "attending_events/create" => "attending_events#create", as: :attending_events_create # route to method to join an event
delete "attending_events/:id" => "attending_events#destroy", as: :attending_events_destroy # route to cancel attendance at event

Controller Methods
for all routes

Begin Building Views/Templates
-build Welcome page

rails g migration AddLocationToUsers user:references # to add field to User model

## Example of link loop
<h3>Secrets</h3>
<% @secrets.each do |secret| %>
  <% # Secret Content that everyone can see %>
  <table>
    <tr>
      <td><%= secret.content %></td>
    </tr>
    <tr>
      <td>future number of likes</td>
      <td>
        <% if current_user == secret.user %>
          <% # Secret Content that only the User that created that secret can see. %>
          <%= link_to "Delete Secret", secrets_destroy_path(secret.id), :method => :delete, :data => {:confirm => "Are you sure?"} %>
        <% end %>
      </td>
    </tr>
  </table>
<% end %>
