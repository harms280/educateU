class PostsController < ApplicationController
  def new
    @curriculum = Curriculum.find_by_id params[:curriculum_id]
    @post = Post.new
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
end
