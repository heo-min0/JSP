import java.util.Scanner;

public class work01 {

	public static void main(String[] args) {
		work01 ts = new work01();
		ts.decimalCheck();
	}
	
	public void decimalCheck() {
		Scanner sc = new Scanner(System.in);

		//입력받기
		System.out.println("숫자를 입력해주세요");
		System.out.print("입력>>");
		String str = sc.next();
		
		//문자확인
		boolean b = numChk(str);
		if(b == false) {
			System.out.println("math error");
			return;
		}
		
		//소수확인
		int num = Integer.parseInt(str);
		if (num < 2) {
			System.out.println(num + "는(은) 소수가 아닙니다.");
			return;
		}
		else if (num == 2) {
			System.out.println(num + "는(은) 소수입니다.");
			return;
		}
		
		boolean chk = true;
		for (int i = 2; i < num; i++) {
			if(num%i == 0) {
				chk = false;
				break;
			}
		}
		if (chk == false) {	System.out.println(num + "는(은) 소수가 아닙니다.");	}
		else { 	System.out.println(num + "는(은) 소수입니다."); 	}
	}
	
	public boolean numChk(String str) {
		boolean b = true;
		for (int i = 0; i < str.length(); i++) {
			int asc = (int)str.charAt(i);
			if (asc < 48 || asc > 57) { //0 48  9 57
				b = false;
				break;
			}
		}
		return b;
	}
}
