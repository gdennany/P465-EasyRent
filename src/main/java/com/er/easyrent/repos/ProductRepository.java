package com.er.easyrent.repos;

import com.er.easyrent.models.Product;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Collection;

public interface ProductRepository extends CrudRepository<Product, Long> {


    @Query(value="declare @word as varchar(255) = :word;" +
            "select * from product where name like (select concat('%', @word, '%')) " +
            "or description like (select concat('%', @word, '%')) or short_desc like (select concat('%', @word, '%'));")
    Collection<Product> findByKeyword(@Param("word") String word);

    @Query(value="declare @word as varchar(255) = :word;" +
            "select * from product where category like (select concat('%', @word, '%')); ")
    Collection<Product> findByCategory(@Param("word") String category);


    Collection<Product> findByLocationContaining(String location);
    Collection<Product> findByLocationLike(String location);
    @Query(value="select * from product where EXISTS (select product_id, avg(rating)\n" +
            "from product_review\n" +
            "where product.id = product_id\n" +
            "GROUP BY (product_id)\n" +
            "HAVING AVG(rating) <=3);\n" +
            "\n")
    Collection<Product> findByRatingLessThanThree();

    Collection<Product> findByOwnerIs(int id);

    Product findByLocationIs(String location);


    @Query(value="declare @userid as int = :userid;\n" +
            "select top 5 * from product\n" +
            "    where id in ((select product_id from has_viewed where user_id = @userid) \n" +
            "        union \n" +
            "            (select product_id from has_favorite where user_id = @userid)) \n" +
            "                order by newid() ")
    Collection<Product> getRecommendations(@Param("userid") int userid);


}