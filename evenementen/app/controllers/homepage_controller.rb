class HomepageController < ApplicationController
  def index
    @events = Event.all
    @people = Person.all
  end
end
