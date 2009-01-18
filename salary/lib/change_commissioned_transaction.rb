require 'change_classification_transaction'

class ChangeCommissionedTransaction < ChangeClassificationTransaction

  def initialize(employee_id, salary, commissioned_rate)
    @employee_id = employee_id
    @salary = salary
    @commissioned_rate = commissioned_rate
  end

  def new_schedule
    BiWeeklySchedule.new
  end

  def new_classification
    CommissionedClassification.new(@salary, @commissioned_rate)
  end
end
