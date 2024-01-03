package com.todaypopup.todaypopup.service;

import com.todaypopup.todaypopup.dto.GetPopupsQueryDto;
import com.todaypopup.todaypopup.repository.PopupRepository;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class PopupServiceImpl implements PopupService {

  private final PopupRepository popupRepository;

  public PopupServiceImpl(PopupRepository popupRepository) {
    this.popupRepository = popupRepository;
  }

  @Override
  public List<String> GetPopups(GetPopupsQueryDto params) {
    return null;
  }
}
