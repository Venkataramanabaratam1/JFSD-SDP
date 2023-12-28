package com.klef.jfsd.springboot.model;

import java.util.Arrays;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name="document_table")
public class Document 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	private String courseocde;
	private String docName;
	private String docType;
	private String docCategory;
	
	@Lob
	@Column(columnDefinition = "LONGBLOB")
	private byte[] data;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCourseocde() {
		return courseocde;
	}

	public void setCourseocde(String courseocde) {
		this.courseocde = courseocde;
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getDocType() {
		return docType;
	}

	public void setDocType(String docType) {
		this.docType = docType;
	}

	public String getDocCategory() {
		return docCategory;
	}

	public void setDocCategory(String docCategory) {
		this.docCategory = docCategory;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "Document [id=" + id + ", courseocde=" + courseocde + ", docName=" + docName + ", docType=" + docType
				+ ", docCategory=" + docCategory + ", data=" + Arrays.toString(data) + "]";
	}

	
	
}