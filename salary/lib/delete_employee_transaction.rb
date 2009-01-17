require 'transaction'

class DeleteEmployeeTransaction
  include Transaction

  def initialize(employee_id)
    @employee_id = employee_id
  end

  def execute
    PayrollDatabase.instance.delete_employee(@employee_id)
  end

end
