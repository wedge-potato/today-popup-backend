package com.todaypopup.todaypopup.domain.popup.service;

import com.todaypopup.todaypopup.core.dto.PaginationInfoDto;
import com.todaypopup.todaypopup.core.dto.PaginationResponseDto;
import com.todaypopup.todaypopup.core.model.ImageEntity;
import com.todaypopup.todaypopup.core.model.PopupEntity;
import com.todaypopup.todaypopup.core.util.CursorEncryptionUtil;
import com.todaypopup.todaypopup.core.util.DateUtil;
import com.todaypopup.todaypopup.domain.popup.dto.GetPopupDetailResponseDto;
import com.todaypopup.todaypopup.domain.popup.dto.GetPopupsRequestDto;
import com.todaypopup.todaypopup.domain.popup.dto.GetPopupsResponseDto;
import com.todaypopup.todaypopup.domain.popup.dto.LocationDto;
import com.todaypopup.todaypopup.domain.popup.repository.ImageRepository;
import com.todaypopup.todaypopup.domain.popup.repository.PopupRepository;
import com.todaypopup.todaypopup.domain.popup.repository.PopupRepositoryCustom;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PopupServiceImpl implements PopupService {

  private final PopupRepository popupRepository;
  private final PopupRepositoryCustom popupRepositoryCustom;
  private final ImageRepository imageRepository;


  public PopupServiceImpl(PopupRepository popupRepository,
      PopupRepositoryCustom popupRepositoryCustom, ImageRepository imageRepository) {
    this.popupRepository = popupRepository;
    this.popupRepositoryCustom = popupRepositoryCustom;
    this.imageRepository = imageRepository;
  }

  @Override
  public PaginationResponseDto<GetPopupsResponseDto> getPopups(GetPopupsRequestDto queryDto)
      throws Exception {
    List<PopupEntity> popups = popupRepositoryCustom.getPopups(queryDto);

    if (popups.isEmpty()) {
      return emptyPaginationResponseDto(queryDto);
    }

    String nextCursorValue = getNextCursorValue(popups, queryDto);

    PaginationInfoDto pagination = PaginationInfoDto.builder()
        .previousCursor(queryDto.getCursor())
        .nextCursor(CursorEncryptionUtil.encrypt(nextCursorValue))
        .hasPrevious(queryDto.getCursor() != null)
        .hasNext(popups.size() == queryDto.getLimit())
        .totalCount(popups.size())
        .build();

    return PaginationResponseDto.<GetPopupsResponseDto>builder()
        .data(convertToDtoList(popups))
        .pagination(pagination)
        .build();
  }

  @Override
  public GetPopupDetailResponseDto getPopupDetail(Long popupId) throws Exception {
    Optional<PopupEntity> popupOptional = popupRepository.findById(popupId);

    if (popupOptional.isEmpty()) {
      throw new IllegalArgumentException("Invalid popupId");
    }

    PopupEntity popup = popupOptional.get();

    List<String> imageUrls = popup.getImages().stream()
        .map(ImageEntity::getUrl)
        .collect(Collectors.toList());

    LocationDto location = LocationDto.builder()
        .address(popup.getPopupInfo().getAddress())
        .lat(popup.getPopupInfo().getLat())
        .lng(popup.getPopupInfo().getLng())
        .build();

    return GetPopupDetailResponseDto.builder()
        .images(imageUrls)
        .category(popup.getCategory().getName())
        .title(popup.getTitle())
        .startDate(DateUtil.parseDateToDateOnly(popup.getStartDate()))
        .endDate(DateUtil.parseDateToDateOnly(popup.getEndDate()))
        .startTime(DateUtil.parseDateToTimeOnly(popup.getPopupInfo().getStartTime()))
        .endTime(DateUtil.parseDateToTimeOnly(popup.getPopupInfo().getEndTime()))
        .urlLink(popup.getPopupInfo().getUrlLink())
        .introduction(popup.getPopupInfo().getIntroduction())
        .sido(popup.getSido().getName())
        .sigungu(popup.getSigungu().getName())
        .location(location)
        .build();
  }

  private PaginationResponseDto<GetPopupsResponseDto> emptyPaginationResponseDto(
      GetPopupsRequestDto queryDto) {
    return PaginationResponseDto.<GetPopupsResponseDto>builder()
        .data(Collections.emptyList())
        .pagination(PaginationInfoDto.builder()
            .previousCursor(queryDto.getCursor())
            .nextCursor(null)
            .hasPrevious(false)
            .hasNext(false)
            .totalCount(0)
            .build())
        .build();
  }

  private String getNextCursorValue(List<PopupEntity> popups, GetPopupsRequestDto queryDto) {
    PopupEntity lastPopup = popups.get(popups.size() - 1);
    try {
      Field orderByField = PopupEntity.class.getDeclaredField(queryDto.getOrderBy());
      orderByField.setAccessible(true);
      Object orderByValue = orderByField.get(lastPopup);
      return orderByValue.toString() + "_" + lastPopup.getId().toString();
    } catch (NoSuchFieldException | IllegalAccessException e) {
      throw new IllegalArgumentException("Invalid orderBy field", e);
    }
  }

  public List<GetPopupsResponseDto> convertToDtoList(List<PopupEntity> popupEntities) {
    return popupEntities.stream().map(popup -> GetPopupsResponseDto.builder()
        .id(popup.getId())
        .thumbnail(popup.getThumbnail())
        .title(popup.getTitle())
        .startDate(DateUtil.parseDateToDateOnly(popup.getStartDate()))
        .endDate(DateUtil.parseDateToDateOnly(popup.getEndDate()))
        .sido(popup.getSido().getName())
        .sigungu(popup.getSigungu().getName())
        .category(popup.getCategory().getName())
        .build()).collect(Collectors.toList());
  }
}
