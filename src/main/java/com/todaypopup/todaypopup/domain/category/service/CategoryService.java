package com.todaypopup.todaypopup.domain.category.service;

import com.todaypopup.todaypopup.domain.category.dto.GetCategoryInfoRequestDto;
import com.todaypopup.todaypopup.domain.category.dto.GetCategoryInfoResponseDto;

public interface CategoryService {

  GetCategoryInfoResponseDto GetCategoryInfo(GetCategoryInfoRequestDto queryDto) throws Exception;
}
