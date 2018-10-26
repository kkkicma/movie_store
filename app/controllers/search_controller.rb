class SearchController < ApplicationController
    def index
        @movies_all = Movie.all
    end

    def results
        @movies = Movie.where('title LIKE ?', "%#{params[:q]}%")     
    end    
end
