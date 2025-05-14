class SessionsController < ApplicationController

  skip_before_action :authenticate!

  def new
    redirect_to :root if current_user.present?
  end

  def create
    user = User.where("email = :key OR tel = :key", key: params[:account]).first
    is_valid_password = user&.authenticate(params[:password])

    if is_valid_password
      session[:user_id] = user.id
      redirect_to :root, notice: "Đăng nhập thành công!"
    else
      flash.now[:alert] = "Sai email/số điện thoại hoặc mật khẩu"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
