class ReactionsController < ApplicationController
    
    before_action :authenticate_user! # Used with devise
    before_action :set_movie, only: [:react, :undo_reaction, :reverse_reaction] # Sets @movie instance before reaction actions
    
    def react
        @reaction = @movie.reactions.build(user: current_user, reaction_type: params[:reaction_type])
        if @reaction.save
            redirect_to movies_path
            #head :ok
        else
            redirect_to movies_path
            #head :bad_request
        end
    end

    def undo_reaction
        @reaction = @movie.reactions.find_by(user: current_user)
        if @reaction &&
            @reaction.destroy
            redirect_to movies_path
            #head :ok
        else
            redirect_to movies_path
            #head :bad_request
        end
    end

    def reverse_reaction
        @reaction = @movie.reactions.find_by(user: current_user)
        if @reaction
            if @reaction.reaction_type == "like"
                @reaction.update_attribute(:reaction_type, "hate")
            elsif @reaction.reaction_type == "like"
                @reaction.update_attribute(:reaction_type, "like")
            end
            redirect_to movies_path
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
