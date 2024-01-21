package com.todaypopup.todaypopup.domain.region.service;

import com.todaypopup.todaypopup.domain.region.dto.GetRegionInfoRequestDto;
import com.todaypopup.todaypopup.domain.region.dto.GetRegionInfoResponseDto;
import java.util.List;

public interface RegionService {

  List<GetRegionInfoResponseDto> getRegionInfo(GetRegionInfoRequestDto queryDto) throws Exception;
}
