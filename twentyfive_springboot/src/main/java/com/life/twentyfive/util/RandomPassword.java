package com.life.twentyfive.util;

import java.util.Random;

public class RandomPassword {
    public static void main(String[] args) {
        String password [] = {"zjx", "cg", ".", "..", "...", "2001", "0505", "0515", "0629"};
        Random random = new Random();
        int a = random.nextInt(password.length);
        int b = random.nextInt(password.length);
        int c = random.nextInt(password.length);
        int d = random.nextInt(password.length);
        int e = random.nextInt(password.length);
        System.out.println(password[a] + password[b] + password[c]+ password[d] + password[e]);
    }
}