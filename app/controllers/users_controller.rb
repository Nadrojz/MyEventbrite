class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
  # L'utilisateur doit etre connecté pour pouvoir faire une de ces actions ci-dessus
  before_action :authenticate_current_user, only: [:show]
  # Le current_user doit etre le createur du potin pour pouvoir editer ou detruire un potin

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Tu dois te connecter ou t'inscrire pour accéder à la page du profil."
      redirect_to new_user_registration_path
    end
  end

  def authenticate_current_user
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:danger] = "Impossible d'aller sur cette page."
      redirect_to root_path
    end
  end


end
