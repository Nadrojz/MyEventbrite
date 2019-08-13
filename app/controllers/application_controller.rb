class ApplicationController < ActionController::Base

  def user
  @user= User.find_by(id: params[:id])
  end

end
