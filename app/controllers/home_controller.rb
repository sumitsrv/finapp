class HomeController < ApplicationController
  def index
    @transaction = Transaction.new
    @account = Account.new
  end
end
