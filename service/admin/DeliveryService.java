package service.admin;

import java.util.List;

import model.DeliveryPersonModel;

public interface DeliveryService {
    boolean addDeliveryPerson(DeliveryPersonModel deliveryPerson);
    List<DeliveryPersonModel> getAllDeliveryPersons();
    boolean updateDeliveryPerson(DeliveryPersonModel deliveryPerson);
    boolean deleteDeliveryPerson(int deliverypersonid);
}
