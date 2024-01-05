package com.todaypopup.todaypopup.repository;

import com.todaypopup.todaypopup.dto.GetPopupsQueryDto;
import com.todaypopup.todaypopup.model.PopupEntity;
import java.util.List;

public interface PopupRepository {

  List<PopupEntity> getPopups(GetPopupsQueryDto queryDto) throws Exception;
}
