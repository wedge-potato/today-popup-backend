package com.todaypopup.todaypopup.domain.region.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
public class GetRegionInfoRequestDto {

  private Long regionId;
}
