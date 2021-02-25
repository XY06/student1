package com.suyike.controller;

import com.alibaba.fastjson.JSON;
import com.suyike.bean.user;
import com.suyike.page.ResultMsg;
import com.suyike.service.suyikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
public class suyikeController {

    @Autowired
    private suyikeService suyikeService;

    @RequestMapping("index")
    public String  index(){
        return "index";
    }

    @RequestMapping("zhuce")
    public String zhuce(){
        return "zhuce";
    }

    @RequestMapping("zhuce1")
    @ResponseBody
    public boolean zhuce1(user user){
        Date date =new Date();
        user.setAdddate(date);
        suyikeService.addUser(user);
        return true;
    }

    @RequestMapping("denglu")
    public String denglu(){
        return "denglu";
    }


    @RequestMapping("denglu1")
    @ResponseBody
    public boolean denglu1(user user){

        String password = suyikeService.selectbyUser(user.getUser()).getPassword();
        if (password!=null&&password.equals(user.getPassword())){
            return true;
        }
        return false;
    }

    @RequestMapping("list")
    public ModelAndView list(){
        List list = suyikeService.list();
        ModelAndView mv = new ModelAndView();
        mv.addObject("list",list);
        mv.setViewName("list");
        return mv;
    }

    @RequestMapping("list1")
    @ResponseBody
    public String list1(){
        List list = suyikeService.list();
        ResultMsg msg = new ResultMsg(200,"success");
        msg.getExtenal().put("list",list);
        return JSON.toJSONString(msg);
    }
    @RequestMapping("guanyu")
    public String guanyu(){
        return "guanyu";
    }

}
