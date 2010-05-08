class VenueTypesController < ApplicationController
  def index
    @venue_types = VenueType.all
  end
  
  def show
    @venue_type = VenueType.find(params[:id])
  end
  
  def new
    @venue_type = VenueType.new
  end
  
  def create
    @venue_type = VenueType.new(params[:venue_type])
    if @venue_type.save
      flash[:notice] = "Successfully created venue type."
      redirect_to @venue_type
    else
      render :action => 'new'
    end
  end
  
  def edit
    @venue_type = VenueType.find(params[:id])
  end
  
  def update
    @venue_type = VenueType.find(params[:id])
    if @venue_type.update_attributes(params[:venue_type])
      flash[:notice] = "Successfully updated venue type."
      redirect_to @venue_type
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @venue_type = VenueType.find(params[:id])
    @venue_type.destroy
    flash[:notice] = "Successfully destroyed venue type."
    redirect_to venue_types_url
  end
end
