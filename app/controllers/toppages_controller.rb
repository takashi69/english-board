class ToppagesController < ApplicationController
  def index
    @schools = School.all.page(params[:id])
 #   @school =  School.find(params[:id])

  end
end