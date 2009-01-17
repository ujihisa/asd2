import junit.framework.TestCase;

public class TestPayroll extends TestCase {
  public void testAddSalariedEmployee() {
    System.err.println("TestAddSalariedEmployee");
    int empId = 1;
    AddSalariedEployee t = new AddSalariedEmployee(empId, "Bob", "Home", 1000.00);
    t.Execute();
    Employee e = PayrollDatabase.GetEmployee(empId);
    assertNotNull(e);
    assertEquals("Bob", e.GetName());
    PaymentClassification pc = e.GetClassification();
    SalariedClassification sc = (SalariedClassification) pc;
    assertNotNull(cs);
    assertEquals(1000.00, sc.GetSalary());
    PaymentSchedule ps = e.GetSchedule();
    MonthlySchedule ms = (MonthlySchedule) ps;
    assertNotNull(ms);
    PaymentMethod pm = g.GetMethod();
    HoleMethod hm = (HoldMehotd) pM;
    assertNotNull(hm);
  }
}
