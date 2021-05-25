class UsersController < ApplicationController
    before_action :authorized, only: [:index]

    def create
        user_params[:bio] = ''
        @user = User.create(user_params)
        if @user.persisted?
            render json: { "msg": 'Please Login' }
        else
            if User.find_by(username: user_params[:username])
                render json: { "msg": 'Username Has Been Taken' }
            else
                render json: { "msg": 'Please Enter Password' }
            end
        end
    end

    def index
        render json: UserSerializer.new(current_user).serializable_hash.to_json
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
