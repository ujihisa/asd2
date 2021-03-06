$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'payroll_database'
require 'add_salaried_employee'
require 'add_hourly_employee'
require 'add_commissioned_employee'
require 'delete_employee_transaction'
require 'time_card_transaction'
require 'sales_receipt_transaction'
require 'service_charge_transaction'
require 'change_name_transaction'
require 'change_address_transaction'
require 'change_hourly_transaction'
require 'change_salaried_transaction'
require 'change_commissioned_transaction'
require 'change_direct_transaction'
require 'change_mail_transaction'
require 'change_hold_transaction'
require 'change_union_member_transaction'
require 'change_unaffiliated_transaction'

describe 'Payroll' do
  describe 'Add SaraliedEmployee' do
    before do
      @employee_id = 1
      @t = AddSalariedEmployee.new(@employee_id, 'Bob', 'Home', 1000.0)
      @t.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it 'should get an instance of Employee' do
      @e.should_not nil
    end
    it 'should be that name is "Bob"' do
      @e.name.should == "Bob"
    end
    it 'should be that salayy is 1000.0' do
      @e.classification.salary.should == 1000.0
    end
    it 'should be that schedule is monthly' do
      @e.schedule.class.should == MonthlySchedule
    end
  end

  describe "Add HourlyEmployee" do
    before do
      @employee_id = 2
      @t = AddHourlyEmployee.new(@employee_id, 'Bob', 'Home', 10.0)
      @t.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it 'should get an instance of Employee' do
      @e.should_not nil
    end
    it 'should be that name is "Bob"' do
      @e.name.should == "Bob"
    end
    it 'should be that hourly rate is 10.0' do
      @e.classification.hourly_rate.should == 10.0
    end
    it 'should be that schedule is hourly' do
      @e.schedule.class.should == WeeklySchedule
    end
  end

  describe "Add CommissionedEmployee" do
    before do
      @employee_id = 3
      @t = AddCommissionedEmployee.new(@employee_id, 'Bob', 'Home', 800.0, 10.0)
      @t.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it 'should get an instance of Employee' do
      @e.should_not nil
    end
    it 'should be that name is "Bob"' do
      @e.name.should == "Bob"
    end
    it 'shoud be that salary is 800.0' do
      @e.classification.salary.should == 800.0
    end
    it 'should be that commission rate is 10.0' do
      @e.classification.commissioned_rate.should == 10.0
    end
    it 'should be that schedule is hourly' do
      @e.schedule.class.should == BiWeeklySchedule
    end
  end

  describe "Delete an employee" do
    before do
      @employee_id = 4
      @t = AddCommissionedEmployee.new(@employee_id, 'Bob', 'Home', 800.0, 10.0)
      @t.execute
      @dt = DeleteEmployeeTransaction.new(@employee_id)
      @dt.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it "should delete an employee" do
      @e.should == nil
    end
  end

  describe "TimeCardTransaction" do
    before do
      @employee_id = 2
      @t = AddHourlyEmployee.new(@employee_id, 'Bob', 'Home', 10.0)
      @t.execute
      @tct = TimeCardTransaction.new(Date.new(2001,10,31), 8.0, @employee_id)
      @tct.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
      @hc = @e.classification
      @tc = @hc.time_card(Date.new(2001,10,31))
    end
    it "should record working hours" do
      @tc.hours.should == 8.0
    end
  end

  describe "SalesReceiptTransaction" do
    before do
      @employee_id = 3
      @t = AddCommissionedEmployee.new(@employee_id, 'Bob', 'Home', 800.0, 10.0)
      @t.execute
      @srt = SalesReceiptTransaction.new(Date.new(2008,1,19), 100.0, @employee_id)
      @srt.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
      @c = @e.classification
      @sr = @c.sales_receipt(Date.new(2008,1,19))
    end
    it 'should record amount' do
      @sr.amount.should == 100.0
    end
  end

  describe "add service charge" do
    before do
      @employee_id = 2
      @t = AddHourlyEmployee.new(@employee_id, 'Bob', 'Home', 15.25)
      @t.execute
      @tct = TimeCardTransaction.new(Date.new(2001,10,31), 8.0, @employee_id)
      @tct.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
      @af = UnionAffiliation.new(12.5)
      @e.affiliation = @af
      @member_id = 86
      PayrollDatabase.instance.add_union_member(@member_id, @e)
      @sct = ServiceChargeTransaction.new(@member_id, Date.new(2001,10,31), 12.95)
      @sct.execute
      @sc = @af.service_charge(Date.new(2001,10,31))
    end
    it "shoud be 12.95" do
      @sc.amount.should == 12.95
    end
  end

  describe "change an employee's name" do
    before do
      @employee_id = 2
      @t = AddHourlyEmployee.new(@employee_id, 'Bill', 'Home', 15.25)
      @t.execute
      @cnt = ChangeNameTransaction.new(@employee_id, 'Bob')
      @cnt.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it "should not be nil" do
      @e.should_not nil
    end
    it "should be 'Bob'" do
      @e.name.should == 'Bob'
    end
  end

  describe "change an employee's address" do
    before do
      @employee_id = 2
      @t = AddHourlyEmployee.new(@employee_id, 'Bill', 'Home', 15.25)
      @t.execute
      @cnt = ChangeAddressTransaction.new(@employee_id, 'House')
      @cnt.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it "should not be nil" do
      @e.should_not nil
    end
    it "should be 'House'" do
      @e.address.should == 'House'
    end
  end

  describe "change commissioned to hourly" do
    before do
      @employee_id = 3
      @t = AddCommissionedEmployee.new(@employee_id, 'Bob', 'Home', 800.0, 10.0)
      @t.execute
      @ct = ChangeHourlyTransaction.new(@employee_id, 27.52)
      @ct.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it "should not be nil" do
      @e.should_not nil
    end
    it "should have hourly classification" do
      @e.classification.class.should == HourlyClassification
    end
    it "should have a hourly rate 27.52" do
      @e.classification.hourly_rate.should == 27.52
    end
    it "should have a weekly schedule" do
      @e.schedule.class == WeeklySchedule
    end
  end

  describe "change commissioned to salaried" do
    before do
      @employee_id = 3
      @t = AddCommissionedEmployee.new(@employee_id, 'Bob', 'Home', 800.0, 10.0)
      @t.execute
      @ct = ChangeSalariedTransaction.new(@employee_id, 2500.0)
      @ct.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it "should not be nil" do
      @e.should_not nil
    end
    it "should have salaried classification" do
      @e.classification.class.should == SalariedClassification
    end
    it "should have a salary 2500.0" do
      @e.classification.salary.should == 2500.0
    end
    it "should have a monthly schedule" do
      @e.schedule.class == MonthlySchedule
    end
  end

  describe "change salaried to commissioned" do
    before do
      @employee_id = 3
      @t = AddSalariedEmployee.new(@employee_id, 'Bob', 'Home', 2500.0)
      @t.execute
      @ct = ChangeCommissionedTransaction.new(@employee_id, 2500.0, 100.0)
      @ct.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it "should not be nil" do
      @e.should_not nil
    end
    it "should have commissioned classification" do
      @e.classification.class.should == CommissionedClassification
    end
    it "should have a salary 2500.0" do
      @e.classification.salary.should == 2500.0
    end
    it "should have a commissioned rate 100.0" do
      @e.classification.commissioned_rate.should == 100.0
    end
    it "should have a biweekly schedule" do
      @e.schedule.class == BiWeeklySchedule
    end
  end

  describe "change payment method to direct" do
    before do
      @employee_id = 3
      @t = AddSalariedEmployee.new(@employee_id, 'Bob', 'Home', 2500.0)
      @t.execute
      @ct = ChangeDirectTransaction.new(@employee_id, 'bank', 'bob account')
      @ct.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it "should not be nil" do
      @e.should_not nil
    end
    it "should have payment method that is direct method" do
      @e.method.class.should == DirectMethod
    end
  end

  describe "change payment method to mail" do
    before do
      @employee_id = 3
      @t = AddSalariedEmployee.new(@employee_id, 'Bob', 'Home', 2500.0)
      @t.execute
      @ct = ChangeMailTransaction.new(@employee_id, 'bob address')
      @ct.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it "should not be nil" do
      @e.should_not nil
    end
    it "should have payment method that is mail method" do
      @e.method.class.should == MailMethod
    end
  end

  describe "change payment method to hold" do
    before do
      @employee_id = 3
      @t = AddSalariedEmployee.new(@employee_id, 'Bob', 'Home', 2500.0)
      @t.execute
      @ct = ChangeHoldTransaction.new(@employee_id, 'bob address')
      @ct.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it "should not be nil" do
      @e.should_not nil
    end
    it "should have payment method that is hold method" do
      @e.method.class.should == HoldMethod
    end
  end

  describe "change affiliation to union member" do
    before do
      @employee_id = 3
      @union_member_id = 7734
      @t = AddSalariedEmployee.new(@employee_id, 'Bob', 'Home', 2500.0)
      @t.execute
      @ct = ChangeUnionMemberTransaction.new(@employee_id, @union_member_id, 99.42)
      @ct.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
      @af = @e.affiliation
      @member = PayrollDatabase.instance.union_member(@union_member_id)
    end
    it "should not be nil" do
      @af.should_not nil
    end
    it "should have dues 99.42" do
      @af.dues.should == 99.42
    end
    it "should record a union member" do
      @member.should_not nil
    end
    it "should be same the employee and the union member" do
      @e.should == @member
    end
  end

  describe "change affiliation to unaffiliated" do
    before do
      @employee_id = 3
      @union_member_id = 7734
      @t = AddSalariedEmployee.new(@employee_id, 'Bob', 'Home', 2500.0)
      @t.execute
      @ct = ChangeUnionMemberTransaction.new(@employee_id, @union_member_id, 99.42)
      @ct.execute
      @ct = ChangeUnaffiliatedTransaction.new(@employee_id)
      @ct.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
      @af = @e.affiliation
      @member = PayrollDatabase.instance.union_member(@union_member_id)
    end
    it "should not be nil" do
      @af.should_not nil
    end
    it "should be NoAffiliation" do
      @af.class.should == NoAffiliation
    end
    it "should be nil" do
      @member.should nil
    end
  end
end
