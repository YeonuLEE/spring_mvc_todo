가package com.multicampus.springboot.service;

import com.multicampus.springboot.dao.ITodoDAO;
import com.multicampus.springboot.dto.TodoDTO;
import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Nested
class TodoServiceTest {

    @Autowired
    ITodoService service;

    @DisplayName("Nested test")
    @Nested
    class Test_Nested {
        @DisplayName("전체 글 목록 가져오기")
        @RepeatedTest(value = 10)
        void selectAll() {
            List<TodoDTO> list = service.selectAll();
            Assertions.assertNotNull(list);
        }
        @DisplayName("글 상세보기 테스트")
        @ParameterizedTest
        @CsvSource(value = {"11", "12", "13", "60", "55", "33"})
        void view(String tno) {
            //given
            TodoDTO todoDTO = service.view(tno);
//        String tno = "10";
            Assertions.assertNotNull(todoDTO);
//        assertThat(todoDTO.getTitle()).isEqualTo("test10");
        }
    }

    @Test
    void insert() {
    }

    @Test
    void modify() {
    }

    @Test
    void remove() {
    }

    @Test
    void search() {
    }

    @Test
    void getList() {
    }
}