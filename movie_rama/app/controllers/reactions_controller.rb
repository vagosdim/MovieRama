class ReactionsController < ApplicationController
    
    before_action :authenticate_user! # Used with devise
    
    def create
        @movie = Movie.find(params[:movie_id])
        @reaction = @movie.reactions.build(user: current_user, reaction_type: params[:reaction_type])
        if @reaction.save
            redirect_to movies_path
            #render json: @reaction, status: :created
        else
            render json: @reaction.errors, status: :unprocessable_entity
        end
    end

    def update
    end

    def destroy
        @movie = Movie.find(params[:movie_id])
        @reaction = @movie.reactions.find_by(user: current_user, reaction_type: params[:reaction_type])
        if @reaction.destroy
            redirect_to movies_path, notice: 'Movie unliked successfully.'
          else
            redirect_to movies_path, alert: 'Failed to unlike the movie.'
        end
    end

    private

    def reaction_params
        params.require(:reaction).permit(:reaction_type, :user_id, :movie_id)
    end
end
