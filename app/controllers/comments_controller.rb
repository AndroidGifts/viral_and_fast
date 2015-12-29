class CommentsController < ApplicationController
  layout false
  
  def index
  end

  def show
  end

  def new
  end

  def create 
    @this_post = Post.find(params[:post_id])
    @new_comment = @this_post.comments.create(params.require(:comment).permit(:content))
    @new_comment.editor_id = 1;

    if @new_comment.save
      @this_post.comment_count = @this_post.comments.count
      @this_post.save 
      redirect_to @this_post
    end 
  end

  def edit
  end

  def update
  end

  def delete
  end
end
