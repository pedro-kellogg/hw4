class PlacesController < ApplicationController

  def index
    @current_user = User.find_by({ "id" => session["user_id"] })
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @current_user = User.find_by({ "id" => session["user_id"] })
    if @current_user != nil
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user["id"] })
    else
      @entries = []
    end
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end