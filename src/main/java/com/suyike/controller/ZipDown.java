package com.suyike.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Controller
@RequestMapping("/test")
public class ZipDown {
    private static final Logger logger = LoggerFactory.getLogger(ZipDown.class);


    @RequestMapping(value = "/download", method = RequestMethod.GET)
    @ResponseBody
    public String downloadAttachment(HttpServletResponse response) throws IOException {
        //测试如下2个目录下的文件打包,两个目录一样的是为了测试重命名问题
        File file1 = new File("D:\\IT\\参考资料\\文件导入导出");
        File file2 = new File("D:\\IT\\参考资料\\文件导入导出");
        File file3 = new File("D:\\IT\\参考资料\\文件下载模板导出方式");

        // 获取所有文件
        List<File> fileList1 = Arrays.asList(file1.listFiles());
        List<File> fileList2 = Arrays.asList(file2.listFiles());
        List<File> fileList3 = Arrays.asList(file3.listFiles());
        List<File> totalFile = new ArrayList<>();
        if (fileList1.size() > 0) {
            for (File f : fileList1) {
                totalFile.add(f);
            }
        }
        if (fileList2.size() > 0) {
            for (File f : fileList2) {
                totalFile.add(f);
            }
        }
        if (fileList3.size() > 0) {
            for (File f : fileList3) {
                totalFile.add(f);
            }
        }
        try {
            // 压缩文件 到"D:\IT\test",名字为 "hello.zip
            File zipFile = this.zipFiles(totalFile, "D:\\IT\\test", "hello.zip");
            // 如果压缩文件大于20兆,返回提示
            Integer maxSize = 20;
            if (maxSize * 1024 * 1024 < zipFile.length()) {
                return "压缩包超过规定的20兆大小,限制下载";
            } else {
                // 将文件写出
                writeOut(response, zipFile);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    // 批量文件压缩成zip包
    public File zipFiles(List<File> fileList, String zipPath, String zipName) throws IOException {
        // 如果被压缩文件中有重复，会重命名
        Map<String, String> namePathMap = getTransferName(fileList);
        File zipPathFile = new File(zipPath);
        // 文件夹不存在则创建
        if (!zipPathFile.exists()) {
            zipPathFile.mkdirs();
        }
        File zipFile = new File(zipPath + File.separator + zipName);
        if (!zipFile.exists()) {
            zipFile.createNewFile();
        }
        ZipOutputStream zos = null;
        BufferedInputStream bis = null;
        try {
            // 存放的目标文件
            zos = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(zipFile.getPath())));
            Set<String> keySet = namePathMap.keySet();
            ZipEntry zipEntry = null;
            for (String key : keySet) { // key是文件名，value是path
                // 指定源文件
                File sourceFile = new File(namePathMap.get(key));
                // 创建ZIP实体，并添加进压缩包,指定压缩文件中的文件名
                zipEntry = new ZipEntry(key);
                zos.putNextEntry(zipEntry);
                // 读取待压缩的文件并写进压缩包里
                bis = new BufferedInputStream(new BufferedInputStream(new FileInputStream(sourceFile), 1024 * 10));
                byte[] bufs = new byte[1024 * 10];
                int read = 0;
                while ((read = (bis.read(bufs, 0, 1024 * 10))) != -1) {
                    zos.write(bufs, 0, read);
                }
                if (bis != null) {
                    bis.close();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭流
            if (bis != null) {
                bis.close();
            }
            if (null != zos) {
                zos.close();
            }
        }
        return zipFile;

    }

    /**
     * 将文件写出到流 【方法名】{方法的功能/动作描述}
     * @author Fisher
     *
     * */
    private void writeOut(HttpServletResponse response, File zipFile) throws IOException {
        response.reset();
        response.setContentType("application/zip");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + zipFile.getName());
        OutputStream outputStream = response.getOutputStream();
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(zipFile.getPath());
            int len = 0;
            byte[] buffer = new byte[1024];
            while ((len = fis.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush();
        } finally {
            if (null != fis) {
                fis.close();
            }
            if (null != outputStream) {
                outputStream.close();
            }
        }
    }

    // 计算压缩包如果已存在重复的名称，则在重复文件后面跟上数字 如: 文件(1).doc,文件(2).doc
    public Map<String, String> getTransferName(List<File> fileList) {
        if (fileList == null || fileList.size() == 0) {
            return new HashMap<String, String>();
        }
        // key存放文件名，value存放path
        Map<String, String> fileNameMap = new HashMap<>();
        List<String> fileNames = new ArrayList<>();
        for (File file : fileList) {
            // 获取文件名
            String fileName = file.getName();
            int count = 0;

            for (String name : fileNames) {
                if (name != null && name.equals(fileName)) {
                    count++;
                }
            }
            fileNames.add(fileName);
            if (count > 0) {
                int lastIndex = fileName.lastIndexOf('.');
                String name = fileName.substring(0, lastIndex);
                String type = fileName.substring(lastIndex + 1, fileName.length());
                fileName = new StringBuilder().append(name).append("(").append(count).append(")").append(".")
                        .append(type).toString();
                fileNameMap.put(fileName, file.getPath());
            } else {
                fileNameMap.put(fileName, file.getPath());
            }
        }
        return fileNameMap;
    }
}
