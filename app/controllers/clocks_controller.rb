class ClocksController < ApplicationController
  before_action :set_clock, only: %i[show edit update destroy]
  before_action :set_action, only: %i[new create]

  # GET /clocks or /clocks.json
  def index
    set_calendar
    @clocks = Clock.all
  end

  # GET /clocks/1 or /clocks/1.json
  def show; end

  # GET /clocks/new
  def new
    @clock = Clock.new
  end

  # GET /clocks/1/edit
  def edit; end

  # POST /clocks or /clocks.json
  def create
    @clock = Clock.new(check_in_params)

    respond_to do |format|
      if @clock.save
        format.html { redirect_to clock_url(@clock), notice: "#{@action} successful" }
        format.json { render :show, status: :created, location: @clock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clocks/1 or /clocks/1.json
  def update
    respond_to do |format|
      if @clock.update(clock_params)
        format.html { redirect_to clock_url(@clock), notice: 'Clock was successfully updated.' }
        format.json { render :show, status: :ok, location: @clock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clocks/1 or /clocks/1.json
  def destroy
    @clock.destroy

    respond_to do |format|
      format.html { redirect_to clocks_url, notice: 'Clock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_clock
    @clock = Clock.find(params[:id])
  end

  def set_calendar
    @calendar = Calendar.new Time.zone.today
  end

  # Only allow a list of trusted parameters through.
  def clock_params
    params.require(:clock).permit(:time).merge(user: current_user)
  end

  def check_in_params
    params.permit(:user, :time).merge(user: current_user, time: Time.zone.now)
  end

  def set_action
    @action = Clock.where(user_id: current_user.id).count.even? ? 'Check In' : 'Check Out'
  end
end
