class SquaresController < ApplicationController
  before_action :set_square, only: %i[update]

  def update
    respond_to do |format|
      if @square.update(user: @square.user.nil? ? current_user : nil)
        format.turbo_stream
      end
    end
  end

  private

  def set_square
    @square = Square.includes(:user, :game).find(params[:id])
  end
end
