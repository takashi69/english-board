class CoursesController < ApplicationController
  def index
    @courses = Course.all.page(params[:id])
  end

  def show
    @course = Course.find(params[:id])
    @comments = @course.comments
#コース側から学校を呼び出す
    
    
    
  end

  def new
    @school = School.find(params[:school_id])
    @course = @school.courses.build
  end

  def create
  end
  
  def toeic
    @course = Couses.find(params[:id])
    @toeic = @course.find_by(name: 'toeic')
  end  

  
end
