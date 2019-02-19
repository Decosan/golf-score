class CategoriesController < ApplicationController
  def show
    @scores=current_user.scores.where(category_id: params[:id]).page(params[:page])
    @category=Category.find(params[:id])
  end
end
