package com.todaypopup.todaypopup.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.springframework.stereotype.Component;

@Component
public class CursorEncryptionUtil {

  private static final String ALGORITHM = "AES";
  private static final String KEY = "YourSecretKeyForEncryptionAndDecryption";


  private static SecretKeySpec getKey() throws Exception {
    MessageDigest sha = MessageDigest.getInstance("SHA-256");
    byte[] key = sha.digest(KEY.getBytes(StandardCharsets.UTF_8));
    key = Arrays.copyOf(key, 16); // Use only first 128 bits (16 bytes)
    return new SecretKeySpec(key, ALGORITHM);
  }

  public static String encrypt(String value) throws Exception {
    SecretKeySpec key = getKey();
    Cipher cipher = Cipher.getInstance(ALGORITHM);
    cipher.init(Cipher.ENCRYPT_MODE, key);

    byte[] encryptedByteValue = cipher.doFinal(value.getBytes(StandardCharsets.UTF_8));
    return Base64.getEncoder().encodeToString(encryptedByteValue);
  }

  public static String decrypt(String value) throws Exception {
    SecretKeySpec key = getKey();
    Cipher cipher = Cipher.getInstance(ALGORITHM);
    cipher.init(Cipher.DECRYPT_MODE, key);

    byte[] decryptedValue64 = Base64.getDecoder().decode(value);
    byte[] decryptedByteValue = cipher.doFinal(decryptedValue64);
    return new String(decryptedByteValue, StandardCharsets.UTF_8);
  }

}
