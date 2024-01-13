package com.todaypopup.todaypopup.domain.region.repository;

import com.todaypopup.todaypopup.core.model.RegionEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegionRepository extends JpaRepository<RegionEntity, Long> {

  @Override
  List<RegionEntity> findAll();

  @Override
  Optional<RegionEntity> findById(Long regionId);
}
