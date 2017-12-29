class API::EventsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_filter :set_access_control_headers

   def set_access_control_headers
 # #1
     headers['Access-Control-Allow-Origin'] = '*'
 # #2
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
 # #3
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
   end

  skip_before_action :verify_authenticity_token

  def create
    app = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    if app
      @event = app.events.new(event_params)
      if @event.save
        render json: "#{@event} has been created, yay!\n\n", status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    else
      render json: "Unregistered application! Try again!\n\n", status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.permit(:name)
  end
end
