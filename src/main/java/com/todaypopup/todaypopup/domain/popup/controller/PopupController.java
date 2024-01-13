package com.todaypopup.todaypopup.domain.popup.controller;

import com.todaypopup.todaypopup.core.dto.PaginationResponseDto;
import com.todaypopup.todaypopup.domain.popup.dto.GetPopupDetailResponseDto;
import com.todaypopup.todaypopup.domain.popup.dto.GetPopupsRequestDto;
import com.todaypopup.todaypopup.domain.popup.dto.GetPopupsResponseDto;
import com.todaypopup.todaypopup.domain.popup.service.PopupService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PopupController {

  private final PopupService popupService;

  public PopupController(PopupService popupService) {
    this.popupService = popupService;
  }

  @GetMapping("/v1/popups")
  public ResponseEntity<PaginationResponseDto<GetPopupsResponseDto>> getPopups(
      @ModelAttribute GetPopupsRequestDto queryDto) throws Exception {

    PaginationResponseDto<GetPopupsResponseDto> response = this.popupService.getPopups(queryDto);

    return ResponseEntity.ok().body(response);
  }

  @GetMapping("/v1/popup/{popupId}")
  public ResponseEntity<GetPopupDetailResponseDto> getPopupDetail(
      @PathVariable Long popupId) throws Exception {

    GetPopupDetailResponseDto response = this.popupService.getPopupDetail(popupId);

    return ResponseEntity.ok().body(response);
  }

}
