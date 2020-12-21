package com.er.easyrent.repos;
import java.util.Collection;

import com.er.easyrent.models.HasFavorite;
import com.er.easyrent.models.HasViewed;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface HasViewedRepository extends CrudRepository<HasViewed, Long> {

	@Query(value="declare @userId as int = :userId;" +
			"select * from has_viewed where user_id = @userId;")
	Collection<HasViewed> findByUser(@Param("userId") int userId);

	@Query(value="declare @productId as int = :productId; declare @userId as int = :userId;" +
			"select * from has_viewed where product_id = @productId AND user_id = @userId;")
	HasViewed findByProductIdAndUser(@Param("productId") int productId, @Param("userId") int userId);


}