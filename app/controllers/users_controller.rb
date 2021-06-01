class UsersController < ApplicationController
    before_action :authorized, only: %i[index link]

    def create
        user_params[:bio] = ''
        if user_params[:username] != '' && user_params[:password] != ''
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
        else
            render json: { "msg": 'Please Enter a Password And a Username' }
        end
    end

    def index
        render json: UserSerializer.new(current_user).serializable_hash.to_json
    end

    def link
        p user_params[:id]

        case user_params[:type]
        when 'county'
            CountyLink.create(user: current_user, county_id: user_params[:id])
        end
        render json: { msg: 'done' }
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :type, :id, :jwt)
        # params.permit(:type, :id)
    end
end
