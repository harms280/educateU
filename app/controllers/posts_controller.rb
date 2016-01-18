class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit,:update,:destroy]
  before_action :set_curriculum, only: [:new,:create]
  before_action :set_post, only: [:edit,:update,:destroy]

  def new
    @curriculum = Curriculum.find_by_id params[:curriculum_id]
    if @curriculum.user_id = current_user.id
      @post = Post.new
    else
      redirect_to @curriculum, flash: {warning: "Not Authroized"}
    end
  end

  def create
    @post = @curriculum.posts.build(post_params)
    if @post.save
      redirect_to @curriculum, flash: {success: 'Post successfully created'}
    else
      render :new
    end
  end

  def edit

  end

  def update
    @post.update post_params
    if @post.save
      redirect_to @post.curriculum, flash: {success: "Post Successfully Updated"}
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to @post.curriculum, flash: {success: "Post Successfully Deleted"}
    else
      redirect_to @post.curriculum, flash: {error: "There's been an error"}
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:position,:description,:url,:cost)
  end

  def ensure_correct_user
    @post = Post.find_by_id params[:id]
    if @post.curriculum.user_id != current_user.id
      redirect_to root_path, flash: {alert: "Unauthorized Action" }
    end
  end

  def set_curriculum
    @curriculum = Curriculum.find_by_id params[:curriculum_id]
  end

  def set_post
    @post = Post.find_by_id params[:id]
  end
end
