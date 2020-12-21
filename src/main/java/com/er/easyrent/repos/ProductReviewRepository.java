package com.er.easyrent.repos;
import java.util.Collection;

import com.er.easyrent.models.HasViewed;
import com.er.easyrent.models.ProductReview;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface ProductReviewRepository extends CrudRepository<ProductReview, Long>{


	@Query(value="declare @productId as int = :productId;" +
			"select * from product_review where product_id = @productId;")
	Collection<ProductReview> findByProductId(@Param("productId") int productId);


}
