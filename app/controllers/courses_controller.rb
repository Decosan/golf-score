class CoursesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @courses=Course.search(params[:search])
    @scores=current_user.scores.all
  end
  
  def show
    @scores=current_user.scores.where(course_id: params[:id]).order('date DESC').page(params[:page])
    @course=Course.find(params[:id])
  end
  
  private
  
  def course_params
    params.require(:course).permit(:name)
  end
end
