class CommentsController < ApplicationController
  before_action :require_user_logged_in

  def create
    @course = Course.find(params[:course_id])
    @comment = current_user.comments.build(comment_params)
    @comment.course_id = @course.id
    if @comment.save!
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to @course
    else
      @comments = @course.comments.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'courses/show'
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
