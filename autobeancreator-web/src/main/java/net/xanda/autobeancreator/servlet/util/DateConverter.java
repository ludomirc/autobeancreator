package net.xanda.autobeancreator.servlet.util;

import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;


public class DateConverter {

 /* Replace all instances of a String in a String.
 *   @param  s  String to alter.
 *   @param  f  String to look for.
 *   @param  r  String to replace it with, or null to just remove it.
 */

    public static String convertDateToDayWithEnding(String rawDate) {
        try {

            StringTokenizer tok = new StringTokenizer(rawDate, "-");
            String year = tok.nextToken();
            String month = tok.nextToken();
            String day = tok.nextToken();
            String th = "th";
            String nd = "nd";
            String st = "st";
            String rd = "rd";
            String finalDate = "";

            int dayInt = Integer.parseInt(day);
            if (dayInt < 10) {
                day = dayInt + "";
            }

            if (day.equals("1") || day.equals("21") || day.equals("31")) {
                finalDate = day + st;
            } else if (day.equals("2") || day.equals("22")) {
                finalDate = day + nd;
            } else if (day.equals("3") || day.equals("23")) {
                finalDate = day + rd;
            } else {
                finalDate = day + th;
            }
            return finalDate;
        } catch (Exception e) {
            return "Invalid Date";
        }
    }

    //
    public static String convertRawDate(String rawDate) {
        if (rawDate.equals("")) {
            return "";
        }
        String longDate = "";
        String longDay = "";
        String longMonth = "";
        StringTokenizer tok = new StringTokenizer(rawDate, "-");
        String year = tok.nextToken();
        String month = tok.nextToken();
        String day = tok.nextToken();
        longMonth = getLongMonth(month);

        longDay = trimFirstZero(day);
        longDate = longDay + " " + longMonth + ", " + year;
        return longDate;
    }

    private static String trimFirstZero(String str) {
        if (str == null) return str;

        if (str.charAt(0) == '0') {
            str = str.substring(1);
        }
        return str;
    }

    private static String getLongMonth(String month) {

        String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
        return geFromArr(month, months);
    }


    private static String getShortMonth(String month) {
        String[] months = {"Jan", "Feb",  "Mar", "Apr","May","Jun", "Jul",  "Aug", "Sep", "Oct", "Nov","Dec"};
        return geFromArr(month, months);
    }

    private static String geFromArr(String month, String[] months) {
        int mnt = Integer.parseInt(trimFirstZero(month)) - 1;
        return  months[mnt];
    }

    public static String convertRawDateMini(String rawDate) {

        String longDate = "";
        String longDay = "";
        String longMonth = "";
        StringTokenizer tok = new StringTokenizer(rawDate, "-");
        String year = tok.nextToken();
        String month = tok.nextToken();
        String day = tok.nextToken();
        longMonth = getShortMonth(month);
        longDay = trimFirstZero(day);
        longDate = longDay + " " + longMonth + " " + year.substring(2);
        return longDate;
    }

    public static String getMonthFromRawDate(String rawDate) {
        if (rawDate.equals("")) {
            return "";
        }
        StringTokenizer tok = new StringTokenizer(rawDate, "-");
        String year = tok.nextToken();
        String month = tok.nextToken();
        String day = tok.nextToken();
        return month;
    }

    public static String convertRawDateMonth(String rawDate) {
        if (rawDate.equals("")) {
            return "";
        }
        String longDate = "";
        String longDay = "";
        String longMonth = "";
        StringTokenizer tok = new StringTokenizer(rawDate, "-");
        String year = tok.nextToken();
        String month = tok.nextToken();
        String day = tok.nextToken();
        longMonth = getLongMonth(month);
        longDate = longMonth + ", " + year;
        return longDate;
    }

