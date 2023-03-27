class ConditionsController < ApplicationController

  #this needs to be updated again for params
  def create
    condition=DailyForecast.new(
      wave_height: wave_seven_am,
      wind_direction: wind_direction_seven_am,
      wind_speed: params[:wind_speed],
      time: params[:time]
      )
    #if condition saves with no errors, render the condition
    if condition.save
      render json: condition.as_json
    #if condition does not save, render stock error message and a 422 which means unprocessable content(ie-something wrong with request)
      else
        render json: {message:condition.errors.full_messages}, status:422
    end
  end
    
end



# t.float "wave_height"
# t.string "wind_direction"
# t.float "wind_speed"