require 'transaction'
require 'union_affiliation'
require 'service_charge'

class ServiceChargeTransaction
  include Transaction

  attr_accessor :member_id, :date, :amount

  def initialize(member_id, date, amount)
    @member_id = member_id
    @date = date
    @amount = amount
  end

  def execute
    e = PayrollDatabase.instance.union_member(@member_id)
    af = e.affiliation
    af.service_charge = ServiceCharge.new(@date, @amount) if af.class == UnionAffiliation
  end
end
