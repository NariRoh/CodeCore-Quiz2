class ReviewsController < ApplicationController
  # before_action :authorize, only: [:destroy]

  def create
    @review = Review.new review_params
    @idea = Idea.find params[:idea_id]
    @review.idea = @idea
    @review.user = current_user

    if @review.save
      redirect_to idea_path(params[:idea_id]), notice: 'Review Created!'
    else
      flash.now[:alert] = 'Please fix errors below'
      render 'ideas/show'
    end
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    redirect_to idea_path(review.idea_id), notice: 'Review deleted!'
  end

  private

  def review_params
    review_params = params.require(:review).permit(:body)
  end

  # def authorize
  #   if cannot?(:manage, @review)
  #     redirect_to 'ideas/show', alert: 'Not authorized!'
  #   end
  # end

end
