class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.event = Event.find(params[:id])

    if comment.save
      redirect_to events_show_path
    else
      flash[:notice] = comment.errors.full_messages
      puts comment.errors.full_messages
      redirect_to events_show_path
    end
  end

  def destroy

  end

private
  def comment_params
    params.require(:discussion).permit(:content)
  end

end
