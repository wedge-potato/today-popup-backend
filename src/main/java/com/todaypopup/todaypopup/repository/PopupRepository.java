package com.todaypopup.todaypopup.repository;

import com.todaypopup.todaypopup.dto.GetPopupsQueryDto;
import java.util.List;

public interface PopupRepository {

  List<String> findAll(GetPopupsQueryDto params);

}
