class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities
    end

    def create
        activity = Activity.new(activity_params)
        if activity.save
            render json: activity
        else
            render json: {error: 'Could not be created'}
        end
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy

        render json: {message: `Successfully deleted #{activity.name}.`}
    end

    private

    def activity_params
        params.require(:activity).permit(:name, :description, :cost, :destination_id)
    end

end
