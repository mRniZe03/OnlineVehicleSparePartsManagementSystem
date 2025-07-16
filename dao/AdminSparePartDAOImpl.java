package dao.admin;

import model.AdminSparePartModel;
import util.DBconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public  class AdminSparePartDAOImpl implements AdminSparePartDAO {

    @Override
    public AdminSparePartModel getSparePartById(String spareId) {
        AdminSparePartModel part = null;
        String sql = "SELECT * FROM spare_parts WHERE spare_id = ? AND status = 'active'";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, spareId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                byte[] imageBytes = rs.getBytes("spare_photo");
                String base64Image = (imageBytes != null) ? Base64.getEncoder().encodeToString(imageBytes) : null;

                part = new AdminSparePartModel(
                    rs.getString("spare_id"),
                    rs.getString("name"),
                    rs.getBigDecimal("price"),
                    rs.getString("category"),
                    rs.getInt("quantity"),
                    rs.getString("description"),
                    imageBytes,
                    base64Image,
                    rs.getInt("supplierid"),
                    rs.getString("status")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return part;
    }

    @Override
    public List<AdminSparePartModel> getAllSpareParts() {
        List<AdminSparePartModel> list = new ArrayList<>();
        String sql = "SELECT * FROM spare_parts WHERE status = 'active'";

        try (Connection con = DBconnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                byte[] imageBytes = rs.getBytes("spare_photo");
                String base64Image = (imageBytes != null) ? Base64.getEncoder().encodeToString(imageBytes) : null;

                AdminSparePartModel part = new AdminSparePartModel(
                    rs.getString("spare_id"),
                    rs.getString("name"),
                    rs.getBigDecimal("price"),
                    rs.getString("category"),
                    rs.getInt("quantity"),
                    rs.getString("description"),
                    imageBytes,
                    base64Image,
                    rs.getInt("supplierid"),
                    rs.getString("status")
                );
                list.add(part);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean softDeleteSparePart(String spareId) {
        String sql = "UPDATE spare_parts SET status = 'inactive' WHERE spare_id = ?";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, spareId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

	@Override
	public boolean increaseStock(String spareId, int amount) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean decreaseStock(String spareId, int amount) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateSparePart(AdminSparePartModel part) {
		// TODO Auto-generated method stub
		return false;
	}

    // Add other methods like insert, update, delete as needed
}
