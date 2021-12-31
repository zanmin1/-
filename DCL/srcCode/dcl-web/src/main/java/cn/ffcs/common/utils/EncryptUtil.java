package cn.ffcs.common.utils;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.Key;


public class EncryptUtil {
    /**
     * 密钥算法
     */
    private static final String AES_ALGORITHM = "AES";

    /**
     * 加密算法/加密模式/填充类型
     * 采用AES加密，ECB加密模式，PKCS5Padding填充
     */
    private static final String CIPHER_MODE = "AES/ECB/PKCS5Padding";

    /**
     * 加密
     *
     * @param data 待加密数据
     * @param key  BASE64编码后密钥
     * @return string        加密数据,返回null表示输入数据有误
     */
    public static String encryptAES(String data, String key) throws Exception {
        if (data == null || key == null || data.equals("") || key.equals("")) return null;
        // 还原密钥
        Key k = toKey(key);

        // 实例化
        Cipher cipher = Cipher.getInstance(CIPHER_MODE);
        // 初始化,设置为加密模式
        cipher.init(Cipher.ENCRYPT_MODE, k);
        // 执行操作
        byte[] result = cipher.doFinal(data.getBytes(StandardCharsets.UTF_8));

        return Base64.encodeBase64String(result);
    }


    /**
     * 解密
     *
     * @param base64data 待解密BASE64编码数据
     * @param key        BASE64编码后密钥
     * @return byte[]    解密数据,返回null表示输入数据有误
     */
    public static String decryptAES(String base64data, String key) throws Exception {
        if (base64data == null || key == null || base64data.equals("") || key.equals("")) return null;

        // 还原密钥
        Key k = toKey(key);

        // 实例化
        Cipher cipher = Cipher.getInstance(CIPHER_MODE);
        // 初始化,设置为解密模式
        cipher.init(Cipher.DECRYPT_MODE, k);
        // 执行操作
        byte[] result = cipher.doFinal(Base64.decodeBase64(base64data));

        return new String(result, StandardCharsets.UTF_8);
    }

    /***
     * 3des加密
     */
    public static String encrypt3des(String data, String key) {
        try {
            Cipher cipher = Cipher.getInstance("DESede/ECB/PKCS5Padding");
            byte[] keybytes = key.getBytes(StandardCharsets.US_ASCII);
            DESedeKeySpec spec = new DESedeKeySpec(keybytes);
            SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("DESede");
            Key key1 = keyfactory.generateSecret(spec);
            cipher.init(Cipher.ENCRYPT_MODE, key1);

            byte[] desbyte = cipher.doFinal(data.getBytes(StandardCharsets.US_ASCII));
            return Base64.encodeBase64String(desbyte);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }


    /**
     * 转换密钥
     *
     * @param key BASE64编码后密钥
     */
    private static Key toKey(String key) {
        // 获取密钥
        byte[] k = Base64.decodeBase64(key);
        // 实例化AES密钥
        return new SecretKeySpec(k, EncryptUtil.AES_ALGORITHM);
    }

    public static void main(String[] args) {

    }

}
