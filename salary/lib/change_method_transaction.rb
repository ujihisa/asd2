require 'change_employee_transaction'
require 'payment_method'

class ChangeMethodTransaction < ChangeEmployeeTransaction

  def initialize(employee_id)
    super
  end

  def change(e)
    e.method = new_method
  end

  def new_method
    raise 'must implements in subclass'
  end

end
