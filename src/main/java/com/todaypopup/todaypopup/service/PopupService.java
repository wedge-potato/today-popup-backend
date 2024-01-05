package com.todaypopup.todaypopup.service;

import com.todaypopup.todaypopup.dto.GetPopupsQueryDto;
import com.todaypopup.todaypopup.dto.GetPopupsResponseDto;
import com.todaypopup.todaypopup.dto.PaginationResponseDto;

public interface PopupService {

  PaginationResponseDto<GetPopupsResponseDto> GetPopups(GetPopupsQueryDto params) throws Exception;

}
