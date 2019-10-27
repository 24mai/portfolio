class MessagesController < ApplicationController
  
  #Messageモデルのレコードの一覧表示
  #Message.allで全てのレコードを取得して、インスタンス変数の@informationに代入している
  def index
    @messages = Message.all.page(params[:page]).per(5).order(id: :desc)
  end

  #個別表示
  def show
    set_information
  end

  def new
    @message = Message.new
    @messages = Message.all.page(params[:page]).order(id: :desc)
  end

  def create
    @message = Message.new(message_params)
    
    if @message.save
      flash[:success] = '更新履歴が投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = '投稿できませんでした'
      render :new
    end
  end

  def edit
    set_information
  end

  def update
    set_information
    if @message.update(message_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    set_information
    @message.destroy
    
    flash[:success] = 'タスクは削除されました'
    redirect_to messages_url
  end

  
  
  
  private
  
  def set_information
    @message = Message.find(params[:id])
  end
  
  # Strong Parameter
  def message_params
    params.require(:message).permit(:title, :content)
  end
 
end
