package util;

import java.util.List;

import calendar.CalendarDto;

public class UtilEx {
	
	//날짜 누르면 해당일 모든 일정 확인 callist.jsp 이동하는 함수
	public static String callist(int year, int month, int day) {
		String str = "";
		str += String.format("&nbsp;<a href='%s?year=%d&month=%d&day=%d'>",
				"callist.jsp",year,month,day);
		str += String.format("%2d", day);
		str += "</a>";
		return str;
	}
	
	//일정 추가 위해 pen이미지 클릭하면 calwrite.jsp로 이동하는 함수
	public static String showPen(int year, int month, int day) {
		String str = "";
		String img = "<img src='img/pen2.png' width='18px' height='18px' >";
		str = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>",
				"calwrite.jsp",year,month,day,img);
		return str;
	}
	
	//날짜를 두자리수로 변경     2021 3 9 2021 03 09 1-9 01-09
	public static String two(String msg) {
		return msg.trim().length()<2?"0"+msg.trim():msg.trim(); 
	}
	
	//달력 날짜 별 설정할 테이블 작성하는 함수
	public static boolean nvl(String msg) {
		return msg == null || msg.trim().equals("")?true:false;
	}
	
	//일정 제목 길 때  '...'처리 함수    영화관에서 데이트 약속 영화관에서... 
	public static String makeTable(int year, int month, int day, List<CalendarDto> list) {
		String str = "";
		String dates = (year+"") + two(month+"") + two(day+"");
		str += "<table style='margin:0;' border='1'>";
		str += "<col width='100'>";
		for (CalendarDto dto : list) {
			if (dto.getRdate().substring(0, 8).equals(dates)) {
				//str += "<tr style='margin:0;'>";
				//str += "<td style='line-height:10px; overflow:hidden; padding:0;'>";
				str += "<div align='center'>";
				str += "<ul><li>";
				str += "<a href='caldetail.jsp?seq="+dto.getSeq()+"'>";
				str += "<font style='font-size:8px; color:black'>";
				str += dot3(dto.getTitle());
				str += "</font>";
				str += "</a>";
				str += "</li></ul>";
				str += "</div>";
				//str += "</td>";
				//str += "</tr>";
			}
		}
		str += "</table>";
		return str;
	}

	//nvl 문자열이 비어있는지 확인 함수    null이나 빈문자는 true 
	public static String dot3(String msg) {
		String str = "";
		if(msg.length() >= 7) {
			str = msg.substring(0, 7);
			str += "...";
		}else {str = msg.trim();}
		return str;
	}
	
}
