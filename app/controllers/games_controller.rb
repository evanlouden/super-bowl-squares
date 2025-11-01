class GamesController < ApplicationController
  before_action :check_current_user, only: [:show]

  def show
    @game = Game.includes(:headers, :squares).find_by!(share_code: params[:id].upcase)
    @decorated_game = Decorators::GameDecorator.new(@game)
  end

  def new
    @game = Game.new(
      square_price: 1,
      first_quarter_payout: 20,
      second_quarter_payout: 20,
      third_quarter_payout: 20,
      final_payout: 40
    )
  end


  def create
    @game = current_user.games.new(game_params)

    if @game.save
      Services::CreateSquares.new(@game).call
      Services::AssignNumbers.new(@game).call
      render turbo_stream: turbo_stream.action(:redirect, game_path(@game.share_code))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @game = current_user.games.find_by!(share_code: params[:id])
    @game.destroy!

    render turbo_stream: turbo_stream.action(:redirect, user_path(current_user))
  end

  private

  def game_params
    params.require(:game).permit(:square_price, :first_quarter_payout, :second_quarter_payout, :third_quarter_payout, :final_payout)
  end
end
