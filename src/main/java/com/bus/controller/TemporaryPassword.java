package com.bus.controller;

import java.security.SecureRandom;

public class TemporaryPassword {
	
	private static final String UPPERCASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String LOWERCASE = "abcdefghijklmnopqrstuvwxyz";
    private static final String DIGITS = "0123456789";
    private static final String SPECIAL_CHARACTERS = "!@#$%^&*()-_=+";
    private static final String ALL_CHARACTERS = UPPERCASE + LOWERCASE + DIGITS + SPECIAL_CHARACTERS;
    
    public static String TemporaryPassword(int length) {
        if (length < 8) {
            throw new IllegalArgumentException("비밀번호 길이는 최소 8자 이상이어야 합니다.");
        }

        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder();

        // 각 유형의 문자 중 하나씩 포함
        password.append(UPPERCASE.charAt(random.nextInt(UPPERCASE.length())));
        password.append(LOWERCASE.charAt(random.nextInt(LOWERCASE.length())));
        password.append(DIGITS.charAt(random.nextInt(DIGITS.length())));
        password.append(SPECIAL_CHARACTERS.charAt(random.nextInt(SPECIAL_CHARACTERS.length())));

        // 나머지 비밀번호는 모든 문자에서 랜덤으로 채움
        for (int i = 4; i < length; i++) {
            password.append(ALL_CHARACTERS.charAt(random.nextInt(ALL_CHARACTERS.length())));
        }

        // 비밀번호를 랜덤하게 섞음
        return shuffleString(password.toString());
    }

    // 문자열을 랜덤하게 섞는 메서드
    private static String shuffleString(String input) {
        SecureRandom random = new SecureRandom();
        char[] characters = input.toCharArray();
        for (int i = characters.length - 1; i > 0; i--) {
            int j = random.nextInt(i + 1);
            char temp = characters[i];
            characters[i] = characters[j];
            characters[j] = temp;
        }
        return new String(characters);
    }
}