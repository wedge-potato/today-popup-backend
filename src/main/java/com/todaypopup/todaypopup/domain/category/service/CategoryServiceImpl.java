package com.todaypopup.todaypopup.domain.category.service;

import com.todaypopup.todaypopup.domain.category.dto.GetCategoryInfoRequestDto;
import com.todaypopup.todaypopup.domain.category.dto.GetCategoryInfoResponseDto;
import com.todaypopup.todaypopup.domain.category.repository.CategoryRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

  private final CategoryRepository categoryRepository;

  public CategoryServiceImpl(CategoryRepository categoryRepository) {
    this.categoryRepository = categoryRepository;
  }

  @Override
  public GetCategoryInfoResponseDto GetCategoryInfo(GetCategoryInfoRequestDto queryDto) {
    if (queryDto.getCategoryId() == null) {
      return GetCategoryInfoResponseDto.builder()
          .categoryList(this.categoryRepository.findAll())
          .build();
    }

    return GetCategoryInfoResponseDto.builder()
        .category(this.categoryRepository.findById(queryDto.getCategoryId()))
        .build();
  }

}
