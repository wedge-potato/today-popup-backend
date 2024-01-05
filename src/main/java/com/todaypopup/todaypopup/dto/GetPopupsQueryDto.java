package com.todaypopup.todaypopup.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
public class GetPopupsQueryDto extends PaginationQueryDto {

  private Integer category;
  private Integer region;

}
