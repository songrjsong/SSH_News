package com.rjsong.news.utils;


import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {
	private static SessionFactory sf ;
	
	
	public static SessionFactory getSessionFactory(){
		Configuration cfg = new Configuration();
		cfg.configure();  //加载解析 hibernate.cfg.xml
		
		StandardServiceRegistryBuilder builder = 
				new StandardServiceRegistryBuilder();
			builder.applySettings(cfg.getProperties());
			ServiceRegistry sr = builder.build();
		
		
		sf = cfg.buildSessionFactory(sr);
		return sf;
	}
	
}