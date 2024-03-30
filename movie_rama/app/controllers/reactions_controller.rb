class ReactionsController < ApplicationController
    
    before_action :authenticate_user! # Used with devise
    
    def react
        movie = Movie.find_by(title: params[:title])
        if movie && %w(like hate).include?(params[:reaction_type])
            Reaction.create(user: current_user, movie: movie, reaction_type: params[:reaction_type])
            redirect_to movies_path
            #head :ok
        else
            redirect_to movies_path
            #head :bad_request
        end
    end

    def undo_reaction
        movie = Movie.find_by(title: params[:title])
        if movie
            reaction = Reaction.find_by(user: current_user, movie: movie)
            if reaction
                reaction.destroy
                redirect_to movies_path
                #head :ok
            else
                redirect_to movies_path
                #head :bad_request
            end
        end
    end

    def reverse_reaction
        movie = Movie.find_by(title: params[:title])
        if movie
            reaction = Reaction.find_by(user: current_user, movie: movie)
            if reaction.reaction_type == "like"
                reaction.update_attribute(:reaction_type, "hate")
            elsif reaction.reaction_type == "like"
                reaction.update_attribute(:reaction_type, "like")
            end
        end
    end

    private

    def reaction_params
        params.require(:reaction).permit(:reaction_type, :user_id, :movie_id)
    end
end
