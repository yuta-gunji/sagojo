class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(birth_year: params[:user][:"birth_day(1i)"].to_i,
    birth_month: params[:user][:"birth_day(2i)"].to_i, birth_day: params[:user][:"birth_day(3i)"].to_i) && current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:sex, :phone_number, :division, :municipality, :address, :job_experience, :trip_experience, :skills, :activity, :introduction
    )
  end
end
