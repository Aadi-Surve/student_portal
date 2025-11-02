module Api
  class BaseController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!
    before_action :set_default_format
    before_action :add_version_headers

    private

    def set_default_format
      request.format = :json
    end

    def add_version_headers
      response.headers['X-API-Version'] = '1.0'
    end

    def pagination_dict(collection)
      {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page,
        total_pages: collection.total_pages,
        total_count: collection.total_count
      }
    end
  end
end