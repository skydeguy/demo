package com.rw.util;

import java.text.DateFormat;
import java.util.Calendar;

public class DateUtils {
	public static void main(String[] args) {
		DateFormat df = DateFormat.getDateTimeInstance();
		System.out.println(df.toString());
		System.out.println(df.format(Calendar.getInstance().getTime()));
	}
}
