package com.todaypopup.todaypopup.core.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.util.Date;
import java.util.List;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@Entity(name = "popup")
@Table(name = "popup")
public class PopupEntity extends BaseTimeEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "title", nullable = false)
  private String title;

  @Column(name = "thumbnail", nullable = false, columnDefinition = "TEXT")
  private String thumbnail;

  @Column(name = "start_date")
  @Temporal(TemporalType.TIMESTAMP)
  private Date startDate;

  @Column(name = "end_date")
  @Temporal(TemporalType.TIMESTAMP)
  private Date endDate;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "category_id", referencedColumnName = "id", insertable = false, updatable = false)
  private CategoryEntity category;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "sido_id", referencedColumnName = "id", insertable = false, updatable = false)
  private SidoEntity sido;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "sigungu_id", referencedColumnName = "id", insertable = false, updatable = false)
  private SigunguEntity sigungu;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "info_id", referencedColumnName = "id")
  private PopupInfoEntity popupInfo;

  @OneToMany(fetch = FetchType.LAZY)
  @JoinColumn(name = "popup_id", referencedColumnName = "id")
  private List<ImageEntity> images;
}
