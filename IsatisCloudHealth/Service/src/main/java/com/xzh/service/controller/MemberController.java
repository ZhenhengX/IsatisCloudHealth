package com.xzh.service.controller;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Member;
import com.xzh.service.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("Service/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    //根据手机号查询会员
    @GetMapping("findByTelephone/{telephone}")
    public Member findByTelephone(@PathVariable String telephone) {
        return memberService.findByTelephone(telephone);
    }

    //新增会员
    @PostMapping("add")
    public void add(@RequestBody Member member) {
        memberService.add(member);
    }

    //根据月份查询会员数量
    @GetMapping("findMemberCountByMonths")
    public List<Integer> findMemberCountByMonths(@RequestBody List<String> months) {
        return memberService.findMemberCountByMonths(months);
    }

    //分页查询
    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return memberService.findPage(queryPageBean);
    }

    //查询健康管理师
    @GetMapping("findHealthManager")
    public List<Map<String, Object>> findHealthManager() {
        return memberService.findHealthManager();
    }

    //添加会员
    @PostMapping("addMember")
    public void addMember(@RequestBody Member member) {
        memberService.addMember(member);
    }

    //根据id查询会员
    @GetMapping("findMemberById/{memberId}")
    public Member findMemberById(@PathVariable Integer memberId) {
        return memberService.findMemberById(memberId);
    }

    //修改会员
    @PutMapping("editMember")
    public void editMember(@RequestBody Member member) {
        memberService.editMember(member);
    }

    //删除会员
    @DeleteMapping("deleteMember/{id}")
    public Result deleteMember(@PathVariable Integer id) {
        return memberService.deleteMember(id);
    }

    //根据会员id查询所有关联信息
    @GetMapping("findAllmessageById/{id}")
    public List<String> findAllmessageById(@PathVariable Integer id) {
        return memberService.findAllmessageById(id);
    }

    @GetMapping("findByEmailAndPwd/{email}/{md5_password}")
    public Member findByEmailAndPwd(@PathVariable String email, @PathVariable String md5_password) {
        return memberService.findByEmailAndPwd(email, md5_password);
    }

    @PutMapping("editEmail")
    public void editEmail(@RequestBody Member member) {
        memberService.editEmail(member);
    }

    @PutMapping("editPhoneNumber")
    public void editPhoneNumber(@RequestBody Member member) {
        memberService.editPhoneNumber(member);
    }

    @PutMapping("editPassword")
    public void editPassword(@RequestBody Member member) {
        memberService.editPassword(member);
    }

}
