package com.todaypopup.todaypopup.domain.region.repository;

import com.todaypopup.todaypopup.core.model.SigunguEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SigunguRepository extends JpaRepository<SigunguEntity, Long> {
  List<SigunguEntity> findBySidoId(Long sidoId);

}
