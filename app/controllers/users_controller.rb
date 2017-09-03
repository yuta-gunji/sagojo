class UsersController < ApplicationController
  before_action  :authenticate_user!
  before_action  :set_user, only: [:edit, :update]
  before_action  :set_user_categories_to_gon, only: [:edit, :update]
  before_action  :set_user_skills_to_gon, only: [:edit, :update]
  before_action  :set_available_user_categories_to_gon, only: [:edit, :update]
  before_action  :set_available_user_skills_to_gon, only: [:edit, :update]

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def apply_list
    @works = current_user.works.includes(:categories, :skills).order('created_at DESC').page(params[:page]).per(10)
  end

  private

  def user_params
    params.require(:user).permit(
      :avatar,
      :sex,
      :phone_number,
      :division,
      :municipality,
      :address,
      :job_experience,
      :trip_experience,
      :activity,
      :introduction,
      :birth_day,
      :category_list,
      :skill_list
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_categories_to_gon
    gon.user_categories = @user.category_list
  end

  def set_user_skills_to_gon
    gon.user_skills = @user.skill_list
  end

  def set_available_user_categories_to_gon
    gon.available_user_categories = User.tags_on(:categories).pluck(:name)
  end

  def set_available_user_skills_to_gon
    gon.available_user_skills = User.tags_on(:skills).pluck(:name)
  end

end
