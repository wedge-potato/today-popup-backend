package com.todaypopup.todaypopup.domain.popup.repository;

import com.todaypopup.todaypopup.core.model.PopupEntity;
import com.todaypopup.todaypopup.core.util.CursorEncryptionUtil;
import com.todaypopup.todaypopup.domain.popup.dto.GetPopupsRequestDto;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Order;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class PopupRepositoryImpl implements PopupRepositoryCustom {

  private final EntityManager em;

  public PopupRepositoryImpl(EntityManager em) {
    this.em = em;
  }

  public List<PopupEntity> getPopups(GetPopupsRequestDto queryDto) throws Exception {
    CriteriaBuilder cb = em.getCriteriaBuilder();
    CriteriaQuery<PopupEntity> cq = cb.createQuery(PopupEntity.class);
    Root<PopupEntity> popup = cq.from(PopupEntity.class);
    List<Predicate> predicates = new ArrayList<>();

    if (queryDto.getCategory() != null) {
      predicates.add(cb.equal(popup.get("category").get("id"), queryDto.getCategory()));
    }
    if (queryDto.getRegion() != null) {
      predicates.add(cb.equal(popup.get("region").get("id"), queryDto.getRegion()));
    }

    // Cursor
    if (queryDto.getCursor() != null) {
      String cursor = CursorEncryptionUtil.decrypt(queryDto.getCursor());
      String firstCursorStr = cursor.split("_")[0];
      String secondCursor = cursor.split("_")[1];
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      Timestamp firstCursor = new Timestamp(dateFormat.parse(firstCursorStr).getTime());

      if ("asc".equalsIgnoreCase(queryDto.getOrder())) {
        predicates.add(
            cb.or(
                cb.greaterThan(popup.get(queryDto.getOrderBy()), firstCursor),
                cb.and(
                    cb.equal(popup.get(queryDto.getOrderBy()), firstCursor),
                    cb.greaterThan(popup.get("id"), secondCursor)
                )
            )
        );
      } else if ("desc".equalsIgnoreCase(queryDto.getOrder())) {
        predicates.add(
            cb.or(
                cb.lessThan(popup.get(queryDto.getOrderBy()), firstCursor),
                cb.and(
                    cb.equal(popup.get(queryDto.getOrderBy()), firstCursor),
                    cb.lessThan(popup.get("id"), secondCursor)
                )
            )
        );
      }
    }

    cq.where(predicates.toArray(new Predicate[0]));

    // Ordering
    List<Order> orderList = new ArrayList<>();
    if ("asc".equalsIgnoreCase(queryDto.getOrder())) {
      orderList.add(cb.asc(popup.get(queryDto.getOrderBy())));
      orderList.add(cb.asc(popup.get("id")));
    } else if ("desc".equalsIgnoreCase(queryDto.getOrder())) {
      orderList.add(cb.desc(popup.get(queryDto.getOrderBy())));
      orderList.add(cb.desc(popup.get("id")));
    }
    cq.orderBy(orderList);

    return em.createQuery(cq)
        .setMaxResults(queryDto.getLimit())
        .getResultList();
  }
}
