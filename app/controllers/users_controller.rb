class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def update
    @user = current_user
    if @user.valid_password?(params[:user][:current_password])
      if @user.update(user_params)
        respond_to do |format|
          format.html { redirect_to root_path, notice: "Profile updated successfully." }
          format.json { render json: { message: "Profile updated successfully." } }
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:alert] = "Invalid password. Please enter your current password."
          render :edit
        end
        format.json { render json: { error: "Invalid password." }, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
     params.require(:user).permit(:first_name, :last_name, :email)
  end
end
