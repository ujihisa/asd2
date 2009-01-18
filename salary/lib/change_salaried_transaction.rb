require 'change_classification_transaction'

class ChangeSalariedTransaction < ChangeClassificationTransaction

  def initialize(employee_id, rate)
    @employee_id = employee_id
    @rate = rate
  end

  def new_schedule
    MonthlySchedule.new
  end

  def new_classification
    SalariedClassification.new(@rate)
  end
end
