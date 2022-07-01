package com.matrix.cola.service.basics;

import cn.hutool.core.date.DateUtil;

import java.util.Date;

/**
 * @Author : cui_feng
 * @Date: 2022-04-07 17:16
 */
public class JunitTest {


    public static void main(String[] args) {
        System.out.println(fillZero("123456789",6));
        System.out.println(DateUtil.format(new Date(),"YYYYMMdd"));
    }

    private static String fillZero(String num,int length) {
        if (length<4) length = 4;
        if (num.length()==length) return num;
        if (num.length()>length) return num.substring(num.length()-length);
        int count = length - num.length();
        for(int i=0; i<count; i++) {
            num = "0"+ num;
        }
        return num;
    }
}
