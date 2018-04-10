package com.leebokeum.common;

import org.springframework.data.domain.Page;
import lombok.Data;

@Data
public class PageBlock {
	private int blockSize = 5;
	private int totalBlock;
	private int currentBlock;
	private int firstPage;
	private int lastPage;
	
	public PageBlock(Page<?> page){
		/*전체 블락 수 구하기 (blockSize는 한 블락당 표시될 갯수)*/
		this.totalBlock = page.getTotalPages() / blockSize;
		if(page.getTotalPages() % blockSize != 0) totalBlock++;
		if(totalBlock == 0 ) totalBlock++;
		
		/*현재 블락 번호 구하기*/
		this.currentBlock = (int) Math.ceil(((double)(page.getNumber()+1) / blockSize));

		/*현재 블락의 첫번째 페이지 번호와 마지막 페이지 번호*/
		this.firstPage = (currentBlock-1)*blockSize+1;
		this.lastPage = currentBlock *blockSize;
		if(currentBlock >= totalBlock) lastPage= page.getTotalPages();
	}
}
