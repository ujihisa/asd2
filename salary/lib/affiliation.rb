

module Affiliation
  attr_accessor :dues
end

class UnionAfiliation
  include Affiliation

  def initialize(union_member_id, dues)
    @union_member_id = union_member_id
    @dues = dues
  end
end

class NoAffiliation
  include Affiliation
end
