package com.bupt.core.system.model;

public class BusinessRecord {
    private Integer recordId;

    private String customerName;

    private String contractSum;

    private String dataOrigin;

    private String dataVersion;

    private String contractLast;

    private String dataShare;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public String getContractSum() {
        return contractSum;
    }

    public void setContractSum(String contractSum) {
        this.contractSum = contractSum == null ? null : contractSum.trim();
    }

    public String getDataOrigin() {
        return dataOrigin;
    }

    public void setDataOrigin(String dataOrigin) {
        this.dataOrigin = dataOrigin == null ? null : dataOrigin.trim();
    }

    public String getDataVersion() {
        return dataVersion;
    }

    public void setDataVersion(String dataVersion) {
        this.dataVersion = dataVersion == null ? null : dataVersion.trim();
    }

    public String getContractLast() {
        return contractLast;
    }

    public void setContractLast(String contractLast) {
        this.contractLast = contractLast == null ? null : contractLast.trim();
    }

    public String getDataShare() {
        return dataShare;
    }

    public void setDataShare(String dataShare) {
        this.dataShare = dataShare == null ? null : dataShare.trim();
    }
}