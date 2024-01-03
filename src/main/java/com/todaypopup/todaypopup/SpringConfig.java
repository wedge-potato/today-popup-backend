package com.todaypopup.todaypopup;

import com.todaypopup.todaypopup.repository.PopupRepository;
import com.todaypopup.todaypopup.service.PopupService;
import com.todaypopup.todaypopup.service.PopupServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {

  private final PopupRepository popupRepository;

  @Autowired
  public SpringConfig(PopupRepository popupRepository) {
    this.popupRepository = popupRepository;
  }

  @Bean
  public PopupService popupService() {
    return new PopupServiceImpl(popupRepository);
  }

}
