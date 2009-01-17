
require 'singleton'

require 'transaction'
require 'classification'
require 'schedule'



class PayrollDatabase
  include Singleton

  def initialize
    @employees = {}
  end

  def add_employee(employee_id, employee)
    @employees[employee_id] = employee
  end

  def employee(employee_id)
    @employees[employee_id]
  end

  def clear
    @employees.clear
  end

  def delete_employee(employee_id)
    @employees.delete(employee_id)
  end
end
