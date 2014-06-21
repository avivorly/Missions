class MissionsController < ApplicationController

  def index
    Mission.create :title=>123,:details=>4

  end


end
