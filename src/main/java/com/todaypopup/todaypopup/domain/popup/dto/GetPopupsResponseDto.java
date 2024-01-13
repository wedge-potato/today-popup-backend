package com.todaypopup.todaypopup.domain.popup.dto;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GetPopupsResponseDto {

  private String thumbnail;
  private String title;
  private String startDate;
  private String endDate;
  private String sido;
  private String sigungu;
  private String category;
}
