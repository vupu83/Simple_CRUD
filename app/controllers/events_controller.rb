class EventsController < ApplicationController
	def index
		#@events = Event.all
		@events = Event.page(params[:page]).per(5)
	end

	def show
		@event = Event.find(params[:id])
		@page_title = @event.name
	end

	def edit
		if params[:id] == nil
			@event = Event.new
		else
			@event = Event.find(params[:id])
		end
	end	

	def update
		if params[:id] == nil
			@event = Event.new(event_params)
			if @event.save
				flash[:notice] = "event was successfully created	"
				redirect_to :action => :index
			end
		else
			@event = Event.find(params[:id])
			if @event.update(event_params)
				flash[:notice] = "event was successfully updated"
				redirect_to :action => :show, :id => @event.id
			end
		end

		if @event.errors.any?
			render :action => :edit
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		flash[:alert] = "event was successfully deleted"
		redirect_to :action => :index
	end	

	private

	def event_params
  		params.require(:event).permit(:name, :description)
	end
end
