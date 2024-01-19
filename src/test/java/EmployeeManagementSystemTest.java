import org.example.Employee;
import org.example.Project;

public class EmployeeManagementSystemTest {
    public static void main(String[] args) {
        // Creating employees and projects
        Employee employee1 = new Employee("John Doe", 30, "Developer");
        employee1.setEntryDate("2022-01-01");
        employee1.setContactDuration(12);
        employee1.setNoticePeriod(1);

        Employee employee2 = new Employee("Jane Smith", 25, "Manager");
        employee2.setEntryDate("2021-06-01");
        employee2.setContactDuration(24);
        employee2.setNoticePeriod(2);

        Project project1 = new Project("Project A");
        Project project2 = new Project("Project B");



        // Assigning employees to projects
        employee1.addProject(project1);
        employee1.addProject(project2);

        employee2.addProject(project1);

        // Displaying employee information
        System.out.println("Employee 1 Information:");
        employee1.displayInfo();

        System.out.println("\nEmployee 2 Information:");
        employee2.displayInfo();
    }
}
