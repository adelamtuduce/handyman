class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy, :update_role]
  def index
  end
  
  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @user.personal_information
        puts params[:user]
        @user.personal_information.update_attributes(user_params[:personal_information])
      else
        personal_information = PersonalInformation.new(user_params[:personal_information])
        personal_information.save
        @user.personal_information = personal_information
        @user.save
      end
      format.html { redirect_to edit_user_path(@user), notice: 'Personal information was successfully updated.' }
      format.json { render :show, status: :ok, location: @user }
    end
  end

  def role_select
  end

  def destroy
  end

  def update_role
    @user.update_attributes(role_id: Role.find_by(name: params[:role]))
    redirect_to edit_user_path(@user)
  end
    
  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(
      :email,
      :personal_information => [
        :first_name,
        :last_name,
        :city,
        :number,
        :apartment,
        :county,
        :street,
        :building,
        :country
      ]  
    ) 
  end

end
