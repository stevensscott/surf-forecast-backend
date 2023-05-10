class ObservedConditionsController < ApplicationController
  def index
    @observed_conditions = ObservedCondition.all
    render json: @observed_conditions.as_json   
  end

  def create
    
    @observed_condition = ObservedCondition.new(
      date: params[:date],
      actual_condition: params[:actual_condition],
      board_ridden: params[:board_ridden],
      match_forecast: params[:match_forecast]
      
    )
    if @observed_condition.save
      render json: @observed_condition.as_json
    else
      render json: {error: @observed_condition.errors.full_messages}, status: 422
    end
  end
end
