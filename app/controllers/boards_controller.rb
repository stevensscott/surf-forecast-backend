class BoardsController < ApplicationController
  def index
    @boards = Board.all
    render json: @boards.as_json
  end
end
