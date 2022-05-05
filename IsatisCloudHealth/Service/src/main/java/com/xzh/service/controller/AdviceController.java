package com.xzh.service.controller;

import com.xzh.common.dto.AdviceDTO;
import com.xzh.service.service.AdviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("Service/advice")
public class AdviceController {

    @Autowired
    private AdviceService adviceService;

    @PostMapping("add")
    public void add(@RequestBody AdviceDTO adviceDTO) {
        adviceService.add(adviceDTO.getTempOrderId(), adviceDTO.getFoodIds(), adviceDTO.getSportIds(), adviceDTO.getUsername(), adviceDTO.getSuggestion());
    }

}
