class MissionsController < ApplicationController

  def index
    respond_to do |format|
      format.json do
        render :json => Mission.all
      end
      format.html
    end
  end

  # def mission
  #   respond_to do |format|
  #     # format.json do
  #     #   render :json => Mission.all
  #     # end
  #     format.html
  #   end
  #
  # end


end
