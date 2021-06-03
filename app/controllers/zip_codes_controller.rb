class ZipCodesController < ApplicationController
    def show
        setting = JSON.parse(request.headers['donationCheck'])
        where_op = []
        if setting['id']
            where_op << 'CAN'
            where_op << 'IND'
        end
        if setting['org']
            where_op << 'PTY'
            where_op << 'ORG'
        end
        if setting['com']
            where_op << 'CCM'
            where_op << 'COM'
            where_op << 'PAC'
        end
        results =
            IndividualDonation.search params[:id],
                                      fields: [{ zip: :exact }],
                                      where: {
                                          entity_type: where_op,
                                      },
                                      page: request.headers['page'],
                                      per_page: request.headers['amount'],
                                      includes: [:committee],
                                      order: {
                                          amount: :desc,
                                      }

        # byebug
        options = { include: [:committee] }
        render json: {
                   zip: ZipCodeSerializer.new(ZipCode.find(params[:id]), { include: [:county] }).serializable_hash,
                   id: IndividualDonationSerializer.new(results, options).serializable_hash,
               }.to_json
    end
end
