class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    if params.include?(:account_id)
      account_id = params[:account_id]
      @transactions = Transaction.where(:account_id => account_id)
    else
      @transactions = Transaction.all
    end

    respond_to do |format|
      format.html
      format.json { render :json =>
          {
            :iTotalRecords => @transactions.count,
            :iTotalDisplayRecords => @transactions.count,
            :aaData =>
                @transactions.map do |transaction|
                  [
                    transaction.dt,
                    link_to(transaction.account.name, account_url(transaction.account.id)),
                    transaction.transaction_type,
                    transaction.amount,
                    transaction.remark
                  ]
                end
          }
        }
      format.js
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      Transaction.transaction do
        begin
          @transaction.save!
          @transaction.account.update_attributes!(:balance => @transaction.account.balance + @transaction.amount)

          format.html { redirect_to root_url, notice: 'Transaction was successfully created.' }
        rescue ActiveRecord::RecordInvalid
          format.html { redirect_to root_url }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
          
          raise ActiveRecord::Rollback
        end
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:dt, :account_id, :amount, :remark, :transaction_type)
    end
end
