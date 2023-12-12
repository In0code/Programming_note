package kr.co.sist.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    public static String getElapsedTime(String inputDate) {
        Date date = parseInputDate(inputDate);
        Date now = new Date();
        long elapsedTime = now.getTime() - date.getTime();

        if (elapsedTime < 5 * 60 * 1000) {  // 5분 이내
            return "5분 전";
        } else if (elapsedTime < 60 * 60 * 1000) {  // 1시간 이내
            long minutes = elapsedTime / (60 * 1000);
            return minutes + "분 전";
        } else if (elapsedTime < 24 * 60 * 60 * 1000) {  // 1일 이내
            long hours = elapsedTime / (60 * 60 * 1000);
            return hours + "시간 전";
        } else if (elapsedTime < 30 * 24 * 60 * 60 * 1000) {  // 30일 이내
            long days = elapsedTime / (24 * 60 * 60 * 1000);
            return days + "일 전";
        } else {
            // 'yyyy-MM-dd HH:mm:ss' 형식으로 반환
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return sdf.format(date);
        }
    }

    private static Date parseInputDate(String inputDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return sdf.parse(inputDate);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
