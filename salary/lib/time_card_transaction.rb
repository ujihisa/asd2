require 'transaction'
require 'time_card'

class TimeCardTransaction
  include Transaction

  attr_accessor :date, :hours, :employee_id
  
  def initialize(date, hours, employee_id)
    @date = date
    @hours = hours
    @employee_id = employee_id
  end
  
  def execute
    e = PayrollDatabase.instance.employee(@employee_id)
    raise 'No such employee' if e.nil?
    c = e.classification
    raise 'Tried to add timecard to non-hourly cmployee' unless c.class == HourlyClassification
    c.time_card = TimeCard.new(@date, @hours)
  end
end
