class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    @user.categories.build
    @user.tags.build
    @user_categories = UserCategory.all
    @user_tags = UserTag.all
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
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
      category_ids: [],
      tag_ids: [],
      categories_attributes: [:id, :name],
      tags_attributes: [:id, :name]
    )
  end
end
