package com.multicampus.springboot.dao;

import com.multicampus.springboot.dto.PageRequestDTO;
import com.multicampus.springboot.dto.TodoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ITodoDAO {
    List<TodoDTO> selectAllDAO();
    int insertDAO(TodoDTO todoDTO);
    TodoDTO viewDAO(String tno);
    int modifyDAO(TodoDTO todoDTO);
    int removeDAO(String tno);
    List<TodoDTO> searchDAO(PageRequestDTO pageRequestDTO);
    List<TodoDTO> selectList(PageRequestDTO pageRequestDTO);
    int getCount(PageRequestDTO pageRequestDTO);
    int searchCount(PageRequestDTO pageRequestDTO);
}
