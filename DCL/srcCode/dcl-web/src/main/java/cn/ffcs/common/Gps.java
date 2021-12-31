package cn.ffcs.common;
/**
 * 
 * @ClassName:  Gps   
 * @Description:经纬度转换工具类用到的GPS对象  
 * @author: liuw 
 * @date:   2017-3-9 下午4:07:27   
 *     
 * @Copyright: 2017 福富软件
 */
public class Gps {

	private double wgLat;
	private double wgLon;

	public Gps(double wgLat, double wgLon) {
		setWgLat(wgLat);
		setWgLon(wgLon);
	}

	public double getWgLat() {
		return wgLat;
	}

	public void setWgLat(double wgLat) {
		this.wgLat = wgLat;
	}

	public double getWgLon() {
		return wgLon;
	}

	public void setWgLon(double wgLon) {
		this.wgLon = wgLon;
	}

	@Override
	public String toString() {
		return wgLat + "," + wgLon;
	}
}
