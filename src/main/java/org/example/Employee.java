package org.example;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Employee extends Person implements ContractDepartment {

    private String entryDate;
    private int contractDuration;
    private int noticePeriod;
    private String position;

    private List<Project> projects;

    public Employee(String name, int age, String position) {
        super(name, age);
        this.position = position;
        projects = new ArrayList<>();
    }

    @Override
    public void setEntryDate(String entryDate) {
        this.entryDate = entryDate;
    }

    @Override
    public void setContactDuration(int contactDuration) {
        this.contractDuration = contactDuration;
    }

    @Override
    public void setNoticePeriod(int noticePeriod) {
        this.noticePeriod = noticePeriod;
    }


    public double calculateSalary() {
        double baseSalary = 50000;
        switch (position.toLowerCase()) {
            case "developer":
                baseSalary += 10000;
                break;

            case "manager":
                baseSalary += 20000;
                break;

            default:
                return baseSalary;
        }
        return baseSalary;
    }

    public void addProject(Project project) {
        projects.add(project);
    }

    public void removeProject(Project project) {
        projects.remove(project);
    }

    public void displayInfo() {
        System.out.println("Name : " + this.getName());
        System.out.println("Age : " + this.getAge());
        System.out.println("Position : " + this.position);
        System.out.println("Salary $ : " + this.calculateSalary());

        List result = new ArrayList<>();
        for (int i = 0; i < this.projects.size(); i++) {
            result.add(projects.get(i).getProjectName());
        }
        System.out.println("Projects : " + result);
    }
}
