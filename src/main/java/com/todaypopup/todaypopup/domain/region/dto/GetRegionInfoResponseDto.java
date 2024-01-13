package com.todaypopup.todaypopup.domain.region.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.todaypopup.todaypopup.core.model.RegionEntity;
import java.util.List;
import java.util.Optional;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class GetRegionInfoResponseDto {

  private List<RegionEntity> regionList;
  private Optional<RegionEntity> region;
}
