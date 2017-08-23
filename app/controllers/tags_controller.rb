class TagsController < ApplicationController

  def index
    @tags = []
    tags = Tag.where('name LIKE(?)', "%#{params[:keyword]}%")
    tags.each do |tag|
      t_hash = {}
      t_count = UserTag.where(tag_id: tag.id).count
      t_hash = {tag: tag, count: t_count}
      @tags << t_hash
    end
    respond_to do |format|
      format.json
    end
  end

end
