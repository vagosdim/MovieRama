class ReactionsController < ApplicationController
    
    before_action :authenticate_user! # Used with devise
    
    def create
        @movie = Movie.find(params[:movie_id])
        @reaction = @movie.reactions.build(user: current_user, reaction_type: params[:reaction_type])
        #puts '\n\nDEBUG\n'
        #puts @reaction.attributes
        #puts '\nDEBUG\n\n'
        #if @reaction.save
            #@movie = Movie.find(params[:movie_id])
            #like_movie(@movie)
            #@reaction.user_id = @movie.user_id
            #@reaction.movie_id = params[:movie_id]
            #@reaction.reaction_type = "like"
        #end

        #puts @reaction
        if @reaction.save
            render json: @reaction, status: :created
        else
            render json: @reaction.errors, status: :unprocessable_entity
        end
    end

    def update
    end

    def destroy
        @movie = Movie.find(params[:movie_id])
        @reaction = @movie.reactions.find_by(user: current_user, reaction_type: "like")
        if @reaction.destroy
            redirect_to movies_path, notice: 'Movie unliked successfully.'
          else
            redirect_to movies_path, alert: 'Failed to unlike the movie.'
        end
    end

    private

    #def like_movie(movie)
    #    puts movie
    #    puts "\n\nDEBUG"
    #end

    #def hate_movie(movie)
    #    puts movie
    #end

    def reaction_params
        params.require(:reaction).permit(:reaction_type, :user_id, :movie_id)
    end
end
