require 'date'

class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end
  def show
    an_id = params.fetch("an_id")
    @matching_records = Director.where({ :id => an_id})
    @director = @matching_records[0]
    render({ :template => "director_templates/show"})
  end
  def youngest
    young_directors = Director.where.not({ :dob => nil }).order({ :dob => :asc })

    @youngest_director = young_directors.at(-1)
    @young_dob = @youngest_director.dob
    render({ :template => "director_templates/youngest"})
  end
  def oldest
    old_directors = Director.where.not({ :dob => nil }).order({ :dob => :asc })

    @oldest_director = old_directors.at(0)
    @old_dob = @oldest_director.dob
    render({ :template => "director_templates/oldest"})
  end

end
