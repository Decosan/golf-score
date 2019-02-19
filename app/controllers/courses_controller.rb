class CoursesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @courses=Course.all.order('alphabet ASC').page(params[:page])
    @scores=current_user.scores.all
  end
  
  def show
    @scores=current_user.scores.where(course_id: params[:id]).order('date DESC').page(params[:page])
    @course=Course.find(params[:id])
  end
end
