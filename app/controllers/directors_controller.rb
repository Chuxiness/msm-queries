class DirectorsController < ApplicationController
  def index
    render({ :template => "directors_template/list"})
  end
  def show
    the_id=params.fetch("the_id")
    matching_records = Director.where({ :id => the_id }).all
    @the_director= matching_records.at(0)

    render({ :template => "directors_template/details"})
  end
  def young
    not_null_director = Director.where.not({ :dob => nil })
    @youngest = not_null_director.order(dob: :desc).first
    render({ :template => "age_templates/youngest"})
  end
  def old
    not_null_director = Director.where.not({ :dob => nil })
    @oldest = not_null_director.order(dob: :asc).first
    render({ :template => "age_templates/oldest"})
  end
end
