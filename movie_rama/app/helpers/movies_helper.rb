module MoviesHelper
    def user_display_name(movie)
        if user_signed_in? && current_user.email == movie.user.email
            'You'
        else
            movie.user.email
        end
    end
end
