package com.matrix.cola.service.basics;

/**
 * @author : cui_feng
 * @since : 2022-05-14 00:21
 */
public class TestXunhuan {
    public static void main(String[] args) {
        a();
    }

    public static void a (){
        System.out.println("aaa");
        b();
    }

    public static void b (){
        System.out.println("bbb");
        c();
    }

    public static void c (){
        System.out.println("ccc");
        b();
    }

}
