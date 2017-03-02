class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_idea, :authorize_like_creation, only: [:create]

  def create
    like = Like.new idea: @idea, user: current_user

    if like.save
      redirect_to @idea, notice: 'You liked the idea!'
    else
      redirect_to @idea, alert: 'Something is wrong..'
    end
  end

  def destroy
    like = Like.find params[:id]

    if like.destroy
      redirect_to idea_path(like.idea), notice: 'You unlike this!'
    else
      redirect_to idea_path(like.idea),
      notice: like.error.full_messages.join(', ')
    end
  end

  private

  def find_idea
    @idea = Idea.find params[:idea_id]
  end

  def authorize_like_creation
    redirect_to @idea, alert: 'Cannot like your own idea!' if cannot? :like, @idea
  end

end
