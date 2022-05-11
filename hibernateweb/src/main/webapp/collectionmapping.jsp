<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.*,
                    org.hibernate.*,
                    org.hibernate.cfg.Configuration,com.wipro.velocity.bookstore.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Collection Mapping</title>
</head>
<body>
	<h1> Hibernate Collection Mapping Demo</h1>

 

<%
Session sess = new Configuration().configure("hibernate.cfg.xml")
.buildSessionFactory().openSession();
Transaction t = sess.beginTransaction();

 

Employee employee = new Employee();
employee.setEmployeeId(1004);
employee.setEmployeeName("Manikanta Reddy");

 

Set<String> phoneNumbers = new HashSet<String>();
phoneNumbers.add("78945612");
phoneNumbers.add("789520134");
phoneNumbers.add("012378965");

 

employee.setPhoneNumbers(phoneNumbers);

 

sess.save(employee);
t.commit();

 

// Retrieve records using Query Interface

 

/*Query q=sess.createQuery("from Employee"); //HQL
List<Employee> empList=q.list(); // stores query records in list */

 

List<Employee> empList=sess.createQuery("from Employee",Employee.class).list();
Iterator<Employee> itr = empList.iterator();
while (itr.hasNext()) {
    Employee emp = itr.next();
    out.print("<br>"+"Employee Id: " + emp.getEmployeeId()+"<br>");
    out.print("Employee Name: " + emp.getEmployeeName()+"<br>");

 

    // printing answers
    Set<String> set = emp.getPhoneNumbers();
    Iterator<String> itr2 = set.iterator();
    out.print("Employee Phone Numbers:");
    while (itr2.hasNext()) {
        out.println(itr2.next());
    }
   out.println("<br>"+"----------------------------------------------------");
}
sess.close();
out.println("<br>"+"success");

 

%>
</body>
</html>