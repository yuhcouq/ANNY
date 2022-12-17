package com.vienmv.dao;

import java.util.List;

import com.vienmv.model.Product;

public interface ProductDao {
	void insert(Product product);

	void edit(Product product);

	void delete(int id);

	Product get(int id);

	List<Product> getAll(int featured);

	List<Product> search(String username);
	
	List<Product> seachByCategory(String cate_id, int page);
	
	int countByCategory(String cate_id);
	
	List<Product> seachByName(String productName);
}
