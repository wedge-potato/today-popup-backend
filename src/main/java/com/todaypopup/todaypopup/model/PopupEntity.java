package com.todaypopup.todaypopup.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.util.Date;
import lombok.Data;

@Data
@Entity(name = "popup")
@Table(name = "popup")
public class PopupEntity extends BaseTimeEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "title", nullable = false)
  private String title;

  @Column(nullable = false)
  private String thumbnail;

  @Temporal(TemporalType.TIMESTAMP)
  private Date startDate;

  @Temporal(TemporalType.TIMESTAMP)
  private Date endDate;

  @Column(nullable = false)
  private Integer categoryId;

  @Column(nullable = false)
  private Integer cityId;

  @Column(nullable = false)
  private Long info;
}
