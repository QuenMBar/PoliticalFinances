class ZipCodesController < ApplicationController
    def show
        results =
            IndividualDonation.search params[:id],
                                      fields: [{ zip: :exact }],
                                      page: request.headers['page'],
                                      per_page: request.headers['amount'],
                                      includes: [:committee],
                                      order: {
                                          amount: :desc,
                                      }
        options = { include: [:committee] }
        render json: IndividualDonationSerializer.new(results, options).serializable_hash.to_json
    end
end
