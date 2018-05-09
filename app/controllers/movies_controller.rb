class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find_by(id: params[:id])

    render json: {ok: false, error: :not_found}, status: :not_found if @movie.nil?
  end

  def create
    #
    # if movies_params[:inventory].nil?
    #   inventory = movies_params[:inventory]
    # else
    #   inventory = 0
    # end

    # movie = Movie.create(movies_params, inventory: inventory)
     movie = Movie.create(movies_params)

    if movie.valid?
      render json: {id: movie.id}, status: :ok
    else
      render json: {ok: false, errors: movie.errors}, status: :bad_request
    end
  end

  private
  def movies_params
    params.require(:movie).permit(:title, :release_date, :overview, :inventory)
  end
end
