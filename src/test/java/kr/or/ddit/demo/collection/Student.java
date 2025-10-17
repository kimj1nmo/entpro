package kr.or.ddit.demo.collection;

public class Student extends People {

	private String grade;//학년
	private String classNo;//반
	private String no;//번호
	
	public Student(){
		
	}
	
	public Student(	
			 String name,
	 String age,
	 String sex,
	 String grade,
	 String classNo,
	 String no
	)
	{
		this.setName(name);
		this.setAge(age);
		this.setSex(sex);
		/*	
		 this.name=name;
		this.age=age;
		this.sex=sex;
		*/
		this.grade=grade;
		this.classNo=classNo;
		this.no=no;
	}	
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "Student [grade=" + grade + ", classNo=" + classNo + ", no=" + no + "]"+super.toString();
	}
	public String getClassNo() {
		return classNo;
	}
	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	
	
	
	
}
