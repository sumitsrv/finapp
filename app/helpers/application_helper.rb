module ApplicationHelper
  def saving_balance
    Account.where(:account_type => ['savings','pf']).sum("balance")
  end

  def credit
    Account.where(:account_type => ['credit']).sum("balance")
  end

  def in_person
    Account.where(:account_type => ['person']).sum("balance")
  end
end
