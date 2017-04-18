package org.agent.common;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeFormat {

	// 时间比较
	public static boolean comperTime(Date time) {
		boolean flag = false;
		if (time.getTime() < new Date().getTime()) {
			flag = true;
		}
		return flag;
	}

//	public static String showTime(Timestamp ts) {
//		Date now = new Date();
//		SimpleDateFormat sfc = new SimpleDateFormat("MM-dd");
//		Calendar cal = Calendar.getInstance();
//		cal.set(Calendar.HOUR_OF_DAY, 0);
//		cal.set(Calendar.MINUTE, 0);
//		cal.set(Calendar.SECOND, 0);
//		long jintian = cal.getTime().getTime();
//		cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH) - 1);
//		long zuotian = cal.getTime().getTime();
//		cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH) - 1);
//		long qiantian = cal.getTime().getTime();
//		if ((now.getTime() - ts.getTime()) < 1000 * 60)
//			return (now.getTime() - ts.getTime()) / 1000 + "��ǰ";
//		else if ((now.getTime() - ts.getTime()) < 1000 * 60 * 60)
//			return (now.getTime() - ts.getTime()) / 1000 / 60 + "����ǰ";
//		else if ((now.getTime() - ts.getTime()) < 1000 * 60 * 60 * 24)
//			return (now.getTime() - ts.getTime()) / 1000 / 60 / 60 + "Сʱǰ";
//		else if (zuotian <= ts.getTime() && ts.getTime() < jintian)
//			return "���� ";
//		else if (qiantian <= ts.getTime() && ts.getTime() < zuotian)
//			return "ǰ�� ";
//		else
//			return sfc.format(ts);
//
//	}

	public static Timestamp strToHoursDate(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ParsePosition pos = new ParsePosition(0);
		Timestamp strtodate = new Timestamp(formatter.parse(strDate, pos).getTime());
		return strtodate;
	}

	public static Timestamp strToHoursmmDate(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		ParsePosition pos = new ParsePosition(0);
		Timestamp strtodate = new Timestamp(formatter.parse(strDate, pos).getTime());
		return strtodate;
	}

	public static Timestamp strToDate(String strDate) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		ParsePosition pos = new ParsePosition(0);
		Timestamp strtodate = new Timestamp(formatter.parse(strDate, pos).getTime());
		return strtodate;
	}

	public static Timestamp getTimestampByString(String datestring) {
		try {
			java.util.Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datestring);
			return new Timestamp(date.getTime());
		} catch (Exception ex) {
			return null;
		}

	}

	public static String getCurrentTimeString(){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		return formatter.format(date);
	}
	
	public static String getyyyyMMddHHmmssTimeString(Timestamp t){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return formatter.format(t);
	}
	
	public static void main(String args[]) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String dateString = formatter.format(date);

		//Timestamp time = Timestamp.valueOf(dateString);
		System.out.println(dateString);
		System.out.println(TimeFormat.getyyyyMMddHHmmssTimeString(new Timestamp(System.currentTimeMillis())));

	}

	public static Timestamp dateToStr() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String dateString = formatter.format(date);

		Timestamp time = Timestamp.valueOf(dateString);
		return time;
	}
	
	public static Date parseStringToDate(String dateStr){
		Date date = null;
		//2012-03-22
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = simpleDateFormat.parse(dateStr);
		} catch (ParseException e) {			
			e.printStackTrace();
		}
		return date;
	}

}