    public static String convertRawDateMiniMonthYearOnly(String rawDate) {

        String longDate = "";
        String longMonth = "";
        StringTokenizer tok = new StringTokenizer(rawDate, "-");
        String year = tok.nextToken();
        String month = tok.nextToken();
        longMonth = getShortMonth(month);
        longDate = longMonth + " " + year.substring(2);
        return longDate;
    }


    public static String getYear() {
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat("yyyy");
        return getToday(formatter);
    }

    private static String getToday(SimpleDateFormat formatter) {
        java.util.Date today;
        String dateOutFormatted;
        today = new java.util.Date();
        dateOutFormatted = formatter.format(today);
        return dateOutFormatted;
    }

    public static String getMonth() {
        java.util.Date today;
        String dateOutFormatted;
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat("MM");
        today = new java.util.Date();
        dateOutFormatted = formatter.format(today);
        // System.err.println("Setting message date as "+dateOutFormatted);
        return dateOutFormatted;
    }

    public static String getDay() {
        java.util.Date today;
        String dateOutFormatted;
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat("dd");
        today = new java.util.Date();
        dateOutFormatted = formatter.format(today);
        // System.err.println("Setting message date as "+dateOutFormatted);
        return dateOutFormatted;
    }

    public static String getRawDate() {
        java.util.Date today;
        String dateOutFormatted;
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat("yyyy-MM-dd");
        today = new java.util.Date();
        dateOutFormatted = formatter.format(today);
        //  System.err.println("Setting message date as "+dateOutFormatted);
        return dateOutFormatted;
    }

    public static String get7DaysAhead(String startDate) {
        StringTokenizer tok = new StringTokenizer(startDate, "-");
        int year = Integer.parseInt(tok.nextToken());
        int month = Integer.parseInt(tok.nextToken());
        int day = Integer.parseInt(tok.nextToken());

        GregorianCalendar calendar = new GregorianCalendar(year, month - 1, day);

        String dayString = "";
        String monthString = "";
        calendar.add(java.util.Calendar.DAY_OF_MONTH, 7);
        day = calendar.get(java.util.Calendar.DAY_OF_MONTH);
        month = calendar.get(java.util.Calendar.MONTH) + 1;
        year = calendar.get(java.util.Calendar.YEAR);

        dayString = addZeroPrefix(day);
        monthString = addZeroPrefix(month);

        return year + "-" + monthString + "-" + dayString;
    }

    public static String get14DaysPrevious(String startDate) {
        StringTokenizer tok = new StringTokenizer(startDate, "-");
        int year = Integer.parseInt(tok.nextToken());
        int month = Integer.parseInt(tok.nextToken());
        int day = Integer.parseInt(tok.nextToken());

        GregorianCalendar calendar = new GregorianCalendar(year, month - 1, day);

        String dayString = "";
        String monthString = "";
        calendar.add(java.util.Calendar.DAY_OF_MONTH, -14);
        day = calendar.get(java.util.Calendar.DAY_OF_MONTH);
        month = calendar.get(java.util.Calendar.MONTH) + 1;
        year = calendar.get(java.util.Calendar.YEAR);

        dayString = addZeroPrefix(day);
        monthString = addZeroPrefix(month);

        return year + "-" + monthString + "-" + dayString;
    }

    public static String get1DayAhead(String startDate) {
        StringTokenizer tok = new StringTokenizer(startDate, "-");
        int year = Integer.parseInt(tok.nextToken());
        int month = Integer.parseInt(tok.nextToken());
        int day = Integer.parseInt(tok.nextToken());

        GregorianCalendar calendar = new GregorianCalendar(year, month - 1, day);

        String dayString = "";
        String monthString = "";
        calendar.add(java.util.Calendar.DAY_OF_MONTH, 1);
        day = calendar.get(java.util.Calendar.DAY_OF_MONTH);
        month = calendar.get(java.util.Calendar.MONTH) + 1;
        year = calendar.get(java.util.Calendar.YEAR);

        dayString = addZeroPrefix(day);
        monthString = addZeroPrefix(month);

        return year + "-" + monthString + "-" + dayString;
    }

