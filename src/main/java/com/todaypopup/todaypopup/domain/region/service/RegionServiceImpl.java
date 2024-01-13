package com.todaypopup.todaypopup.domain.region.service;

import com.todaypopup.todaypopup.domain.region.dto.GetRegionInfoRequestDto;
import com.todaypopup.todaypopup.domain.region.dto.GetRegionInfoResponseDto;
import com.todaypopup.todaypopup.domain.region.repository.RegionRepository;
import org.springframework.stereotype.Service;

@Service
public class RegionServiceImpl implements RegionService {

  private final RegionRepository regionRepository;

  public RegionServiceImpl(RegionRepository regionRepository) {
    this.regionRepository = regionRepository;
  }

  @Override
  public GetRegionInfoResponseDto getRegionInfo(GetRegionInfoRequestDto queryDto) throws Exception {
    if (queryDto.getRegionId() == null) {
      return GetRegionInfoResponseDto.builder()
          .regionList(this.regionRepository.findAll())
          .build();
    }

    return GetRegionInfoResponseDto.builder()
        .region(this.regionRepository.findById(queryDto.getRegionId()))
        .build();
  }
}
