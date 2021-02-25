class PagesController < ApplicationController
  def home
    @events = Event.last(6)
  end
end
