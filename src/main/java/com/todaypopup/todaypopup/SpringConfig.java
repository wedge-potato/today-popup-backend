package com.todaypopup.todaypopup;

import jakarta.annotation.PostConstruct;
import org.springframework.context.annotation.Configuration;

import java.util.TimeZone;

@Configuration
public class SpringConfig {

  @PostConstruct
  void started() {
    TimeZone.setDefault(TimeZone.getTimeZone("KST"));
  }
}
