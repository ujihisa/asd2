
class SalariedClassification

  attr_accessor :salary

  def initialize(salary)
    @salary = salary
  end
end

class HourlyClassification

  attr_accessor :hourly_rate

  def initialize(hourly_rate)
    @hourly_rate = hourly_rate
    @records = {}
  end

  def time_card(date)
    @records[date]
  end

  def time_card=(time_card)
    @records[time_card.date] = time_card
  end
end

class CommissionedClassification

  attr_accessor :salary
  attr_accessor :commissioned_rate

  def initialize(salary, commissioned_rate)
    @salary = salary
    @commissioned_rate = commissioned_rate
    @records = {}
  end

  def sales_receipt=(sales_receipt)
    @records[sales_receipt.date] = sales_receipt
  end

  def sales_receipt(date)
    @records[date]
  end
end
