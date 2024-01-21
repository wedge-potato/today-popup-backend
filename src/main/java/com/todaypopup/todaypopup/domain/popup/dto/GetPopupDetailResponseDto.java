package com.todaypopup.todaypopup.domain.popup.dto;

import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GetPopupDetailResponseDto {

  private List<String> images;
  private String category;
  private String title;
  private String startDate;
  private String endDate;
  private String startTime;
  private String endTime;
  private String urlLink;
  private String introduction;
  private String sido;
  private String sigungu;
  private LocationDto location;

}
