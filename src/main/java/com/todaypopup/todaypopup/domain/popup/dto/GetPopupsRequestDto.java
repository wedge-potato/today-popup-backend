package com.todaypopup.todaypopup.domain.popup.dto;

import com.todaypopup.todaypopup.core.dto.PaginationQueryDto;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@EqualsAndHashCode(callSuper = true)
@SuperBuilder
@NoArgsConstructor
public class GetPopupsRequestDto extends PaginationQueryDto {

  private Integer category;
  private Integer sidoId;
  private Integer sigunguId;

}
