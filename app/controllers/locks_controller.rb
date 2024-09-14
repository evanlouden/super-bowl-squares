# frozen_string_literal: true

class  LocksController < ApplicationController
  before_action :set_game

  def create
    @game.squares.where(locked: false, name: params[:name]).update_all(locked: true)
    redirect_to game_path(@game)
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end
end
