class MapsController < ApplicationController
  def index
    @apartments = Apartment.all
  end
end
