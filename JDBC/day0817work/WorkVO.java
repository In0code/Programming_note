package day0817work;

public class WorkVO {  //승우 숙제
	
	private String columnName;
	private String dataType;
	private String dataSize;
	private String isNull;
	private String dataPrecision;
	private String isDefault;
		
	public WorkVO() {
		
	}
	
	public WorkVO(String columnName, String dataType, String dataSize, String isNull, String dataPrecision, String isDefault) {
		super();
		this.columnName = columnName;
		this.dataType = dataType;
		this.dataSize = dataSize;
		this.isNull = isNull;
		this.dataPrecision = dataPrecision;
		this.isDefault = isDefault;
	}
	
	public String getColumnName() {
		return columnName;
	}
	
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	
	public String getDataType() {
		return dataType;
	}
	
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	
	public String getDataSize() {
		return dataSize;
	}
	
	public void setDataSize(String dataSize) {
		this.dataSize = dataSize;
	}
	
	public String getIsNull() {
		return isNull;
	}
	
	public void setIsNull(String isNull) {
		this.isNull = isNull;
	}
	
	public String getDataPrecision() {
		return dataPrecision;
	}
	
	public void setDataPrecision(String dataPrecision) {
		this.dataPrecision = dataPrecision;
	}
	
	
	public String getIsDefault() {
		return isDefault;
	}
	
	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

	@Override
	public String toString() {
		return "WorkVO [columnName=" + columnName + ", dataType=" + dataType + ", dataSize=" + dataSize + ", isNull="
				+ isNull +  ", dataPrecision=" + dataPrecision + ", isDefault=" + isDefault + "]";
	}
	
	
	
	
}
