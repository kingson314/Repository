package test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.system.sysuser.entity.SysUser;

public class Hibernate {
	public static void main(String[] args) {
		SysUser u = new SysUser();
		u.setName("123");
		SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();  
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.save(u);
		session.beginTransaction().commit();
		System.out.println("done");
	}
}
