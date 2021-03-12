import java.util.Scanner;

public class work2 {

	public static void main(String[] args) {
		work2 ts = new work2();
		ts.decimalCheck();
	}
	
	public void decimalCheck() {
		Scanner sc = new Scanner(System.in);

		//입력받기
		System.out.println("숫자를 입력해주세요");
		System.out.print("입력>>");
		String str = sc.next();
		
		boolean b = true;
		for (int i = 0; i < str.length(); i++) {
			int asc = (int)str.charAt(i);
			if (asc < 46 || asc > 57 || asc == 48) { //0 48  9 57
				b = false;
				break;
			}
		}
		if (b == false) {
			System.out.println("math error");
			return;
		}
		
		
		if (str.contains(".")) {
			System.out.println(str + "는(은) 소수입니다.");
		}else {
			System.out.println(str + "는(은) 소수가 아닙니다.");
		}
	}
}
