require 'change_affiliation_transaction'
require 'affiliation'

class ChangeUnaffiliatedTransaction < ChangeAffiliationTransaction

  def initialize(employee_id)
    super(employee_id)
  end

  def new_affiliation
    NoAffiliation.new
  end

  def record_membership(e)
    PayrollDatabase.instance.delete_union_member(e.affiliation.member_id)
  end
end
