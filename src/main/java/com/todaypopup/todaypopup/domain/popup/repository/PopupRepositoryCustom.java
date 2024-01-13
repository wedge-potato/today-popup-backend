package com.todaypopup.todaypopup.domain.popup.repository;

import com.todaypopup.todaypopup.core.model.PopupEntity;
import com.todaypopup.todaypopup.domain.popup.dto.GetPopupsRequestDto;
import java.util.List;

public interface PopupRepositoryCustom {

  List<PopupEntity> getPopups(GetPopupsRequestDto queryDto) throws Exception;

}
