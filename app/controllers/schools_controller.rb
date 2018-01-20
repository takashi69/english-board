class SchoolsController < ApplicationController
  def index
    @schools = School.all.page(params[:id])
 #   @school =  School.find(params[:id])

  end

  def show
    @school = School.find(params[:id])
    @courses = @school.courses.all.page(params[:page])
#   @toeic = @school.toeic.page(params[:page])
  end

  def new
  end

  def create
  end
  
  def courses
    @school = School.find(params[:id])
    @courses = @school.courses.page(params[:id])
  end
  
  def toeic
    @school = School.find(params[:id])
    @toeic = @school.courses.find_by(name: 'toeic')
    @user = current_user
    @comment = current_user.comments.build  # form_for 用
    @comments = current_user.comments.order('created_at DESC').page(params[:page])
  end
    
end
