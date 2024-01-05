package com.todaypopup.todaypopup.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
public class PaginationQueryDto {

  private String cursor;

  @Builder.Default
  private Integer limit = 20;

  @Builder.Default
  private String orderBy = "startDate";

  @Builder.Default
  private String order = "desc";
}
