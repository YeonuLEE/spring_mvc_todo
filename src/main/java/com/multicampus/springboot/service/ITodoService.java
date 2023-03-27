package com.multicampus.springboot.service;


import com.multicampus.springboot.dto.PageRequestDTO;
import com.multicampus.springboot.dto.PageResponseDTO;
import com.multicampus.springboot.dto.TodoDTO;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ITodoService {
    List<TodoDTO> selectAll();
    TodoDTO view(String tno);
    int insert(TodoDTO todoDTO);
    int modify(TodoDTO todoDTO);
    int remove(String tno);
    PageResponseDTO <TodoDTO> search(PageRequestDTO pageRequestDTO);
    PageResponseDTO <TodoDTO> getList(PageRequestDTO pageRequestDTO);
}
