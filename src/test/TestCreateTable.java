package test;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.junit.*;



public class TestCreateTable {

	@Test
	public void testCreateTable(){
		
		Configuration cfg = new Configuration();
		cfg.configure();
		
		SchemaExport se = new SchemaExport(cfg);
		se.create(true, true);
	}
}
