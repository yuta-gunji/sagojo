class CategoriesController < ApplicationController

  def index
    @categories = []
    categories = Category.where('name LIKE(?)', "%#{params[:keyword]}%")
    categories.each do |category|
      c_hash = {}
      c_count = UserCategory.where(category_id: category.id).count
      c_hash = {category: category, count: c_count}
      @categories << c_hash
    end
    respond_to do |format|
      format.json
    end
  end

end
