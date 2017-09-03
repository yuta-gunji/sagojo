class WorksController < ApplicationController
  before_action  :authenticate_company!, only: [:new, :create]
  before_action  :authenticate_user!, only: [:form, :apply]
  before_action  :set_company, only: [:new, :create]
  before_action  :set_work, only: [:show, :form]
  before_action  :set_available_work_categories_to_gon, only: [:new, :create]
  before_action  :set_available_work_skills_to_gon, only: [:new, :create]
  before_action  :set_user, only: [:form, :apply]
  before_action  :set_user_categories_to_gon, only: [:form, :apply]
  before_action  :set_user_skills_to_gon, only: [:form, :apply]
  before_action  :set_available_user_categories_to_gon, only: [:form, :apply]
  before_action  :set_available_user_skills_to_gon, only: [:form, :apply]

  def index
    @works = Work.order('created_at DESC').page(params[:page]).per(5)
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def form
  end

  def apply
    if current_user.update(apply_params)
      candidate = current_user.candidates.new(user_id: @user.id, work_id: params[:id])
      if candidate.save
        redirect_to root_path, notice: '応募が完了しました'
      else
        render :form
      end
    else
      render :form
    end
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_work
    @work = Work.find(params[:id])
  end

  def set_available_work_categories_to_gon
    gon.available_work_categories = Work.tags_on(:categories).pluck(:name)
  end

  def set_available_work_skills_to_gon
    gon.available_work_skills = Work.tags_on(:skills).pluck(:name)
  end

  def work_params
    work_param = params.require(:work).permit(
      :image,
      :title,
      :outline,
      :fee,
      :qualification_requirements,
      :headcount,
      :span,
      :area,
      :recruitment_end_date,
      :category_list,
      :skill_list
    ).merge(company_id: params[:company_id])
  end

  def apply_params
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
    @user = current_user
  end

  def set_user_categories_to_gon
    gon.user_categories = @user.category_list
  end

  def set_available_user_categories_to_gon
    gon.available_user_categories = User.tags_on(:categories).pluck(:name)
  end

  def set_user_skills_to_gon
    gon.user_skills = @user.skill_list
  end

  def set_available_user_skills_to_gon
    gon.available_user_skills = User.tags_on(:skills).pluck(:name)
  end

end
