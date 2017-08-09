class TagsController < ApplicationController

  def index
    @tags = Tag.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json
    end
  end

end
