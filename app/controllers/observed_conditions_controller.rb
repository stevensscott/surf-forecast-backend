class ObservedConditionsController < ApplicationController
  def index
    # @observed_conditions = ObservedCondition.all
    # render json: @observed_conditions.as_json   

    # pagination
   
  # sets page number based user input, OR sets it to 1 as default
    # page_number = params[:page_number] || 1
    page_number = params[:page_number] || 1
    pp page_number
  # sets page size based on user input, OR sets it to 5 as default
    page_size = params[:page_size] || 5

  # sets "offset" to 0 as default unless user is on a higher page than 1. Offset is the number of database entries to skip. If a user is on page 2, then we "skip" over the entries that WOULD have been on page one.
    offset = 0
    if page_number.to_i > 1
      offset = ((page_number.to_i - 1) * page_size.to_i)
    end

  # get all items from the database
    @observed_conditions = ObservedCondition.all
    count= @observed_conditions.length
  # apply ordering, page size limiting, and offset
    # @observed_conditions = @observed_conditions.order("name ASC").limit(page_size.to_i).offset(offset.to_i)
    @observed_conditions = @observed_conditions.order("id ASC").limit(page_size.to_i).offset(offset.to_i)
    render json: {observed_conditions: @observed_conditions, count: count }
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
