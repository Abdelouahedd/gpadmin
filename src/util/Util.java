package util;


import metier.beans.Etape;

import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;

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

    public static Set<String> filterCatNames (List<Etape> etapes) {
        return etapes.stream()
                .map(Etape::getLibelle)
                .collect(Collectors.toSet());
    }

    public static List<Etape> filterByLibelle (List<Etape> list, String name) {
        return list.stream()
                .filter(item -> item.getLibelle().equals(name))
                .collect(Collectors.toList());
    }

}