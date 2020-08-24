class DestinationsController < ApplicationController

    def index
        destinations = Destination.all
        render json: destinations.to_json(include: {activities: {only: [:name, :description, :cost]}}, except: [:updated_at, :created_at])
    end
    
end
