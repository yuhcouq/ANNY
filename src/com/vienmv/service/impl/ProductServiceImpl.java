package com.vienmv.service.impl;

import java.io.File;
import java.util.List;
import com.vienmv.dao.ProductDao;
import com.vienmv.dao.UserDao;
import com.vienmv.dao.impl.ProductDaoImpl;
import com.vienmv.dao.impl.UserDaoImpl;
import com.vienmv.model.Product;
import com.vienmv.model.User;
import com.vienmv.service.ProductService;
import com.vienmv.service.UserService;
import com.vienmv.util.Constant;

public class ProductServiceImpl implements ProductService {
	ProductDao productDao = new ProductDaoImpl();

	@Override
	public void insert(Product product) {
		productDao.insert(product);

	}

	@Override
	public void edit(Product newProduct) {
		Product product = new Product();
		if(newProduct.getId() != -1) {
			product = productDao.get(newProduct.getId());
		}

		product.setName(newProduct.getName());
		product.setPrice(newProduct.getPrice());
		product.setCategory(newProduct.getCategory());
		if (newProduct.getImage() != null) {
			// XOA ANH CU DI
			String fileName = product.getImage();
			final String dir = Constant.Path.FILE_UPLOAD_DIR;
			File file = new File(dir + "/" + fileName);
			if (file.exists()) {
				file.delete();
			}

			product.setImage(newProduct.getImage());
		}

		productDao.edit(product);

	}

	@Override
	public void delete(int id) {
		productDao.delete(id);

	}

	@Override
	public Product get(int id) {
		return productDao.get(id);
	}

	@Override
	public List<Product> getAll() {
		return productDao.getAll();
	}

	@Override
	public List<Product> search(String product) {
		return productDao.search(product);
	}

	@Override
	public List<Product> seachByCategory(int cate_id, int page) {
		return productDao.seachByCategory(cate_id, page);
	}
	
	@Override
	public int countByCategory(int cate_id) {
		return productDao.countByCategory(cate_id);
	}

	@Override
	public List<Product> seachByName(String productName) {
		return productDao.seachByName(productName);
	}

}
