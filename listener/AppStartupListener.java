package listener;

import util.DailyOrderStatusScheduler;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class AppStartupListener implements ServletContextListener {

	 @Override
	    public void contextInitialized(ServletContextEvent sce) {
	        DailyOrderStatusScheduler.startScheduler();
	        System.out.println("[AppStartupListener] DailyOrderStatusScheduler started.");
	    }

	    @Override
	    public void contextDestroyed(ServletContextEvent sce) {
	        // Clean up resources if needed
	        System.out.println("[AppStartupListener] Context destroyed.");
	    }
	
}