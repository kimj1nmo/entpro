package kr.or.ddit.spring.lab;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.or.ddit.demo.collection.Manager_;

public class ManagerTest_ {
	public static void main(String[] args) {
//		ApplicationContext context = new ClassPathXmlApplicationContext(
//
//				new String[] { "kr/or/ddit/spring/lab/beans-manager.xml" });
		ApplicationContext context = new ClassPathXmlApplicationContext(

				new String[] { "kr/or/ddit/spring/lab/beans-aspect.xml" });

		 Manager_ foo=(Manager_)context.getBean("manager");
		 System.out.println(foo);
		 foo.printPeopleList();


	}
}
