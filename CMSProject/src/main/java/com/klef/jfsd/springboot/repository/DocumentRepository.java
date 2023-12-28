package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.springboot.model.Document;
import com.klef.jfsd.springboot.model.Faculty;

public interface DocumentRepository extends JpaRepository<Document,Integer>
{
	@Query("SELECT d FROM Document d WHERE d.courseocde = ?1")
	List<Document> viewDocumentByCode(String code);
}
