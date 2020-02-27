package com.chenjiahao.rouge.utils;

import java.io.*;

public class MySqlBackups {
    public static void main(String[] args) throws IOException {
        System.out.println(backup("D:\\Rouge\\RougeProject\\Rouge\\rouge_UI\\target\\rouge_UI\\mysqlBackup/c0cacfc4-81ff-4d32-acd7-31f3805c89ec.sql"));
//        recover("d:\\d.sql");
    }
    public static boolean backup(String path) throws IOException {
        try {
            Runtime runtime = Runtime.getRuntime();
            //-u后面是用户名，-p是密码-p后面最好不要有空格，-family是数据库的名字
            Process process = runtime.exec("mysqldump -u root -proot --default-character-set=utf8 rouge");
            InputStream inputStream = process.getInputStream();//得到输入流，写成.sql文件
            InputStreamReader reader = new InputStreamReader(inputStream);
            BufferedReader br = new BufferedReader(reader);
            String s = null;
            StringBuffer sb = new StringBuffer();
            while ((s = br.readLine()) != null) {
                sb.append(s + "\r\n");
            }
            s = sb.toString();
            System.out.println(s);
            File file = new File(path);
            file.getParentFile().mkdirs();
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            fileOutputStream.write(s.getBytes());
            fileOutputStream.close();
            br.close();
            reader.close();
            inputStream.close();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }

    }

    public static boolean recover(String path) throws IOException {
        try {
            Runtime runtime = Runtime.getRuntime();
            //-u后面是用户名，-p是密码-p后面最好不要有空格，-family是数据库的名字，--default-character-set=utf8，这句话一定的加
            //我就是因为这句话没加导致程序运行成功，但是数据库里面的内容还是以前的内容，最好写上完成的sql放到cmd中一运行才知道报错了
            //错误信息：
            //mysql: Character set 'utf-8' is not a compiled character set and is not specified in the '
            //C:\Program Files\MySQL\MySQL Server 5.5\share\charsets\Index.xml' file ERROR 2019 (HY000): Can't
            // initialize character set utf-8 (path: C:\Program Files\MySQL\MySQL Server 5.5\share\charsets\)，
            //又是讨人厌的编码问题，在恢复的时候设置一下默认的编码就可以了。
            Process process = runtime.exec("mysql -u root -proot --default-character-set=utf8 rouge");
            OutputStream outputStream = process.getOutputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path)));
            String str = null;
            StringBuffer sb = new StringBuffer();
            while ((str = br.readLine()) != null) {
                sb.append(str + "\r\n");
            }
            str = sb.toString();
            System.out.println(str);
            OutputStreamWriter writer = new OutputStreamWriter(outputStream, "utf-8");
            writer.write(str);
            writer.flush();
            outputStream.close();
            br.close();
            writer.close();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}
