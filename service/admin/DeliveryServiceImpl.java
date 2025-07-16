package service.admin;

	import java.util.List;

import dao.admin.AdminDeliveryDAO;	
import model.DeliveryPersonModel;

	public class DeliveryServiceImpl implements DeliveryService {

	    private AdminDeliveryDAO dao = new AdminDeliveryDAO();

	    @Override
	    public boolean addDeliveryPerson(DeliveryPersonModel deliveryPerson) {
	        return dao.addDeliveryPerson(deliveryPerson);
	    }

	    @Override
	    public List<DeliveryPersonModel> getAllDeliveryPersons() {
	        return dao.getAllDeliveryPersons();
	    }

	    @Override
	    public boolean updateDeliveryPerson(DeliveryPersonModel deliveryPerson) {
	        return dao.updateDeliveryPerson(deliveryPerson);
	    }

	    @Override
	    public boolean deleteDeliveryPerson(int deliverypersonid) {
	        return dao.deleteDeliveryPerson(deliverypersonid);
	    }

		public DeliveryServiceImpl login(String deliverypersonusername, String deliverypersonpassword) {
			// TODO Auto-generated method stub
			return null;
		}
	}



