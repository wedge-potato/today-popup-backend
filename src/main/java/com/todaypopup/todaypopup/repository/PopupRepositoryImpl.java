package com.todaypopup.todaypopup.repository;

import com.todaypopup.todaypopup.dto.GetPopupsQueryDto;
import jakarta.persistence.EntityManager;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class PopupRepositoryImpl implements PopupRepository {

  private final EntityManager em;

  public PopupRepositoryImpl(EntityManager em) {
    this.em = em;
  }


  @Override
  public List<String> findAll(GetPopupsQueryDto params) {
    return null;
  }
}
