package org.zsl.testfile;

import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class TestImageType {

    public static String bytesToHexString(byte[] src) {
        StringBuilder stringBuilder = new StringBuilder();
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            // byte转int
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }
    @Test
    public void test() throws IOException {
        String imagePath = "D:/kimage/l.jpg";
        File image = new File(imagePath);
        InputStream is = new FileInputStream(image);
        byte[] bt = new byte[2];
        is.read(bt);
        System.out.println(bytesToHexString(bt));
    }
}