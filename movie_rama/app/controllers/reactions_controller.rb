class ReactionsController < ApplicationController
    
    before_action :authenticate_user! # Used with devise
    before_action :set_movie, only: [:react, :undo_reaction, :reverse_reaction] # Sets @movie instance before reaction actions
    
    def react
        if @movie
            @reaction = @movie.reactions.build(user: current_user, reaction_type: params[:reaction_type])
            if @reaction.save
                render 'reactions/react', locals: { movie: @movie }, layout: false
            else
                render json: { success: false, errors: @reaction.errors.full_messages }, status: :unprocessable_entity
            end
        else
            redirect_ movies_path, alert: 'Movie not found'
        end
    end

    def undo_reaction
        if @movie
            @reaction = @movie.reactions.find_by(user: current_user)
            if @reaction && @reaction.destroy
                render 'reactions/react', locals: { movie: @movie }, layout: false
            else
                render json: { success: false, errors: @reaction.errors.full_messages }, status: :unprocessable_entity
            end
        else
            redirect_ movies_path, alert: 'Movie not found'
        end
    end

    def reverse_reaction
        if @movie
            @reaction = @movie.reactions.find_by(user: current_user)
            if @reaction
                if @reaction.reaction_type == "like"
                    @reaction.update_attribute(:reaction_type, "hate")
                elsif @reaction.reaction_type == "hate"
                    @reaction.update_attribute(:reaction_type, "like")
                end
                render 'reactions/react', locals: { movie: @movie }, layout: false
            end
        else
            redirect_ movies_path, alert: 'Movie not found'
        end
    end

    private

    def set_movie
        @movie = Movie.find(params[:id])
      end

    def reaction_params
        params.require(:reaction).permit(:reaction_type, :user_id, :movie_id)
    end
end
