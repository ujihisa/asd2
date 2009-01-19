require 'change_employee_transaction'

class ChangeAffiliationTransaction < ChangeEmployeeTransaction

  def initialize(employee_id)
    super(employee_id)
  end

  def change(e)
    record_membership(e)
    e.affiliation = new_affiliation
  end

  def new_affiliation
    raise 'must implement in subclass'
  end

  def record_membership(e)
    raise 'must implement in subclass'
  end
end
