class CountiesController < ApplicationController
    include ActionController::Caching
    caches_page :geojson

    def index
        # results =
        #     County.search '*',
        #                   page: request.headers['page'],
        #                   per_page: request.headers['amount'],
        #                   order: {
        #                       total_donated: :desc,
        #                   }
        render json: CountyBulkSerializer.new(County.all).serializable_hash.to_json
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

    def geojson
        geojson = { "type": 'FeatureCollection', "features": [] }
        County.all.each do |c|
            geojson[:features] << {
                "type": 'Feature',
                "geometry": {
                    "type": 'Point',
                    "coordinates": [c.lat, c.log],
                },
                "properties": {
                    "name": c.name,
                    "state": c.state,
                    "FIPS": c.fids,
                    "total_donated": c.total_donated,
                    "dem_donation": c.dem_donation,
                    "rep_donation": c.rep_donation,
                    "other_donation": c.other_donation,
                    "radius": c.total_donated / 8_000_000,
                },
            }
        end
        response.set_header('Access-Control-Expose-Headers', '*')
        response.set_header('total_donated', County.sum(:total_donated))
        response.set_header('dem_donation', County.sum(:dem_donation))
        response.set_header('rep_donation', County.sum(:rep_donation))
        response.set_header('other_donation', County.sum(:other_donation))
        render json: geojson
    end
end
