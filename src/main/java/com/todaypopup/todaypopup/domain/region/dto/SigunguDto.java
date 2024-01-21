package com.todaypopup.todaypopup.domain.region.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class SigunguDto {

    private Long sigunguId;
    private String sigunguName;
}
