class MainController < ApplicationController
    def new
        if logged_in?
            @user_name = current_user.name
            @user_email = current_user.email
        end
    end
    #def profile
    #    @user = current_user
    #    render layout: false
    #end
    #def destroy
    #    log_out
    #    redirect_to root_path, notice: "Logged out successfully!"
    #end
end