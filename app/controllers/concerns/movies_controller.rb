class MoviesController < ApplicationController
  def index
    render({ :template => "movie_templates/index"})
  end
  def show
    an_id = params.fetch("an_id")
    @matching_records = Director.where({ :id => an_id})
    @director = @matching_records[0]
    render({ :template => "movie_templates/show"})
  end
end
