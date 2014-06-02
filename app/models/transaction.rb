class Transaction < ActiveRecord::Base
  belongs_to :account
  TYPES = [['CR', 'cr'], ['DR', 'dr']]

  validates :dt, :presence => true
  validates :account_id, :presence => true
  validates :amount, :presence => true
  validates :transaction_type, :presence => true, :inclusion => {:in => TYPES.collect{|tt| tt[1]}}
end
