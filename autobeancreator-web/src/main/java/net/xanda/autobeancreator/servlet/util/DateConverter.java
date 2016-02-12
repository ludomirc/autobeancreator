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
        if (month.equals("01")) {
            longMonth = "January";
        } else {
            if (month.equals("02")) {
                longMonth = "February";
            } else {
                if (month.equals("03")) {
                    longMonth = "March";
                } else {
                    if (month.equals("04")) {
                        longMonth = "April";
                    } else {
                        if (month.equals("05")) {
                            longMonth = "May";
                        } else {
                            if (month.equals("06")) {
                                longMonth = "June";
                            } else {
                                if (month.equals("07")) {
                                    longMonth = "July";
                                } else {
                                    if (month.equals("08")) {
                                        longMonth = "August";
                                    } else {
                                        if (month.equals("09")) {
                                            longMonth = "September";
                                        } else {
                                            if (month.equals("10")) {
                                                longMonth = "October";
                                            } else {
                                                if (month.equals("11")) {
                                                    longMonth = "November";
                                                } else {
                                                    if (month.equals("12")) {
                                                        longMonth = "December";
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if (day.equals("01")) {
            longDay = "1";
        } else {
            if (day.equals("02")) {
                longDay = "2";
            } else {
                if (day.equals("03")) {
                    longDay = "3";
                } else {
                    if (day.equals("04")) {
                        longDay = "4";
                    } else {
                        if (day.equals("05")) {
                            longDay = "5";
                        } else {
                            if (day.equals("06")) {
                                longDay = "6";
                            } else {
                                if (day.equals("07")) {
                                    longDay = "7";
                                } else {
                                    if (day.equals("08")) {
                                        longDay = "8";
                                    } else {
                                        if (day.equals("09")) {
                                            longDay = "9";
                                        } else {
                                            longDay = day;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        longDate = longDay + " " + longMonth + ", " + year;
        return longDate;
    }

    public static String convertRawDateMini(String rawDate) {

        String longDate = "";
        String longDay = "";
        String longMonth = "";
        StringTokenizer tok = new StringTokenizer(rawDate, "-");
        String year = tok.nextToken();
        String month = tok.nextToken();
        String day = tok.nextToken();
        if (month.equals("01")) {
            longMonth = "Jan";
        } else {
            if (month.equals("02")) {
                longMonth = "Feb";
            } else {
                if (month.equals("03")) {
                    longMonth = "Mar";
                } else {
                    if (month.equals("04")) {
                        longMonth = "Apr";
                    } else {
                        if (month.equals("05")) {
                            longMonth = "May";
                        } else {
                            if (month.equals("06")) {
                                longMonth = "Jun";
                            } else {
                                if (month.equals("07")) {
                                    longMonth = "Jul";
                                } else {
                                    if (month.equals("08")) {
                                        longMonth = "Aug";
                                    } else {
                                        if (month.equals("09")) {
                                            longMonth = "Sep";
                                        } else {
                                            if (month.equals("10")) {
                                                longMonth = "Oct";
                                            } else {
                                                if (month.equals("11")) {
                                                    longMonth = "Nov";
                                                } else {
                                                    if (month.equals("12")) {
                                                        longMonth = "Dec";
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if (day.equals("01")) {
            longDay = "1";
        } else {
            if (day.equals("02")) {
                longDay = "2";
            } else {
                if (day.equals("03")) {
                    longDay = "3";
                } else {
                    if (day.equals("04")) {
                        longDay = "4";
                    } else {
                        if (day.equals("05")) {
                            longDay = "5";
                        } else {
                            if (day.equals("06")) {
                                longDay = "6";
                            } else {
                                if (day.equals("07")) {
                                    longDay = "7";
                                } else {
                                    if (day.equals("08")) {
                                        longDay = "8";
                                    } else {
                                        if (day.equals("09")) {
                                            longDay = "9";
                                        } else {
                                            longDay = day;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
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
        if (month.equals("01")) {
            longMonth = "January";
        } else {
            if (month.equals("02")) {
                longMonth = "February";
            } else {
                if (month.equals("03")) {
                    longMonth = "March";
                } else {
                    if (month.equals("04")) {
                        longMonth = "April";
                    } else {
                        if (month.equals("05")) {
                            longMonth = "May";
                        } else {
                            if (month.equals("06")) {
                                longMonth = "June";
                            } else {
                                if (month.equals("07")) {
                                    longMonth = "July";
                                } else {
                                    if (month.equals("08")) {
                                        longMonth = "August";
                                    } else {
                                        if (month.equals("09")) {
                                            longMonth = "September";
                                        } else {
                                            if (month.equals("10")) {
                                                longMonth = "October";
                                            } else {
                                                if (month.equals("11")) {
                                                    longMonth = "November";
                                                } else {
                                                    if (month.equals("12")) {
                                                        longMonth = "December";
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if (day.equals("01")) {
            longDay = "1";
        } else {
            if (day.equals("02")) {
                longDay = "2";
            } else {
                if (day.equals("03")) {
                    longDay = "3";
                } else {
                    if (day.equals("04")) {
                        longDay = "4";
                    } else {
                        if (day.equals("05")) {
                            longDay = "5";
                        } else {
                            if (day.equals("06")) {
                                longDay = "6";
                            } else {
                                if (day.equals("07")) {
                                    longDay = "7";
                                } else {
                                    if (day.equals("08")) {
                                        longDay = "8";
                                    } else {
                                        if (day.equals("09")) {
                                            longDay = "9";
                                        } else {
                                            longDay = day;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        longDate = longMonth + ", " + year;
        return longDate;
    }

    public static String convertRawDateMiniMonthYearOnly(String rawDate) {

        String longDate = "";
        String longDay = "";
        String longMonth = "";
        StringTokenizer tok = new StringTokenizer(rawDate, "-");
        String year = tok.nextToken();
        String month = tok.nextToken();
        String day = tok.nextToken();
        if (month.equals("01")) {
            longMonth = "Jan";
        } else {
            if (month.equals("02")) {
                longMonth = "Feb";
            } else {
                if (month.equals("03")) {
                    longMonth = "Mar";
                } else {
                    if (month.equals("04")) {
                        longMonth = "Apr";
                    } else {
                        if (month.equals("05")) {
                            longMonth = "May";
                        } else {
                            if (month.equals("06")) {
                                longMonth = "Jun";
                            } else {
                                if (month.equals("07")) {
                                    longMonth = "Jul";
                                } else {
                                    if (month.equals("08")) {
                                        longMonth = "Aug";
                                    } else {
                                        if (month.equals("09")) {
                                            longMonth = "Sep";
                                        } else {
                                            if (month.equals("10")) {
                                                longMonth = "Oct";
                                            } else {
                                                if (month.equals("11")) {
                                                    longMonth = "Nov";
                                                } else {
                                                    if (month.equals("12")) {
                                                        longMonth = "Dec";
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if (day.equals("01")) {
            longDay = "1";
        } else {
            if (day.equals("02")) {
                longDay = "2";
            } else {
                if (day.equals("03")) {
                    longDay = "3";
                } else {
                    if (day.equals("04")) {
                        longDay = "4";
                    } else {
                        if (day.equals("05")) {
                            longDay = "5";
                        } else {
                            if (day.equals("06")) {
                                longDay = "6";
                            } else {
                                if (day.equals("07")) {
                                    longDay = "7";
                                } else {
                                    if (day.equals("08")) {
                                        longDay = "8";
                                    } else {
                                        if (day.equals("09")) {
                                            longDay = "9";
                                        } else {
                                            longDay = day;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        longDate = longMonth + " " + year.substring(2);
        return longDate;
    }


    public static String getYear() {
        java.util.Date today;
        String dateOutFormatted;
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

        String[] months = {"01", "02", "03", "04", "05", "06", "07", "08", "09"};
        String[] days = {"01", "02", "03", "04", "05", "06", "07", "08", "09"};

        if (day < 10) {
            dayString = days[day - 1];
        } else {
            dayString = day + "";
        }

        if (month < 10) {
            monthString = months[month - 1];
        } else {
            monthString = month + "";
        }

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

        String[] months = {"01", "02", "03", "04", "05", "06", "07", "08", "09"};
        String[] days = {"01", "02", "03", "04", "05", "06", "07", "08", "09"};

        if (day < 10) {
            dayString = days[day - 1];
        } else {
            dayString = day + "";
        }

        if (month < 10) {
            monthString = months[month - 1];
        } else {
            monthString = month + "";
        }

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

        String[] months = {"01", "02", "03", "04", "05", "06", "07", "08", "09"};
        String[] days = {"01", "02", "03", "04", "05", "06", "07", "08", "09"};

        if (day < 10) {
            dayString = days[day - 1];
        } else {
            dayString = day + "";
        }

        if (month < 10) {
            monthString = months[month - 1];
        } else {
            monthString = month + "";
        }

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

        String[] months = {"01", "02", "03", "04", "05", "06", "07", "08", "09"};
        String[] days = {"01", "02", "03", "04", "05", "06", "07", "08", "09"};

        if (day < 10) {
            dayString = days[day - 1];
        } else {
            dayString = day + "";
        }

        if (month < 10) {
            monthString = months[month - 1];
        } else {
            monthString = month + "";
        }

        return year + "-" + monthString + "-" + dayString;
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

        String[] months = {"01", "02", "03", "04", "05", "06", "07", "08", "09"};
        String[] days = {"01", "02", "03", "04", "05", "06", "07", "08", "09"};

        if (day < 10) {
            dayString = days[day - 1];
        } else {
            dayString = day + "";
        }

        if (month < 10) {
            monthString = months[month - 1];
        } else {
            monthString = month + "";
        }

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
       

