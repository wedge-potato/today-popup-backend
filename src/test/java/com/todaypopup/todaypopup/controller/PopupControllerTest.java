package com.todaypopup.todaypopup.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.todaypopup.todaypopup.domain.popup.controller.PopupController;
import org.apache.catalina.security.SecurityConfig;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

/**
 * @WebMvcTest - JPA 기능은 동작하지 않는다. - 여러 스프링 테스트 어노테이션 중, Web(Spring MVC)에만 집중할 수 있는 어노테이션 -
 * @Controller, @ControllerAdvice 사용 가능 - 단, @Service, @Repository등은 사용할 수 없다.
 */
@WebMvcTest(value = {PopupController.class},
    excludeFilters = {
        @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = SecurityConfig.class)
    }
)
@AutoConfigureMockMvc(addFilters = false)
public class PopupControllerTest {

  @Autowired
  private MockMvc mockMvc;

  @Test
  @DisplayName("Get Popup List Dto Test")
  public void GetPopupListDtoTest() throws Exception {
    int category = 1;
    int city = 1;
    int district = 1;
    String cursor = "cursor";
    int limit = 20;
    String orderBy = "start_date";

    //given
    MultiValueMap<String, String> query = new LinkedMultiValueMap<>();
    query.add("category", String.valueOf(category));
    query.add("city", String.valueOf(city));
    query.add("district", String.valueOf(district));
    query.add("cursor", cursor);
    query.add("limit", String.valueOf(limit));
    query.add("orderBy", orderBy);

    //when
    ResultActions actions = mockMvc.perform(get("/v1/popups").queryParams(query));

    //then
    actions.andExpect(status().isOk()) //200 상태
        .andExpect(jsonPath("$.category").value(category))
        .andExpect(jsonPath("$.city").value(city))
        .andExpect(jsonPath("$.district").value(district))
        .andExpect(jsonPath("$.cursor").value(cursor))
        .andExpect(jsonPath("$.limit").value(limit))
        .andExpect(jsonPath("$.orderBy").value(orderBy));
  }
}
