import java.util.HashMap;
import java.util.Map;

class PayrollDatabase {
  private static Map<Integer, Employee> itsEmployees =
    new HashMap<Integer, Employee>();

  public static void AddEmployee(int empId, Employee e) {
    itsEmployees.put(empId, e);
  }

  public static Employee GetEmployee(int empId) {
    return itsEmployees.get(empId);
  }

  public static void Clear() {
    itsEmployees.clear();
  }
}
