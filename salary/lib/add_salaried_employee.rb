require 'add_employee_transaction'

class AddSalariedEmployee < AddEmployeeTransaction
  
  attr_accessor :salary
  
  def initialize(employee_id, name, address, salary)
    super(employee_id, name, address)
    @salary = salary
  end
  
  def classification
    SalariedClassification.new(@salary)
  end
  
  def schedule
    MonthlySchedule.new
  end
end
