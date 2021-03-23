package arr;

public class Arrow {
	int depth = 0;
	String res = "";
	
	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		res = "";
		this.depth = depth;
		String rs = "<img src='./img/arrow.png' width='20px' height='20px'/>";
		String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
		String ts = "";
		for(int i = 0;i<depth;i++){	ts += nbsp;	}
		if(depth != 0) { res=ts+rs; }
	}

	public String getRes() {
		return res;
	}

	public void setRes(String res) {
		this.res = res;
	}

}
