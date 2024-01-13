package com.todaypopup.todaypopup.domain.category.repository;

import com.todaypopup.todaypopup.core.model.CategoryEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {

  @Override
  List<CategoryEntity> findAll();

  @Override
  Optional<CategoryEntity> findById(Long aLong);
}
