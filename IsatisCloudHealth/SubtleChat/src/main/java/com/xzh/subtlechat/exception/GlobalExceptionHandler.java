package com.xzh.subtlechat.exception;

import com.xzh.subtlechat.entity.RespBean;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

/**
 * @author Zhenheng.Xie
 * @date 2020/4/27 - 19:49
 * 功能：全局异常处理类
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    /*
    处理SQLException异常
     */
    @ExceptionHandler(SQLException.class)
    public RespBean sqlExceptionHandler(SQLException e) {

        if (e instanceof SQLIntegrityConstraintViolationException) {
            return RespBean.error("该数据与其他数据存在关联，无法删除！");
        } else {
            e.printStackTrace();
            return RespBean.error("数据库异常，操作失败！");
        }
    }
}
