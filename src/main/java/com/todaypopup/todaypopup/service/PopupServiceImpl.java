package com.todaypopup.todaypopup.service;

import com.todaypopup.todaypopup.dto.GetPopupsQueryDto;
import com.todaypopup.todaypopup.dto.GetPopupsResponseDto;
import com.todaypopup.todaypopup.dto.PaginationInfoDto;
import com.todaypopup.todaypopup.dto.PaginationResponseDto;
import com.todaypopup.todaypopup.model.PopupEntity;
import com.todaypopup.todaypopup.repository.PopupRepository;
import com.todaypopup.todaypopup.util.CursorEncryptionUtil;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;
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
  public PaginationResponseDto<GetPopupsResponseDto> GetPopups(GetPopupsQueryDto queryDto)
      throws Exception {
    List<PopupEntity> popups = this.popupRepository.getPopups(queryDto);

    if (popups.isEmpty()) {
      return PaginationResponseDto.<GetPopupsResponseDto>builder()
          .data(convertToDtoList(popups))
          .pagination(PaginationInfoDto.builder()
              .previousCursor(queryDto.getCursor())
              .nextCursor(null)
              .hasPrevious(false)
              .hasNext(false)
              .totalCount(popups.size())
              .build())
          .build();
    }

    PopupEntity lastPopup = popups.get(popups.size() - 1);

    String nextCursorValue;
    try {
      Field orderByField = PopupEntity.class.getDeclaredField(queryDto.getOrderBy());
      orderByField.setAccessible(true);
      Object orderByValue = orderByField.get(lastPopup);

      nextCursorValue = orderByValue.toString() + "_" + lastPopup.getId().toString();
    } catch (NoSuchFieldException | IllegalAccessException e) {
      throw new Exception("Invalid orderBy field");
    }

    PaginationInfoDto pagination = PaginationInfoDto.builder()
        .previousCursor(queryDto.getCursor())
        .nextCursor(CursorEncryptionUtil.encrypt(nextCursorValue))
        .hasPrevious(!"0".equals(queryDto.getCursor()))
        .hasNext(popups.size() == queryDto.getLimit())
        .totalCount(popups.size())
        .build();

    return PaginationResponseDto.<GetPopupsResponseDto>builder()
        .data(convertToDtoList(popups))
        .pagination(pagination)
        .build();
  }

  public List<GetPopupsResponseDto> convertToDtoList(List<PopupEntity> popupEntities) {
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // or any other format

    return popupEntities.stream().map(popup -> {
      String endDateFormatted =
          popup.getEndDate() != null ? dateFormat.format(popup.getEndDate()) : null;

      String city = popup.getRegion().getCity() != null ? popup.getRegion().getCity() : null;
      String district = popup.getRegion().getDistrict() != null ? popup.getRegion().getDistrict() : null;
      String location = city + " " + district;

      return GetPopupsResponseDto.builder()
          .thumbnail(popup.getThumbnail())
          .title(popup.getTitle())
          .end_date(endDateFormatted)
          .location(location.trim())
          .build();
    }).collect(Collectors.toList());
  }
}
