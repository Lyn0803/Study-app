class SessionsController < ApplicationController
  def new
    user = User.find_by(id: session[:user_id])

    redirect_to :root if user.present?
  end

  def create
    user = User.find_by(email: params[:email])
    is_valid_password = user&.authenticate(params[:password])

    if is_valid_password
      session[:user_id] = user.id
      redirect_to :root, notice: "Đăng nhập thành công!"
    else
      flash.now[:alert] = "Sai email hoặc mật khẩu"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end 