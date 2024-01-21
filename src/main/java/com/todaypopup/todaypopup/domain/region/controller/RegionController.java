package com.todaypopup.todaypopup.domain.region.controller;

import com.todaypopup.todaypopup.domain.region.dto.GetRegionInfoRequestDto;
import com.todaypopup.todaypopup.domain.region.dto.GetRegionInfoResponseDto;
import com.todaypopup.todaypopup.domain.region.service.RegionService;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RegionController {

  private final RegionService regionService;

  public RegionController(RegionService regionService) {
    this.regionService = regionService;
  }

  @GetMapping("/v1/region")
  public ResponseEntity<List<GetRegionInfoResponseDto>> getRegionInfo(
      @ModelAttribute GetRegionInfoRequestDto queryDto) throws Exception {

    List<GetRegionInfoResponseDto> response = this.regionService.getRegionInfo(queryDto);

    return ResponseEntity.ok().body(response);
  }
}
