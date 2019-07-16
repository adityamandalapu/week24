// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.journaldev.jpa.data;

import com.journaldev.jpa.data.Employee;
import com.journaldev.jpa.data.Phone;
import java.math.BigDecimal;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;

privileged aspect Employee_Roo_DbManaged {
    
    @OneToMany(mappedBy = "empId")
    private Set<Phone> Employee.phones;
    
    @Column(name = "EMP_NAME", length = 45)
    private String Employee.empName;
    
    @Column(name = "EMP_HIRE_DATE", length = 30)
    private String Employee.empHireDate;
    
    @Column(name = "EMP_SALARY", precision = 11, scale = 4)
    private BigDecimal Employee.empSalary;
    
    public Set<Phone> Employee.getPhones() {
        return phones;
    }
    
    public void Employee.setPhones(Set<Phone> phones) {
        this.phones = phones;
    }
    
    public String Employee.getEmpName() {
        return empName;
    }
    
    public void Employee.setEmpName(String empName) {
        this.empName = empName;
    }
    
    public String Employee.getEmpHireDate() {
        return empHireDate;
    }
    
    public void Employee.setEmpHireDate(String empHireDate) {
        this.empHireDate = empHireDate;
    }
    
    public BigDecimal Employee.getEmpSalary() {
        return empSalary;
    }
    
    public void Employee.setEmpSalary(BigDecimal empSalary) {
        this.empSalary = empSalary;
    }
    
}
