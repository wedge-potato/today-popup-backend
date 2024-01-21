package com.todaypopup.todaypopup.domain.region.service;

import com.todaypopup.todaypopup.core.model.SidoEntity;
import com.todaypopup.todaypopup.domain.region.dto.GetRegionInfoRequestDto;
import com.todaypopup.todaypopup.domain.region.dto.GetRegionInfoResponseDto;
import com.todaypopup.todaypopup.domain.region.dto.SigunguDto;
import com.todaypopup.todaypopup.domain.region.repository.SidoRepository;
import com.todaypopup.todaypopup.domain.region.repository.SigunguRepository;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;

@Service
public class RegionServiceImpl implements RegionService {

  private final SidoRepository sidoRepository;
  private final SigunguRepository sigunguRepository;

  public RegionServiceImpl(SidoRepository sidoRepository, SigunguRepository sigunguRepository) {
    this.sidoRepository = sidoRepository;
    this.sigunguRepository = sigunguRepository;
  }

  @Override
  public List<GetRegionInfoResponseDto> getRegionInfo(GetRegionInfoRequestDto queryDto) throws Exception {
    if (queryDto.getSidoId() == null) {
      List<SidoEntity> sidoList = this.sidoRepository.findAll();

      if (sidoList.isEmpty()) {
        throw new Exception("존재하지 않는 시도입니다.");
      }

      return sidoList.stream()
          .map(sido -> GetRegionInfoResponseDto.builder()
              .sidoId(sido.getId())
              .sidoName(sido.getName())
              .build())
          .toList();
    }

    Optional<SidoEntity> sido = this.sidoRepository.findById(queryDto.getSidoId());

    if (sido.isEmpty()) {
      throw new Exception("존재하지 않는 시도입니다.");
    }

    List<SigunguDto> sigunguList = this.sigunguRepository.findBySidoId(sido.get().getId()).stream()
        .map(sigungu -> SigunguDto.builder()
            .sigunguId(sigungu.getId())
            .sigunguName(sigungu.getName())
            .build())
        .toList();

    GetRegionInfoResponseDto responseDto = GetRegionInfoResponseDto.builder()
        .sidoId(sido.get().getId())
        .sidoName(sido.get().getName())
        .sigunguList(sigunguList)
        .build();

    return Collections.singletonList(responseDto);
  }
}
