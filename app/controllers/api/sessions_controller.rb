class Api::SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(
            # params[:user][:username],
            # params[:user][:first_name],
            # params[:user][:last_name],
            params[:user][:email],
            params[:user][:password]
        )
    # debugger
        if @user
            login(@user)
            render "api/users/show"
        else
            render json: ["Invalid credentials"], status: 401
        end
      end
    
      def destroy
            @user = current_user
        if @user
            logout
            render "api/users/show"
        else
            render json: ["Error"], status: 404
        end
      end
end