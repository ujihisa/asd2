require 'transaction'

class ChangeEmployeeTransaction
  include Transaction

  def initialize(employee_id)
    @employee_id = employee_id
  end

  def execute
    e = PayrollDatabase.instance.employee(@employee_id)
    change(e) if e
  end

  def change(e)
    raise 'must implements in subclass'
  end
end
