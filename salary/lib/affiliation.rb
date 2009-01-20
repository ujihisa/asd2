

module Affiliation
  attr_accessor :dues
end

class UnionAfiliation
  include Affiliation

  attr_reader :member_id

  def initialize(member_id, dues)
    @member_id = member_id
    @dues = dues
  end
end

class NoAffiliation
  include Affiliation
end
