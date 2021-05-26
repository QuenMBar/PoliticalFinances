class CountiesController < ApplicationController
    def index
        results =
            County.search '*',
                          page: request.headers['page'],
                          per_page: request.headers['amount'],
                          order: {
                              total_donated: :desc,
                          }
        render json: CountyBulkSerializer.new(results).serializable_hash.to_json
    end

    def show
        begin
            results = County.includes(:zip_codes).find(params[:id])
            options = { include: [:zip_codes] }
            render json: CountySerializer.new(results, options).serializable_hash.to_json
        rescue => exception
            p exception
            render json: { "msg": 'County Doesnt Exist' }, status: :not_found
        end

        # render json: CountySerializer.new(results).serializable_hash.to_json
    end
end
