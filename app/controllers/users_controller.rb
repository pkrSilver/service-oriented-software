class UsersController < ApplicationController
    def new

       @user= User.new
       render :new

    end

    def create

        @user = User.new(user_params)

        if @user.save
            
            flash[:notice] = "Succesfully created account!"
            redirect_to root_path

        else

            flash[:notice] = "Something went wrong."
            render :new

        end

    end

    private

    def user_params

        params.require(:user).permit(:name, :surname, :email, :password)

    end
end
