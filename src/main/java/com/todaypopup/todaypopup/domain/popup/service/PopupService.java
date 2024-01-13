package com.todaypopup.todaypopup.domain.popup.service;

import com.todaypopup.todaypopup.core.dto.PaginationResponseDto;
import com.todaypopup.todaypopup.domain.popup.dto.GetPopupDetailResponseDto;
import com.todaypopup.todaypopup.domain.popup.dto.GetPopupsRequestDto;
import com.todaypopup.todaypopup.domain.popup.dto.GetPopupsResponseDto;

public interface PopupService {

  PaginationResponseDto<GetPopupsResponseDto> getPopups(GetPopupsRequestDto params)
      throws Exception;

  GetPopupDetailResponseDto getPopupDetail(Long popupId) throws Exception;
}
