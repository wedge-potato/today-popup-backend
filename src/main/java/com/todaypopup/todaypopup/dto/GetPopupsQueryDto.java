package com.todaypopup.todaypopup.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter // Mapstruct를 위해 추가, 로직/테스트를 위해 추가
@Setter // @ModelAttribute를 위해 추가
@Builder // (선택) Mapstruct를 위해 추가, 테스트를 위해 추가
@AllArgsConstructor // @ModelAttribute를 위해 추가, @Builder를 위해 추가
public class GetPopupsQueryDto {

  private Integer category;
  private Integer city;
  private Integer district;
  private String cursor;
  private Integer limit;
  private String orderBy;

  public GetPopupsQueryDto() {
    this.limit = 20;
    this.orderBy = "start_date";
  }
}
