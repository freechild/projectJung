package member.service;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class JasyptTest {
	public static void main(String[] args) {
		StandardPBEStringEncryptor standardPBEStringEncryptor = new StandardPBEStringEncryptor();  
		standardPBEStringEncryptor.setAlgorithm("PBEWithMD5AndDES");  
		standardPBEStringEncryptor.setPassword("1234");  
		String encodedPass = standardPBEStringEncryptor.encrypt("1234");  
		System.out.println("Encrypted Password for admin is : "+encodedPass); 
	}
}
