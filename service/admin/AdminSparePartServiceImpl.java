package service.admin;

import java.util.List;
import dao.admin.AdminSparePartDAO;
import dao.admin.AdminSparePartDAOImpl;
import model.AdminSparePartModel;

public class AdminSparePartServiceImpl implements AdminSparePartService {
    private AdminSparePartDAO dao = new AdminSparePartDAOImpl();
    
    @Override
    public List<AdminSparePartModel> getAllSpareParts() {
        return dao.getAllSpareParts();
    }

    @Override
    public AdminSparePartModel getSparePartById(String spareId) {
        return dao.getSparePartById(spareId);
    }

    @Override
    public boolean orderStock(String spareId, int amount) {
        return dao.increaseStock(spareId, amount);
    }

    @Override
    public boolean removeStock(String spareId, int amount) {
        return dao.decreaseStock(spareId, amount);
    }

    @Override
    public boolean deleteSparePart(String spareId) {
        return dao.softDeleteSparePart(spareId);
    }

    
}

