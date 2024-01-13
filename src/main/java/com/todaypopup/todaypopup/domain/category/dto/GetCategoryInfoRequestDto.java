package com.todaypopup.todaypopup.domain.category.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
public class GetCategoryInfoRequestDto {

  private Long categoryId;
}

