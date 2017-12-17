class WelcomeController < ApplicationController
  def index
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
