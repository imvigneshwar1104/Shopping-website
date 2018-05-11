package com.niit.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;

@Configuration
@EnableTransactionManagement
@ComponentScan("com.niit")
public class DBConfiguration {

	@Bean(name="dataSource")
	public DataSource getDataSource() {
		BasicDataSource dataSource=new BasicDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/Vignesh");
		dataSource.setUsername("sa");
		dataSource.setPassword("");
		return dataSource;
		
	}
	
	@Bean(name="sessionFactory")
	public SessionFactory sessionFactory() {
		
		LocalSessionFactoryBuilder lsf= new LocalSessionFactoryBuilder(getDataSource());
		
		lsf.scanPackages("com.niit");
		Properties hibernateProperties=new Properties();
		hibernateProperties.setProperty(
				"hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");
		hibernateProperties.setProperty("hibernate.show_sql", "true");
		hibernateProperties.setProperty("hibernate.format_sql", "true");
		lsf.addProperties(hibernateProperties);
		
	    return lsf.buildSessionFactory();
	}
	
	@Bean(name="transactionManager")
	public HibernateTransactionManager hibTransManagement(){
		return new HibernateTransactionManager(sessionFactory());
	}
}



