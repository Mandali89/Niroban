package me.mandali.niroban.service.interfaces;

import me.mandali.niroban.model.Employee;

import java.util.List;

public interface EmployeeService {

    Employee addEmployee(Employee employee);
    Employee getEmployeeById(Long id);
    Employee updateEmployee(Employee employee);
    List<Employee> getAllEmployees();
    void deleteEmployee(Long id);
}
