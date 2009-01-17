
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
