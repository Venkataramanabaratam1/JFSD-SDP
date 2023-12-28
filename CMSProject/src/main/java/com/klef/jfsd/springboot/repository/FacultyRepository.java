package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Faculty;

@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Integer>
{
	@Query("select f from Faculty f where f.id=?1 and f.password=?2")
	public Faculty checkfacultylogin(int id, String pwd);
	
	@Query("select f from Faculty f where f.department=?1")
	List<Faculty> findByDepartment(String department);
}
