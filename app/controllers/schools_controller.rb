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
#作るのはschoolの方じゃなくてコースのほうへ！！！
  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      flash[:success] = '学校を登録しました'
      redirect_to @school
    else
      flash.now[:danger] = '学校の登録に失敗しました。'
      render :new
    end
  end
  
  def courses
    @school = School.find(params[:id])
    @courses = @school.courses.page(params[:id])
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])

    if @school.update(school_params)
      flash[:success] = '学校情報 は正常に更新されました'
      redirect_to @school
    else
      flash.now[:danger] = '学校情報 は更新されませんでした'
      render :edit
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :address, :explanation)
  end
  
  def course_params
    params.require(:course).permit(:name, :term, :price)
  end
    
  
#  def toeic
#    @school = School.find(params[:id])
#    @toeic = @school.courses.find_by(name: 'toeic')
#    @user = current_user
#    @comment = current_user.comments.build  # form_for 用
#    @comments = current_user.comments.order('created_at DESC').page(params[:page])
#  end
end
