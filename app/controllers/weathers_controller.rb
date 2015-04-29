class WeathersController < ApplicationController
  before_action :set_weather, only: [:show, :edit, :update, :destroy]

  # GET /weathers
  def index
    @weathers = Weather.all
  end

  # GET /weathers/1
  def show
  end

  # GET /weathers/new
  def new
    @weather = Weather.new
  end

  # GET /weathers/1/edit
  def edit
  end

  # POST /weathers
  def create
    @weather = Weather.new(weather_params)

    if @weather.save
      redirect_to @weather, notice: 'Weather was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /weathers/1
  def update
    if @weather.update(weather_params)
      redirect_to @weather, notice: 'Weather was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /weathers/1
  def destroy
    @weather.destroy
    redirect_to weathers_url, notice: 'Weather was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather
      @weather = Weather.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def weather_params
      params.require(:weather).permit(:city, :country)
    end
end
