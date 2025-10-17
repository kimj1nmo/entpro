package kr.or.ddit.test;

public class MerongVO {

	/**
	 * 테스트 해보세요
	 * @param args
	 */
	
	public static void main(String[] args) {
		String nameA = "육수민";
		String nameB = "육수민";
		String nameC = new String("육수민");
		String nameD = new String("육수민");
		
		System.out.println(nameA == nameB);
		System.out.println(nameA == nameC);
		System.out.println(nameC == nameD);
		System.out.println(nameC.equals(nameD));
	}
}
