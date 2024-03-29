class ApplicationController < ActionController::Base
    rescue_from ActionController::RoutingError, with: :route_not_found

    def route_not_found
        redirect_to '/404'
    end
end
