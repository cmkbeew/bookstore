package org.fullstack4.bookstore.utils;

import java.util.UUID;

public class UuidUtil {

    public UuidUtil (){}
    public static String getUUID() {
        UUID uUID = UUID.randomUUID();
        return uUID.toString();
    }
}
