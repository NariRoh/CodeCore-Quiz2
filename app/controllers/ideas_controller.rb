class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_idea, except: [:index, :new, :create]
  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user

    if @idea.save
      redirect_to idea_path(@idea), notice: 'New idea created!'
    else
      flash.now[:alert] = 'Fix errors below'
      render :new
    end
  end

  def show
    @review = Review.new
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path @idea, notice: 'Idea edited!'
    else
      flash.now[:alert] = 'Fix errors below'
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to root_path, notice: 'Idea deleted!'
  end

  private

  def idea_params
    idea_params = params.require(:idea).permit(:title, :description)
  end

  def find_idea
    @idea = Idea.find params[:id]
  end

  def authorize
    if cannot?(:manage, @idea)
      redirect_to root_path, alert: 'Not authorized!'
    end
  end

end
