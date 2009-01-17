
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
  end
end

class CommissionedClassification

  attr_accessor :salary
  attr_accessor :commissioned_rate

  def initialize(salary, commissioned_rate)
    @salary = salary
    @commissioned_rate = commissioned_rate
  end

end
