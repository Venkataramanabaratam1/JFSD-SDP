package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.FContact;

@Repository
public interface FContactRepository extends JpaRepository<FContact, Integer>
{

}
