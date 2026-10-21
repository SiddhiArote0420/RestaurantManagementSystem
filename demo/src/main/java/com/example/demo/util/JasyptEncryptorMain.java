package com.example.demo.util;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class JasyptEncryptorMain {
    public static void main(String[] args) {
        StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
        encryptor.setPassword("mySecretKey"); // We will set this in application.yml
        String encryptedPassword = encryptor.encrypt("MySql_Sid@20");
        System.out.println("ENC(" + encryptedPassword + ")");
    }
}
