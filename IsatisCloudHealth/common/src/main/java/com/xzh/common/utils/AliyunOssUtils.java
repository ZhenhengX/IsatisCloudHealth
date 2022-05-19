package com.xzh.common.utils;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.OSSException;

import java.io.ByteArrayInputStream;

/**
 * 阿里云 OSS工具类
 */
public class AliyunOssUtils {

    // 填写Bucket名称
    private static final String bucketName = "isatis";
    // Bucket所在地域对应的Endpoint
    private static final String endpoint = "https://oss-cn-beijing.aliyuncs.com";
    // 阿里云账号AccessKey
    private static final String accessKeyId = "LTAI5tSoWiZt24zivA4xbkVw";
    private static final String accessKeySecret = "g3wWgz1XXjeOi96xtl3yd1W608FCeZ";

    /**
     * <p>上传文件</p>
     */
    public static void upload(byte[] objectContent, String objectName) {
        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        try {
            // 上传文件
            ossClient.putObject(bucketName, objectName, new ByteArrayInputStream(objectContent));
        } catch (OSSException oe) {
            System.out.println("上传请求被拒绝。");
            System.out.println("Error Message:" + oe.getErrorMessage());
            System.out.println("Error Code:" + oe.getErrorCode());
            System.out.println("Request ID:" + oe.getRequestId());
            System.out.println("Host ID:" + oe.getHostId());
        } catch (ClientException ce) {
            System.out.println("Caught an ClientException，这意味着客户端在尝试与 OSS 通信时遇到了严重的内部问题，例如无法访问网络。");
            System.out.println("Error Message:" + ce.getMessage());
        } finally {
            if (ossClient != null) {
                ossClient.shutdown();
            }
        }
    }

    /**
     * <p>删除文件</p>
     */
    public static void delete(String objectName) {
        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        try {
            // 删除文件或目录。如果要删除目录，目录必须为空。
            ossClient.deleteObject(bucketName, objectName);
        } catch (OSSException oe) {
            System.out.println("删除请求被拒绝。");
            System.out.println("Error Message:" + oe.getErrorMessage());
            System.out.println("Error Code:" + oe.getErrorCode());
            System.out.println("Request ID:" + oe.getRequestId());
            System.out.println("Host ID:" + oe.getHostId());
        } catch (ClientException ce) {
            System.out.println("Caught an ClientException，这意味着客户端在尝试与 OSS 通信时遇到了严重的内部问题，例如无法访问网络。");
            System.out.println("Error Message:" + ce.getMessage());
        } finally {
            if (ossClient != null) {
                ossClient.shutdown();
            }
        }
    }
}
