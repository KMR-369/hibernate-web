<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.hibernate.*,
                    org.hibernate.cfg.Configuration,com.wipro.velocity.bookstore.Customer,com.wipro.velocity.bookstore.Address,
                    javax.persistence.TypedQuery,
                    java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>One to One</title>
</head>
<body>

	<h1>One To One Bi-Directional Association Mapping</h1>
	<%
	Configuration cfg = new Configuration();
	cfg.configure("hibernate.cfg.xml");

	//Hibernate 4 way of initializing the session factory
	SessionFactory factory = cfg.buildSessionFactory();
	Session sess = factory.openSession();
	Transaction t = sess.beginTransaction();

	Customer e1 = new Customer();
	e1.setName("James Bond");
	e1.setEmail("james.Bond@gmail.com");

	Address address1 = new Address();
	address1.setHouseNo(102);
	address1.setStreet("H-24,Gandhinagar");
	address1.setCity("Kakinada");
	address1.setState("Andhra Pradesh");
	address1.setCountry("India");
	address1.setPincode(533001);

	e1.setAddress(address1);
	address1.setCust(e1);

	sess.persist(e1);
	t.commit();
	//sess.close();
	out.print("Data Sucessfully Saved");

	out.print("<br>" + "************** Data Retrieveal********************" + "<br>");

	sess.beginTransaction();

	TypedQuery qry = sess.createQuery("from Customer");

	List<Customer> list = qry.getResultList();

	Iterator<Customer> itr = list.iterator();
	while (itr.hasNext()) {
		Customer c = itr.next();
		out.println(c.getCustId() + " " + c.getName() + " " + c.getEmail());
		Address address = c.getAddress();
		out.println(address.getStreet() + "  " + address.getStreet() + " " + address.getCity() + " " + address.getState()
		+ " " + address.getCountry() + " " + address.getPincode() + "<br>");
	}

	sess.close();
	System.out.println("success");
	%>
</body>
</html>