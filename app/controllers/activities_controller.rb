class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.all.includes(:trackable).order(id: :desc).limit(100)

    respond_to :atom
  end
end
