require 'add_employee_transaction'

class AddHourlyEmployee < AddEmployeeTransaction
  
  attr_accessor :hourly_rate
  
  def initialize(employee_id, name, address, hourly_rate)
    super(employee_id, name, address)
    @hourly_rate = hourly_rate
  end
  
  def classification
    HourlyClassification.new(@hourly_rate)
  end
  
  def schedule
    WeeklySchedule.new
  end
end
