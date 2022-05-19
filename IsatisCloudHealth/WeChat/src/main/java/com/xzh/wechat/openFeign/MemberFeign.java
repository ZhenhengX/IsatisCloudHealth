package com.xzh.wechat.openFeign;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Member;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@FeignClient(name = "Service", path = "Service/member")
public interface MemberFeign {

    //根据手机号查询会员
    @GetMapping("findByTelephone/{telephone}")
    Member findByTelephone(@PathVariable("telephone") String telephone);

    // 根据手机号密码查询会员（登录用）
    @GetMapping("findByTelephoneAndPassword/{telephone}/{password}")
    Member findByTelephoneAndPassword(@PathVariable("telephone") String telephone, @PathVariable("password") String password);

    //新增会员
    @PostMapping("add")
    void add(@RequestBody Member member);

    //根据月份查询会员数量
    @GetMapping("findMemberCountByMonths")
    List<Integer> findMemberCountByMonths(@RequestBody List<String> months);

    //分页查询
    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    //查询健康管理师
    @GetMapping("findHealthManager")
    List<Map<String, Object>> findHealthManager();

    //添加会员
    @PostMapping("addMember")
    void addMember(@RequestBody Member member);

    //根据id查询会员
    @GetMapping("findMemberById/{memberId}")
    Member findMemberById(@PathVariable("memberId") Integer memberId);

    //修改会员
    @PutMapping("editMember")
    void editMember(@RequestBody Member member);

    //删除会员
    @DeleteMapping("deleteMember/{id}")
    Result deleteMember(@PathVariable("id") Integer id);

    //根据会员id查询所有关联信息
    @GetMapping("findAllmessageById/{id}")
    List<String> findAllmessageById(@PathVariable("id") Integer id);

    @GetMapping("findByEmailAndPwd/{email}/{md5_password}")
    Member findByEmailAndPwd(@PathVariable("email") String email, @PathVariable("md5_password") String md5_password);

    @PutMapping("editEmail")
    void editEmail(@RequestBody Member member);

    @PutMapping("editPhoneNumber")
    void editPhoneNumber(@RequestBody Member member);

    @PutMapping("editPassword")
    void editPassword(@RequestBody Member member);

}
