package service.admin;

import java.util.List;

public interface Manageable<T> {

    // Add a new record (e.g., admin, part, etc.)
    boolean add(T obj);

    // Update existing record
    boolean update(T obj);

    // Delete record by ID
    boolean delete(int id);

    // Retrieve all records
    List<T> getAll();

    // Retrieve one record by ID
    T getById(int id);
}
