package com.todaypopup.todaypopup.domain.category.controller;

import com.todaypopup.todaypopup.domain.category.dto.GetCategoryInfoRequestDto;
import com.todaypopup.todaypopup.domain.category.dto.GetCategoryInfoResponseDto;
import com.todaypopup.todaypopup.domain.category.service.CategoryService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CategoryController {

  private final CategoryService categoryService;

  public CategoryController(CategoryService categoryService) {
    this.categoryService = categoryService;
  }

  @GetMapping("/v1/category")
  public ResponseEntity<GetCategoryInfoResponseDto> getCategoryInfo(
      @ModelAttribute GetCategoryInfoRequestDto queryDto) throws Exception {

    GetCategoryInfoResponseDto response = this.categoryService.GetCategoryInfo(queryDto);

    return ResponseEntity.ok().body(response);
  }
}
