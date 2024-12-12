class SquaresController < ApplicationController
  before_action :set_square, only: %i[update]

  def update
    respond_to do |format|
      if @square.update(user: square_user)
        format.turbo_stream
      end
    end
  end

  private

  def set_square
    @square = Square.find(params[:id])
  end

  def square_user
    if @square.user.present?
      nil
    else
      current_user
    end
  end
end
