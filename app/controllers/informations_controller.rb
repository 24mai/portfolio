class InformationsController < ApplicationController

  #Informationモデルのレコードの一覧表示
  #Information.allで全てのレコードを取得して、インスタンス変数の@informationに代入している
  def index
    @informations = Information.all.page(params[:page]).per(5).order(id: :desc)
  end

  #個別表示
  def show
    set_information
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    
    if @information.save
      flash[:success] = '更新履歴が投稿されました'
      redirect_to @information
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
    if @information.update(information_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @information
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    set_information
    @information.destroy
    
    flash[:success] = 'タスクは削除されました'
    redirect_to informations_url
  end

  
  
  
  private
  
  def set_information
    @information = Information.find(params[:id])
  end
  
  # Strong Parameter
  def information_params
    params.require(:information).permit(:title, :content)
  end
    
end

