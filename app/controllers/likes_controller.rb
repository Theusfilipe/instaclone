class LikesController < ApplicationController
  def create
    if user_signed_in?
      @like = current_user.likes.new(like_params)
      if @like.save
        flash[:notice] = "Post liked successfully!"
      else
        flash[:alert] = "You already liked the post"
      end
    else
      flash[:alert] = "Please sign in to like posts"
      # Redirect the user to the sign-in page or handle as appropriate
    end
    redirect_to root_path
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to root_path
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
