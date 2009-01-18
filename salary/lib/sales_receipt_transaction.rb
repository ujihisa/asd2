require 'transaction'
require 'sales_receipt'

class SalesReceiptTransaction
  include Transaction

  def initialize(date, amount, employee_id)
    @date = date
    @amount = amount
    @employee_id = employee_id
  end

  def execute
    e = PayrollDatabase.instance.employee(@employee_id)
    raise 'No such employee' if e.nil?
    c = e.classification
    raise 'Tried to add timecard to non-commissioned cmployee' unless c.class == CommissionedClassification
    c.sales_receipt = SalesReceipt.new(@date, @amount)
  end
end
