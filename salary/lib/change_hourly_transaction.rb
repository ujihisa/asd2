require 'change_classification_transaction'

class ChangeHourlyTransaction < ChangeClassificationTransaction

  def initialize(employee_id, rate)
    @employee_id = employee_id
    @rate = rate
  end

  def new_schedule
    WeeklySchedule.new
  end

  def new_classification
    HourlyClassification.new(@rate)
  end
end
