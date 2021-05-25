class SessionsController < ApplicationController
    def create
        p user_params
        @user = User.find_by(username: user_params[:username])
        if @user && @user.authenticate(user_params[:password])
            token = JWT.encode({ user_id: @user.id, exp: Time.now.to_i + 3600 }, ENV['SUPER_SECRET_KEY'])
            render json: { "token": token }
        else
            render json: { "msg": 'Login failed..' }, status: :not_found
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
