package com.todaypopup.todaypopup.controller;

import com.todaypopup.todaypopup.dto.GetPopupsQueryDto;
import com.todaypopup.todaypopup.dto.GetPopupsResponseDto;
import com.todaypopup.todaypopup.dto.PaginationResponseDto;
import com.todaypopup.todaypopup.service.PopupService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PopupController {

  private final PopupService popupService;

  public PopupController(PopupService popupService) {
    this.popupService = popupService;
  }

  @GetMapping("/v1/popups")
  public ResponseEntity<PaginationResponseDto<GetPopupsResponseDto>> getPopups(
      @ModelAttribute GetPopupsQueryDto queryDto) throws Exception {


    PaginationResponseDto<GetPopupsResponseDto> response = this.popupService.GetPopups(queryDto);

    return ResponseEntity.ok().body(response);
  }

}
