class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render(json: movies.as_json(except: [:created_at, :updated_at]), status: :ok)
  end

  def show
    @movie = Movie.find_by(id: params[:id])

        # if @movie
        #   render json: @movie.as_json(only: [:id, :title, :release_date, :overview]), status: :ok
        #
        # else
        #   render json: {ok: false, errors: "Movie not found"}, status: :not_found
        # end
  end

  def create
    movie = Movie.create(movies_params)

    if movie.valid?
      render json: {id: movie.id}, status: :ok
    else
      render json: {ok: false, errors: movie.errors}, status: :bad_request
    end
  end

  private
  def movies_params
    params.require(:movie).permit(:title, :release_date, :overview)
  end
end
