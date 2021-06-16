package com.hknp.controller.employee;

import com.hknp.model.dao.BrandDAO;
import com.hknp.model.entity.BrandEntity;
import com.hknp.utils.ServletUtils;
import com.hknp.utils.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/employee/brand/edit"})
public class EMBrandEditController extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      String brandIdPara = req.getParameter("id");
      Long brandId = StringUtils.toLong(brandIdPara);
      BrandEntity brandEdit = null;

      if (brandId != 0) {
         brandEdit = BrandDAO.getInstance().getById(brandId);
         if (brandEdit != null) {
            req.setAttribute("brandEdit", brandEdit);
            ServletUtils.forward(req, resp, "/view/employee/em-brand-edit.jsp");
            return;
         }
      }

      ServletUtils.forward(req, resp, "/employee/brand");
   }
}
