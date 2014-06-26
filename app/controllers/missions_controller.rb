class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]


  # default_scope Mission.where(:user_id => User.current)
  # GET /missions
  # GET /missions.json
  def index
    # p '='*100
    # p current_user
    # p current_user.id#nil
    # p current_user.email
    p "=====I'm getting to index, current_user:#{current_user.inspect}   ==="
    @missions = current_user.missions.order(:done)
  end

  # GET /missions/1
  # GET /missions/1.json
  def show
  end

  # GET /missions/new
  def new
    @mission = Mission.new :user_id => current_user.id# user_id:  Thread.current[:user].id
  end

  # GET /missions/1/edit
  def edit
  end

  # POST /missions
  # POST /missions.json
  def create
    @mission = Mission.new(mission_params.merge({'user_id'=> current_user.id}))

    respond_to do |format|
      if @mission.save
        format.html { redirect_to @mission, notice: 'Mission was successfully created.' }
        format.json { render :show, status: :created, location: @mission }
      else
        format.html { render :new }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missions/1
  # PATCH/PUT /missions/1.json
  def update
    raise 'no permistion' if @mission.user.id != current_user.id
    respond_to do |format|
      if @mission.update(mission_params)
        format.html { redirect_to @mission, notice: 'Mission was successfully updated.' }
        format.json { render :show, status: :ok, location: @mission }
      else
        format.html { render :edit }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missions/1
  # DELETE /missions/1.json
  def destroy
    raise 'no permistion' if @mission.user.id != current_user.id
    @mission.destroy
    respond_to do |format|
      format.html { redirect_to missions_url, notice: 'Mission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mission_params
      params.require(:mission).permit(:title, :details, :done)
    end
end
