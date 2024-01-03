package com.todaypopup.todaypopup.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity(name = "image")
@Table(name = "image")
public class ImageEntity extends BaseTimeEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "image", nullable = false)
  private String imageUrl;

  @Column(name = "popup_id", nullable = false)
  private Long popupId;
}
