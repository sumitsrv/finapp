class HomeController < ApplicationController
  def index
    @transaction = Transaction.new
  end
end
