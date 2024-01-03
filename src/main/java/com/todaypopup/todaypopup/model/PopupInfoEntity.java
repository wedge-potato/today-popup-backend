package com.todaypopup.todaypopup.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity(name = "popup_info")
@Table(name = "popup_info")
public class PopupInfoEntity extends BaseTimeEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column()
  private String urlLink;

  @Column()
  private String introduction;

  @Column()
  private String address;
}
