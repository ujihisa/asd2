
class Employee

  attr_accessor :employee_id, :name, :address
  attr_accessor :classification
  attr_accessor :schedule
  attr_accessor :method
  attr_accessor :affiliation

  def initialize(employee_id, name, address)
    @employee_id = employee_id
    @name = name
    @address = address
  end
end
