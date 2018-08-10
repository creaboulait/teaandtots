class ForecastsController < ApplicationController

  def index
    @forecasts = Forecast.all
  end

  def new
    @forecast = Forecast.new
  end

  def create
    @forecast = Forecast.new(forecast_params)

    respond_to do |format|
      if @forecast.save
        format.html { redirect_to @forecast, notice: 'Forecast was successfully created.' }
        format.json { render :show, status: :created, location: @forecast }
      else
        format.html { render :new }
        format.json { render json: @forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def forecast_params
      params.require(:forecast).permit(:lat, :lng)
    end
end
