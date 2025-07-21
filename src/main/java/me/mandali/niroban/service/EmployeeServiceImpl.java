package me.mandali.niroban.service;

import me.mandali.niroban.exception.DatabaseOperationException;
import me.mandali.niroban.exception.IdNotFoundException;
import me.mandali.niroban.exception.InvalidInputException;
import me.mandali.niroban.model.Employee;
import me.mandali.niroban.repository.EmployeeRepositoryImpl;
import me.mandali.niroban.repository.interfaces.EmployeeRepository;
import me.mandali.niroban.service.interfaces.EmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {

  private EmployeeRepository employeeRepository;


    public EmployeeServiceImpl() {
        this.employeeRepository = new EmployeeRepositoryImpl();
    }
    @Override
    public Employee addEmployee(Employee employee) {
        validateEmployee(employee);

        try {
            return employeeRepository.save(employee);
        } catch (Exception e) {
            throw new DatabaseOperationException("Failed to save the employee.", e);
        }
    }

    @Override
    public Employee updateEmployee(Employee employee) {
        try {
            return employeeRepository.update(employee);
        } catch (Exception e) {
            throw new DatabaseOperationException("Failed to update the employee.", e);
        }
    }
    @Override
    public Employee getEmployeeById(Long id) {
        Employee employee = employeeRepository.findById(id);
        if (employee == null) {
            throw new IdNotFoundException(id);
        }
        return employee;
    }

    @Override
    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    @Override
    public void deleteEmployee(Long id) {
        try {
            employeeRepository.delete(id);
        } catch (Exception e) {
            throw new DatabaseOperationException("Failed to delete the employee.", e);
        }
    }



    public void validateEmployee(Employee employee) {
        if (employee.getName() == null || employee.getName().isEmpty()) {
            throw new InvalidInputException("Employee name cannot be empty.");
        }

        if (employee.getEmail() == null || employee.getEmail().isEmpty()) {
            throw new InvalidInputException("Employee email cannot be empty.");
        }

        if (employee.getPassword() == null || employee.getPassword().isEmpty()) {
            throw new InvalidInputException("Employee password cannot be empty.");
        }

        if (employee.getBirthDate() == null) {
            throw new InvalidInputException("Employee birth date cannot be null.");
        }

        if (employee.getDepartment() == null || employee.getDepartment().isEmpty()) {
            throw new InvalidInputException("Employee department cannot be empty.");
        }

        if (employee.getPosition() == null || employee.getPosition().isEmpty()) {
            throw new InvalidInputException("Employee position cannot be empty.");
        }

        if (employee.getAddress() == null || employee.getAddress().isEmpty()) {
            throw new InvalidInputException("Employee address cannot be empty.");
        }

        if (employee.getPhoneNumber() == null || employee.getPhoneNumber().isEmpty()) {
            throw new InvalidInputException("Employee phone number cannot be empty.");
        }

        if (employee.getSalary() <= 0) {
            throw new InvalidInputException("Employee salary must be greater than zero.");
        }

        if (employee.getSoldConge() == null || employee.getSoldConge().isEmpty()) {
            throw new InvalidInputException("Employee soldConge cannot be empty.");
        }

        if (employee.getSocialSecurityNumber() == null || employee.getSocialSecurityNumber().isEmpty()) {
            throw new InvalidInputException("Employee social security number cannot be empty.");
        }
    }
}