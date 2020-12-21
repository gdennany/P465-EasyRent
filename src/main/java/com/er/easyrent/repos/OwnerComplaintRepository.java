package com.er.easyrent.repos;
import java.util.Collection;

import com.er.easyrent.models.HasViewed;
import com.er.easyrent.models.OwnerComplaint;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface OwnerComplaintRepository extends CrudRepository<OwnerComplaint, Long>{

	@Query(value="declare @userId as int = :userId;" +
			"select * from owner_complaint where user_that_was_complained_about = @userId;")
	Collection<OwnerComplaint> findByOwner(@Param("userId") int userId);

}
