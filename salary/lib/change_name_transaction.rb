require 'change_employee_transaction'

class ChangeNameTransaction < ChangeEmployeeTransaction

  def initialize(employee_id, name)
    super(employee_id)
    @name = name
  end

  def change(e)
    e.name = @name
  end

end
