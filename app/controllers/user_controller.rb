class UserController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def sign_up

    if params[:sign_up_button]
      if params[:username].empty?
        redirect_to user_sign_up_path, alert:"Username could not be blank."
        return
      end
      if params[:password1].empty? || params[:password2].empty?
        redirect_to user_sign_up_path, alert:"Password could not be blank."
        return
      end
      if params[:password1] != params[:password2]
        redirect_to user_sign_up_path, alert:"Password and confirmation are different."
        return
      end

      check_user = User.find_by(username: params[:username])
      if check_user
        redirect_to user_sign_up_path, alert:"Username already exists."
        return
      end

      @user = User.create(username: params[:username], password: params[:password1])
      session[:user_id]=@user.id
      flash[:signed_in] = "true"
      redirect_to root_path, alert:"Welcome, new user: " + @user.username + "!"
      return
    end

    if params[:cancel_button]
      redirect_to root_path
    end
  end

  def sign_in

    if params[:sign_in_button]
      if params[:username].empty?
        flash[:alert] = "Username could not be blank."
        redirect_to root_path
        return
      end
      if params[:password].empty?
        flash[:alert] = "Password could not be blank."
        redirect_to root_path
        return
      end
      @check_user = User.find_by(username: params[:username], password: params[:password])

      if @check_user
        session[:user_id] = @check_user.id
        flash[:signed_in] = "true"
        flash[:alert] = "Welcome back, dear user: " + @check_user.username + "!"
        redirect_to root_path
        return
      else
        flash[:alert] = "Invalid username or password."
        redirect_to root_path
        return
      end
    end

    if params[:sign_up_button]
      redirect_to user_sign_up_path
      return
    end
  end

  def sign_out
    if params[:sign_out_button]
      session[:user_id] = nil
      flash[:alert] = "Successfully signed out."
      redirect_to root_path
      return
    end
  end

end
