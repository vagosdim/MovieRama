class ReactionsController < ApplicationController
    
    before_action :authenticate_user! # Used with devise
    before_action :set_movie, only: [:react, :undo_reaction, :reverse_reaction] # Sets @movie instance before reaction actions
    
    def react
        return redirect_to movies_path, alert: 'Movie not found' unless @movie

        @reaction = @movie.reactions.build(user: current_user, reaction_type: params[:reaction_type])
        if @reaction.save
            respond_to do |format|
                format.js { render partial: 'reactions/react', locals: { movie: @movie }, layout: false, status: :ok }
            end
        else
            render json: { success: false, errors: @reaction.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def undo_reaction
        return redirect_to movies_path, alert: 'Movie not found' unless @movie
        
        @reaction = @movie.reactions.find_by(user: current_user)
        return redirect_to movies_path unless @reaction
        
        respond_to do |format|
            if @reaction.destroy
                format.js { render partial: 'reactions/react', locals: { movie: @movie }, layout: false, status: :ok }
            else
                format.js { render json: { success: false, errors: @reaction.errors.full_messages }, status: :unprocessable_entity }
            end
        end
        
    end

    def reverse_reaction
        
        return redirect_to movies_path, alert: 'Movie not found' unless @movie
        
        @reaction = @movie.reactions.find_by(user: current_user)
        return redirect_to movies_path unless @reaction

        new_reaction = "invalid reaction"
        if @reaction.reaction_type == "like"
            new_reaction = "hate"
        elsif @reaction.reaction_type == "hate"
            new_reaction = "like"
        end

        respond_to do |format|
            if @reaction.update_attribute(:reaction_type, new_reaction)
                format.js { render partial: 'reactions/react', locals: { movie: @movie }, layout: false, status: :ok }
            else
                format.js { render json: { success: false, errors: @reaction.errors.full_messages }, status: :unprocessable_entity }
            end
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
