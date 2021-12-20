package com.ott.Util;

public class Paging {
	private int nowPage, 
				rowTotal,//�� �Խù� ��
				blockList, // �� �������� ǥ���� �Խù� ��
				blockPage, // �� ���� ǥ���� ������ ��
				totalPage, //��ü ��������
				startPage, // ���������� ��
				endPage, // ������ ������ ��
				begin, // �� �������� ���� ���ڵ��� ��
				end; // �� �������� ������ ���ڵ��� ��
	
	private boolean isPrePage; // ���� ��� ���� ����(true�϶� ������� Ȱ��ȭ)
	private boolean isNextPage; // ���� ��� ���� ����(true�϶� ������� Ȱ��ȭ)
	
	//JSP���� ǥ���� ����¡ HTML�ڵ带 ������ ��
	private StringBuffer sb;
	
	public Paging(int nowPage, int rowTotal, int blockList, int blockPage) {
		this.nowPage = nowPage;
		this.rowTotal = rowTotal;
		this.blockList = blockList;
		this.blockPage = blockPage;
		
		// ������ɰ� ��������� �ʱ�ȭ ��Ų��.
		isPrePage = false;
		isNextPage = false;
		
		//�Էµ� ��ü �Խù��� ���� ���� ��ü ������ ���� ������.
		totalPage = (int)Math.ceil((double)rowTotal/blockList);
		
		// ���� �������� ���� ��ü�������� ������ ũ�ٸ� ��ü ������ ���� ���� ������������ ����
		if(nowPage > totalPage) {
			nowPage = totalPage;
		}
		
		// ���� ���� ���������� ���� ������������ ���� ������.
		startPage = (int)((nowPage-1)/blockPage)*blockPage+1;
		endPage = startPage+blockPage -1;
		
		//  �������������� ���� ��ü�������� ������ ũ�ٸ�
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		// ���� ������ ���� ���� ���۰Խù��� ���ȣ�� ������ �Խù��� ���ȣ�� �����Ͽ� ���� �������� ������ �Խù� ����� ���� �غ�
		begin = (nowPage-1)*blockList+1;
		end = nowPage*blockList;
		
		// ������� ���ɿ��� Ȯ��
		if(startPage > 1) {
			isPrePage = true;
		}
		
		if(endPage < totalPage) {
			isNextPage = true;
		}
		
		// ���� ���������� ���� �˰�, ������������ ������������ ���� �˾����� ������ ����� ����� �ڵ带 �ۼ��Ͽ� sb�� ����.
		sb = new StringBuffer("<ol class='paging'>");
		
		
		if(isPrePage) {
			sb.append("<li><a href='/bbs?cPage=");
			sb.append(nowPage-blockPage);
			sb.append("'> &lt </a></li>"); // <a href='list.inc?cPage = 1'> &lt </a></li>
		}else {
			sb.append("<li class='disable'> &lt; </li>");
		}
		
		// ������ ��ȣ�� ����ϴ� �ݺ���
		for(int i=startPage; i<=endPage; i++) {
			//i�� ���� ���� �������� ���� ���� ����
			// a�±׸� �������� �ʰ� ���ڸ� �������
			if(i == nowPage) {
				sb.append("<li class='now'>");
				sb.append(i);
				sb.append("</li>");
			}else {
				sb.append("<li><a href='/bbs?cPage=");
				sb.append(i);
				sb.append("'>"); // <a href = 'list.inc?cPage=1>
				sb.append(i); //ȭ�鿡 ǥ���Ǵ� ������ ��
				sb.append("</a></li>");
			}
		}// for���� ��
		
		// ���� ��� ���ɿ��θ� Ȯ��
		if(isNextPage) {
			sb.append("<li><a href='/bbs?cPage=");
			sb.append(nowPage+blockPage);
			sb.append("'> &gt; </a></li>");
		}else {
			sb.append("<li class='disable'> &gt; </li>");
		}
		
		sb.append("</ol>");
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getRowTotal() {
		return rowTotal;
	}

	public void setRowTotal(int rowTotal) {
		this.rowTotal = rowTotal;
	}

	public int getBlockList() {
		return blockList;
	}

	public void setBlockList(int blockList) {
		this.blockList = blockList;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public boolean isPrePage() {
		return isPrePage;
	}

	public void setPrePage(boolean isPrePage) {
		this.isPrePage = isPrePage;
	}

	public boolean isNextPage() {
		return isNextPage;
	}

	public void setNextPage(boolean isNextPage) {
		this.isNextPage = isNextPage;
	}

	public StringBuffer getSb() {
		return sb;
	}

	public void setSb(StringBuffer sb) {
		this.sb = sb;
	}
}
