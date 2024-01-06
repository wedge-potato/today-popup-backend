package com.todaypopup.todaypopup.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class DateUtil {

  public static String parseDateToISO8601AndFormatToKST(Date date) {
    if (date == null) {
      return null;
    }

    SimpleDateFormat kstFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXXX");
    kstFormat.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));

    return kstFormat.format(date);
  }

  public static String parseDateToDateOnly(Date date) {
    if (date == null) {
      return null;
    }

    SimpleDateFormat kstFormat = new SimpleDateFormat("yyyy-MM-dd");
    kstFormat.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));

    return kstFormat.format(date);
  }
}
