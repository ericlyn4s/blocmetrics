class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = RegisteredApplication.all
    @events = @registered_application.events(:group => 'name')
    @events.name = params[:event][:name]
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def create
        @registered_application = RegisteredApplication.new


        @registered_application.user = current_user
        @registered_application.name = params[:registered_application][:name]
        @registered_application.URL = params[:registered_application][:URL]



        if @registered_application.save
          flash[:notice] = "Application was registered successfully."
          redirect_to welcome_index_path

        else
          flash[:error] = "Error registering application. Please try again."
          render :new
        end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
    authorize @registered_application
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    authorize @registered_application

    if @registered_application.update_attributes( registered_application_params )
      redirect_to @registered_application, notice: "Application updated successfully."
    else
      flash[:error] = "Error updating applcation. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to welcome_index_path
    else
      flash[:error] = "Error deleting application. Please try again."

      end
    end
  end
