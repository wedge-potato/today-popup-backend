package com.todaypopup.todaypopup.service;

import com.todaypopup.todaypopup.dto.GetPopupsQueryDto;
import java.util.List;

public interface PopupService {

  List<String> GetPopups(GetPopupsQueryDto params);

}
