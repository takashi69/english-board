class SchoolsController < ApplicationController
  def index
    @schools = School.all.page(params[:id])
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
    @toeic = @school.toeic.page(params[:id])
  end
    
  
  
end
