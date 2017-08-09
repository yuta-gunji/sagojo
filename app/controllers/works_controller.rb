class WorksController < ApplicationController
  before_action :set_company, only: [:new, :create]

  def index
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
      redirect_to new_company_work_path, alert: '入力内容に不備があります'
    end
  end

  private

  def work_params
    work_param = params.require(:work).permit(
      :image,
      :outline,
      :fee,
      :qualification_requirements,
      :headcount,
      :span,
      :area,
      :recruitment_end_date,
      category_ids: [],
      tag_ids: []
    ).merge(company_id: params[:company_id])

    new_categories = params.require(:work).permit(categories_attributes: [:name])[:categories_attributes]["0"][:name]
    new_tags = params.require(:work).permit(tags_attributes: [:name])[:tags_attributes]["0"][:name]
    c_params = params.require(:work).permit(categories_attributes: [:name])
    t_params = params.require(:work).permit(tags_attributes: [:name])

    if (new_categories.blank?) && (new_tags.blank?)
      work_param
    elsif (new_categories.present?) && (new_tags.blank?)
      work_param.merge(c_params)
    elsif (new_categories.blank?) && (new_tags.present?)
      work_param.merge(t_params)
    else
      work_param.merge(c_params).merge(t_params)
    end
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

end
