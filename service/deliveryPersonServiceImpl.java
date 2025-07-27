package service.deliverypersonnel;

import dao.deliverypersonnel.deliveryDAO;
import model.DeliveryPersonModel;


public class deliveryPersonServiceImpl {
	
	 private deliveryDAO dao = new deliveryDAO();

	    public DeliveryPersonModel login(String deliverypersonusername, String deliverypersonpassword) {
	        return dao.validateLogin(deliverypersonusername, deliverypersonpassword);
	    }

	public DeliveryPersonModel getDeliverPersonemail(String deliverypersonemail) {
	    return new deliveryDAO().getDeliverypersonemail(deliverypersonemail);
	}

	public boolean updatePasswordByEmail(String deliverypersonemail, String newPassword) {
	    return new deliveryDAO().updatedeliveryPersonPassword(deliverypersonemail, newPassword);
	}

	public boolean validateCurrentPassword(String deliverypersonemail, String currentPassword) {
	    return dao.checkdeliveryPersonPassword(deliverypersonemail, currentPassword);
	}

	public boolean updatePassword(String deliverypersonemail, String newPassword) {
	    return dao.updatedeliveryPersonPassword(deliverypersonemail, newPassword);
	}

}