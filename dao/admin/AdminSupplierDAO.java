package dao.admin;

import model.AdminSupplierModel;
import util.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminSupplierDAO {

    public boolean addSupplier(AdminSupplierModel supplier) {
        boolean isInserted = false;

        try (
            Connection con = DBconnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO vehiclespareparts.supplier (suppliername, supplieremail, supplierusername, supplierphone, supplierpassword) " +
                "VALUES (?, ?, ?, ?, ?)")
        ) {
            ps.setString(1, supplier.getsuppliername());
            ps.setString(2, supplier.getsupplieremail());
            ps.setString(3, supplier.getsupplierusername());
            ps.setString(4, supplier.getsupplierphone());
            ps.setString(5, supplier.getsupplierpassword());

            int result = ps.executeUpdate();
            isInserted = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isInserted;
    }

    public List<AdminSupplierModel> getAllSuppliers() {
        List<AdminSupplierModel> list = new ArrayList<>();

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM supplier");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
            	AdminSupplierModel s = new AdminSupplierModel(
                    rs.getInt("supplierid"),
                    rs.getString("suppliername"),
                    rs.getString("supplieremail"),
                    rs.getString("supplierusername"),
                    rs.getString("supplierphone"),
                    rs.getString("supplierpassword")
                );
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean updateSupplier(AdminSupplierModel supplier) {
        boolean isUpdated = false;

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "UPDATE supplier SET suppliername = ?, supplieremail = ?, supplierphone = ? WHERE supplierid = ?")) {

            ps.setString(1, supplier.getsuppliername());
            ps.setString(2, supplier.getsupplieremail());
            ps.setString(3, supplier.getsupplierphone());
            ps.setInt(4, supplier.getsupplierid());

            int rows = ps.executeUpdate();
            isUpdated = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

    public boolean deleteSupplier(int supplierId) {
        boolean success = false;

        try (Connection con = DBconnection.getConnection()) {
            con.setAutoCommit(false); // Transaction start

            // 1. Mark supplier's spare parts as inactive
            try (PreparedStatement ps1 = con.prepareStatement(
                    "UPDATE spare_parts SET status = 'inactive' WHERE supplierid = ?")) {
                ps1.setInt(1, supplierId);
                ps1.executeUpdate();
            }

            // 2. Delete the supplier
            try (PreparedStatement ps2 = con.prepareStatement(
                    "DELETE FROM supplier WHERE supplierid = ?")) {
                ps2.setInt(1, supplierId);
                int rows = ps2.executeUpdate();

                if (rows > 0) {
                    con.commit();
                    success = true;
                } else {
                    con.rollback();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }
}

