package com.todaypopup.todaypopup.domain.category.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.todaypopup.todaypopup.core.model.CategoryEntity;
import java.util.List;
import java.util.Optional;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class GetCategoryInfoResponseDto {

  private List<CategoryEntity> categoryList;
  private Optional<CategoryEntity> category;

}
