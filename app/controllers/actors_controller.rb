class ActorsController < ApplicationController
  def index
    render({ :template => "actor_templates/index"})
  end
  def show
    an_id = params.fetch("an_id")
    @matching_records = Actor.where({ :id => an_id})
    @actor = @matching_records[0]
    render({ :template => "actor_templates/show"})
  end
end
