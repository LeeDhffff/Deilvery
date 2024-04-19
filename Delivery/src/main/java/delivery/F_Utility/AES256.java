package delivery.F_Utility;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

import delivery.Main.WebC;

/**
 * @Class Name : LoginController.java
 * @Description : Login Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.03.25  이동헌           최초생성
 *
 * @author 이동헌
 * @since 2024. 03.01
 * @version 1.0
 * @see
 *
 *  Copyright (C) by LLJ All right reserved.
 */
public class AES256 {
//	 private static String privateKey_256 = WebC.PRIVATE_KEY;
	 

	    private static volatile AES256 INSTANCE;

	    final static String secretKey = WebC.PRIVATE_KEY;//"dhtkdwnsdi199503291045dhtkdwns12"; //32bit
	    static String IV = "DH_JW_YW_2022_HN"; //16bit

	    public static AES256 getInstance() {
	        if (INSTANCE == null) {
	            synchronized (AES256.class) {
	                if (INSTANCE == null)
	                    INSTANCE = new AES256();
	            }
	        }
	        return INSTANCE;
	    }

	    private AES256() {
	        IV = secretKey.substring(0, 16);
	    }

	    //암호화
	    public static String AES_Encode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
	        byte[] keyData = secretKey.getBytes();

	        SecretKey secureKey = new SecretKeySpec(keyData, "AES");

	        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
	        c.init(Cipher.ENCRYPT_MODE, secureKey, new IvParameterSpec(IV.getBytes()));

	        byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
	        String enStr = new String(Base64.encodeBase64(encrypted));

	        return enStr;
	    }

	    //복호화
	    public static String AES_Decode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
	        byte[] keyData = secretKey.getBytes();
	        SecretKey secureKey = new SecretKeySpec(keyData, "AES");
	        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
	        c.init(Cipher.DECRYPT_MODE, secureKey, new IvParameterSpec(IV.getBytes("UTF-8")));

	        byte[] byteStr = Base64.decodeBase64(str.getBytes());

	        return new String(c.doFinal(byteStr), "UTF-8");
	    }
//	 public static String aesCBCEncode(String plainText) throws Exception {
//			System.out.println(privateKey_256);
//		    SecretKeySpec secretKey = new SecretKeySpec(privateKey_256.getBytes("UTF-8"), "AES");
//		    IvParameterSpec IV = new IvParameterSpec(privateKey_256.getBytes());
//
//		    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
//			System.out.println(privateKey_256 + "_F"  + c);
//
//		    c.init(Cipher.ENCRYPT_MODE, secretKey);
//
//		    byte[] encrpytionByte = c.doFinal(plainText.getBytes("UTF-8"));
//				
//		    return Hex.encodeHexString(encrpytionByte);
//		  }
//
//			
//		  public static String aesCBCDecode(String encodeText) throws Exception {
//
//			System.out.println(encodeText + privateKey_256 + "1");
//		    SecretKeySpec secretKey = new SecretKeySpec(privateKey_256.getBytes("UTF-8"), "AES");
//		    IvParameterSpec IV = new IvParameterSpec(privateKey_256.getBytes());
//		    
//		    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
//			System.out.println(privateKey_256 + "2" + c);
//
//		    c.init(Cipher.DECRYPT_MODE, secretKey);
//			System.out.println(privateKey_256 + "3");
//				
//		    byte[] decodeByte = Hex.decodeHex(encodeText.toCharArray());
//				
//		    return new String(c.doFinal(decodeByte), "UTF-8");
//		  }
}