package com.todaypopup.todaypopup.core.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.Date;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@Entity(name = "popup_info")
@Table(name = "popup_info")
public class PopupInfoEntity extends BaseTimeEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "url_link")
  private String urlLink;

  @Column(name = "introduction")
  private String introduction;

  @Column(name = "address")
  private String address;

  @Column(name = "lat")
  private String lat;

  @Column(name = "lng")
  private String lng;

  @Column(name = "start_time")
  private Date startTime;

  @Column(name = "end_time")
  private Date endTime;
}
