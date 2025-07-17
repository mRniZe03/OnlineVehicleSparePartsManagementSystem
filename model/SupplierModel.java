package model;

public class SupplierModel {
	private int supplierid;
    private String suppliername;
    private String supplieremail;
    private String supplierusername;
    private String supplierphone;
    private String supplierpassword;
    
    

	public SupplierModel(int supplierid, String suppliername, String supplieremail, String supplierusername,String supplierphone, String supplierpassword) {
		super();
		this.supplierid = supplierid;
		this.suppliername = suppliername;
		this.supplieremail = supplieremail;
		this.supplierusername = supplierusername;
		this.supplierphone= supplierphone;
		this.supplierpassword = supplierpassword;
	}

	public int getSupplierid() {
		return supplierid;
	}

	public void setSupplierid(int supplierid) {
		this.supplierid = supplierid;
	}

	public String getSuppliername() {
		return suppliername;
	}

	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	public String getSupplieremail() {
		return supplieremail;
	}

	public void setSupplieremail(String supplieremail) {
		this.supplieremail = supplieremail;
	}

	public String getSupplierusername() {
		return supplierusername;
	}

	public void setSupplierusername(String supplierusername) {
		this.supplierusername = supplierusername;
	}
	public String getSupplierphone() {
		return supplierphone;
	}

	public void setSupplierphone(String supplierphone) {
		this.supplierphone= supplierphone;
	}

	public String getSupplierpassword() {
		return supplierpassword;
	}

	public void setSupplierpassword(String supplierpassword) {
		this.supplierpassword = supplierpassword;
	}

}
