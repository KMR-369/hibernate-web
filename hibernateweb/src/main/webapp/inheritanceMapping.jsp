<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.hibernate.*,
                    org.hibernate.cfg.Configuration,com.wipro.velocity.bookstore.Person,com.wipro.velocity.bookstore.Candidate,
                    java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inheritance Mapping</title>
</head>
<body>
	<h1>Inheritance Mapping Demo</h1>



	<%
	Configuration cfg = new Configuration();
	cfg.configure("hibernate.cfg.xml");
	SessionFactory factory = cfg.buildSessionFactory();
	Session sess = factory.openSession();
	sess.beginTransaction();

	Person person = new Person("Manikanta", "Reddy");
	sess.save(person);

	Candidate cd = new Candidate("Aditya", "Reddy", new Date(), "Software");
	sess.save(cd);
	out.println("Executed Sucessfully");
	sess.getTransaction().commit();
	sess.close();

	sess = factory.openSession();
	Person p = (Person) sess.get(Person.class, person.getPersonId());
	out.println(p);
	sess.close();
	factory.close();
	%>
</body>
</html>