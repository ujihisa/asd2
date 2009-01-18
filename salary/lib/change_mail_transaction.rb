require 'change_method_transaction'

class ChangeMailTransaction < ChangeMethodTransaction

  def initialize(employee_id, address)
    super(employee_id)
    @address = address
  end

  def new_method
    MailMethod.new(@address)
  end
end
