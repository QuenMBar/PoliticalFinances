class ApplicationController < ActionController::API
    def current_user
        token = request.headers['token']
        begin
            payload = JWT.decode token, ENV['SUPER_SECRET_KEY'], true
        rescue JWT::VerificationError
            render json: { "msg": 'Login first..' }
            return nil
        end
        @user = User.find_by(id: payload[0]['user_id'])
    end

    def authorized
        !!current_user
    end
end
