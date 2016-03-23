class HomeController < ApplicationController
  def show
    if params[:course_name]
      @uid = session[:user_id]
      Enrollment.create(username: @uid, course_code: params[:course_name])
    end
    @selected_courses = Enrollment.where("username LIKE ?", "%#{@uid}%")
  end
end
