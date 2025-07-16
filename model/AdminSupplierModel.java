package model;

public class AdminSupplierModel {
	private int supplierid;
    private String suppliername;
    private String supplieremail;
    private String supplierusername;
    private String supplierphone;
    private String supplierpassword;
    

	public AdminSupplierModel(int supplierid, String suppliername, String supplieremail, String supplierusername,String supplierphone, String supplierpassword) {
		super();
		this.supplierid = supplierid;
		this.suppliername = suppliername;
		this.supplieremail = supplieremail;
		this.supplierusername = supplierusername;
		this.supplierphone = supplierphone;
		this.supplierpassword = supplierpassword;
	}

	public int getsupplierid() {
		return supplierid;
	}

	public void setsupplierid(int supplierid) {
		this.supplierid = supplierid;
	}

	public String getsuppliername() {
		return suppliername;
	}

	public void setsuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	public String getsupplieremail() {
		return supplieremail;
	}

	public void setsupplieremail(String supplieremail) {
		this.supplieremail = supplieremail;
	}

	public String getsupplierusername() {
		return supplierusername;
	}

	public void setsupplierusername(String supplierusername) {
		this.supplierusername = supplierusername;
	}
	public String getsupplierphone() {
		return supplierphone;
	}

	public void setsupplierphone(String supplierphone) {
		this.supplierphone= supplierphone;
	}

	public String getsupplierpassword() {
		return supplierpassword;
	}

	public void setsupplierpassword(String supplierpassword) {
		this.supplierpassword = supplierpassword;
	}

	
}
