package com.bupt.core.system.model;

import java.util.ArrayList;
import java.util.List;

public class BusinessRecordExample {
	protected Integer start;
	protected Integer limit;
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public BusinessRecordExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andRecordIdIsNull() {
            addCriterion("record_id is null");
            return (Criteria) this;
        }

        public Criteria andRecordIdIsNotNull() {
            addCriterion("record_id is not null");
            return (Criteria) this;
        }

        public Criteria andRecordIdEqualTo(Integer value) {
            addCriterion("record_id =", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotEqualTo(Integer value) {
            addCriterion("record_id <>", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdGreaterThan(Integer value) {
            addCriterion("record_id >", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("record_id >=", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdLessThan(Integer value) {
            addCriterion("record_id <", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdLessThanOrEqualTo(Integer value) {
            addCriterion("record_id <=", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdIn(List<Integer> values) {
            addCriterion("record_id in", values, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotIn(List<Integer> values) {
            addCriterion("record_id not in", values, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdBetween(Integer value1, Integer value2) {
            addCriterion("record_id between", value1, value2, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotBetween(Integer value1, Integer value2) {
            addCriterion("record_id not between", value1, value2, "recordId");
            return (Criteria) this;
        }

        public Criteria andCustomerNameIsNull() {
            addCriterion("customer_name is null");
            return (Criteria) this;
        }

        public Criteria andCustomerNameIsNotNull() {
            addCriterion("customer_name is not null");
            return (Criteria) this;
        }

        public Criteria andCustomerNameEqualTo(String value) {
            addCriterion("customer_name =", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameNotEqualTo(String value) {
            addCriterion("customer_name <>", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameGreaterThan(String value) {
            addCriterion("customer_name >", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameGreaterThanOrEqualTo(String value) {
            addCriterion("customer_name >=", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameLessThan(String value) {
            addCriterion("customer_name <", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameLessThanOrEqualTo(String value) {
            addCriterion("customer_name <=", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameLike(String value) {
            addCriterion("customer_name like", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameNotLike(String value) {
            addCriterion("customer_name not like", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameIn(List<String> values) {
            addCriterion("customer_name in", values, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameNotIn(List<String> values) {
            addCriterion("customer_name not in", values, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameBetween(String value1, String value2) {
            addCriterion("customer_name between", value1, value2, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameNotBetween(String value1, String value2) {
            addCriterion("customer_name not between", value1, value2, "customerName");
            return (Criteria) this;
        }

        public Criteria andContractSumIsNull() {
            addCriterion("contract_sum is null");
            return (Criteria) this;
        }

        public Criteria andContractSumIsNotNull() {
            addCriterion("contract_sum is not null");
            return (Criteria) this;
        }

        public Criteria andContractSumEqualTo(String value) {
            addCriterion("contract_sum =", value, "contractSum");
            return (Criteria) this;
        }

        public Criteria andContractSumNotEqualTo(String value) {
            addCriterion("contract_sum <>", value, "contractSum");
            return (Criteria) this;
        }

        public Criteria andContractSumGreaterThan(String value) {
            addCriterion("contract_sum >", value, "contractSum");
            return (Criteria) this;
        }

        public Criteria andContractSumGreaterThanOrEqualTo(String value) {
            addCriterion("contract_sum >=", value, "contractSum");
            return (Criteria) this;
        }

        public Criteria andContractSumLessThan(String value) {
            addCriterion("contract_sum <", value, "contractSum");
            return (Criteria) this;
        }

        public Criteria andContractSumLessThanOrEqualTo(String value) {
            addCriterion("contract_sum <=", value, "contractSum");
            return (Criteria) this;
        }

        public Criteria andContractSumLike(String value) {
            addCriterion("contract_sum like", value, "contractSum");
            return (Criteria) this;
        }

        public Criteria andContractSumNotLike(String value) {
            addCriterion("contract_sum not like", value, "contractSum");
            return (Criteria) this;
        }

        public Criteria andContractSumIn(List<String> values) {
            addCriterion("contract_sum in", values, "contractSum");
            return (Criteria) this;
        }

        public Criteria andContractSumNotIn(List<String> values) {
            addCriterion("contract_sum not in", values, "contractSum");
            return (Criteria) this;
        }

        public Criteria andContractSumBetween(String value1, String value2) {
            addCriterion("contract_sum between", value1, value2, "contractSum");
            return (Criteria) this;
        }

        public Criteria andContractSumNotBetween(String value1, String value2) {
            addCriterion("contract_sum not between", value1, value2, "contractSum");
            return (Criteria) this;
        }

        public Criteria andDataOriginIsNull() {
            addCriterion("data_origin is null");
            return (Criteria) this;
        }

        public Criteria andDataOriginIsNotNull() {
            addCriterion("data_origin is not null");
            return (Criteria) this;
        }

        public Criteria andDataOriginEqualTo(String value) {
            addCriterion("data_origin =", value, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataOriginNotEqualTo(String value) {
            addCriterion("data_origin <>", value, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataOriginGreaterThan(String value) {
            addCriterion("data_origin >", value, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataOriginGreaterThanOrEqualTo(String value) {
            addCriterion("data_origin >=", value, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataOriginLessThan(String value) {
            addCriterion("data_origin <", value, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataOriginLessThanOrEqualTo(String value) {
            addCriterion("data_origin <=", value, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataOriginLike(String value) {
            addCriterion("data_origin like", value, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataOriginNotLike(String value) {
            addCriterion("data_origin not like", value, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataOriginIn(List<String> values) {
            addCriterion("data_origin in", values, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataOriginNotIn(List<String> values) {
            addCriterion("data_origin not in", values, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataOriginBetween(String value1, String value2) {
            addCriterion("data_origin between", value1, value2, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataOriginNotBetween(String value1, String value2) {
            addCriterion("data_origin not between", value1, value2, "dataOrigin");
            return (Criteria) this;
        }

        public Criteria andDataVersionIsNull() {
            addCriterion("data_version is null");
            return (Criteria) this;
        }

        public Criteria andDataVersionIsNotNull() {
            addCriterion("data_version is not null");
            return (Criteria) this;
        }

        public Criteria andDataVersionEqualTo(String value) {
            addCriterion("data_version =", value, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andDataVersionNotEqualTo(String value) {
            addCriterion("data_version <>", value, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andDataVersionGreaterThan(String value) {
            addCriterion("data_version >", value, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andDataVersionGreaterThanOrEqualTo(String value) {
            addCriterion("data_version >=", value, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andDataVersionLessThan(String value) {
            addCriterion("data_version <", value, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andDataVersionLessThanOrEqualTo(String value) {
            addCriterion("data_version <=", value, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andDataVersionLike(String value) {
            addCriterion("data_version like", value, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andDataVersionNotLike(String value) {
            addCriterion("data_version not like", value, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andDataVersionIn(List<String> values) {
            addCriterion("data_version in", values, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andDataVersionNotIn(List<String> values) {
            addCriterion("data_version not in", values, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andDataVersionBetween(String value1, String value2) {
            addCriterion("data_version between", value1, value2, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andDataVersionNotBetween(String value1, String value2) {
            addCriterion("data_version not between", value1, value2, "dataVersion");
            return (Criteria) this;
        }

        public Criteria andContractLastIsNull() {
            addCriterion("contract_last is null");
            return (Criteria) this;
        }

        public Criteria andContractLastIsNotNull() {
            addCriterion("contract_last is not null");
            return (Criteria) this;
        }

        public Criteria andContractLastEqualTo(String value) {
            addCriterion("contract_last =", value, "contractLast");
            return (Criteria) this;
        }

        public Criteria andContractLastNotEqualTo(String value) {
            addCriterion("contract_last <>", value, "contractLast");
            return (Criteria) this;
        }

        public Criteria andContractLastGreaterThan(String value) {
            addCriterion("contract_last >", value, "contractLast");
            return (Criteria) this;
        }

        public Criteria andContractLastGreaterThanOrEqualTo(String value) {
            addCriterion("contract_last >=", value, "contractLast");
            return (Criteria) this;
        }

        public Criteria andContractLastLessThan(String value) {
            addCriterion("contract_last <", value, "contractLast");
            return (Criteria) this;
        }

        public Criteria andContractLastLessThanOrEqualTo(String value) {
            addCriterion("contract_last <=", value, "contractLast");
            return (Criteria) this;
        }

        public Criteria andContractLastLike(String value) {
            addCriterion("contract_last like", value, "contractLast");
            return (Criteria) this;
        }

        public Criteria andContractLastNotLike(String value) {
            addCriterion("contract_last not like", value, "contractLast");
            return (Criteria) this;
        }

        public Criteria andContractLastIn(List<String> values) {
            addCriterion("contract_last in", values, "contractLast");
            return (Criteria) this;
        }

        public Criteria andContractLastNotIn(List<String> values) {
            addCriterion("contract_last not in", values, "contractLast");
            return (Criteria) this;
        }

        public Criteria andContractLastBetween(String value1, String value2) {
            addCriterion("contract_last between", value1, value2, "contractLast");
            return (Criteria) this;
        }

        public Criteria andContractLastNotBetween(String value1, String value2) {
            addCriterion("contract_last not between", value1, value2, "contractLast");
            return (Criteria) this;
        }

        public Criteria andDataShareIsNull() {
            addCriterion("data_share is null");
            return (Criteria) this;
        }

        public Criteria andDataShareIsNotNull() {
            addCriterion("data_share is not null");
            return (Criteria) this;
        }

        public Criteria andDataShareEqualTo(String value) {
            addCriterion("data_share =", value, "dataShare");
            return (Criteria) this;
        }

        public Criteria andDataShareNotEqualTo(String value) {
            addCriterion("data_share <>", value, "dataShare");
            return (Criteria) this;
        }

        public Criteria andDataShareGreaterThan(String value) {
            addCriterion("data_share >", value, "dataShare");
            return (Criteria) this;
        }

        public Criteria andDataShareGreaterThanOrEqualTo(String value) {
            addCriterion("data_share >=", value, "dataShare");
            return (Criteria) this;
        }

        public Criteria andDataShareLessThan(String value) {
            addCriterion("data_share <", value, "dataShare");
            return (Criteria) this;
        }

        public Criteria andDataShareLessThanOrEqualTo(String value) {
            addCriterion("data_share <=", value, "dataShare");
            return (Criteria) this;
        }

        public Criteria andDataShareLike(String value) {
            addCriterion("data_share like", value, "dataShare");
            return (Criteria) this;
        }

        public Criteria andDataShareNotLike(String value) {
            addCriterion("data_share not like", value, "dataShare");
            return (Criteria) this;
        }

        public Criteria andDataShareIn(List<String> values) {
            addCriterion("data_share in", values, "dataShare");
            return (Criteria) this;
        }

        public Criteria andDataShareNotIn(List<String> values) {
            addCriterion("data_share not in", values, "dataShare");
            return (Criteria) this;
        }

        public Criteria andDataShareBetween(String value1, String value2) {
            addCriterion("data_share between", value1, value2, "dataShare");
            return (Criteria) this;
        }

        public Criteria andDataShareNotBetween(String value1, String value2) {
            addCriterion("data_share not between", value1, value2, "dataShare");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}
}