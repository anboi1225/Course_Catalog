class ResultController < ApplicationController
  def show
    @subject = params[:select_tag]
    @keyword = params[:search_box]
    @result = Course.where("name LIKE ?", "%#{params[:search_box]}%")
  end
end
