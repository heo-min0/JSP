<%@page import="dto.PdsDto"%>
<%@page import="dao.PdsDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
//upload 함수
public String processUploadFile(FileItem fileItem, String dir, String filename)throws IOException{
	String orifilename = fileItem.getName(); //경로  + 파일명
	long sizeInBytes = fileItem.getSize();
	if(sizeInBytes > 0){ // 파일 정상일때
		int idx = orifilename.lastIndexOf("\\");
		if(idx == -1){idx = orifilename.lastIndexOf("/");}
		orifilename = orifilename.substring(idx+1);
		
		int i = orifilename.lastIndexOf(".");
		String exeten = orifilename.substring(i);
		
		File uploadFile = new File(dir, filename+exeten);
		try{
			fileItem.write(uploadFile); //실제 업로드 부분
		}catch(Exception e){e.printStackTrace();};
	}
	return orifilename; // DB에 저장하기 위한 리턴
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
//tomcat 배포  -  server
String fupload = application.getRealPath("/upload");

//지정 폴더 - client
/* String fupload = "d:\  \ tmp"; */
System.out.println("업로드폴더:"+fupload);

String yourTempDir = fupload;
int yourMaxRequestSize = 100*1024*1024; // 1 Mbyte
int yourMaxMemorySize = 100*1024; // 1 Kbyte

//form filed의 데이터를 저장할 변수
String id = "", title = "", content = "";

//file명 저장
String orifilename = "";
String filename = request.getParameter("filename");

//데이터가 multipart/form-data형식으로 전송되었는지 확인
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if(isMultipart == true){
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(yourMaxMemorySize);
	factory.setRepository(new File(yourTempDir));
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(yourMaxRequestSize);
	List<FileItem> items = upload.parseRequest(request);
	Iterator<FileItem> it = items.iterator();
	
	while(it.hasNext()){
		FileItem item = it.next();
		if(item.isFormField()){ //id, title, content
			if(item.getFieldName().equals("id")){
				id = item.getString("utf-8");
			}else if(item.getFieldName().equals("title")){
				title = item.getString("utf-8");
			}else if(item.getFieldName().equals("content")){
				content = item.getString("utf-8");
			}
		}else{ //file
			if(item.getFieldName().equals("fileload")){
				orifilename = processUploadFile(item, fupload, filename);
			}
		}
	}
}
//DB저장
PdsDao dao = PdsDao.getInstance();
boolean is = dao.writePds(new PdsDto(id,title,content,filename,orifilename));
if(is){%>
	<script type="text/javascript">
	alert("파일업로드 성공")
	location.href = "pdslist.jsp"
	</script>
<%}else{%>
	<script type="text/javascript">
	alert("파일업로드 실패")
	location.href = "pdswrite.jsp"
	</script>
<%}%>



</body>
</html>





