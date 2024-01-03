package com.todaypopup.todaypopup.controller;

import com.todaypopup.todaypopup.dto.GetPopupsQueryDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PopupController {

  @GetMapping("/v1/popups")
  public ResponseEntity getPopups(@ModelAttribute GetPopupsQueryDto params) {

    return ResponseEntity.ok().body(params);
  }

}
