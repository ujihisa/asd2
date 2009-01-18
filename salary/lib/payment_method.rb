
class PaymentMethod
end

class DirectMethod < PaymentMethod
  def initialize(bank, account)
    @bank = bank
    @account = account
  end
end

class MailMethod < PaymentMethod
  def initialize(address)
    @address = address
  end
end

class HoldMethod < PaymentMethod
  def initialize(address)
    @address = address
  end
end
