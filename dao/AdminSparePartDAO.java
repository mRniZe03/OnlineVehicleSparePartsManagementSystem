package dao.admin;

import java.util.List;
import model.AdminSparePartModel;

public interface AdminSparePartDAO {
    AdminSparePartModel getSparePartById(String spareId);
    boolean increaseStock(String spareId, int amount);
    boolean decreaseStock(String spareId, int amount);
    List<AdminSparePartModel> getAllSpareParts();
    boolean softDeleteSparePart(String spareId);
    
    // Optional but recommended
    boolean updateSparePart(AdminSparePartModel part);
}
