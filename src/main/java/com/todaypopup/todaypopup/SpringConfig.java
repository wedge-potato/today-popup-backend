package com.todaypopup.todaypopup;

import com.todaypopup.todaypopup.repository.PopupRepository;
import com.todaypopup.todaypopup.service.PopupService;
import jakarta.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {
  private final PopupService popupService;

  private final PopupRepository popupRepository;
  private final EntityManager em;

@Autowired
  public SpringConfig(PopupService popupService, PopupRepository popupRepository, EntityManager em) {
    this.popupService = popupService;
    this.popupRepository = popupRepository;
    this.em = em;
  }


}
