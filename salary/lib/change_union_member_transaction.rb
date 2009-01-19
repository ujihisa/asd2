require 'change_affiliation_transaction'
require 'affiliation'

class ChangeUnionMemberTransaction < ChangeAffiliationTransaction

  def initialize(employee_id, union_member_id, dues)
    super(employee_id)
    @union_member_id = union_member_id
    @dues = dues
  end

  def new_affiliation
    UnionAfiliation.new(@union_member_id, @dues)
  end

  def record_membership(e)
    PayrollDatabase.instance.add_union_member(@union_member_id, e)
  end
end
