package com.er.easyrent;

import com.er.easyrent.models.Category;
import com.er.easyrent.models.HasFavorite;
import com.er.easyrent.models.HasViewed;
import com.er.easyrent.models.OwnerComplaint;
import com.er.easyrent.models.Product;
import com.er.easyrent.models.ProductBooking;
import com.er.easyrent.models.ProductReview;
import com.er.easyrent.models.User;
import com.er.easyrent.repos.CategoryRepository;
import com.er.easyrent.repos.HasFavoriteRepository;
import com.er.easyrent.repos.HasViewedRepository;
import com.er.easyrent.repos.OwnerComplaintRepository;
import com.er.easyrent.repos.ProductBookingRepository;
import com.er.easyrent.repos.ProductRepository;
import com.er.easyrent.repos.ProductReviewRepository;
import com.er.easyrent.repos.UserRepository;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Optional;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class HomeController {

	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	ProductRepository productRepository;

	@Autowired
	UserRepository fUserRepository;

	@Autowired
	ProductBookingRepository fProductBookingRepository;

	@Autowired
	HasFavoriteRepository fHasFavoriteRepository;

	@Autowired
	HasViewedRepository fHasViewedRepository;


	@Autowired
	ProductReviewRepository productReviewRepository;

	@Autowired
	OwnerComplaintRepository fOwnerComplaintRepository;


	/**
	 * Renders the home page
	 */
	@RequestMapping("/")
	public String home(HttpServletRequest req, HttpSession sesh) {

		sesh.setAttribute("categories", (ArrayList<Category>) categoryRepository.findAll());
		req.setAttribute("products", (ArrayList<Product>) productRepository.findAll());
		return "index";
	}


	@RequestMapping("/profile")
	public String profile(HttpServletRequest req, HttpSession sesh) {

	    if(sesh.getAttribute("loggedInUser") == null){
	        return "notLoggedIn";
        }

		req.setAttribute("categories", (ArrayList<Category>) categoryRepository.findAll());


		User loggedInUser = (User) sesh.getAttribute("loggedInUser");
		ArrayList<Product> userOwnedProducts = (ArrayList<Product>) productRepository.findByOwnerIs(loggedInUser.getId().intValue());
		int average =0;
		if(userOwnedProducts.size() !=0){

			for(Product p: userOwnedProducts){

				Collection<ProductReview> reviews = productReviewRepository.findByProductId((int) p.getId());
				if(reviews.size() !=0) {
					int averageMini = reviews.stream().mapToInt(ProductReview::getRating).sum() / reviews.size();
					average += averageMini;
				}
			}
		}

		req.setAttribute("averageRating",average );

		String filter = req.getParameter("filter");

		if (filter.equals("history")) {
			ArrayList<HasViewed> userHasViewed = (ArrayList<HasViewed>) fHasViewedRepository.findByUser((loggedInUser.getId().intValue()));

			if(userHasViewed.size() !=0) {
				ArrayList<Product> viewedProducts = new ArrayList<>();
				for (HasViewed viewProd : userHasViewed) {
					viewedProducts.add(productRepository.findById((long) viewProd.getProduct_id()).get());

				}
				req.setAttribute("products", viewedProducts);
				req.setAttribute("filter", "history");
			}
		} else if (filter.equals("postings")) {


			req.setAttribute("products", productRepository.findByOwnerIs(loggedInUser.getId().intValue()));
			req.setAttribute("filter", "postings");

		} else {
			ArrayList<HasFavorite> userHasFavorite = (ArrayList<HasFavorite>) fHasFavoriteRepository.findByUser((loggedInUser.getId().intValue()));
			System.out.println(userHasFavorite);
			ArrayList<Product> favoriteProducts = new ArrayList<>();
			for (HasFavorite favProd : userHasFavorite) {
				favoriteProducts.add(productRepository.findById((long) favProd.getProduct_id()).get());

			}
			req.setAttribute("products", favoriteProducts);
			req.setAttribute("filter", "favorites");
		}


		averageRating(req,sesh);
		return "profile";
	}

	private void averageRating(HttpServletRequest req,HttpSession sesh) {
		User u = (User) sesh.getAttribute("loggedInUser");

		Collection<Product> userOwnedProducts = productRepository.findByOwnerIs(u.getId().intValue());
		int average =0;
		if(userOwnedProducts.size() !=0){

			for(Product prod: userOwnedProducts){
				Collection<ProductReview> reviews = productReviewRepository.findByProductId((int) prod.getId());
				if(reviews.size() !=0) {
					int averageMini = reviews.stream().mapToInt(ProductReview::getRating).sum() / reviews.size();
					average += averageMini;
				}
			}
		}
		req.setAttribute("averageRating",average );
	}


	@RequestMapping("/listing")
	public String listing(HttpServletRequest req, HttpSession sesh) {
		req.setAttribute("selectedProduct", req.getParameter("selectedProduct"));
		Product p = productRepository.findById(Long.parseLong(req.getParameter("selectedProduct"))).get();
		User u = fUserRepository.findById((long) p.getOwner()).get();

		Collection<Product> userOwnedProducts = productRepository.findByOwnerIs(u.getId().intValue());
		int average =0;
		if(userOwnedProducts.size() !=0){

			for(Product prod: userOwnedProducts){
				Collection<ProductReview> reviews = productReviewRepository.findByProductId((int) prod.getId());
				if(reviews.size() !=0) {
					int averageMini = reviews.stream().mapToInt(ProductReview::getRating).sum() / reviews.size();
					average += averageMini;
				}
			}
		}
		req.setAttribute("averageRating",average );
		Collection<ProductBooking> productsOwnedThatWereBooked = new ArrayList<>();
		for (Product product : userOwnedProducts) {
			productsOwnedThatWereBooked.addAll(fProductBookingRepository.findByProductId((int) product.getId()));
		}


		req.setAttribute("user", u);
		req.setAttribute("userRentCount", productsOwnedThatWereBooked.size());
		req.setAttribute("short_description", p.getShort_desc());
		req.setAttribute("obj", p);
		User loggedInUser = (User) sesh.getAttribute("loggedInUser");


		if(loggedInUser!=null) {
			if (fHasFavoriteRepository.findByProductIdAndUser((int) p.getId(), loggedInUser.getId().intValue()) != null) {
				req.setAttribute("isUserFavorite", "yes");
			}
		}


		if(loggedInUser != null && fHasViewedRepository.findByProductIdAndUser((int) p.getId(),loggedInUser.getId().intValue()) == null){
		    fHasViewedRepository.save(new HasViewed(loggedInUser.getId().intValue(),(int) p.getId()));
        }

		Collection<ProductReview> productReviews = (ArrayList<ProductReview>) productReviewRepository.findByProductId((int) p.getId());

		req.setAttribute("prodReviews", productReviews);
		return "listing";
	}

	@RequestMapping("/postListing")
	public String postListing(HttpServletRequest req, HttpSession sesh) {
        if(sesh.getAttribute("loggedInUser") == null){
            return "notLoggedIn";
        }
		return "form";
	}

	@RequestMapping("/review")
	public String review(HttpServletRequest req, HttpSession sesh) {
		if(sesh.getAttribute("loggedInUser") == null){
			return "notLoggedIn";
		}
		req.setAttribute("product", req.getParameter("product"));
		return "review";
	}

	@RequestMapping("/addReview")
	public String addReview(HttpServletRequest req, HttpSession sesh, HttpServletResponse resp) {
		if(sesh.getAttribute("loggedInUser") == null){
			return "notLoggedIn";
		}
		User loggedInUser = (User) sesh.getAttribute("loggedInUser");
		int productId = Integer.parseInt(req.getParameter("product"));
		productReviewRepository.save(new ProductReview(productId, req.getParameter("review"), loggedInUser.getId().intValue(), Integer.parseInt(req.getParameter("rating"))));
		resp.setHeader("Location", "/listing?selectedProduct="+productId);
		resp.setStatus(302);
		return "listing";
	}


	@RequestMapping("/complaint")
	public String complaint(HttpServletRequest req, HttpSession sesh) {
		if(sesh.getAttribute("loggedInUser") == null){
			return "notLoggedIn";
		}
		req.setAttribute("userId", req.getParameter("userId"));
		req.setAttribute("username", req.getParameter("username"));
		return "complaint";
	}

	@RequestMapping("/addComplaint")
	public String addComplaint(HttpServletRequest req, HttpSession sesh, HttpServletResponse resp) {
		if(sesh.getAttribute("loggedInUser") == null){
			return "notLoggedIn";
		}
		User loggedInUser = (User) sesh.getAttribute("loggedInUser");
		String userId = req.getParameter("userId");

		fOwnerComplaintRepository.save(new OwnerComplaint(Integer.parseInt(userId),req.getParameter("complaint"), loggedInUser.getId().intValue() ));
		return "complaintFiled";
	}


	@RequestMapping("/addListing")
	public String addListing(HttpServletRequest req, HttpSession sesh, HttpServletResponse resp) {

		String name = req.getParameter("name");
		String short_desc = req.getParameter("short_desc");
		String description = req.getParameter("description");
		String condition = req.getParameter("condition");
		String location = req.getParameter("address");
		String category = req.getParameter("category");
		float price = Float.parseFloat(req.getParameter("price"));
		String period = req.getParameter("period");
		User loggedInUser = (User) sesh.getAttribute("loggedInUser");
		long ownedBy = loggedInUser.getId();
		String img_url = req.getParameter("img_url");

		Product p = new Product(name, description, condition, price, period, (int) ownedBy, 0, category, img_url, short_desc, location, 0);


		productRepository.save(p);

		if(productRepository.findByLocationIs("") != null){
			productRepository.deleteById(productRepository.findByLocationIs("").getId());

		}


		resp.setHeader("Location", "/profile?filter=postings");
		resp.setStatus(302);
		return "profile";
	}

	@RequestMapping("/addFavorite")
	public String createFavorite(HttpServletRequest req, HttpSession sesh, HttpServletResponse resp) {

		if(sesh.getAttribute("loggedInUser") == null){
			return "notLoggedIn";
		}
		int prodId = Integer.parseInt(req.getParameter("product"));
		User loggedInUser = (User) sesh.getAttribute("loggedInUser");
		HasFavorite hf = new HasFavorite(Math.toIntExact(loggedInUser.getId()), prodId);
		if (req.getParameter("favorite").equals("add")) {
			fHasFavoriteRepository.save(hf);
			resp.setHeader("Location", req.getHeader("referer"));
			resp.setStatus(302);
			System.out.println("check");
		} else {

			fHasFavoriteRepository.deleteById(fHasFavoriteRepository.findByProductIdAndUser(prodId, loggedInUser.getId().intValue()).getId());
			resp.setHeader("Location", req.getHeader("referer"));
			resp.setStatus(302);
			System.out.println("x'd");
		}

		return "listing";
	}

	@RequestMapping("/removeListing")
	public String removeListing(HttpServletRequest req, HttpSession sesh, HttpServletResponse resp) {

		if(sesh.getAttribute("loggedInUser") == null){
			return "notLoggedIn";
		}
		int prodId = Integer.parseInt(req.getParameter("product"));

			productRepository.deleteById((long) prodId);
			resp.setHeader("Location", "/profile?filter=favorites");
			resp.setStatus(302);
			System.out.println("check");

		return "listing";
	}



	@RequestMapping("/getProblematicOwners")
	public String getProblematicOwners(HttpServletRequest req, HttpSession sesh, HttpServletResponse resp) {
		HashMap<User, ArrayList<OwnerComplaint>> userAndTheirComplaints = new HashMap<>();
		for(User u: fUserRepository.findAll()){
			Collection<OwnerComplaint> userComplaints = fOwnerComplaintRepository.findByOwner(u.getId().intValue());
			if(!userComplaints.isEmpty()){
				userAndTheirComplaints.put(u, (ArrayList<OwnerComplaint>) userComplaints);
			}
		}

		req.setAttribute("userAndTheirComplaints", userAndTheirComplaints);

		return "adminOwners";
	}

	@RequestMapping("/getProblematicListings")
	public String getProblematicListings(HttpServletRequest req, HttpSession sesh, HttpServletResponse resp) {
		Collection<Product> badProds = productRepository.findByRatingLessThanThree();
		req.setAttribute("products", badProds);

		return "adminListings";
	}
}
