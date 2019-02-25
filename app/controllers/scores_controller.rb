class ScoresController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  before_action :set_user, only: [:show,:edit,:update]
  
  def index
    @scores = current_user.scores.order('date DESC').page(params[:page])
    @bestscore=current_user.scores.order(:score_total).first
  end

  def new
    @score=Score.new
    2.times { @score.pictures.build }
    @courses=Course.all.order('alphabet ASC')
    @score.put_total = 0
    @score.score_total = 0
  end

  def create
    @score=current_user.scores.build(score_params)
    
    
    if @score.save
      flash[:success]="スコア登録が完了しました"
      redirect_to @score
    else
      @courses=Course.all.order('alphabet ASC')
      flash[:danger]="スコアの登録に失敗しました"
      render :new
    end  
  end

  def destroy
      @score.destroy
      flash[:success]="削除が完了しました"
      path = Rails.application.routes.recognize_path(request.referer)
      if path[:action] == "show"
        redirect_to scores_path
      else
        redirect_back(fallback_location: scores_path)
      end
  end

  def edit
    @courses=Course.all.order('alphabet ASC')
    #@score.image2.cache! unless @score.image2.blank? 
  end

  def update
    if @score.update(update_score_params)
      flash[:success]="編集が完了しました"
      redirect_to @score
    else
      flash[:danger]="編集に失敗しました"
      render :edit
    end  
  end

  def show
    
  end
  
  private
  
  
  def set_user
    @score=current_user.scores.find(params[:id])
  end
  
  def score_params
    params.require(:score).permit(:date,:score_out,:score_in,:score_total,:put_out,:put_in,:put_total,:user,:course_id,:category_id,:memo,:image2_cache, pictures_attributes: [:image2])
  end
  
  def update_score_params
    params.require(:score).permit(:date,:score_out,:score_in,:score_total,:put_out,:put_in,:put_total,:user,:course_id,:category_id,:memo,:image2_cache, pictures_attributes: [:image2, :_destroy, :id])
  end
  
  def correct_user
    @score = current_user.scores.find_by(id: params[:id])
    unless @score
      redirect_to root_url
    end
  end
  
end
