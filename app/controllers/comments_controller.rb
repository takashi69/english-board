class CommentsController < ApplicationController
  before_action :require_user_logged_in

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @comments = current_user.comments.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
