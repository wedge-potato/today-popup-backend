package com.todaypopup.todaypopup.model;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import java.time.LocalDateTime;
import lombok.Getter;

@Getter
@MappedSuperclass
public abstract class BaseTimeEntity {

  @Column(name = "created_date")
  private LocalDateTime createdDate;   // 생성일시

  @Column(name = "modified_date")
  private LocalDateTime modifiedDate;  // 최종 수정일시

  @PrePersist
  public void prePersist() {
    this.createdDate = LocalDateTime.now();
  }

  @PreUpdate
  public void preUpdate() {
    this.modifiedDate = LocalDateTime.now();
  }

}
