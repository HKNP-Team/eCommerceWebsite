package com.hknp.model.dao;

import com.hknp.interfaces.IModifySingleEntityAutoIncrement;
import com.hknp.interfaces.IRetrieveEntity;
import com.hknp.model.entity.DeliveryEntity;
import com.hknp.model.entity.UserEntity;
import com.hknp.utils.EntityUtils;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.ArrayList;

public class DeliveryDAO implements IRetrieveEntity<DeliveryEntity, Long>, IModifySingleEntityAutoIncrement<DeliveryEntity, Long> {
   private static DeliveryDAO instance = null;

   private DeliveryDAO() {
   }

   public static DeliveryDAO getInstance() {
      if (instance == null) {
         instance = new DeliveryDAO();
      }
      return instance;
   }

   @Override
   public Long insert(DeliveryEntity entity) {
      Long newUserId = 0L;
      EntityManager entityMgr = EntityUtils.getEntityManager();
      EntityTransaction entityTrans = null;

      try {
         entityTrans = entityMgr.getTransaction();
         entityTrans.begin();

         newUserId = UserDAO.getInstance().insert(entity.getUserEntity());
         entityMgr.persist(entity);

         entityTrans.commit();
      } catch (Exception e) {
         if (entityTrans != null) {
            entityTrans.rollback();
         }
         e.printStackTrace();
      } finally {
         entityMgr.close();
      }

      return newUserId;
   }

   @Override
   public boolean update(DeliveryEntity entity) {
      if (UserDAO.getInstance().update(entity.getUserEntity()))
         return EntityUtils.merge(entity);
      return false;
   }

   @Override
   public boolean delete(Long id) {
      EntityManager entityMgr = EntityUtils.getEntityManager();
      EntityTransaction entityTrans = null;

      try {
         entityTrans = entityMgr.getTransaction();
         entityTrans.begin();

         DeliveryEntity deliveryEntity = entityMgr.find(DeliveryEntity.class, id);
         entityMgr.remove(deliveryEntity);

         UserEntity userEntity = entityMgr.find(UserEntity.class, id);
         entityMgr.remove(userEntity);

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
   public ArrayList<DeliveryEntity> gets() {
      EntityManager entityMgr = EntityUtils.getEntityManager();

      String query = "SELECT u FROM DeliveryEntity u";
      TypedQuery<DeliveryEntity> typedQuery = entityMgr.createQuery(query, DeliveryEntity.class);

      ArrayList<DeliveryEntity> result = null;
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
   public DeliveryEntity getById(Long id) {
      EntityManager entityMgr = EntityUtils.getEntityManager();
      DeliveryEntity deliveryEntity = entityMgr.find(DeliveryEntity.class, id);
      return deliveryEntity;
   }
}