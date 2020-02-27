package test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class test {
    @RequestMapping("test")
    @ResponseBody
    public  String  test(){
        return "Hello";
    }
}
