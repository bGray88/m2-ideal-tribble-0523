class ActorMoviesController < ApplicationController
  def create
    ActorMovie.create_relationship(params[:actor_id], params[:movie_id])

    redirect_to "/movies/#{params[:movie_id]}"
  end
end