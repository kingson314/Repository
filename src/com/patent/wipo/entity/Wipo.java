package com.patent.wipo.entity;                     
	                                                               
import javax.persistence.Entity;                                
import javax.persistence.Table;                                 
import framework.base.entity.BaseEntity;                    
	                                                               
@Entity                                                         
@Table(name = "patentwipo", catalog = "", schema = "") 
public class Wipo extends BaseEntity {                          
	private static final long serialVersionUID = 1L;               
	private String applicationNumber;// 申请号
	private String applicationDate;// 申请日
	private String publicationNumber;// 公布号
	private String publicationDate;// 公布日
	private String grantNumber;// 授权号
	private String grantDate;// 授权日
	private String publicationKind;// 公布种类
	private String PCTReference;//PCT参考号
	private String ipc;
	private String applicants;// 申请人
	private String inventors;// 发明人
	private String priorityData;// 优先权数据
	private String title;// 标题
	
	private String srcNationalBiblioData;//国家著录事项
	private String srcDescription;//说明书
	private String srcClaims;//权利要求书
	private String srcDrawings;//Drawings
	private String srcDocuments;//文件
	
	public String getApplicationNumber() {
		return applicationNumber;
	}
	public void setApplicationNumber(String applicationNumber) {
		this.applicationNumber = applicationNumber;
	}
	public String getApplicationDate() {
		return applicationDate;
	}
	public void setApplicationDate(String applicationDate) {
		this.applicationDate = applicationDate;
	}
	public String getPublicationNumber() {
		return publicationNumber;
	}
	public void setPublicationNumber(String publicationNumber) {
		this.publicationNumber = publicationNumber;
	}
	public String getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}
	public String getGrantNumber() {
		return grantNumber;
	}
	public void setGrantNumber(String grantNumber) {
		this.grantNumber = grantNumber;
	}
	public String getGrantDate() {
		return grantDate;
	}
	public void setGrantDate(String grantDate) {
		this.grantDate = grantDate;
	}
	public String getPublicationKind() {
		return publicationKind;
	}
	public void setPublicationKind(String publicationKind) {
		this.publicationKind = publicationKind;
	}
	public String getPCTReference() {
		return PCTReference;
	}
	public void setPCTReference(String pCTReference) {
		PCTReference = pCTReference;
	}
	public String getIpc() {
		return ipc;
	}
	public void setIpc(String ipc) {
		this.ipc = ipc;
	}
	public String getApplicants() {
		return applicants;
	}
	public void setApplicants(String applicants) {
		this.applicants = applicants;
	}
	public String getInventors() {
		return inventors;
	}
	public void setInventors(String inventors) {
		this.inventors = inventors;
	}
	public String getPriorityData() {
		return priorityData;
	}
	public void setPriorityData(String priorityData) {
		this.priorityData = priorityData;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getSrcNationalBiblioData() {
		return srcNationalBiblioData;
	}
	public void setSrcNationalBiblioData(String srcNationalBiblioData) {
		this.srcNationalBiblioData = srcNationalBiblioData;
	}
	public String getSrcDescription() {
		return srcDescription;
	}
	public void setSrcDescription(String srcDescription) {
		this.srcDescription = srcDescription;
	}
	public String getSrcClaims() {
		return srcClaims;
	}
	public void setSrcClaims(String srcClaims) {
		this.srcClaims = srcClaims;
	}
	public String getSrcDrawings() {
		return srcDrawings;
	}
	public void setSrcDrawings(String srcDrawings) {
		this.srcDrawings = srcDrawings;
	}
	public String getSrcDocuments() {
		return srcDocuments;
	}
	public void setSrcDocuments(String srcDocuments) {
		this.srcDocuments = srcDocuments;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}                                                               
