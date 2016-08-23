package member.service;

public class ariaEx01 {
	public static void main(String[] args) {
		String key = "qwerty~!@#$%";
		Aria aria = new Aria(key);
		String password="qwerty";
		// 암호화
		String encrypt = aria.Encrypt(password);
		// 복호화
		String decrypt = aria.Decrypt(encrypt);
		
		System.out.println(password);
		System.out.println(encrypt);
		System.out.println(decrypt);
		
	}
}
