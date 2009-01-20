
require 'singleton'

require 'transaction'
require 'classification'
require 'schedule'



class PayrollDatabase
  include Singleton

  def initialize
    @employees = {}
    @union_members = {}
  end

  def add_employee(employee_id, employee)
    @employees[employee_id] = employee
  end

  def employee(employee_id)
    @employees[employee_id]
  end

  def clear
    @employees.clear
    @union_members.clear
  end

  def delete_employee(employee_id)
    @employees.delete(employee_id)
  end

  def add_union_member(member_id, employee)
    @union_members[member_id] = employee
  end

  def union_member(member_id)
    @union_members[member_id]
  end

  def delete_union_member(member_id)
    @union_members.delete(member_id)
  end
end
