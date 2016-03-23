class ResultController < ApplicationController
  def show
    @result = Course.where("name LIKE ?", "%#{params[:search_box]}%")
  end
end
