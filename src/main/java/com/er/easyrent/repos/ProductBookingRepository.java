package com.er.easyrent.repos;

import java.util.Collection;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.er.easyrent.models.Category;
import com.er.easyrent.models.Product;
import com.er.easyrent.models.ProductBooking;

public interface ProductBookingRepository extends CrudRepository<ProductBooking, Long> {



	@Query(value="declare @productId as int = :productId;" +
			"select * from product_booking where id = @productId;")
	Collection<ProductBooking> findByProductId(@Param("productId") int productId);
}