package me.mandali.niroban.repository.interfaces;

import me.mandali.niroban.model.Employee;

import java.util.List;

public interface EmployeeRepository {
    Employee save(Employee employee);
    Employee update(Employee employee);
    Employee findById(Long id);
    List<Employee> findAll();
    void delete(Long id);
}
