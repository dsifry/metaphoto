class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end
  
  def show
    @activity = Activity.find(params[:id])
    @photo = @activity.photo
  end
  
  def new
    @activity = Activity.new
    @activity.photo = Photo.new
    @photo = @activity.photo
    @activity.place = Place.new
    @place = @activity.place
  end
  
  def create
    @activity = Activity.new(params[:activity])
    if @activity.save
      flash[:notice] = "Successfully created activity."
      redirect_to @activity
    else
      render :action => 'new'
    end
  end
  
  def edit
    @activity = Activity.find(params[:id])
    @photo = @activity.photo
  end
  
  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(params[:activity])
      flash[:notice] = "Successfully updated activity."
      redirect_to @activity
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    flash[:notice] = "Successfully destroyed activity."
    redirect_to activities_url
  end
end
