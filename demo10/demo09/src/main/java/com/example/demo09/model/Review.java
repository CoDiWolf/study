package com.example.demo09.model;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;


@Entity
@Table(name="hotel_review") 
public class Review {


@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="id")
private Long id;
@JoinColumn(name = "hotel")
@ManyToOne
private Hotel hotel;
private int rate; 
private String comment; 
@CreationTimestamp
@Temporal(TemporalType.TIMESTAMP)
@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
private Date ratingDate;


	
	
}
