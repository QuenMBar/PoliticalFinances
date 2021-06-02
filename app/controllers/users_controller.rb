class UsersController < ApplicationController
    before_action :authorized, only: %i[index link update togglePrivate relations unlink]

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

    def relations
        render json: UserSlimSerializer.new(current_user).serializable_hash.to_json
    end

    def index
        options = {}
        options[:include] = [
            :counties,
            :zip_codes,
            :'zip_codes.county',
            :individual_donations,
            :'individual_donations.committee',
        ]
        render json: UserSerializer.new(current_user, options).serializable_hash.to_json
    end

    def link
        # p link_params[:id]

        case link_params[:type]
        when 'county'
            CountyLink.create(user: current_user, county_id: link_params[:id])
        when 'zip_code'
            ZipCodeLink.create(user: current_user, zip_code_id: link_params[:id])
        when 'individual_donation'
            IndividualDonationLink.create(user: current_user, individual_donation_id: link_params[:id])
        end
        render json: { msg: 'done' }
    end

    def unlink
        # p link_params[:id]

        case link_params[:type]
        when 'county'
            CountyLink.find_by(user: current_user, county_id: link_params[:id]).destroy
        when 'zip_code'
            ZipCodeLink.find_by(user: current_user, zip_code_id: link_params[:id]).destroy
        when 'individual_donation'
            IndividualDonationLink.find_by(user: current_user, individual_donation_id: link_params[:id]).destroy
        end

        render json: { msg: 'done' }
    end

    def update
        cu = current_user
        cu.bio = bio_params[:bio]
        cu.save(validate: false)
        options = {}
        options[:include] = [
            :counties,
            :zip_codes,
            :'zip_codes.county',
            :individual_donations,
            :'individual_donations.committee',
        ]
        render json: UserSerializer.new(current_user, options).serializable_hash.to_json
    end

    def togglePrivate
        cu = current_user
        cu.privacy = priv_params[:state]
        cu.save(validate: false)
        options = {}
        options[:include] = [
            :counties,
            :zip_codes,
            :'zip_codes.county',
            :individual_donations,
            :'individual_donations.committee',
        ]
        render json: UserSerializer.new(current_user, options).serializable_hash.to_json
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :type, :id, :jwt)
        # params.permit(:type, :id)
    end

    def link_params
        params.require(:user).permit(:type, :id)
    end

    def bio_params
        params.require(:user).permit(:bio)
    end

    def priv_params
        params.require(:user).permit(:state)
    end
end
