class ExportController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    require 'csv'
    require 'rails/all'

    models = [Mission, Idea]

    str = "#{current_user.name}-data\n" + models.map do |model|
      [
          [model],
          model.column_names
      ] +   model.where(:user_id => current_user.id).map(&:attributes).map(&:values)

    end.flatten(1).map { |a| a.map{|str| str.to_s.gsub(',', ';') }.join(',') }.join("\n")

    respond_to do |format|
      format.html
      format.csv {
        headers['Content-Disposition'] = "attachment; filename=\"  #{current_user.name}-data.csv\""
        render text: str }
    end
  end
end
