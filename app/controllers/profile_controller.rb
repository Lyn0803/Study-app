class ProfileController < ApplicationController
    def show
        @user = current_user
    end

    def edit
        @user = current_user
    end

    def update
        user = User.find(params[:user_id])
        
        user.name = params[:name]
        user.email = params[:email]
        user.gender = params[:gender]
        user.height = params[:height]
        user.weight = params[:weight]
        user.tel = params[:tel]

        result = user.save

        if result
            redirect_to profile_path, notice: "Save success"
        else
            redirect_to edit_profile_path
            flash[:alert] = "Save false"
        end
    end
end