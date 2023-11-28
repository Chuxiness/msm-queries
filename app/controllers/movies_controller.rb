class MoviesController < ApplicationController
  def index
    render({ :template => "movies_template/list"})
  end
  def show
    the_id=params.fetch("the_id")
    matching_records = Movie.where({ :id => the_id }).all
    @the_movie= matching_records.at(0)

    render({ :template => "movies_template/details"})
  end
end
