package com.todaypopup.todaypopup.domain.popup.repository;

import com.todaypopup.todaypopup.core.model.PopupEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PopupRepository extends JpaRepository<PopupEntity, Long> {

}
