package day0817_work;

public class TableinfoVO {

	private String column_name, data_type, data_length, nullable, data_default, table_name;

	public String getColumn_name() {
		return column_name;
	}

	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}

	public String getData_type() {
		return data_type;
	}

	public void setData_type(String data_type) {
		this.data_type = data_type;
	}

	public String getData_length() {
		return data_length;
	}

	public void setData_length(String data_length) {
		this.data_length = data_length;
	}

	public String getNullable() {
		return nullable;
	}

	public void setNullable(String nullable) {
		this.nullable = nullable;
	}

	public String getData_default() {
		return data_default;
	}

	public void setData_default(String data_default) {
		this.data_default = data_default;
	}

	public String getTable_name() {
		return table_name;
	}

	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}

	@Override
	public String toString() {
		return "TableinfoVO [column_name=" + column_name + ", data_type=" + data_type + ", data_length=" + data_length
				+ ", nullable=" + nullable + ", data_default=" + data_default + ", table_name=" + table_name + "]";
	}

	public TableinfoVO(String column_name, String data_type, String data_length, String nullable, String data_default,
			String table_name) {
		super();
		this.column_name = column_name;
		this.data_type = data_type;
		this.data_length = data_length;
		this.nullable = nullable;
		this.data_default = data_default;
		this.table_name = table_name;
	}

	public TableinfoVO() {
		super();
	}

}
