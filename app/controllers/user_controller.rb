class UserController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def sign_up
    if params[:errorinfo]
      @error = params[:error]
    end

    if params[:sign_up_button]
      if params[:username].nil?
        redirect_to user_sign_up_path(:error => "Username can't be blank.")
        return
      end
      if params[:password1].nil? || params[:password2].nil?
        redirect_to user_sign_up_path(:error => "Password can't be blank")
        return
      end
      if params[:password1] != params[:password2]
        redirect_to user_sign_up_path(:error => "Password and confirmation should be the same.")
        return
      end

      check_user = User.find_by(username: params[:username])
      if check_user
        redirect_to user_sign_up_path(:error => "Username already exists.")
        return
      end

      @user = User.create(username: params[:username], password: params[:password1])
      redirect_to root_path
      return
    end


    if params[:cancel_button]
      redirect_to root_path
    end
  end

  def sign_in
    if params[:sign_in_button]
      redirect_to root_path
    elsif params[:sign_up_button]
      redirect_to user_sign_up_path
    end
  end

  def sign_out

  end
end
