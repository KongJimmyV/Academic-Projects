
public class Mountain {
	private String name;
	private int height;
	private double latitude;
	private double longitude;
	
	public Mountain(String name, int height) {
		this.setName(name);
		this.setHeight(height);
	}
	
	public String toString() {
		String msg = "Name: " + getName();
		msg += "\nHeight: " + getHeight();
		msg += "\nLatitude: " + getLatitude();
		msg += "\nLongitude: " + getLongitude();
		return msg;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the height
	 */
	public int getHeight() {
		return height;
	}

	/**
	 * @param height the height to set
	 */
	public void setHeight(int height) {
		this.height = height;
	}

	/**
	 * @return the latitude
	 */
	public double getLatitude() {
		return latitude;
	}

	/**
	 * @param latitude the latitude to set
	 */
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	/**
	 * @return the longitude
	 */
	public double getLongitude() {
		return longitude;
	}

	/**
	 * @param longitude the longitude to set
	 */
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

}
