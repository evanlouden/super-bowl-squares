# frozen_string_literal: true

class  LockGamesController < ApplicationController
  before_action :set_game

  def update
    @game.update!(locked: !@game.locked)
    redirect_to game_path(@game.share_code)
  end

  private

  def set_game
    @game = current_user.games.find_by!(share_code: params[:id])
  end
end
