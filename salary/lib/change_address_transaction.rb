require 'change_employee_transaction'

class ChangeAddressTransaction < ChangeEmployeeTransaction

  def initialize(employee_id, address)
    super(employee_id)
    @address = address
  end

  def change(e)
    e.address = @address
  end

end
