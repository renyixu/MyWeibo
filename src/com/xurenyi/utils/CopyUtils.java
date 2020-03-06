package com.xurenyi.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class CopyUtils {

    public static void uploadFile(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[1024];
        int len=0;
        while((len=in.read(buffer))!=-1){
            out.write(buffer,0,len);
            out.flush();
        }
    }
}
