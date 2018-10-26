class MoviesController < ApplicationController
  def index
    @movies = Movie.page(params[:page]).per(12)
    @movies_search = Movie.where('title LIKE ?',  "%#{params[:q]}%")
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