    public static String get1MonthAhead(String startDate) {
        StringTokenizer tok = new StringTokenizer(startDate, "-");
        int year = Integer.parseInt(tok.nextToken());
        int month = Integer.parseInt(tok.nextToken());
        int day = Integer.parseInt(tok.nextToken());

        GregorianCalendar calendar = new GregorianCalendar(year, month - 1, day);

        String dayString = "";
        String monthString = "";
        calendar.add(java.util.Calendar.MONTH, 1);
        day = calendar.get(java.util.Calendar.DAY_OF_MONTH);
        month = calendar.get(java.util.Calendar.MONTH) + 1;
        year = calendar.get(java.util.Calendar.YEAR);

        dayString = addZeroPrefix(day);
        monthString = addZeroPrefix(month);

        return year + "-" + monthString + "-" + dayString;
    }

    private static String addZeroPrefix(int day) {

        String dayString;
        if (day < 10) {
            dayString = "0" + day;
        } else {
            dayString = day + "";
        }
        return dayString;
    }

    public static String get1YearAhead(String startDate) {
        StringTokenizer tok = new StringTokenizer(startDate, "-");
        int year = Integer.parseInt(tok.nextToken());
        int month = Integer.parseInt(tok.nextToken());
        int day = Integer.parseInt(tok.nextToken());

        GregorianCalendar calendar = new GregorianCalendar(year, month - 1, day);

        String dayString = "";
        String monthString = "";
        calendar.add(java.util.Calendar.YEAR, 1);
        day = calendar.get(java.util.Calendar.DAY_OF_MONTH);
        month = calendar.get(java.util.Calendar.MONTH) + 1;
        year = calendar.get(java.util.Calendar.YEAR);

        dayString = addZeroPrefix(day);
        monthString = addZeroPrefix(month);

        return year + "-" + monthString + "-" + dayString;
    }

    public static String getRawDateAndTime() {
        java.util.Date today;
        String dateOutFormatted;
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        today = new java.util.Date();
        dateOutFormatted = formatter.format(today);
        //  System.err.println("Setting message date as "+dateOutFormatted);
        return dateOutFormatted;
    }

    public static String getRawDateAndTimeForUpload() {
        java.util.Date today;
        String dateOutFormatted;
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        today = new java.util.Date();
        dateOutFormatted = formatter.format(today);
        //  System.err.println("Setting message date as "+dateOutFormatted);
        return dateOutFormatted;
    }

    public static String getRawTime() {
        java.util.Date today;
        String dateOutFormatted;
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat("HH:mm:ss");
        today = new java.util.Date();
        dateOutFormatted = formatter.format(today);
        //  System.err.println("Setting message date as "+dateOutFormatted);
        return dateOutFormatted;
    }

    public static String getWeekDay(String startDate) {
        StringTokenizer tok = new StringTokenizer(startDate, "-");
        int year = Integer.parseInt(tok.nextToken());
        int month = Integer.parseInt(tok.nextToken());
        int day = Integer.parseInt(tok.nextToken());

        GregorianCalendar calendar = new GregorianCalendar(year, month - 1, day);

        int thisDayOfWeek = calendar.get(java.util.Calendar.DAY_OF_WEEK);

        if (thisDayOfWeek == 2) {
            return "Monday";
        }
        if (thisDayOfWeek == 3) {
            return "Tuesday";
        }
        if (thisDayOfWeek == 4) {
            return "Wednesday";
        }
        if (thisDayOfWeek == 5) {
            return "Thursday";
        }
        if (thisDayOfWeek == 6) {
            return "Friday";
        }
        if (thisDayOfWeek == 7) {
            return "Saturday";
        }
        if (thisDayOfWeek == 1) {
            return "Sunday";
        }

        return "Error";

    }

}
       

