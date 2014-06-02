class Account < ActiveRecord::Base
  TYPES = [['SAVINGS', 'savings'], ['CREDIT', 'credit'], ['PF', 'pf'], ['PERSON', 'person']] 

  validates :name, :uniqueness => true, :presence => true
  validates :account_type, :presence => true, :inclusion => {:in => TYPES.map{|o| o[1]}}

end
