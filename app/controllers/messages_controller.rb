class MessagesController < ApplicationController
  before_action :set_work, only: [:index, :create]
  before_action :set_candidates, only: [:index, :create]
  before_action :set_messages, only: [:index, :create]
  before_action :confirm_authorization, only: [:index, :create]


  def index
    @message = Message.new
    respond_to do |format|
      format.html
      format.json { @new_messages = @work.messages.where('id > ?', params[:message][:id]) }
    end
  end

  def create
    build_message
    if @message.save
      respond_to do |format|
        format.html { redirect_to work_messages_path }
        format.json
      end
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def create_params
      params.require(:message).permit(:body, :image).merge(work_id: params[:work_id])
  end

  def build_message
    if company_signed_in?
      @message = current_company.messages.new(create_params)
    elsif user_signed_in?
      @message = current_user.messages.new(create_params)
    end
  end

  def set_work
    @work = Work.find(params[:work_id])
  end

  def set_candidates
    @candidates = @work.users
  end

  def set_messages
    @messages = @work.messages
  end

  def confirm_authorization
    if company_signed_in? && @work.company.id == current_company.id
    elsif user_signed_in? && Candidate.applied_work?(@work.id, current_user.id)
    else
      redirect_to company_work_path(@work.company.id, @work.id), alert: '関連のない求人です'
    end
  end

end
