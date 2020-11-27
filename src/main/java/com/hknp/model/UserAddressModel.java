package com.hknp.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserAddressModel {
    Long userId;
    Long addressId;
    String fullName;
    String phoneNumber;
    Integer addressType;

    public UserAddressModel(ResultSet resultSet) throws SQLException {
        userId = resultSet.getLong("USER_ID");
        addressId = resultSet.getLong("ADDRESS_ID");
        fullName = resultSet.getString("FULL_NAME");
        phoneNumber = resultSet.getString("PHONE_NUMBER");
        addressType = resultSet.getInt("ADDRESS_TYPE");
    }
}