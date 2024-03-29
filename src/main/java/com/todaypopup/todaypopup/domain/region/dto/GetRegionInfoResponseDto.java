package com.todaypopup.todaypopup.domain.region.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class GetRegionInfoResponseDto {

  private Long sidoId;
  private String sidoName;
  private List<SigunguDto> sigunguList;
}
