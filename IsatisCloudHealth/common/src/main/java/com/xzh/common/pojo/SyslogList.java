package com.xzh.common.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class SyslogList implements Serializable {
    private List<Syslog> syslogList;
}
