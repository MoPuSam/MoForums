package com.cn.hnust.util;


public class Crypt {

	public static String encrype(String pwd) {

		System.out.println("原码：" + pwd);

		StringBuffer sb = new StringBuffer();

		char[] ch_pwd = pwd.toCharArray();

		for (int i = 0; i < ch_pwd.length; i++) {

			int j = (int) ((int) ch_pwd[i] + ch_pwd.length - (int) Math
					.round(i * 1.1));

			if (32 <= j && j <= 57) {
				j = j + 33;
				sb.append((char) j);
				sb.append((char) 66);
			} else if (58 <= j && j <= 64) {
				j = j + 49;
				sb.append((char) j);
				sb.append((char) 98);
			} else if (91 <= j && j <= 95) {
				j = j + 17;
				sb.append((char) j);
				sb.append((char) 102);
			} else if (123 <= j && j <= 126) {
				j = j - 4;
				sb.append((char) j);
				sb.append((char) 120);
			} else {
				sb.append((char) j);
				sb.append((char) j);
			}

		}

		System.out.println("加密后：" + sb.toString());
		return sb.toString();
	}

	public static String unencrype(String pwd) {

		StringBuffer sb = new StringBuffer();

		char[] ch_pwd = pwd.toCharArray();

		for (int i = 0; i < ch_pwd.length; i++) {

			// int asc=(int)
			// ((int)ch_pwd[i]-ch_pwd.length+(int)Math.round(i*1.1));
			int s = (int) ch_pwd[i];
			int k = (int) Math.round((i / 2) * 1.1);
			int q = (int) ch_pwd[++i];
			int j = s - pwd.length() / 2 + k;

			if (s == q) {

			} else if (q == 66) {
				j = j - 66 / 2;
			} else if (q == 98) {
				j = j - 49;
			} else if (q == 102) {
				j = j - 17;
			} else if (q == 120) {
				j = j + 4;
			}
			sb.append((char)j);
//			System.out.println("ԭascii��" + (int) ch_pwd[i] + "***"
//					+ " ���ܺ�ascii:" + asc);

		}

		System.out.println("解密后：" + sb.toString());
		return sb.toString();
	}
}
