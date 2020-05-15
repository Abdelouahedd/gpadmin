package util;


import java.util.Random;

public class Util {

    public static String generateJeton() {
        StringBuilder jeton = new StringBuilder(20);
        int minAscii = 97;
        int maxAscii = 122;
        Random rand = new Random();

        for (int i = 0; i < 10; i++) {
            jeton.append((char) (rand.nextInt((maxAscii - minAscii) + 1) + minAscii));
            jeton.append(rand.nextInt(10));
        }
        return jeton.toString();
    }

}