package service.admin;

import java.util.List;

import model.AdminSparePartModel;


public interface AdminSparePartService {
	List<AdminSparePartModel> getAllSpareParts();


	AdminSparePartModel getSparePartById(String spareId);
    boolean orderStock(String spareId, int amount);
    boolean removeStock(String spareId, int amount);
    public boolean deleteSparePart(String spareId);

}
