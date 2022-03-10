package com.woori.myhome.common;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	 
	static String filePath= CommonConst.FilePath;
	
	
	public static String getFilePath() {
		return filePath;
	}

	public static void setFilePath(String filePath) {
		FileUploadUtil.filePath = filePath;
	}


	public static void upload(String contextPath, List<MultipartFile> fileList,
			List<String> fileNameList)
	{
	
		String filePath = contextPath + CommonConst.FilePath;
		System.out.println("현재경로 : " + filePath);
		//java.io.File
		File file = new File(filePath);
		if( !file.exists())
		{

			file.mkdir();
		}
		
		//System.out.println("filesize : " + fileList.size());
		
		if( fileList!=null && fileList.size()>0)
		{
			 for(MultipartFile multipartFile : fileList)
			 {		
				 if( multipartFile.getOriginalFilename().length()==0)//파일이 없다  
					   break;
				
				 
				 String orifilename = multipartFile.getOriginalFilename(); //업로드된 파일명을 가져온다 
				 
				 //파일명이 중복되는걸 방지하기위해서 , 1. 날짜시간분초 +랜덤값 해서 파일명을 만든다
				 //                             2. a(1).jpg, a(2).jpg ........
				 //파일명과 확장자를 분리해야 한다 
				 
				 int pos = orifilename.lastIndexOf(".");       //맨뒤쪽의 . 위치를 파악한다. 
				 String ext = orifilename.substring(pos+1);    //확장자
				 String oriFile = orifilename.substring(0, pos); //파일명만 
							 
				 String filename = multipartFile.getOriginalFilename(); //새로만들 파일명 
				
				 File newFile = new File(filePath+"/" +filename); //원래 파일명 
				 int i=1;
				 while(newFile.exists())  //이미존재하면   a(1).jpg, a(2).jpg
				 {
					
					 filename = oriFile + "("+i+")." + ext;  //새로운 파일명을 만들어서 
					 i++;
					 newFile = new File(filePath+"/" +filename);
					 
				 }
				 
				 System.out.println("filename : " + filename);
				 fileNameList.add(filename); //확정된 파일명을 리스트에 저장해서 보낸다. 디비에 저장해야 되서  
				
				 //확정된 파일명으로 임시저장소에서 업로드 저장소로 옮긴다. 
				 String newFileName   = filePath + "/" + filename;
				 try
				 {
					 System.out.println(newFileName);
					 multipartFile.transferTo( new File(newFileName));
					 
				 }
				 catch(Exception e)
				 { 
					 e.printStackTrace();
				 } 
			 }
		}
		
		
	}
}
