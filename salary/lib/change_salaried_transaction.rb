require 'change_classification_transaction'

class ChangeSalariedTransaction < ChangeClassificationTransaction

  def initialize(employee_id, salary)
    @employee_id = employee_id
    @salary = salary
  end

  def new_schedule
    MonthlySchedule.new
  end

  def new_classification
    SalariedClassification.new(@salary)
  end
end
