package com.wipro.velocity;

//Component Mapping Demo

/*Component Mappings -    Mapping for a class 
 * having a reference to another class as a 
 * member variable */

public class Student {
	
	private int studentId;
    private String firstName;
    private String lastName;
    private String rollNo;
    private int age;
    private StudentClass studentClass; // component - has a relationship
	
    public Student() {
		
	}

	public Student(String firstName, String lastName, String rollNo, int age,
			StudentClass studentClass) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.rollNo = rollNo;
		this.age = age;
		this.studentClass = studentClass;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getRollNo() {
		return rollNo;
	}

	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public StudentClass getStudentClass() {
		return studentClass;
	}

	public void setStudentClass(StudentClass studentClass) {
		this.studentClass = studentClass;
	}

    
}
