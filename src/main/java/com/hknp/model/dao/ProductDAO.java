package com.hknp.model.dao;

import com.hknp.interfaces.IModifySingleEntityAutoIncrement;
import com.hknp.interfaces.IRetrieveEntity;
import com.hknp.model.entity.ProductEntity;
import com.hknp.utils.EntityUtils;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.ArrayList;

public class ProductDAO implements IRetrieveEntity<ProductEntity, Long>, IModifySingleEntityAutoIncrement<ProductEntity, Long> {
   private static ProductDAO instance = null;

   private ProductDAO() {
   }

   public static ProductDAO getInstance() {
      if (instance == null) {
         instance = new ProductDAO();
      }
      return instance;
   }

   @Override
   public Long insert(ProductEntity entity) {
      Long newId = 0L;
      EntityManager entityMgr = EntityUtils.getEntityManager();
      EntityTransaction entityTrans = null;

      try {
         entityTrans = entityMgr.getTransaction();
         entityTrans.begin();

         entityMgr.persist(entity);
         newId = entity.getProductId();

         entityTrans.commit();
      } catch (Exception e) {
         if (entityTrans != null) {
            entityTrans.rollback();
         }
         e.printStackTrace();
      } finally {
         entityMgr.close();
      }

      return newId;
   }

   @Override
   public boolean update(ProductEntity entity) {
      return EntityUtils.merge(entity);
   }

   @Override
   public boolean delete(Long id) {
      EntityManager entityMgr = EntityUtils.getEntityManager();
      EntityTransaction entityTrans = null;

      try {
         entityTrans = entityMgr.getTransaction();
         entityTrans.begin();

         ProductEntity productEntity = entityMgr.find(ProductEntity.class, id);
         entityMgr.remove(productEntity);

         entityTrans.commit();
      } catch (Exception e) {
         if (entityTrans != null) {
            entityTrans.rollback();
         }
         e.printStackTrace();
         entityMgr.close();
         return false;
      }
      return true;
   }

   @Override
   public ArrayList<ProductEntity> gets() {
      EntityManager entityMgr = EntityUtils.getEntityManager();

      String query = "SELECT u FROM ProductEntity u";
      TypedQuery<ProductEntity> typedQuery = entityMgr.createQuery(query, ProductEntity.class);

      ArrayList<ProductEntity> result = null;
      try {
         result = new ArrayList<>(typedQuery.getResultList());
      } catch (Exception exception) {
         exception.printStackTrace();
      } finally {
         entityMgr.close();
      }
      return result;
   }

   @Override
   public ProductEntity getById(Long id) {
      EntityManager entityMgr = EntityUtils.getEntityManager();
      ProductEntity productEntity = entityMgr.find(ProductEntity.class, id);
      return productEntity;
   }
}
