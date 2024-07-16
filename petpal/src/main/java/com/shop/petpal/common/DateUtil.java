package com.shop.petpal.common;

import java.util.Calendar;

import org.springframework.stereotype.Service;

@Service
public class DateUtil {
	public boolean isValidDate(String date) {
		try {
			if (date.length() != 8 && date.length() != 10) {
				return false;
			}
			
			date = date.replaceAll("(\\-|\\.|\\/)", "");

			int y = Integer.parseInt(date.substring(0, 4));
			int m = Integer.parseInt(date.substring(4, 6));
			int d = Integer.parseInt(date.substring(6));

			Calendar cal = Calendar.getInstance();
			cal.set(y, m - 1, d);

			int y1 = cal.get(Calendar.YEAR);
			int m1 = cal.get(Calendar.MONTH) + 1;
			int d1 = cal.get(Calendar.DATE);

			if (y != y1 || m != m1 || d != d1) {
				return false;
			}

		} catch (Exception e) {
			// 예외가 발생한 경우 false를 반환
			return false;
		}

		return true;
	}
	
	public String toDaysLater(String date, int days) {
		String result = null;

		if (!isValidDate(date)) {
			throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + date);
		}

		date = date.replaceAll("(\\-|\\.|\\/)", "");

		int y = Integer.parseInt(date.substring(0, 4));
		int m = Integer.parseInt(date.substring(4, 6));
		int d = Integer.parseInt(date.substring(6));

		Calendar cal = Calendar.getInstance();
		// cal.set(y, m-1, d+days);

		cal.set(y, m - 1, d);
		cal.add(Calendar.DATE, days);

		result = String.format("%tF", cal);

		return result;
	}
	
	public String toDaysAgo(String date, int days) {
		return toDaysLater(date, -days);
	}
}
