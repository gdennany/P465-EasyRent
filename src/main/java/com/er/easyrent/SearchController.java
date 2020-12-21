package com.er.easyrent;

import com.er.easyrent.models.Category;
import com.er.easyrent.models.Product;
import com.er.easyrent.repos.CategoryRepository;
import com.er.easyrent.repos.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.lang.reflect.Array;
import java.util.*;
import java.util.stream.Collectors;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class SearchController {

    @Autowired
    ProductRepository productRepository;
    @Autowired
    CategoryRepository categoryRepository;

    /**
     * Renders the home page
     */
    @GetMapping(path = "/searchpage")
    public String search(HttpServletRequest req, HttpSession session) {

        session.setAttribute("categories", categoryRepository.findAll());

        String inputKeywords = req.getParameter("keywords");
        String inputLocation = req.getParameter("where");
        String inputCategory = req.getParameter("category");

        SearchFilter sf = new SearchFilter(inputKeywords,inputLocation,inputCategory);
        ArrayList<Product> filteredProductSet =  sf.grabFilteredProductSet();

        session.setAttribute("prods", filteredProductSet);
        session.setAttribute("keywords", inputKeywords);
        session.setAttribute("where", inputLocation);
        session.setAttribute("category", inputCategory);

        return "search";

    }

    /** @noinspection unchecked*/
    @PostMapping(path = "/searchInSearch")
    public String searchInSearch(HttpServletRequest req, HttpSession session) {

        String inputKeywords= (String) session.getAttribute("keywords");
        String inputLocation=  req.getParameter("where");
        String inputCategory=  req.getParameter("category");
        String[] inputFilter = {req.getParameter("sort"), req.getParameter("length")};
        SearchFilter sf = new SearchFilter(inputKeywords,inputLocation,inputCategory,inputFilter);
        ArrayList<Product> products= (ArrayList<Product>) session.getAttribute("prods");
        ArrayList<Product> filteredProductSet =  sf.applySortingFilter(products);

        session.setAttribute("prods", filteredProductSet);

        System.out.println(Arrays.toString(inputFilter));
        return "search";

    }

    @GetMapping(path = "/search")
    public String searchGet(HttpServletRequest req) {

        req.setAttribute("categories", categoryRepository.findAll());
        req.setAttribute("prods", productRepository.findAll());
        req.setAttribute("category", "All Categories");
        return "search";

    }


    private class SearchFilter {
        private String keywordPlaceholder = "";
        private String wherePlaceholder = "";
        private String categoryPlaceholder = "All Categories";

        private String inputKeywords;
        private String inputLocation;
        private String inputCategory;
        private String inputPriceSort;
        private int inputLength;


        private SearchFilter(String inputKeywords, String inputLocation, String inputCategory) {
            this.inputKeywords = inputKeywords;
            this.inputLocation = inputLocation;
            this.inputCategory = inputCategory;
        }

        private SearchFilter(String inputKeywords, String inputLocation, String inputCategory,String[] filterSort) {
            this.inputKeywords = inputKeywords;
            this.inputLocation = inputLocation;
            this.inputCategory = inputCategory;
            this.inputPriceSort = filterSort[0];
            this.inputLength = Integer.parseInt(filterSort[1]);
        }


         private ArrayList<Product> grabFilteredProductSet(){


            ArrayList<Product> productSet = new ArrayList<Product>();

            if(noSearchInputProvidedByUser()){

                for(Product p: productRepository.findAll()){
                    productSet.add(p);

                }

            }else{
                applyKeywordFilter(productSet);
                applyLocationFilter(productSet);
                applyCategoryFilter(productSet);

            }

            return productSet;

        }

        private boolean noSearchInputProvidedByUser() {
            return (inputKeywords.equals(keywordPlaceholder) &&
                    inputCategory.equals(categoryPlaceholder) &&
                    inputLocation.equals(wherePlaceholder));
        }

        private void applyKeywordFilter(ArrayList<Product> productSet){
            if(!inputKeywords.equals(keywordPlaceholder)){
                for(String s: inputKeywords.split(" ")){
                    productSet.addAll(productRepository.findByKeyword(s));
                }
            }
        }
        private void applyLocationFilter( ArrayList<Product> productSet){
            if(!inputLocation.equals(wherePlaceholder)){

                    productSet.addAll(productRepository.findByLocationLike(inputLocation));

            }

        }

        private ArrayList<Product> applySortingFilter( ArrayList<Product> productSet){
            ArrayList<Product> products = new ArrayList<>(productSet);
            if(inputPriceSort.equals("Price: Highest to Lowest")){
                products.sort((p1, p2) -> Float.floatToIntBits( p1.getPrice_per_day() - p2.getPrice_per_day()));
            }
            if(inputPriceSort.equals("Price: Lowest to Highest")){
                products.sort((p1, p2) -> Float.floatToIntBits( p2.getPrice_per_day() - p1.getPrice_per_day()));
            }


            products.sort((p1,p2) -> (p1.getRent_time_limit()-inputLength));
            products.sort(Comparator.comparingInt(p -> (p.getCategory().equals(inputCategory) ? 0 : 1)));


            return products;
        }


        private void applyCategoryFilter(ArrayList<Product> productSet){
            if(!inputCategory.equals(categoryPlaceholder)){

                productSet.addAll(productRepository.findByCategory(inputCategory));
            }
        }



    }
}

 /*

// for testing connection to database
@RestController
@RequestMapping("/")
=======
>>>>>>> origin/taohu_branch
public class HomeController {
    @RequestMapping("/")
    public String home(){
        return "test";
    }

}

<<<<<<< HEAD
    @GetMapping("/")
    public Iterable<User> getLogins() {
        //User login = new User("gdennany", "grant", "gdennany@iu.edu");
        //loginRepository.save(login);
        return loginRepository.findAll();
    }
}
  */
//// for testing connection to database
//@RestController
//@RequestMapping("/")
//public class HomeController {
//
//    private final UserRepository loginRepository;
//
//    public HomeController(UserRepository loginRepository) {
//        this.loginRepository = loginRepository;
//    }
//
//    @PostMapping("/")
//    @ResponseStatus(HttpStatus.CREATED)
//    public User createLogin(@RequestBody User login) {
//        return loginRepository.save(login);
//    }
//
//    @GetMapping("/")
//    public Iterable<User> getLogins() {
//        return loginRepository.findAll();
//    }
//}
