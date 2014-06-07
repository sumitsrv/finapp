module ApplicationHelper
  def saving_balance
    Account.savings.sum(:balance).round(2)
  end

  def credit_balance
    Account.credit.sum(:balance).round(2)
  end

  def in_person_balance
    Account.person.sum(:balance).round(2)
  end
  
  def pf_balance
    Account.pf.sum(:balance).round(2)
  end

  def bootstrap_class_for flash_type
    case flash_type
      when "success"
        "alert-success"
      when "error"
        "alert-error"
      when "alert"
        "alert-block"
      when "notice"
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
