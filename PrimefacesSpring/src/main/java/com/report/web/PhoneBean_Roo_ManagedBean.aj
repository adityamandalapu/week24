// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.journaldev.web;

import com.journaldev.jpa.data.Employee;
import com.journaldev.jpa.data.Phone;
import com.journaldev.web.PhoneBean;
import com.journaldev.web.converter.EmployeeConverter;
import com.journaldev.web.util.MessageFactory;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.validator.LengthValidator;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect PhoneBean_Roo_ManagedBean {
    
    declare @type: PhoneBean: @ManagedBean(name = "phoneBean");
    
    declare @type: PhoneBean: @SessionScoped;
    
    private String PhoneBean.name = "Phones";
    
    private Phone PhoneBean.phone;
    
    private List<Phone> PhoneBean.allPhones;
    
    private boolean PhoneBean.dataVisible = false;
    
    private List<String> PhoneBean.columns;
    
    private HtmlPanelGrid PhoneBean.createPanelGrid;
    
    private HtmlPanelGrid PhoneBean.editPanelGrid;
    
    private HtmlPanelGrid PhoneBean.viewPanelGrid;
    
    private boolean PhoneBean.createDialogVisible = false;
    
    @PostConstruct
    public void PhoneBean.init() {
        columns = new ArrayList<String>();
        columns.add("phNo");
    }
    
    public String PhoneBean.getName() {
        return name;
    }
    
    public List<String> PhoneBean.getColumns() {
        return columns;
    }
    
    public List<Phone> PhoneBean.getAllPhones() {
        return allPhones;
    }
    
    public void PhoneBean.setAllPhones(List<Phone> allPhones) {
        this.allPhones = allPhones;
    }
    
    public String PhoneBean.findAllPhones() {
        allPhones = Phone.findAllPhones();
        dataVisible = !allPhones.isEmpty();
        return null;
    }
    
    public boolean PhoneBean.isDataVisible() {
        return dataVisible;
    }
    
    public void PhoneBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid PhoneBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void PhoneBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid PhoneBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void PhoneBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid PhoneBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void PhoneBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid PhoneBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel empIdCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        empIdCreateOutput.setFor("empIdCreateInput");
        empIdCreateOutput.setId("empIdCreateOutput");
        empIdCreateOutput.setValue("Emp Id:");
        htmlPanelGrid.getChildren().add(empIdCreateOutput);
        
        AutoComplete empIdCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        empIdCreateInput.setId("empIdCreateInput");
        empIdCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{phoneBean.phone.empId}", Employee.class));
        empIdCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{phoneBean.completeEmpId}", List.class, new Class[] { String.class }));
        empIdCreateInput.setDropdown(true);
        empIdCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "empId", String.class));
        empIdCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{empId.empName} #{empId.empHireDate} #{empId.empSalary} #{empId.empId}", String.class));
        empIdCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{empId}", Employee.class));
        empIdCreateInput.setConverter(new EmployeeConverter());
        empIdCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(empIdCreateInput);
        
        Message empIdCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        empIdCreateInputMessage.setId("empIdCreateInputMessage");
        empIdCreateInputMessage.setFor("empIdCreateInput");
        empIdCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(empIdCreateInputMessage);
        
        OutputLabel phNoCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        phNoCreateOutput.setFor("phNoCreateInput");
        phNoCreateOutput.setId("phNoCreateOutput");
        phNoCreateOutput.setValue("Ph No:");
        htmlPanelGrid.getChildren().add(phNoCreateOutput);
        
        InputText phNoCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        phNoCreateInput.setId("phNoCreateInput");
        phNoCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{phoneBean.phone.phNo}", String.class));
        LengthValidator phNoCreateInputValidator = new LengthValidator();
        phNoCreateInputValidator.setMaximum(30);
        phNoCreateInput.addValidator(phNoCreateInputValidator);
        phNoCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(phNoCreateInput);
        
        Message phNoCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        phNoCreateInputMessage.setId("phNoCreateInputMessage");
        phNoCreateInputMessage.setFor("phNoCreateInput");
        phNoCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(phNoCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid PhoneBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel empIdEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        empIdEditOutput.setFor("empIdEditInput");
        empIdEditOutput.setId("empIdEditOutput");
        empIdEditOutput.setValue("Emp Id:");
        htmlPanelGrid.getChildren().add(empIdEditOutput);
        
        AutoComplete empIdEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        empIdEditInput.setId("empIdEditInput");
        empIdEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{phoneBean.phone.empId}", Employee.class));
        empIdEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{phoneBean.completeEmpId}", List.class, new Class[] { String.class }));
        empIdEditInput.setDropdown(true);
        empIdEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "empId", String.class));
        empIdEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{empId.empName} #{empId.empHireDate} #{empId.empSalary} #{empId.empId}", String.class));
        empIdEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{empId}", Employee.class));
        empIdEditInput.setConverter(new EmployeeConverter());
        empIdEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(empIdEditInput);
        
        Message empIdEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        empIdEditInputMessage.setId("empIdEditInputMessage");
        empIdEditInputMessage.setFor("empIdEditInput");
        empIdEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(empIdEditInputMessage);
        
        OutputLabel phNoEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        phNoEditOutput.setFor("phNoEditInput");
        phNoEditOutput.setId("phNoEditOutput");
        phNoEditOutput.setValue("Ph No:");
        htmlPanelGrid.getChildren().add(phNoEditOutput);
        
        InputText phNoEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        phNoEditInput.setId("phNoEditInput");
        phNoEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{phoneBean.phone.phNo}", String.class));
        LengthValidator phNoEditInputValidator = new LengthValidator();
        phNoEditInputValidator.setMaximum(30);
        phNoEditInput.addValidator(phNoEditInputValidator);
        phNoEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(phNoEditInput);
        
        Message phNoEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        phNoEditInputMessage.setId("phNoEditInputMessage");
        phNoEditInputMessage.setFor("phNoEditInput");
        phNoEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(phNoEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid PhoneBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText empIdLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        empIdLabel.setId("empIdLabel");
        empIdLabel.setValue("Emp Id:");
        htmlPanelGrid.getChildren().add(empIdLabel);
        
        HtmlOutputText empIdValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        empIdValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{phoneBean.phone.empId}", Employee.class));
        empIdValue.setConverter(new EmployeeConverter());
        htmlPanelGrid.getChildren().add(empIdValue);
        
        HtmlOutputText phNoLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        phNoLabel.setId("phNoLabel");
        phNoLabel.setValue("Ph No:");
        htmlPanelGrid.getChildren().add(phNoLabel);
        
        HtmlOutputText phNoValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        phNoValue.setId("phNoValue");
        phNoValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{phoneBean.phone.phNo}", String.class));
        htmlPanelGrid.getChildren().add(phNoValue);
        
        return htmlPanelGrid;
    }
    
    public Phone PhoneBean.getPhone() {
        if (phone == null) {
            phone = new Phone();
        }
        return phone;
    }
    
    public void PhoneBean.setPhone(Phone phone) {
        this.phone = phone;
    }
    
    public List<Employee> PhoneBean.completeEmpId(String query) {
        List<Employee> suggestions = new ArrayList<Employee>();
        for (Employee employee : Employee.findAllEmployees()) {
            String employeeStr = String.valueOf(employee.getEmpName() +  " "  + employee.getEmpHireDate() +  " "  + employee.getEmpSalary() +  " "  + employee.getEmpId());
            if (employeeStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(employee);
            }
        }
        return suggestions;
    }
    
    public String PhoneBean.onEdit() {
        return null;
    }
    
    public boolean PhoneBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void PhoneBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String PhoneBean.displayList() {
        createDialogVisible = false;
        findAllPhones();
        return "phone";
    }
    
    public String PhoneBean.displayCreateDialog() {
        phone = new Phone();
        createDialogVisible = true;
        return "phone";
    }
    
    public String PhoneBean.persist() {
        String message = "";
        if (phone.getPhId() != null) {
            phone.merge();
            message = "message_successfully_updated";
        } else {
            phone.persist();
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "Phone");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllPhones();
    }
    
    public String PhoneBean.delete() {
        phone.remove();
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "Phone");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllPhones();
    }
    
    public void PhoneBean.reset() {
        phone = null;
        createDialogVisible = false;
    }
    
    public void PhoneBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
