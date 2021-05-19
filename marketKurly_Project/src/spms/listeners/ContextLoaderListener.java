package spms.listeners;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

import spms.dao.BoardDao;
import spms.dao.CartDao;


/* JNDI
 * WAS(Web Application Server)의 리소스(자원)에 대한 고유 이름 정의
 * Application에서 서버의 리소스를 접근할 때 사용하는 명명 규칙
 * 1) java:comp/env            - 응용 프로그램 환경 항목
 * 2) java:comp/env/jdbc      - JDBC 데이터 소스
 * 3) java:comp/ejb            - EJB 컴포넌트
 * 4) java:comp/UserTransaction - UserTransaction 객체
 * 5) java:comp/env/mail      - JavaMail 연결 객체
 * 6) java:comp/env/url         - URL 정보
 * 7) java:comp/env/jms         - JMS 연결 객체
 * */

public class ContextLoaderListener implements ServletContextListener {
   
   @Override
   public void contextDestroyed(ServletContextEvent sce) {
      System.out.println("contextDestroyed 호출 - WebApp 종료");
   }

   @Override
   public void contextInitialized(ServletContextEvent sce) {

      try {
         System.out.println("contextInitialized 호출 - WebApp 시작");
         ServletContext sc = sce.getServletContext();

         // tomcat이 생성/관리하는 DataSource객체를 찾아온다
         InitialContext initialContext = 
               new InitialContext();
         DataSource ds = (DataSource)initialContext
               .lookup("java:comp/env/jdbc/studydb");
         
         CartDao cartDao = new CartDao();
         cartDao.setDataSource(ds);
         
         BoardDao boardDao = new BoardDao();
			boardDao.setDataSource(ds);

         
         // 모든 서블릿이 사용할 수 있도록  memberDao를 공유한다
         sc.setAttribute("cartDao", cartDao);
         sc.setAttribute("boardDao", boardDao);

      }catch(Exception e) {
         e.printStackTrace();
      }

   }

}