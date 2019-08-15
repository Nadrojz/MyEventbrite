class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @event = Event.create(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], admin: current_user)
      if @event.save
        flash[:success] = "Bravo! tu as créé un nouvel évènement dans ta ville !"
        redirect_to events_path
      else
        render 'new'
      end
  end

  def show
    @event = Event.find(params[:id])
  end

end
