class SearchController < ApplicationController
  helper SearchHelper
  def show
    if params[:search_button]
      @subject = params[:select_tag]
      @keyword = params[:search_box].downcase
      factor1 = true unless @subject == "All Subjects"
      factor2 = true unless @keyword.empty?

      if factor1
        subject = Subject.where("name LIKE ?", "%#{@subject}%")
        subject.each do |i|
          @sid = i.sid
        end
      end

      if factor1 && factor2
        @result = Course.where("lower(name) LIKE ? AND subjects LIKE ?", "%#{@keyword}%", "%#{@sid}%")
      elsif factor1
        @result = Course.where("subjects LIKE ?", "%#{@sid}%")
      elsif factor2
        @result = Course.where("lower(name) LIKE ?", "%#{@keyword}%")
      else
        @result = Course.all
      end

    end
  end

end
