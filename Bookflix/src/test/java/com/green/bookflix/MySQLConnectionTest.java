package com.green.bookflix;

import java.sql.Connection;
 
import javax.inject.Inject;
import javax.sql.DataSource;
 
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class MySQLConnectionTest {
    
    @Inject
    private DataSource ds;
 
    @Test
    public void testConnection() throws Exception {
 
        try (Connection con = ds.getConnection()) {
 
            System.out.println("\n >>>>>>>>>> Connection 출력 : " + con + "\n");
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

  
  // 1차 테스트
//  private static final String DRIVER = "com.mysql.jdbc.Driver";
//  private static final String URL = "jdbc:mysql://mysql57-projectserver.cdti5hznrqrg.ap-northeast-2.rds.amazonaws.com:3306/bookflixdb";
//  private static final String USER = "dev";
//  private static final String PW = "1234";
//  
//  @Test
//  public void testConnection() throws Exception{
//    Class.forName(DRIVER);
//    
//    try(Connection conn = DriverManager.getConnection(URL,USER,PW)) {
//      System.out.println(conn);
//    } catch (Exception e) {
//      e.printStackTrace();
//    }
//  }
  
  

}
