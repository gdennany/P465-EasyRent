package com.er.easyrent.models;

import java.sql.Date;

import org.springframework.data.annotation.Id;

public class ProductBooking {

	@Id
	private long uniqueId;

	private long id;
	private Date start_date;
	private Date end_date;
	private long rentedBy;


	public ProductBooking(long id, Date start_date, Date end_date, long rentedBy) {
		this.id = id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.rentedBy = rentedBy;
	}

	public long getUniqueId() {
		return uniqueId;
	}

	public void setUniqueId(long uniqueId) {
		this.uniqueId = uniqueId;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public long getRentedBy() {
		return rentedBy;
	}

	public void setRentedBy(long rentedBy) {
		this.rentedBy = rentedBy;
	}
}
