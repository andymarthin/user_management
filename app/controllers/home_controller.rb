# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @pagy, @users = pagy(User.all)
  end
end
