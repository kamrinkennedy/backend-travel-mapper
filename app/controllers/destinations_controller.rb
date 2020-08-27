class DestinationsController < ApplicationController

    def index
        destinations = Destination.all
        render json: destinations.to_json(include: {activities: {only: [:name, :description, :cost]}}, except: [:updated_at, :created_at])
    end

    def create
        destination = Destination.new(destination_params)
        if destination.save
            render json: destination
        else
            render json: {error: 'Could not be created'}
        end
    end

    def update
        destination = Destination.find(params[:id])
        if destination.update(destination_params)
            render json: destination
        else
            render json: {error: 'Could not update'}
        end
    end
    
    def destroy
        destination = Destination.find(params[:id])
        destination.destroy
        
        render json: {message: "Successfully deleted #{destination.location} trip."}
    end
    
    private
    
    def destination_params
        params.require(:destination).permit(:location, :locale, :arrival, :departure)
    end
end
