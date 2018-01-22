class CoursesController < ApplicationController
  def index
    @courses = Course.all.page(params[:id])
  end

  def show
    @course = Course.find(params[:id])
    @comments = @course.comments.order('created_at DESC').page(params[:page])
    @comment = Comment.new
#コース側から学校を呼び出す
  end

  def new
    @school = School.find(params[:school_id])
    @course = @school.courses.build
  end


  def create
    @school = School.find(params[:school_id])
    @course = @school.courses.build(course_params)
  
    if @course.save
      flash[:success] = '登録成功'  
      redirect_to @school
    else
      flash.now[:danger] = '登録失敗'
      render :new
    end
  end

  def courses
    @school = School.find(params[:id])
    @courses = @school.courses.page(params[:id])
  end

  def edit
    @school = School.find(params[:id])
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      flash[:success] = '学校情報 は正常に更新されました'
      redirect_to @course
    else
      flash.now[:danger] = '学校情報 は更新されませんでした'
      render :edit
    end
  end

  
#  def toeic
#    @course = Couses.find(params[:id])
#    @toeic = @course.find_by(name: 'toeic')
#  end  

  private

  def course_params
    params.require(:course).permit(:name, :term, :price)
  end
end
