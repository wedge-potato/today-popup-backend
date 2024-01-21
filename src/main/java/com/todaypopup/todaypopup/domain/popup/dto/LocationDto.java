package com.todaypopup.todaypopup.domain.popup.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class LocationDto {

  private String address;
  private String lat;
  private String lng;

}
