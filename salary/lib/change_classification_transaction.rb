require 'change_employee_transaction'

class ChangeClassificationTransaction < ChangeEmployeeTransaction

  def initialize(employee_id)
    super
  end

  def change(e)
    e.schedule = new_schedule
    e.classification = new_classification
  end

  def new_schedule
    raise 'must implements in subclass'
  end

  def new_classification
    raise 'must implements in subclass'
  end

end
