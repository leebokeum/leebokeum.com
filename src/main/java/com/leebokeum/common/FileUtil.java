package com.leebokeum.common;

import java.io.File;
import java.util.ArrayList;
import java.util.Date; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.leebokeum.dao.vo.Content;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	//private final String filePath = "C:\\dev\\file\\";
	private final String filePath = "/home/ec2-user/upload/";
	
	public void parseInsertFileHeader(Board content, MultipartFile multipartFile) throws Exception{
		String originalFileName = null;
		String originalFileExtension = null; 
		String storedFileName = null; 

		File file = new File(filePath);
		if(file.exists() == false){
			file.mkdirs();
		}

		originalFileName = multipartFile.getOriginalFilename();
		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		storedFileName = CommonUtil.getRandomString() + "." + originalFileExtension;
		file = new File(filePath + storedFileName);
		multipartFile.transferTo(file);

		//ImgResize imgResize = new ImgResize();
		//imgResize.imgResize(filePath + storedFileName, targetFilePath + storedFileName, originalFileExtension , 300, 300);

		content.setOriginImg1(originalFileName);
		content.setImg1(storedFileName);
		content.setFileSizeImg1(multipartFile.getSize());
	}
	/*
	public List<IldongInfoDetail> parseInsertFileDetail(IldongInfoBoard board, MultipartFile[] multipartFiles, HttpServletRequest request) throws Exception{
		
		*//* String defaultFilePath = request.getSession().getServletContext().getRealPath("/");
		filePath = defaultFilePath + "upload/original/";
		targetFilePath = defaultFilePath + "upload/target/"; *//*
		
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<IldongInfoDetail> list = new ArrayList<IldongInfoDetail>();
		IldongInfoDetail ildongInfoDetail = null; 

		File file = new File(filePath);
		if(file.exists() == false){
			file.mkdirs();
		}
		
		File targetFile = new File(targetFilePath);
		if(targetFile.exists() == false){
			targetFile.mkdirs();
		}
 
		for(MultipartFile uploadedFile : multipartFiles) {  
				originalFileName = uploadedFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				storedFileName = CommonUtil.getRandomString() + "." + originalFileExtension; 
				file = new File(filePath + storedFileName);
				uploadedFile.transferTo(file); 
				
				ImgResize imgResize = new ImgResize();
				imgResize.imgResize(filePath + storedFileName, targetFilePath + storedFileName, originalFileExtension , 580, 580); 
				
				ildongInfoDetail = new IldongInfoDetail();
				ildongInfoDetail.setParentId(board.getId()); 
				ildongInfoDetail.setCreateDate(new Date());
				ildongInfoDetail.setLastUpdateDate(new Date());
				ildongInfoDetail.setOriginImg1(originalFileName);
				ildongInfoDetail.setImg1(storedFileName);
				ildongInfoDetail.setFileSizeImg1(uploadedFile.getSize()); 
				ildongInfoDetail.setCardNewsYn("Y");
				ildongInfoDetail.setDeleteFlag("N"); 
				list.add(ildongInfoDetail);
		} 
		return list;
	}*/
}
