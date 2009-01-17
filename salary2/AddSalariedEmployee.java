class AddSalariedEployee extends AddEmployeeTransaction {
  private double itsSalary;

  public AddSalariedEployee(int empId, String name, String address, double salary) {
    super(empId, name, address);
    itsSalary = salary;
  }

  public PaymentClassification GetClassification() {
    return new SalariedClassification(itsSalary);
  }

  public PaymentSchedule GetSchedule() {
    return new MonthlySchedule();
  }
}
