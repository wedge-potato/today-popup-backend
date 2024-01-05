package com.todaypopup.todaypopup.dto;

import lombok.Builder;
import lombok.Data;


@Data
@Builder
public class PaginationInfoDto {

  private String previousCursor;
  private String nextCursor;
  private Boolean hasPrevious;
  private Boolean hasNext;
  private Integer totalCount;

}
