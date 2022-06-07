package com.xzh.wechat.openFeign;

import com.xzh.common.pojo.Member;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

@FeignClient(name = "Service", path = "Service/member")
public interface MemberFeign {

    // 根据手机号查询会员
    @GetMapping("findByTelephone/{telephone}")
    Member findByTelephone(@PathVariable("telephone") String telephone);

    // 根据手机号密码查询会员（登录用）
    @GetMapping("findByTelephoneAndPassword/{telephone}/{password}")
    Member findByTelephoneAndPassword(@PathVariable("telephone") String telephone, @PathVariable("password") String password);

    // 新增会员
    @PostMapping("add")
    void add(@RequestBody Member member);

    // 修改会员信息
    @PutMapping("editMember")
    void editMember(@RequestBody Member member);

}
