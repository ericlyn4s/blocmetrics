class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = RegisteredApplication.all
  end

  def new
    @registered_application = RegisteredApplication.new
  end

    def create
        @registered_application = RegisteredApplication.new
        @registered_application.name = params[:registered_application][:name]



        if @registered_application.save
          redirect_to @registered_application, notice: "Application was registered successfully."
          redirect_to @registered_application
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
    name = @registered_application.name
    authorize @registered_application

    if @registered_application.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
    else
      flash[:error] = "Error deleting application. Please try again."
      end
    end
  end
