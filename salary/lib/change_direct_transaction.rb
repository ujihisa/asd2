require 'change_method_transaction'

class ChangeDirectTransaction < ChangeMethodTransaction

  def initialize(employee_id, bank, account)
    super(employee_id)
    @bank = bank
    @account = account
  end

  def new_method
    DirectMethod.new(@bank, @account)
  end
end
