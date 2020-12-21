package com.er.easyrent.repos;

import java.util.Collection;

import com.er.easyrent.models.HasFavorite;
import com.er.easyrent.models.ProductBooking;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface HasFavoriteRepository extends CrudRepository<HasFavorite, Long> {

	@Query(value="declare @productId as int = :productId;" +
			"select * from has_favorite where product_id = @productId;")
	Collection<HasFavorite> findByProductId(@Param("productId") int productId);

	@Query(value="declare @userId as int = :userId;" +
			"select * from has_favorite where user_id = @userId;")
	Collection<HasFavorite> findByUser(@Param("userId") int userId);

	@Query(value="declare @productId as int = :productId; declare @userId as int = :userId;" +
			"select * from has_favorite where product_id = @productId AND user_id = @userId;")
	HasFavorite findByProductIdAndUser(@Param("productId") int productId, @Param("userId") int userId);

}
