class CoursesController < ApplicationController
  def index
    @courses = Course.all.page(params[:id])
  end

  def show
    @course = Course.find(params[:id])
    @comments = @course.comments
  end

  def new
  end

  def create
  end
end
