class AxisEventsController < ApplicationController
  before_action :set_axis_event, only: [:show, :edit, :update, :destroy]

  # GET /axis_events
  # GET /axis_events.json
  def index
    @axis_events = AxisEvent.all
  end

  # GET /axis_events/1
  # GET /axis_events/1.json
  def show
  end

  # GET /axis_events/new
  def new
    @axis_event = AxisEvent.new
    # @axis_event.axis_id = params[:axis_id]
  end

  # GET /axis_events/1/edit
  def edit
  end

  # POST /axis_events
  # POST /axis_events.json
  def create
    @axis_event = AxisEvent.new(axis_event_params)
    # raise session[:axis_id].inspect
    @axis_event.axis_id =  Rails.class_variable_get(:@@axis_id)
    respond_to do |format|
      if @axis_event.save
        format.html { redirect_to @axis_event, notice: 'Axis event was successfully created.' }
        format.json { render :show, status: :created, location: @axis_event }
      else
        format.html { render :new }
        format.json { render json: @axis_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /axis_events/1
  # PATCH/PUT /axis_events/1.json
  def update
    respond_to do |format|
      if @axis_event.update(axis_event_params)
        format.html { redirect_to @axis_event, notice: 'Axis event was successfully updated.' }
        format.json { render :show, status: :ok, location: @axis_event }
      else
        format.html { render :edit }
        format.json { render json: @axis_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /axis_events/1
  # DELETE /axis_events/1.json
  def destroy
    @axis_event.destroy
    respond_to do |format|
      format.html { redirect_to axis_events_url, notice: 'Axis event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_axis_event
      @axis_event = AxisEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def axis_event_params
      params.require(:axis_event).permit(:rank, :description)
    end
end
