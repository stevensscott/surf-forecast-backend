class ConditionsController < ApplicationController

  require "http"
  def create
  #CONVERTS WAVE HEIGHT FROM METRIC TO FEET#
    def metric_to_feet(wave_height_metric)
      wave_height_feet=wave_height_metric * 3.28084
      wave_height_feet.round(1)
    end

  #CONVERTS CARDINAL DIRECTION TO TEXT BASED ON MY OWN FORMULA#

    def convert_wind_from_cardinal_to_direction(cardinal_direction)
      if (cardinal_direction > 0  && cardinal_direction < 50) || (cardinal_direction > 309 && cardinal_direction<400)
        return "North"
      end
      if (cardinal_direction > 139  && cardinal_direction < 231)
        return "South"
      end
      if (cardinal_direction > 230  && cardinal_direction < 310)
        return "Sideshore West"
      end
      if (cardinal_direction > 50  && cardinal_direction < 140)
        return "Sideshore East"
      end
    
    end

 #Call API for Wave Information
    response_wave = HTTP.get('https://marine-api.open-meteo.com/v1/marine?latitude=41.55&longitude=-71.29&hourly=wave_height&timezone=America%2FNew_York')
    wave_height=response_wave.parse(:json)
 #Call API for Wind Information
    response_wind = HTTP.get('https://api.open-meteo.com/v1/forecast?latitude=41.55&longitude=-71.29&hourly=temperature_2m,windspeed_10m,winddirection_10m&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch')
    wind_info=response_wind.parse(:json)

  #Get Date
    date=wind_info["hourly"]["time"][13]
    new_date=date.slice(5..9)
 #7AM Info
    wave_seven_am=wave_height["hourly"]["wave_height"][13]
    wind_direction_seven_am=wind_info["hourly"]["winddirection_10m"][13]
    wind_speed_seven_am=wind_info["hourly"]["windspeed_10m"][13]
 #12PM Info
    wave_twelve_pm=wave_height["hourly"]["wave_height"][18]
    wind_direction_twelve_pm=wind_info["hourly"]["winddirection_10m"][18]
    wind_speed_twelve_pm=wind_info["hourly"]["windspeed_10m"][18]

  #5PM Info
    wave_five_pm=wave_height["hourly"]["wave_height"][23]    #this gets me the waveheights. 
    wind_direction_five_pm=wind_info["hourly"]["winddirection_10m"][23]
    wind_speed_five_pm=wind_info["hourly"]["windspeed_10m"][23]
  
    
    #Convert Data to correct format
    wave_seven_am_converted_to_feet=metric_to_feet(wave_seven_am)
    wind_direction_seven_am_converted=convert_wind_from_cardinal_to_direction(wind_direction_seven_am)
    wave_twelve_pm_converted_to_feet=metric_to_feet(wave_twelve_pm)
    wind_direction_twelve_pm_converted=convert_wind_from_cardinal_to_direction(wind_direction_twelve_pm)
    wave_five_pm_converted_to_feet=metric_to_feet(wave_five_pm)
    wind_direction_five_pm_converted=convert_wind_from_cardinal_to_direction(wind_direction_five_pm)
    
  
  #this needs to be updated again to add additional params

    condition=DailyForecast.new(
      wave_height_7AM: wave_seven_am_converted_to_feet,
      wind_direction_7AM: wind_direction_seven_am_converted,
      wind_speed_7AM: wind_speed_seven_am,
      wave_height_12PM: wave_twelve_pm_converted_to_feet,
      wind_direction_12PM: wind_direction_twelve_pm_converted,
      wind_speed_12PM: wind_speed_twelve_pm,
      wave_height_5PM: wave_five_pm_converted_to_feet,
      wind_direction_5PM: wind_direction_five_pm_converted,
      wind_speed_5PM: wind_speed_five_pm,
     
      )
    #if condition saves with no errors, render the condition
    if condition.save
      render json: condition.as_json
    #if condition does not save, render stock error message and a 422 which means unprocessable content(ie-something wrong with request)
      else
        render json: {message:condition.errors.full_messages}, status:422
    end
  end

  def index
    @conditions = DailyForecast.all
  end
    
end



