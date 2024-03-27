class ReactionsController < ApplicationController

    def create
        @reaction = Reaction.new
        puts params
        
        if(params[:movie_id]).present?
            @movie = Movie.find(params[:movie_id])
            like_movie(@movie)
            @reaction.user_id = @movie.user_id
            @reaction.movie_id = params[:movie_id]
            @reaction.reaction_type = "like"
        end

        puts @reaction
        if @reaction.save
            render json: @reaction, status: :created
        else
            render json: @reaction.errors, status: :unprocessable_entity
        end
    end

    private

    def like_movie(movie)
        puts movie
        puts "\n\nDEBUG"
    end

    def hate_movie(movie)
        puts movie
    end

    def reaction_params
        params.require(:reaction).permit(:reaction_type, :user_id, :movie_id)
    end
end
