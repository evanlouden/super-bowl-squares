# frozen_string_literal: true

class HomeController < ApplicationController
  # skip_before_action :check_current_user, only: [:index]

  def index
    redirect_to user_path(current_user) if current_user
  end
end
