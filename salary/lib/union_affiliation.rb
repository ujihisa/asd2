

class UnionAffiliation

  def initialize(amount)
    @amount = amount
    @records = {}
  end

  def service_charge(date)
    @records[date]
  end

  def service_charge=(service_charge)
    @records[service_charge.date] = service_charge
  end
end
