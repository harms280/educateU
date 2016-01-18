class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @curriculum = Curriculum.find_by_id params[:curriculum_id]
    @post = Post.new
    @languages = Language.all
  end

  def create
    @curriculum = Curriculum.find_by_id params[:curriculum_id]
    @post = @curriculum.posts.build(post_params)
    if @post.save
      redirect_to @curriculum, flash: {success: 'Post successfully created'}
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by_id params[:id]
  end

  def update
    @post = Post.find_by_id params[:id]
    @post.update post_params
    if @post.save
      redirect_to @post.curriculum, flash: {success: "Post Successfully Updated"}
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by_id params[:id]
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
end
