require 'transaction'
require 'employee'

class AddEmployeeTransaction
  include Transaction
  
  attr_accessor :employee_id, :name, :address
  
  def initialize(employee_id, name, address)
    @employee_id = employee_id
    @name = name
    @address = address
  end
  
  def execute
    c = classification()
    s = schedule()
    m = HoldMethod.new
    e = Employee.new(employee_id, name, address)
    e.classification = c
    e.schedule = s
    e.method = m
    PayrollDatabase.instance.add_employee(employee_id, e)
  end
  
  def classification
    raise 'must implement in subclass'
  end
  
  def schedule
    raise 'must implement in subclass'
  end
  
end

class HoldMethod
end
