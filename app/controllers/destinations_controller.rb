class DestinationsController < ApplicationController

    def index
        destinations = Destination.all
        render json: destinations.to_json(include: {activities: {only: [:name, :description, :cost]}}, except: [:updated_at, :created_at])
    end

    def create
        # byebug
        destination = Destination.new(destination_params)
        if destination.save
            render json: destination
        else
            render json: {error: 'Could not be created'}
        end
    end

    def destination_params
        params.require(:destination).permit(:location, :locale, :arrival, :departure)
    end
    
end
