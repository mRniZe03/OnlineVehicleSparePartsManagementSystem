package util;

import java.util.Timer;
import java.util.TimerTask;
import java.util.Calendar;
import java.util.Date;

/**
 * This class schedules a daily task that updates order statuses
 * according to the date logic (pending, shipped, delivered).
 * It runs automatically at 12:00 AM every day.
 */

public class DailyOrderStatusScheduler {

	public static void startScheduler() {
        Timer timer = new Timer();

        TimerTask dailyTask = new TimerTask() {
            public void run() {
                OrderStatusUpdater.updateOrderStatuses();
                System.out.println("[Scheduler] Order statuses updated at " + new Date());
            }
        };

        // Schedule for midnight
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        Date firstRun = calendar.getTime();
        if (firstRun.before(new Date())) {
            calendar.add(Calendar.DATE, 1);
            firstRun = calendar.getTime();
        }

        long oneDay = 24 * 60 * 60 * 1000L; // 24 hours in milliseconds
        timer.scheduleAtFixedRate(dailyTask, firstRun, oneDay);
    }
}
