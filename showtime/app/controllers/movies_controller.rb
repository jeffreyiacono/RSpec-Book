class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  def create
    Movie.create(params[:movie].merge(:genres => Genre.find(params[:genres])))
    redirect_to movies_path
  end
end
