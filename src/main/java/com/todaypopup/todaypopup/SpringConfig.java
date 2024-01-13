package com.todaypopup.todaypopup;

import jakarta.annotation.PostConstruct;
import java.util.TimeZone;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {

  @PostConstruct
  void started() {
    TimeZone.setDefault(TimeZone.getTimeZone("KST"));
  }
}
