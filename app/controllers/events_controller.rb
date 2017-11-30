class EventsController < ApplicationController
before_action :auth, only: [:edit, :update, :destroy]
  def index
    @user = current_user
    @my_state = @user.state
    # @in_state_events = Event.where(state: @my_state)
    # @other_state_events = Event.where.not(state: @my_state)

    @in_state_events = Event.where(state: @my_state).eager_load(:user, :users)
    @other_state_events = Event.where.not(state: @my_state).eager_load(:user, :users)
    render layout: "two_column"
  end

  def create
    event = Event.new(event_params)
    event.user = current_user

    if event.save
      redirect_to events_path
    else
      flash[:notice] = event.errors.full_messages
      # puts event.errors.full_messages
      redirect_to events_path
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_count = @event.users.count  # Event.count
    @attenders = @event.users
    @comments = Comment.where(event_id: @event.id).eager_load(:user)
    render layout: "three_column"    
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.update(params[:id], event_params)
    event.user = current_user
    if event.valid?
      redirect_to events_path
    else
      flash[:notice] = event.errors.full_messages
      redirect_to events_path
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path
  end

  private
    def event_params
      params.require(:new_event).permit(:name, :date, :city, :state)
    end

    def auth
      event = Event.find(params[:id])
      return redirect_to events_path unless current_user == event.user
    end
end
