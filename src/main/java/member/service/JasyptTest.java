package member.service;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class JasyptTest {
	public static void main(String[] args) {
		StandardPBEStringEncryptor standardPBEStringEncryptor = new StandardPBEStringEncryptor();  
		standardPBEStringEncryptor.setAlgorithm("PBEWithMD5AndDES");  
		standardPBEStringEncryptor.setPassword("1234");
		String i = standardPBEStringEncryptor.decrypt("607CC408D5A821C9B1BAEF2FAD9852DE");
		String encodedPass = standardPBEStringEncryptor.encrypt("1234");  
		System.out.println("Encrypted Password for admin is : "+encodedPass);
		System.out.println(i);
	}
}
