package com.todaypopup.todaypopup.dto;

import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PaginationResponseDto<T> {

  private List<T> data;

  private PaginationInfoDto pagination;
}
