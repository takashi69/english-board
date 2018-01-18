class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @comment = current_user.comments.build  # form_for 用
      @comments = current_user.comments.order('created_at DESC').page(params[:page])
    end
  end
end