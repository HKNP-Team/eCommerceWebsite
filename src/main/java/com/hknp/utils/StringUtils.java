package com.hknp.utils;

import java.math.BigDecimal;

public class StringUtils {
   /**
    * Remove non-digit character from string
    * @param str string to remove non-digit character
    * @return digit string or "0"
    */
   public static String removeNonDigit(String str) {
      str = str.replaceAll("[^0-9]", "");

      if (str == null || str.isEmpty()) {
         str = "0";
      }
      return str;
   }

   /**
    * Convert String to BigDecimal
    * @param str string to remove non-digit character
    * @return 0 or BigDecimal value
    */
   public static BigDecimal toBigDecimal(String str){
      BigDecimal result;
      str = removeNonDigit(str);

      try {
         result = new BigDecimal(str);
      } catch (NumberFormatException e) {
         result = BigDecimal.valueOf(0);
      }

      return result;
   }
}