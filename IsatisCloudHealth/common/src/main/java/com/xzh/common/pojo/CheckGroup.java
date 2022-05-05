package com.xzh.common.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 检查组
 */
@Data
public class CheckGroup implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;//主键
    private String code;//编码
    private String name;//名称
    @TableField("helpCode")
    private String helpCode;//助记
    private String sex;//适用性别
    private String remark;//介绍
    private String attention;//注意事项
    @TableField(exist = false)
    private List<CheckItem> checkItems;//一个检查组合包含多个检查项
}
