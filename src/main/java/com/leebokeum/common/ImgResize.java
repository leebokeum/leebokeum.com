package com.leebokeum.common;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

 
public class ImgResize {
 
	/**
	 * Image Resize
	 */
	public void imgResize(String imgSourcePath, String imgTargetPath, String imgFormat, int newWidth, int newHeight)
	{
		try
		{
			// 원본 이미지 가져오기
			Image imgSrc = ImageIO.read(new File(imgSourcePath));

			// 이미지 리사이즈
			// Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
			// Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
			// Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
			// Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
			Image resizeImage = imgSrc.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH);

			// 새 이미지  저장하기
			BufferedImage newImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
			Graphics g = newImage.getGraphics();
			g.drawImage(resizeImage, 0, 0, null);
			g.dispose();
			ImageIO.write(newImage, imgFormat , new File(imgTargetPath));
		}
		catch (Exception e)
		{
		}
	}
}
