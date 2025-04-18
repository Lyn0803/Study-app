class SessionsController < ApplicationController
  def new
    user = User.find_by(id: session[:user_id])
    redirect_to :root if user.present?
  end

  def create
    login = params[:login]    
    user = User.find_by(email: login) || User.find_by(tel: login)
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
