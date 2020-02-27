package com.chenjiahao.rouge.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class JsonUtil {
    /**
     * 序列化成json格式
     * @param obj
     * @return
     */
    public static String toJson(Object obj) {
        //映射对象
        ObjectMapper objectMapper = new ObjectMapper();
        String json = null;
        try {
            json = objectMapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return json;
    }
    /**
     * 反序列化json
     * @param json
     * @param valueType
     * @return
     */
    public static <T> Object toObject(String json,Class<T> valueType) {
        //对象映射器
        ObjectMapper oMapper=new ObjectMapper();
        T obj=null;
        try {
            obj=oMapper.readValue(json,valueType);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return obj;
    }


    //时间转换
    public static Date timeSwitch(String date) {
        Date myDate = null;
        Timestamp dateTime = null;
        try {
            DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
            myDate = dateFormat2.parse(date);
            dateTime = new Timestamp(myDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return dateTime;
    }

    //首字母转小写
    public static String toLowerCaseFirstOne(String s) {
        if (Character.isLowerCase(s.charAt(0)))
            return s;
        else
            return (new StringBuilder()).append(Character.toLowerCase(s.charAt(0))).append(s.substring(1)).toString();
    }

    //首字母转大写
    public static String toUpperCaseFirstOne(String s) {
        if (Character.isUpperCase(s.charAt(0)))
            return s;
        else
            return (new StringBuilder()).append(Character.toUpperCase(s.charAt(0))).append(s.substring(1)).toString();
    }
}
