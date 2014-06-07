class Account < ActiveRecord::Base
  TYPES = [['SAVINGS', 'savings'], ['CREDIT', 'credit'], ['PF', 'pf'], ['PERSON', 'person']] 

  validates :name, :uniqueness => true, :presence => true
  validates :account_type, :presence => true, :inclusion => {:in => TYPES.map{|o| o[1]}}

  def self.savings
    Account.where(:account_type => ['savings'])
  end

  def self.pf
    Account.where(:account_type => ['pf'])
  end

  def self.credit
    Account.where(:account_type => ['credit'])
  end

  def self.person
    Account.where(:account_type => ['person'])
  end

end
