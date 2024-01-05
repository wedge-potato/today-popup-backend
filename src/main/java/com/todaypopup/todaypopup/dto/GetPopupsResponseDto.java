package com.todaypopup.todaypopup.dto;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GetPopupsResponseDto {

  private String thumbnail;
  private String title;
  private String end_date;
  private String location;
}
