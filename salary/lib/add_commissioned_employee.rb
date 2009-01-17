require 'add_employee_transaction'

class AddCommissionedEmployee < AddEmployeeTransaction
  
  attr_accessor :salary
  attr_accessor :commissioned_rate
  
  def initialize(employee_id, name, address, salary, commissioned_rate)
    super(employee_id, name, address)
    @salary = salary
    @commissioned_rate = commissioned_rate
  end
  
  def classification
    CommissionedClassification.new(@salary, @commissioned_rate)
  end
  
  def schedule
    BiWeeklySchedule.new
  end
end
