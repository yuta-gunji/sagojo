class WorksController < ApplicationController
  before_action :set_company, only: [:new, :create]
  before_action :set_work, only: [:show, :form]

  def index
    @works = Work.order('created_at DESC').limit(5)
  end

  def new
    @work = Work.new
    @work.categories.build
    @work.tags.build
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
    @user = current_user
    @user.categories.build
    @user.tags.build
  end

  def apply
    if current_user.update(apply_params)
      redirect_to root_path
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
      category_ids: [],
      tag_ids: [],
      categories_attributes: [:id, :name],
      tags_attributes: [:id, :name]
    ).merge(company_id: params[:company_id])
  end

end
