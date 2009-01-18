require 'change_method_transaction'

class ChangeHoldTransaction < ChangeMethodTransaction

  def initialize(employee_id, address)
    super(employee_id)
    @address = address
  end

  def new_method
    HoldMethod.new(@address)
  end
end
