package com.multicampus.springboot.controller;

import com.multicampus.springboot.dto.PageRequestDTO;
import com.multicampus.springboot.dto.TodoDTO;
import com.multicampus.springboot.service.ITodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class MyController {

    @Autowired
    ITodoService service;

    @RequestMapping("/")
    public @ResponseBody String root() throws Exception {
        return "redirect:list";
    }

    @GetMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, Model model){
        model.addAttribute("todoList",service.getList(pageRequestDTO));
    }

    @GetMapping("/view")
    public String view(Model model, @RequestParam("tno") String tno, HttpServletRequest req){
        model.addAttribute("dto",service.view(tno));
        return "view";
    }

    @GetMapping("/register")
    public String register(){
        return "register";
    }

    @PostMapping("/register/process")
    public String registerProcess(TodoDTO dto){
        int nResult = service.insert(dto);
        System.out.println("결과 : " + nResult);
        return "redirect:../list";
    }

    @GetMapping("/modify")
    public String modify(Model model, @RequestParam("tno") String tno){
        model.addAttribute("dto",service.view(tno));
        return "modify";
    }

    @PostMapping("/modify/process")
    public String modifyProcess(Model model, TodoDTO todoDTO){

        if(todoDTO.getFinished() == null){
            todoDTO.setFinished("0");
        }else {
            todoDTO.setFinished("1");
        }
        int nResult = service.modify(todoDTO);
        System.out.println("결과 : " + nResult);
        return "redirect:../list";
    }

    @GetMapping("/remove")
    public String remove(@RequestParam("tno") String tno){
        int nResult = service.remove(tno);
        System.out.println("결과 : " + nResult);
        return "redirect:list";
    }

    @GetMapping("/search")
    public String search(Model model, PageRequestDTO pageRequestDTO){
        model.addAttribute("todoList", service.search(pageRequestDTO));
        return "list";
    }
}