package com.todaypopup.todaypopup.domain.region.service;

import com.todaypopup.todaypopup.domain.region.dto.GetRegionInfoRequestDto;
import com.todaypopup.todaypopup.domain.region.dto.GetRegionInfoResponseDto;

public interface RegionService {

  GetRegionInfoResponseDto getRegionInfo(GetRegionInfoRequestDto queryDto) throws Exception;
}
