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

  @Column(name = "create_date")
  private LocalDateTime createDate;

  @Column(name = "update_date")
  private LocalDateTime updateDate;

  @PrePersist
  public void prePersist() {
    this.createDate = LocalDateTime.now();
  }

  @PreUpdate
  public void preUpdate() {
    this.updateDate = LocalDateTime.now();
  }

}
