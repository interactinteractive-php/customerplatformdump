--
-- EnterpriseDB database dump
--

-- Dumped from database version 15.3.0
-- Dumped by pg_dump version 15.3.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET edb_redwood_date = off;
SET default_with_rowids = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET edb_data_redaction = off;

--
-- Name: cloud_customer_uat; Type: SCHEMA; Schema: -; Owner: cloud_customer_uat
--

CREATE SCHEMA cloud_customer_uat;


ALTER SCHEMA cloud_customer_uat OWNER TO cloud_customer_uat;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: base_company; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.base_company (
    company_id numeric(18,0) NOT NULL,
    company_name character varying(512),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    company_register_number character varying(50),
    created_date timestamp without time zone DEFAULT sysdate,
    modified_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_user_id numeric(18,0),
    is_affiliate numeric(1,0) DEFAULT '0'::numeric,
    country_id numeric(18,0),
    established_date timestamp without time zone,
    description character varying(1024),
    city_id numeric(18,0),
    district_id numeric(18,0),
    industry_id numeric(18,0),
    parent_id numeric(18,0),
    company_name_eng character varying(256),
    ownership_form_id numeric(18,0),
    is_province numeric(1,0) DEFAULT '0'::numeric,
    address character varying(4000),
    phone numeric(18,0),
    email character varying(50),
    website character varying(50),
    state_reg_number character varying(50),
    tax_pay_number character varying(50),
    vat_pay_number character varying(50),
    special_license_info character varying(4000),
    phone2 numeric(18,0),
    sub_industry_id numeric(18,0),
    company_type_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.base_company OWNER TO enterprisedb;

--
-- Name: base_person; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.base_person (
    person_id numeric(18,0) NOT NULL,
    first_name character varying(512) NOT NULL,
    last_name character varying(512) NOT NULL,
    date_of_birth timestamp without time zone,
    gender character varying(50),
    state_reg_number character varying(50),
    country_id numeric(18,0),
    title character varying(512),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone DEFAULT sysdate,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    family_name character varying(256),
    first_email character varying(50),
    second_email character varying(50),
    first_phone character varying(50),
    second_phone character varying(50),
    en_first_name character varying(512),
    en_last_name character varying(512),
    picture clob,
    branch_title character varying(256),
    origin_id numeric(18,0),
    profession_name character varying(256),
    address_type_id numeric(18,0),
    city_id numeric(18,0),
    district_id numeric(18,0),
    street_id numeric(18,0),
    address_region_id numeric(18,0),
    address_town_id numeric(18,0),
    address_apartment_id numeric(18,0),
    post_box character varying(128),
    door character varying(512),
    full_address character varying(4000),
    coordinate character varying(4000),
    address_street_id numeric(18,0),
    orts numeric(18,0),
    parent_id numeric(18,0),
    picture_large_thumb character varying(256),
    picture_small_thumb character varying(256),
    picture_middle_thumb character varying(256),
    state_reg_id numeric(12,0),
    translation_value clob,
    industry_id numeric(18,0),
    social_address character varying(50),
    citizenship_id numeric(18,0),
    code character varying(512),
    created_command_id numeric(18,0),
    bio character varying(4000),
    marital_status_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.base_person OWNER TO enterprisedb;

--
-- Name: base_person_finger; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.base_person_finger (
    id numeric(18,0) NOT NULL,
    person_id numeric(18,0),
    userid numeric(18,0)
);


ALTER TABLE cloud_customer_uat.base_person_finger OWNER TO enterprisedb;

--
-- Name: config; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.config (
    id numeric(18,0) NOT NULL,
    description character varying(4000) NOT NULL,
    value_type character varying(50),
    display_order numeric(8,0),
    code character varying(100) NOT NULL,
    default_value character varying(4000),
    system_id numeric(18,0),
    module_id numeric(18,0),
    config_description character varying(4000)
);


ALTER TABLE cloud_customer_uat.config OWNER TO enterprisedb;

--
-- Name: config_value; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.config_value (
    id numeric(18,0) NOT NULL,
    config_id numeric(18,0) NOT NULL,
    config_value character varying(4000),
    criteria character varying(4000),
    description character varying(4000),
    config_value_eng character varying(1024),
    modified_user_id numeric(18,0),
    modified_date timestamp without time zone,
    company_department_id numeric(18,0),
    translation_value clob
);


ALTER TABLE cloud_customer_uat.config_value OWNER TO enterprisedb;

--
-- Name: crm_company; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.crm_company (
    company_id numeric(18,0) NOT NULL,
    company_name character varying(512),
    is_active numeric(1,0) DEFAULT '1'::numeric,
    created_date timestamp without time zone DEFAULT sysdate,
    updated_date timestamp without time zone DEFAULT sysdate,
    company_register_number character varying(50),
    user_id numeric(18,0),
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    base_company_id numeric(18,0),
    industry_id numeric(18,0),
    customer_id numeric(18,0) DEFAULT NULL::numeric,
    company_type_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.crm_company OWNER TO enterprisedb;

--
-- Name: crm_customer; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.crm_customer (
    customer_id numeric(18,0) NOT NULL,
    customer_code character varying(100),
    parent_id numeric(18,0),
    person_id numeric(18,0),
    company_id numeric(18,0),
    is_active numeric(1,0) DEFAULT '1'::numeric,
    is_primary numeric(18,0) DEFAULT NULL::numeric,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    logo character varying(700),
    created_user_id numeric(18,0),
    channel_type_id numeric(18,0),
    object_photo character varying(4000),
    modified_user_id numeric(18,0),
    position_name character varying(512),
    customer_name character varying(512),
    channel_subtype_id numeric(18,0),
    customer_group_id numeric(18,0),
    state_reg_number character varying(50),
    si_reg_number character varying(50),
    last_name character varying(256),
    vatsp_number character varying(50),
    priv_key bytea,
    pub_key bytea,
    department_id numeric(18,0),
    age numeric(8,0),
    appliaction_type_id numeric(18,0),
    old_code character varying(50),
    description character varying(4000),
    facebook_id numeric(24,0),
    unique_id character varying(128),
    mobile_app_id character varying(128),
    mobile_token_id character varying(128),
    template_id numeric(18,0),
    url_path character varying(256),
    is_vat_released numeric(1,0) DEFAULT '0'::numeric,
    wfm_status_id numeric(18,0),
    wfm_description character varying(1024),
    family_name character varying(100),
    short_name character varying(100),
    company_name character varying(100),
    country_id numeric(18,0),
    calc_percent numeric(6,2),
    is_head_of_family numeric(1,0) DEFAULT '0'::numeric,
    is_equivalent numeric(1,0) DEFAULT '0'::numeric,
    created_command_id numeric(18,0),
    modified_command_id numeric(18,0),
    segmentation_id numeric(18,0),
    priority_id numeric(18,0),
    marital_status_id numeric(18,0),
    organization_id numeric(18,0),
    import_id numeric(18,0),
    is_pos_use numeric(1,0) DEFAULT '0'::numeric,
    phone_number numeric(18,0),
    current_address_city_id numeric(18,0),
    current_address_district_id numeric(18,0),
    current_address_street_id numeric(18,0),
    current_address_building character varying(512),
    current_address_number character varying(512),
    date_of_birth timestamp without time zone,
    gender character varying(50),
    city_id numeric(18,0),
    district_id numeric(18,0),
    street_id numeric(18,0),
    address_description character varying(512),
    coordinate character varying(256),
    tax_name character varying(256),
    town_id numeric(18,0),
    current_address_category_id numeric(18,0),
    address_category_id numeric(18,0),
    current_address_town_id numeric(18,0),
    current_address_city_street_id numeric(18,0),
    current_addr_sub_district_id numeric(18,0),
    current_full_address character varying(4000),
    city_street_id numeric(18,0),
    sub_district_id numeric(18,0),
    building character varying(512),
    door_number character varying(256),
    mobile_number numeric(18,0),
    current_address_coordinate character varying(256),
    email character varying(512),
    translation_value clob,
    is_impairment numeric(1,0) DEFAULT 0,
    education_level_id numeric(18,0),
    contract_id numeric(18,0),
    legal_entity_number character varying(50),
    origin_id numeric(18,0),
    ref_origin_name character varying(1024),
    company_department_id numeric(18,0),
    id numeric(18,0),
    indicator_id numeric(18,0),
    src_record_id numeric(18,0),
    data clob,
    name character varying(4000),
    created_user_name character varying(4000),
    modified_user_name character varying(4000),
    deleted_date timestamp without time zone,
    deleted_user_id numeric(18,0),
    deleted_user_name character varying(4000),
    docx_id numeric(18,0),
    is_package_policy numeric(1,0) DEFAULT '0'::numeric,
    worldwide_state_reg_number character varying(128),
    worldwide_name character varying(512),
    health_status_id numeric(18,0),
    health_description character varying(4000),
    health_status_date timestamp without time zone,
    health_status_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.crm_customer OWNER TO enterprisedb;

--
-- Name: crm_customer_map; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.crm_customer_map (
    customer_id numeric(18,0) NOT NULL,
    employee_id numeric(18,0),
    department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.crm_customer_map OWNER TO enterprisedb;

--
-- Name: crm_user; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.crm_user (
    cust_user_id numeric(18,0) NOT NULL,
    candidate_id numeric(18,0),
    user_name character varying(512),
    password character varying(256),
    created_date timestamp without time zone DEFAULT sysdate,
    is_active numeric(1,0) DEFAULT '1'::numeric,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    customer_id numeric(18,0),
    parent_id numeric(18,0),
    password_hash character varying(256),
    password_reset character varying(1024),
    user_id numeric(18,0),
    google_key character varying(1024),
    email character varying(100),
    department_id numeric(18,0),
    is_confirmed numeric(1,0) DEFAULT '0'::numeric,
    created_command_id numeric(18,0),
    person_id numeric(18,0),
    failed_login_attempts numeric(1,0),
    phone character varying(256),
    company_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.crm_user OWNER TO enterprisedb;

--
-- Name: crm_user_kyc; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.crm_user_kyc (
    id numeric(18,0) NOT NULL,
    crm_user_id numeric(18,0),
    kyc_type character varying(256),
    kyc_key character varying(512),
    kyc_value character varying(256),
    confirmed_date timestamp without time zone,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    employee_id numeric(18,0),
    department_id numeric(18,0),
    customer_id numeric(18,0),
    location_id numeric(18,0),
    description character varying(1024),
    user_id numeric(18,0),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    person_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.crm_user_kyc OWNER TO enterprisedb;

--
-- Name: crm_user_role; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.crm_user_role (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    role_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    start_date timestamp without time zone,
    end_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.crm_user_role OWNER TO enterprisedb;

--
-- Name: customer_bp_detail_config; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.customer_bp_detail_config (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    process_meta_data_id numeric(18,0),
    param_path character varying(128),
    label_name character varying(128),
    order_num numeric(3,0),
    is_show numeric(1,0) DEFAULT '0'::numeric,
    is_freeze numeric(1,0) DEFAULT '0'::numeric,
    group_path character varying(128)
);


ALTER TABLE cloud_customer_uat.customer_bp_detail_config OWNER TO enterprisedb;

--
-- Name: customer_dv_field; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.customer_dv_field (
    id numeric(18,0) NOT NULL,
    meta_data_id numeric(18,0),
    field_path character varying(256),
    label_name character varying(256),
    is_required numeric(1,0) DEFAULT '0'::numeric,
    is_active numeric(1,0) DEFAULT '0'::numeric,
    is_criteria numeric(1,0) DEFAULT '0'::numeric,
    is_mandatory_criteria numeric(1,0) DEFAULT '0'::numeric,
    display_order numeric(5,0),
    is_show numeric(1,0) DEFAULT '0'::numeric,
    tab_name character varying(124),
    default_value character varying(4000),
    is_disable numeric(1,0) DEFAULT '0'::numeric,
    is_ignore_tree_group numeric(1,0) DEFAULT '0'::numeric,
    lookup_type character varying(40),
    choose_type character varying(40),
    show_criteria character varying(4000),
    ability_toggle character varying(20)
);


ALTER TABLE cloud_customer_uat.customer_dv_field OWNER TO enterprisedb;

--
-- Name: customer_dv_filter; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.customer_dv_filter (
    id numeric(18,0) NOT NULL,
    dv_meta_data_id numeric(18,0),
    field_path character varying(256),
    label_name character varying(128),
    display_order numeric(5,0),
    is_required numeric(1,0) DEFAULT '0'::numeric,
    is_active numeric(1,0) DEFAULT '0'::numeric
);


ALTER TABLE cloud_customer_uat.customer_dv_filter OWNER TO enterprisedb;

--
-- Name: customer_meta_user_config; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.customer_meta_user_config (
    id numeric(18,0) NOT NULL,
    meta_data_id numeric(18,0),
    user_id numeric(18,0),
    defaultviewer character varying(20)
);


ALTER TABLE cloud_customer_uat.customer_meta_user_config OWNER TO enterprisedb;

--
-- Name: customer_proxy_config; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.customer_proxy_config (
    id numeric(18,0) NOT NULL,
    proxy_meta_data_id numeric(18,0),
    action_meta_data_id numeric(18,0),
    is_default numeric(1,0) DEFAULT '0'::numeric,
    criteria character varying(512),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.customer_proxy_config OWNER TO enterprisedb;

--
-- Name: customer_st_grouping_config; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.customer_st_grouping_config (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    statement_meta_data_id numeric(18,0),
    group_field_path character varying(128),
    group_order numeric(2,0)
);


ALTER TABLE cloud_customer_uat.customer_st_grouping_config OWNER TO enterprisedb;

--
-- Name: db_dashboard_user; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.db_dashboard_user (
    id numeric(18,0) NOT NULL,
    db_dashboard_id numeric(18,0),
    user_id numeric(18,0),
    db_dashboard_dtl_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.db_dashboard_user OWNER TO enterprisedb;

--
-- Name: db_data_mart_config; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.db_data_mart_config (
    id numeric(18,0) NOT NULL,
    src_table_name character varying(256),
    trg_table_name character varying(256),
    trg_table_record_column character varying(50),
    select_query clob,
    description character varying(4000)
);


ALTER TABLE cloud_customer_uat.db_data_mart_config OWNER TO enterprisedb;

--
-- Name: db_data_mart_queue; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.db_data_mart_queue (
    id numeric(18,0) NOT NULL,
    src_table_name character varying(256),
    operation_type character varying(256),
    record_id numeric(18,0),
    status numeric(1,0),
    description character varying(1024),
    created_date timestamp without time zone DEFAULT sysdate,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.db_data_mart_queue OWNER TO enterprisedb;

--
-- Name: db_data_mart_schedule; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.db_data_mart_schedule (
    id numeric(18,0) NOT NULL,
    insert_query clob,
    delete_query clob,
    schedule_id numeric(18,0),
    is_active numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    last_log character varying(4000)
);


ALTER TABLE cloud_customer_uat.db_data_mart_schedule OWNER TO enterprisedb;

--
-- Name: db_fin_working_capital; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.db_fin_working_capital (
    month_id numeric(18,0),
    working_capital_type character varying(512),
    total_amount numeric(18,0)
);


ALTER TABLE cloud_customer_uat.db_fin_working_capital OWNER TO enterprisedb;

--
-- Name: db_gl_analytic_pivot; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.db_gl_analytic_pivot (
    account_code character varying(100) NOT NULL,
    account_name character varying(512) NOT NULL,
    department_code character varying(256),
    department_name character varying(512),
    product_group_code character varying(50),
    product_group_name character varying(256),
    product_code character varying(50),
    product_name character varying(256),
    customer_category_code character varying(50),
    customer_category_name character varying(256),
    product_payment_code character varying(50),
    product_payment_name character varying(256),
    tax_category_code character varying(50),
    tax_category_name character varying(256),
    employee_code character varying(100),
    employee_name character varying(517),
    location_type_code character varying(50),
    location_type_name character varying(256),
    product_brand_code character varying(50),
    product_brand_name character varying(256),
    activity_code character varying(50),
    activity_name character varying(256),
    economic_class_code character varying(50),
    economic_class_name character varying(1024),
    expense_center_code character varying(256),
    expense_center_name character varying(512),
    account_class_code character varying(256),
    account_class_name character varying(1024),
    vat_sub_category_code character varying(100),
    vat_sub_category_name character varying(1024),
    account_segment_code character varying(128),
    m_01_debit_amount numeric,
    m_02_debit_amount numeric,
    m_03_debit_amount numeric,
    m_04_debit_amount numeric,
    m_05_debit_amount numeric,
    m_06_debit_amount numeric,
    m_07_debit_amount numeric,
    m_08_debit_amount numeric,
    m_09_debit_amount numeric,
    m_10_debit_amount numeric,
    m_11_debit_amount numeric,
    m_12_debit_amount numeric,
    total_debit_amount numeric,
    m_01_credit_amount numeric,
    m_02_credit_amount numeric,
    m_03_credit_amount numeric,
    m_04_credit_amount numeric,
    m_05_credit_amount numeric,
    m_06_credit_amount numeric,
    m_07_credit_amount numeric,
    m_08_credit_amount numeric,
    m_09_credit_amount numeric,
    m_10_credit_amount numeric,
    m_11_credit_amount numeric,
    m_12_credit_amount numeric,
    total_credit_amount numeric
);


ALTER TABLE cloud_customer_uat.db_gl_analytic_pivot OWNER TO enterprisedb;

--
-- Name: db_hcm_org_email; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.db_hcm_org_email (
    id numeric(18,0) NOT NULL,
    employee_id numeric(18,0),
    employee_email character varying(100),
    cc_email character varying(100),
    manual_email character varying(100),
    manager_id numeric(18,0),
    created_user_id numeric(18,0),
    created_date timestamp without time zone,
    modified_user_id numeric(18,0),
    modified_date timestamp without time zone,
    second_manager_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.db_hcm_org_email OWNER TO enterprisedb;

--
-- Name: ecm_content; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ecm_content (
    content_id numeric(18,0) NOT NULL,
    file_name character varying(512),
    physical_path character varying(1024),
    thumb_physical_path character varying(1024),
    file_size numeric(20,0),
    file_extension character varying(25),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    wfm_status_id numeric(18,0),
    wfm_description character varying(2000),
    is_locked numeric(1,0) DEFAULT '0'::numeric,
    locked_user_id numeric(18,0),
    locked_date timestamp without time zone,
    locked_ip_address character varying(20),
    is_version numeric(24,6),
    type_id numeric(18,0),
    description character varying(4000),
    is_photo numeric(1,0) DEFAULT '0'::numeric,
    is_signed numeric(1,0) DEFAULT '0'::numeric,
    currency_id numeric(18,0),
    is_default numeric(1,0) DEFAULT '0'::numeric,
    page_count numeric(18,0),
    is_email numeric(1,0) DEFAULT '0'::numeric,
    page_settings character varying(4000),
    related_id numeric(18,0),
    parent_id numeric(18,0),
    widget_id numeric(18,0),
    middle_physical_path character varying(256),
    file_length character varying(400),
    physical_file clob,
    is_external numeric(1,0) DEFAULT '0'::numeric,
    qr_code character varying(4000)
);


ALTER TABLE cloud_customer_uat.ecm_content OWNER TO enterprisedb;

--
-- Name: ecm_content_clip; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ecm_content_clip (
    id numeric(20,0) NOT NULL,
    src_content_id numeric(20,0),
    trg_content_id numeric(20,0),
    relation_type_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ecm_content_clip OWNER TO enterprisedb;

--
-- Name: ecm_content_directory; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ecm_content_directory (
    id numeric(18,0) NOT NULL,
    content_id numeric(18,0),
    directory_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ecm_content_directory OWNER TO enterprisedb;

--
-- Name: ecm_content_file_version; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ecm_content_file_version (
    id numeric(18,0) NOT NULL,
    content_id numeric(18,0) NOT NULL,
    version_number numeric(5,0),
    physical_path character varying(256),
    created_user_id numeric(20,0),
    created_date timestamp without time zone,
    ip_address character varying(20),
    description character varying(4000),
    prev_physical_path character varying(256)
);


ALTER TABLE cloud_customer_uat.ecm_content_file_version OWNER TO enterprisedb;

--
-- Name: ecm_content_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ecm_content_log (
    id numeric(18,0) NOT NULL,
    content_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    show_date timestamp without time zone,
    show_user_id numeric(18,0),
    show_user_ip character varying(20),
    log_type numeric(38,0)
);


ALTER TABLE cloud_customer_uat.ecm_content_log OWNER TO enterprisedb;

--
-- Name: ecm_content_map; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ecm_content_map (
    id numeric(18,0) NOT NULL,
    content_id numeric(20,0),
    ref_structure_id numeric(20,0),
    record_id numeric(20,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    order_num numeric(18,0),
    is_main numeric(1,0) DEFAULT '0'::numeric,
    folder_id numeric(20,0),
    page_count numeric(18,0),
    tag_code character varying(512),
    main_record_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ecm_content_map OWNER TO enterprisedb;

--
-- Name: ecm_content_meta; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ecm_content_meta (
    id numeric(18,0) NOT NULL,
    content_id numeric(18,0),
    meta_data_id numeric(18,0),
    meta_value_id numeric(18,0),
    meta_value character varying(1024)
);


ALTER TABLE cloud_customer_uat.ecm_content_meta OWNER TO enterprisedb;

--
-- Name: ecm_content_process_map; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ecm_content_process_map (
    id numeric(18,0) NOT NULL,
    type_id numeric(18,0),
    process_meta_data_id numeric(18,0),
    object_id character varying(200),
    is_active numeric(1,0) DEFAULT '0'::numeric
);


ALTER TABLE cloud_customer_uat.ecm_content_process_map OWNER TO enterprisedb;

--
-- Name: ecm_content_type; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ecm_content_type (
    id numeric(18,0) NOT NULL,
    code character varying(200),
    name character varying(500),
    parent_id numeric(18,0),
    ref_structure_id numeric(18,0),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    template_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ecm_content_type OWNER TO enterprisedb;

--
-- Name: ecm_content_visitor; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ecm_content_visitor (
    id numeric(18,0) NOT NULL,
    table_name character varying(512),
    ref_structure_id numeric(18,0),
    record_id numeric(18,0),
    user_id numeric(18,0),
    created_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.ecm_content_visitor OWNER TO enterprisedb;

--
-- Name: eml_email_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.eml_email_log (
    id numeric(18,0) NOT NULL,
    email character varying(50) NOT NULL,
    action_date timestamp(6) without time zone NOT NULL,
    status character varying(200),
    from_ip character varying(50),
    newsletter_book_id numeric(18,0),
    user_id numeric(18,0),
    record_id numeric(18,0),
    ref_stucture_id numeric(18,0),
    email_template_id numeric(18,0),
    notification_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.eml_email_log OWNER TO enterprisedb;

--
-- Name: eml_email_queue; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.eml_email_queue (
    id numeric(18,0) NOT NULL,
    to_mail character varying(50) NOT NULL,
    subject character varying(100) NOT NULL,
    body_text character varying(4000) NOT NULL,
    sent_date timestamp without time zone,
    created_date timestamp without time zone NOT NULL
);


ALTER TABLE cloud_customer_uat.eml_email_queue OWNER TO enterprisedb;

--
-- Name: eml_email_schedule; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.eml_email_schedule (
    id numeric(18,0) NOT NULL,
    schedule_id numeric(18,0),
    from_address character varying(128),
    to_address character varying(128),
    cc_list character varying(4000),
    bcc_list character varying(4000),
    subject_text character varying(4000),
    attachment_url character varying(4000),
    body_text clob,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    batch_id character varying(128)
);


ALTER TABLE cloud_customer_uat.eml_email_schedule OWNER TO enterprisedb;

--
-- Name: eml_sms_schedule; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.eml_sms_schedule (
    id numeric(18,0) NOT NULL,
    schedule_id numeric(18,0),
    to_phone_number character varying(128),
    sms_message character varying(4000),
    created_date timestamp without time zone,
    created_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.eml_sms_schedule OWNER TO enterprisedb;

--
-- Name: eml_template; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.eml_template (
    id numeric(18,0) NOT NULL,
    code character varying(256),
    name character varying(1024),
    subject character varying(4000),
    message clob,
    direct_url character varying(1024),
    body_template clob,
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.eml_template OWNER TO enterprisedb;

--
-- Name: file_attach; Type: TABLE; Schema: cloud_customer_uat; Owner: cloud_platform_uat
--

CREATE TABLE cloud_customer_uat.file_attach (
    attach_id numeric(18,0) NOT NULL,
    attach_name character varying(512),
    attach character varying(1024),
    created_date timestamp without time zone DEFAULT sysdate,
    created_user_id numeric(18,0),
    file_extension character varying(10),
    file_size numeric(20,0),
    folder_id numeric(18,0),
    system_id numeric(18,0),
    attach_thumb character varying(1024),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.file_attach OWNER TO cloud_platform_uat;

--
-- Name: fin_fiscal_period_close_acc; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.fin_fiscal_period_close_acc (
    fiscal_period_id numeric(18,0),
    account_id numeric(18,0) NOT NULL,
    id numeric(18,0) NOT NULL,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    close_date timestamp without time zone,
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.fin_fiscal_period_close_acc OWNER TO enterprisedb;

--
-- Name: fin_fiscal_period_close_dep; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.fin_fiscal_period_close_dep (
    fiscal_period_id numeric(18,0) NOT NULL,
    department_id numeric(18,0) NOT NULL,
    id numeric(18,0) NOT NULL,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.fin_fiscal_period_close_dep OWNER TO enterprisedb;

--
-- Name: fin_fiscal_period_curr_object; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.fin_fiscal_period_curr_object (
    id numeric(18,0) NOT NULL,
    fiscal_period_id numeric(18,0),
    object_id numeric(18,0) NOT NULL,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    department_id numeric(18,0),
    transaction_date timestamp without time zone,
    type_code character varying(50),
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.fin_fiscal_period_curr_object OWNER TO enterprisedb;

--
-- Name: fin_fiscal_period_old; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.fin_fiscal_period_old (
    id numeric(18,0) NOT NULL,
    type_id numeric(18,0),
    period_code character varying(50),
    period_name character varying(256),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    parent_id numeric(18,0),
    is_current numeric(1,0) DEFAULT '0'::numeric,
    is_closed numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    english character varying(256),
    object_photo character varying(256),
    is_hide numeric(1,0) DEFAULT '0'::numeric,
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.fin_fiscal_period_old OWNER TO enterprisedb;

--
-- Name: fin_fiscal_period_user; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.fin_fiscal_period_user (
    id numeric(18,0) NOT NULL,
    fiscal_period_id numeric(18,0),
    user_id numeric(18,0),
    created_date timestamp without time zone,
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.fin_fiscal_period_user OWNER TO enterprisedb;

--
-- Name: hrm_employee; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.hrm_employee (
    employee_id numeric(18,0) NOT NULL,
    person_id numeric(18,0),
    employee_code character varying(100),
    employee_email character varying(80),
    employee_phone character varying(100),
    employee_mobile character varying(100),
    picture character varying(150),
    is_active numeric(1,0) DEFAULT '1'::numeric,
    is_member_laborer_union numeric(1,0) DEFAULT '0'::numeric,
    birth_place character varying(256),
    urag character varying(256),
    origin_id numeric(18,0),
    first_name character varying(512),
    last_name character varying(512),
    date_of_birth timestamp without time zone,
    gender character varying(50),
    state_reg_number character varying(50),
    country_id numeric(18,0),
    title character varying(512),
    created_date timestamp without time zone DEFAULT sysdate NOT NULL,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    profession_id numeric(18,0),
    social_insurance_number character varying(50),
    medical_insurance_number character varying(50),
    work_start_date timestamp without time zone,
    military_card_number character varying(50),
    disability_percent numeric(10,6),
    district_id numeric(18,0),
    drive_id numeric(18,0),
    social_origin_id numeric(18,0),
    zodiac_sign_id numeric(18,0),
    lunar_sign_id numeric(18,0),
    position_field_id numeric(18,0),
    marital_status_id numeric(18,0),
    is_driver numeric(1,0) DEFAULT '0'::numeric,
    no_of_family_member numeric(3,0),
    birth_order_id numeric(18,0),
    no_of_children numeric(3,0),
    city_id numeric(18,0),
    height numeric(3,0),
    blood_type_id numeric(18,0),
    drive_start_year_id numeric(18,0),
    purpose character varying(1024),
    current_status_id numeric(18,0),
    description character varying(4000),
    last_name_eng character varying(256),
    first_name_eng character varying(256),
    state_reg_number_eng character varying(50),
    current_worked_month numeric(2,0),
    initial_worked_month numeric(2,0),
    post_address character varying(1024),
    fax character varying(40),
    employee_index character varying(40),
    birth_country_id numeric(18,0),
    customer_id numeric(18,0),
    key_start_date timestamp without time zone,
    plan_id numeric(18,0),
    education_degree_code character varying(40),
    profession_code character varying(40),
    description2 clob,
    education_level_id numeric(18,0),
    contract_start_date timestamp without time zone,
    created_command_id numeric(18,0),
    modified_command_id numeric(18,0),
    profession_level_id numeric(18,0),
    template_id numeric(18,0),
    work_phone character varying(100),
    nes_user_id numeric(18,0),
    portfolio_percent numeric(9,6),
    vacation_start_date timestamp without time zone,
    company_department_id numeric(18,0),
    picture_thumb character varying(150),
    picture_small_thumb character varying(256),
    picture_middle_thumb character varying(256),
    picture_large_thumb character varying(256),
    group_id numeric(18,0),
    username character varying(256),
    translation_value clob,
    military_type_id numeric(18,0),
    weight numeric(3,0),
    created_user_name character varying(4000),
    modified_user_name character varying(4000),
    disability_type_id numeric(18,0),
    disability_mode_type_id numeric(18,0),
    disability_level_id numeric(18,0),
    civil_reg_number character varying(50)
);


ALTER TABLE cloud_customer_uat.hrm_employee OWNER TO enterprisedb;

--
-- Name: hrm_employee_key; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.hrm_employee_key (
    employee_key_id numeric(18,0) NOT NULL,
    employee_id numeric(18,0) NOT NULL,
    department_id numeric(18,0) NOT NULL,
    position_key_id numeric(18,0) NOT NULL,
    salary_key_id numeric(18,0),
    insured_type_id numeric(18,0) NOT NULL,
    status_id numeric(18,0) NOT NULL,
    is_active numeric(1,0) DEFAULT '0'::numeric NOT NULL,
    employee_code character varying(50),
    salary numeric(24,2),
    currency_id numeric(18,0),
    rectorship_id numeric(18,0),
    rectorship_number character varying(50),
    work_start_date timestamp without time zone,
    work_end_date timestamp without time zone,
    salary_level_id numeric(18,0),
    is_paying_nd numeric(1,0) DEFAULT '0'::numeric,
    employee_metadata_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    salary_extra numeric(24,6),
    salary_percent numeric(24,6),
    current_status_id numeric(18,0),
    salary_sublevel_id numeric(18,0),
    salary_type_id numeric(18,0),
    is_salary_percent numeric(1,0) DEFAULT '0'::numeric,
    position_field_id numeric(18,0),
    prl_department_id numeric(18,0),
    is_not_primary numeric(1,0) DEFAULT '0'::numeric,
    is_cross_company numeric(1,0) DEFAULT '0'::numeric,
    created_command_id numeric(18,0),
    modified_command_id numeric(18,0),
    nes_owner_id numeric(18,0),
    project_id numeric(18,0),
    current_status_start timestamp without time zone,
    current_status_end timestamp without time zone,
    company_department_id numeric(18,0),
    is_degree numeric(1,0) DEFAULT '0'::numeric,
    is_prl_type numeric(1,0),
    is_prl_percent numeric(1,0)
);


ALTER TABLE cloud_customer_uat.hrm_employee_key OWNER TO enterprisedb;

--
-- Name: hrm_position; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.hrm_position (
    position_id numeric(18,0) NOT NULL,
    position_name character varying(512) NOT NULL,
    position_code character varying(100),
    display_order numeric(20,0),
    created_user_id numeric(18,0),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    description character varying(4000),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    vocation_group_id numeric(18,0),
    position_name_en character varying(512),
    short_name character varying(50),
    group_id numeric(18,0),
    type_id numeric(18,0),
    field_id numeric(18,0),
    classification_id numeric(18,0),
    prof_level_id numeric(18,0),
    salary_type_id numeric(18,0),
    version_number numeric(3,0),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    globe_code character varying(50),
    salary numeric(24,6),
    icon character varying(256),
    department_id numeric(18,0),
    position_name2 character varying(512),
    company_department_id numeric(18,0),
    translation_value clob,
    salary_key_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.hrm_position OWNER TO enterprisedb;

--
-- Name: hrm_position_key; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.hrm_position_key (
    position_key_id numeric(18,0) NOT NULL,
    position_id numeric(18,0),
    prof_level_id numeric(18,0),
    salary_level_id numeric(18,0),
    department_id numeric(18,0),
    classification_id numeric(18,0),
    updated_date timestamp without time zone,
    is_defined numeric(1,0) DEFAULT '0'::numeric,
    is_active numeric(1,0) DEFAULT '1'::numeric,
    created_user_id numeric(18,0),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    condition_id numeric(18,0),
    code character varying(250),
    vacancy_count numeric(3,0),
    direction_id numeric(18,0),
    vacancy_description character varying(4000),
    salary_type_id numeric(18,0),
    job_description_id numeric(18,0),
    avoidance numeric(18,0),
    salary_key_id numeric(18,0),
    salary_sublevel_id numeric(18,0),
    is_succession numeric(1,0) DEFAULT '0'::numeric,
    is_talent numeric(1,0) DEFAULT '0'::numeric,
    is_evaluation_year numeric(1,0) DEFAULT 0,
    is_evaluation_quarter numeric(1,0) DEFAULT 0,
    is_evaluation_month numeric(1,0) DEFAULT 0,
    company_department_id numeric(18,0),
    wfm_status_id numeric(18,0),
    wfm_description character varying(1024),
    position_key_name character varying(4000),
    position_group_id numeric(18,0),
    job_functional_area_id numeric(18,0),
    job_family_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.hrm_position_key OWNER TO enterprisedb;

--
-- Name: im_cost_method; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.im_cost_method (
    id numeric(18,0) NOT NULL,
    code character varying(50),
    name character varying(256),
    description character varying(4000),
    parent_id numeric(18,0),
    group_keys character varying(256),
    is_calculate_full_range numeric(1,0) DEFAULT '0'::numeric,
    scale_length numeric(1,0),
    is_order_by_inserted_sequence numeric(1,0) DEFAULT '0'::numeric,
    is_skip_fix_balance numeric(1,0) DEFAULT '0'::numeric,
    is_use_department numeric(1,0) DEFAULT '0'::numeric,
    is_skip_check_balance numeric(1,0) DEFAULT '0'::numeric,
    company_department_id numeric(18,0),
    is_check_cycle numeric(1,0) DEFAULT '0'::numeric,
    department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.im_cost_method OWNER TO enterprisedb;

--
-- Name: im_item_cost_key; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.im_item_cost_key (
    id numeric(18,0) NOT NULL,
    item_key_id character varying(256) NOT NULL,
    book_date timestamp without time zone NOT NULL,
    balance_qty numeric(24,6) NOT NULL,
    unit_cost_amount numeric(24,6) NOT NULL,
    total_cost_amount numeric(24,6) NOT NULL,
    created_user_id numeric(18,0),
    created_date timestamp without time zone,
    department_id numeric(18,0),
    company_department_id numeric(18,0),
    store_keeper_key_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.im_item_cost_key OWNER TO enterprisedb;

--
-- Name: im_item_cost_key_fifo; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.im_item_cost_key_fifo (
    id numeric(18,0) NOT NULL,
    item_key_id character varying(256) NOT NULL,
    book_date timestamp without time zone NOT NULL,
    balance_qty numeric(24,6) NOT NULL,
    unit_cost_amount numeric(24,6) NOT NULL,
    total_cost_amount numeric(24,6) NOT NULL,
    cost_order character varying(50) NOT NULL,
    department_id numeric(18,0),
    company_department_id numeric(18,0),
    store_keeper_key_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.im_item_cost_key_fifo OWNER TO enterprisedb;

--
-- Name: im_item_cost_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.im_item_cost_log (
    id numeric(18,0) NOT NULL,
    cost_date timestamp without time zone NOT NULL,
    created_user_id numeric(18,0) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    error_item_key_ids character varying(4000),
    department_id numeric(18,0),
    error_text character varying(4000)
);


ALTER TABLE cloud_customer_uat.im_item_cost_log OWNER TO enterprisedb;

--
-- Name: im_item_cost_method; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.im_item_cost_method (
    id numeric(18,0) NOT NULL,
    cost_method_id numeric(18,0),
    time_type_id numeric(18,0),
    department_id numeric(18,0),
    account_id numeric(18,0),
    warehouse_id numeric(18,0),
    item_category_id numeric(18,0),
    item_id numeric(18,0),
    store_keeper_key_id numeric(18,0),
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.im_item_cost_method OWNER TO enterprisedb;

--
-- Name: im_item_cost_proportion; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.im_item_cost_proportion (
    id numeric(18,0) NOT NULL,
    general_ledger_id numeric(18,0),
    general_ledger_book_id numeric(18,0),
    general_ledger_book_sub_id numeric(18,0),
    amount_percent character varying(50)
);


ALTER TABLE cloud_customer_uat.im_item_cost_proportion OWNER TO enterprisedb;

--
-- Name: im_item_cost_tmp; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.im_item_cost_tmp (
    id numeric(18,0) NOT NULL,
    item_book_dtl_id numeric(18,0) NOT NULL,
    item_book_id numeric(18,0) NOT NULL,
    in_cost_price numeric(24,6),
    in_cost_amount numeric(24,6),
    out_cost_price numeric(18,6),
    out_cost_amount numeric(24,6)
);


ALTER TABLE cloud_customer_uat.im_item_cost_tmp OWNER TO enterprisedb;

--
-- Name: im_item_key_cost; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.im_item_key_cost (
    item_key_id numeric(18,0),
    in_date timestamp without time zone,
    qty numeric(24,6),
    cost numeric(24,6) NOT NULL,
    store_keeper_key_id numeric(18,0),
    total_cost numeric(24,6) NOT NULL,
    income_date timestamp without time zone,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    item_id numeric(18,0) NOT NULL,
    department_id numeric(18,0) NOT NULL,
    id numeric(18,0) NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.im_item_key_cost OWNER TO enterprisedb;

--
-- Name: im_item_key_cost_calc; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.im_item_key_cost_calc (
    item_key_id numeric(18,0),
    in_date timestamp without time zone NOT NULL,
    qty numeric(24,6) NOT NULL,
    cost numeric(24,6) NOT NULL,
    store_keeper_key_id numeric(18,0),
    total_cost numeric(24,6) NOT NULL,
    income_date timestamp without time zone,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    item_id numeric(18,0) NOT NULL,
    department_id numeric(18,0) NOT NULL,
    id numeric(18,0) NOT NULL,
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.im_item_key_cost_calc OWNER TO enterprisedb;

--
-- Name: jira_template; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.jira_template (
    id numeric(18,0) NOT NULL,
    code character varying(256) NOT NULL,
    name character varying(4000) NOT NULL,
    template clob NOT NULL,
    is_active numeric(1,0) DEFAULT '0'::numeric NOT NULL,
    created_date timestamp without time zone NOT NULL,
    user_query clob,
    template_type_id numeric(18,0) NOT NULL,
    criteria clob,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.jira_template OWNER TO enterprisedb;

--
-- Name: jira_template_param; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.jira_template_param (
    id numeric(18,0) NOT NULL,
    jira_template_id numeric(18,0) NOT NULL,
    template_param_path character varying(512) NOT NULL,
    process_param_path character varying(512) NOT NULL,
    default_value character varying(512)
);


ALTER TABLE cloud_customer_uat.jira_template_param OWNER TO enterprisedb;

--
-- Name: jira_template_type; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.jira_template_type (
    id numeric(18,0) NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(256) NOT NULL,
    get_process_id numeric(18,0) NOT NULL,
    find_dtl_id_query clob,
    update_query character varying(4000)
);


ALTER TABLE cloud_customer_uat.jira_template_type OWNER TO enterprisedb;

--
-- Name: knowledge_category; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.knowledge_category (
    id numeric(18,0) NOT NULL,
    code character varying(512),
    name character varying(512),
    description character varying(1024),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    parent_id numeric(18,0),
    wfm_status_id numeric(18,0),
    wfm_desription character varying(1024),
    icon character varying(512),
    icon_color character varying(512),
    order_number character varying(512),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    related_indicator_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.knowledge_category OWNER TO enterprisedb;

--
-- Name: knowledge_copy; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.knowledge_copy (
    knowledge_id numeric(18,0) NOT NULL,
    knowledge_code character varying(100),
    knowledge_name character varying(512),
    is_active numeric(1,0) DEFAULT '0'::numeric NOT NULL,
    parent_id numeric(18,0),
    created_date timestamp without time zone NOT NULL,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone NOT NULL,
    modified_user_id numeric(18,0),
    measure_id numeric(18,0),
    category_id numeric(18,0),
    wfm_status_id numeric(18,0),
    wfm_description character varying(1024),
    recommendation character varying(1024),
    attention character varying(1024),
    real_example character varying(1024),
    sample character varying(1024),
    type_id numeric(18,0),
    tag_ids character varying(512),
    order_number numeric(3,0),
    knowledge_description clob,
    knowledge_description3 character varying(4000),
    knowledge_description1 character varying(4000)
);


ALTER TABLE cloud_customer_uat.knowledge_copy OWNER TO enterprisedb;

--
-- Name: knowledge_helpful; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.knowledge_helpful (
    id numeric(18,0) NOT NULL,
    knowledge_id numeric(18,0),
    yes numeric(1,0),
    no numeric(1,0),
    created_user_id numeric(18,0),
    created_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.knowledge_helpful OWNER TO enterprisedb;

--
-- Name: knowledge_meta_data_map; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.knowledge_meta_data_map (
    id numeric(18,0) NOT NULL,
    meta_data_id numeric(18,0),
    knowledge_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.knowledge_meta_data_map OWNER TO enterprisedb;

--
-- Name: knowledge_type; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.knowledge_type (
    id numeric(18,0) NOT NULL,
    code character varying(50),
    name character varying(256),
    created_user_id numeric(18,0),
    created_date timestamp without time zone,
    parent_id numeric(18,0),
    icon character varying(256),
    is_active numeric(1,0) DEFAULT '0'::numeric
);


ALTER TABLE cloud_customer_uat.knowledge_type OWNER TO enterprisedb;

--
-- Name: meta_dm_record_map; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.meta_dm_record_map (
    id numeric(18,0),
    src_table_name character varying(4000),
    src_record_id numeric(18,0),
    trg_table_name character varying(32),
    trg_record_id numeric(18,0),
    on_delete character varying(20),
    on_update character varying(20),
    delete_process_id numeric(18,0),
    semantic_type_id numeric(18,0),
    semantic_value character varying(1024),
    wfm_status_id numeric(18,0),
    wfm_description character varying(1024),
    fact_1 numeric(24,6),
    fact_2 numeric(24,6),
    fact_3 numeric(24,6),
    fact_4 numeric(24,6),
    fact_5 numeric(24,6),
    fact_6 numeric(24,6),
    fact_7 numeric(24,6),
    fact_8 numeric(24,6),
    fact_9 numeric(24,6),
    fact_10 numeric(24,6),
    dim_1 numeric(18,0),
    dim_2 numeric(18,0),
    dim_3 numeric(18,0),
    dim_4 numeric(18,0),
    dim_5 numeric(18,0),
    dim_6 numeric(18,0),
    dim_7 numeric(18,0),
    dim_8 numeric(18,0),
    dim_9 numeric(18,0),
    dim_10 numeric(18,0),
    text_1 character varying(4000),
    text_2 character varying(4000),
    text_3 character varying(4000),
    text_4 character varying(4000),
    text_5 character varying(4000),
    text_6 character varying(4000),
    text_7 character varying(4000),
    text_8 character varying(4000),
    text_9 character varying(4000),
    text_10 character varying(4000),
    date_1 timestamp without time zone,
    date_2 timestamp without time zone,
    date_3 timestamp without time zone,
    date_4 timestamp without time zone,
    date_5 timestamp without time zone,
    date_6 timestamp without time zone,
    date_7 timestamp without time zone,
    date_8 timestamp without time zone,
    date_9 timestamp without time zone,
    date_10 timestamp without time zone,
    check_1 numeric(1,0),
    check_2 numeric(1,0),
    check_3 numeric(1,0),
    check_4 numeric(1,0),
    check_5 numeric(1,0),
    check_6 numeric(1,0),
    check_7 numeric(1,0),
    check_8 numeric(1,0),
    check_9 numeric(1,0),
    check_10 numeric(1,0),
    clob_1 clob,
    trg_record_char character varying(4000),
    src_record_char character varying(4000),
    order_num character varying(1024) DEFAULT '0'::character varying,
    src_wfm_workflow_id numeric(18,0),
    trg_wfm_workflow_id numeric(18,0),
    src_wfm_status_id numeric(18,0),
    trg_wfm_status_id numeric(18,0),
    template_id numeric(18,0),
    src_name character varying(256),
    trg_name character varying(256),
    src_ref_structure_id numeric(18,0),
    trg_ref_structure_id numeric(18,0),
    created_user_id numeric(18,0),
    created_date timestamp without time zone,
    department_id numeric(18,0),
    dataview_id numeric(18,0),
    object_id numeric(18,0),
    src_code character varying(128),
    trg_code character varying(128)
);


ALTER TABLE cloud_customer_uat.meta_dm_record_map OWNER TO enterprisedb;

--
-- Name: meta_wfm_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.meta_wfm_log (
    id numeric(18,0) NOT NULL,
    ref_structure_id numeric(18,0) NOT NULL,
    record_id numeric(18,0) NOT NULL,
    wfm_status_id numeric(18,0) NOT NULL,
    wfm_description character varying(4000),
    created_date timestamp without time zone NOT NULL,
    created_user_id numeric(18,0) NOT NULL,
    content_hash character varying(1024),
    cipher_text character varying(1024),
    guid character varying(50),
    alias_user_id numeric(18,0),
    prev_wfm_status_id numeric(18,0),
    time_spent numeric(18,0),
    actual_time numeric(24,6)
);


ALTER TABLE cloud_customer_uat.meta_wfm_log OWNER TO enterprisedb;

--
-- Name: meta_wfm_status_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.meta_wfm_status_log (
    id numeric(18,0) NOT NULL,
    wfm_status_code character varying(50),
    wfm_status_name character varying(256),
    process_name character varying(512),
    wfm_workflow_id numeric(18,0),
    is_active numeric(1,0) DEFAULT NULL::numeric,
    wfm_status_color character varying(50),
    process_meta_data_id numeric(18,0),
    is_direct numeric(1,0) DEFAULT NULL::numeric,
    is_need_sign numeric(1,0) DEFAULT NULL::numeric,
    is_desc_required numeric(1,0) DEFAULT NULL::numeric,
    is_send_mail numeric(1,0) DEFAULT NULL::numeric,
    wfm_global_status_id numeric(18,0),
    from_notification_id numeric(18,0),
    to_notification_id numeric(18,0),
    is_notify_to_created_user numeric(1,0) DEFAULT NULL::numeric,
    top character varying(20),
    "left" character varying(20),
    parent_id numeric(18,0),
    is_userdef_assign numeric(1,0) DEFAULT NULL::numeric,
    is_userdef_rule numeric(1,0) DEFAULT NULL::numeric,
    default_rule_id numeric(18,0),
    default_rule_status_id numeric(18,0),
    assigned_to_notif_id numeric(18,0),
    assigned_from_notif_id numeric(18,0),
    alias_name character varying(256),
    notification_id numeric(18,0),
    use_process_window numeric(1,0),
    use_description_window numeric(1,0),
    is_form_notsubmit numeric(1,0) DEFAULT NULL::numeric,
    is_filter_users_by_department numeric(1,0) DEFAULT NULL::numeric,
    created_user_notification_id numeric(18,0),
    order_number numeric(24,6),
    is_mail_action numeric(1,0) DEFAULT NULL::numeric,
    is_check_assign_criteria numeric(1,0) DEFAULT NULL::numeric,
    wfm_status_icon character varying(64),
    mobile_process_meta_data_id numeric(18,0),
    is_ignore_row numeric(1,0) DEFAULT NULL::numeric,
    is_inherit_assign numeric(1,0) DEFAULT NULL::numeric,
    is_hide_next_user numeric(1,0) DEFAULT NULL::numeric,
    is_ignore_sorting numeric(1,0) DEFAULT NULL::numeric,
    is_filter_log numeric(1,0) DEFAULT NULL::numeric,
    from_status_name character varying(256),
    to_status_name character varying(256),
    assign_dataview_id numeric(18,0),
    is_send_mail1 numeric(1,0) DEFAULT NULL::numeric,
    is_pack numeric(1,0) DEFAULT NULL::numeric,
    close_process_window numeric(1,0),
    is_hide_file numeric(1,0) DEFAULT NULL::numeric,
    is_file_preview numeric(1,0) DEFAULT NULL::numeric,
    log_action character varying(128),
    log_created_date timestamp without time zone,
    log_created_user_id numeric(18,0),
    log_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.meta_wfm_status_log OWNER TO enterprisedb;

--
-- Name: meta_wfm_status_permission; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.meta_wfm_status_permission (
    id numeric(18,0),
    wfm_status_id numeric(18,0),
    user_id numeric(18,0),
    role_id numeric(18,0),
    is_edit numeric(1,0) DEFAULT '1'::numeric,
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    access_log_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.meta_wfm_status_permission OWNER TO enterprisedb;

--
-- Name: meta_wfm_status_permission_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.meta_wfm_status_permission_log (
    id numeric(18,0),
    wfm_status_id numeric(18,0),
    user_id numeric(18,0),
    role_id numeric(18,0),
    is_edit numeric(1,0) DEFAULT NULL::numeric,
    log_action character varying(128),
    log_created_date timestamp without time zone,
    log_created_user_id numeric(18,0),
    log_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.meta_wfm_status_permission_log OWNER TO enterprisedb;

--
-- Name: nlt_newsletter_book; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.nlt_newsletter_book (
    id numeric(18,0) NOT NULL,
    code character varying(512),
    name character varying(512),
    template_id numeric(18,0),
    schedule_id numeric(18,0),
    title_header character varying(512),
    description character varying(1024),
    file_type character varying(512),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    url character varying(1024),
    notification_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.nlt_newsletter_book OWNER TO enterprisedb;

--
-- Name: nlt_newsletter_dtl; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.nlt_newsletter_dtl (
    id numeric(18,0) NOT NULL,
    newsletter_book_id numeric(18,0),
    title_name character varying(1024),
    meta_data_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    url character varying(1024),
    is_html numeric(1,0) DEFAULT '0'::numeric
);


ALTER TABLE cloud_customer_uat.nlt_newsletter_dtl OWNER TO enterprisedb;

--
-- Name: nlt_newsletter_schedule; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.nlt_newsletter_schedule (
    id numeric(18,0) NOT NULL,
    book_id numeric(18,0),
    schedule_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.nlt_newsletter_schedule OWNER TO enterprisedb;

--
-- Name: nlt_newsletter_template; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.nlt_newsletter_template (
    id numeric(18,0) NOT NULL,
    code character varying(512),
    name character varying(1024),
    hdr_section numeric(18,0),
    body_section numeric(18,0),
    dtl_section numeric(18,0),
    description character varying(1024),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.nlt_newsletter_template OWNER TO enterprisedb;

--
-- Name: nlt_notification_map; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.nlt_notification_map (
    id numeric(18,0) NOT NULL,
    book_id numeric(18,0),
    schedule_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.nlt_notification_map OWNER TO enterprisedb;

--
-- Name: ntf_dash_notification; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_dash_notification (
    id numeric(21,0) NOT NULL,
    type character varying(25),
    user_id numeric(21,0),
    content_id numeric(21,0)
);


ALTER TABLE cloud_customer_uat.ntf_dash_notification OWNER TO enterprisedb;

--
-- Name: ntf_mention_config; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_mention_config (
    id numeric(18,0) NOT NULL,
    ref_structure_id numeric(18,0),
    get_meta_data_id numeric(18,0),
    notification_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ntf_mention_config OWNER TO enterprisedb;

--
-- Name: ntf_notification; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification (
    notification_id numeric(18,0) NOT NULL,
    notification_type_id numeric(18,0),
    direct_url character varying(1024),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    mobile_url character varying(1024),
    path_tag character varying(1024),
    message clob,
    subject character varying(4000),
    sms_message character varying(256),
    is_by_user_email numeric(1,0) DEFAULT '0'::numeric,
    is_no_msg_substr numeric(1,0) DEFAULT '0'::numeric,
    is_mail_attach numeric(1,0) DEFAULT '0'::numeric
);


ALTER TABLE cloud_customer_uat.ntf_notification OWNER TO enterprisedb;

--
-- Name: ntf_notification_action; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_action (
    id numeric(18,0) NOT NULL,
    notification_id numeric(18,0),
    process_meta_data_id numeric(18,0),
    display_name character varying(50),
    order_num numeric(3,0)
);


ALTER TABLE cloud_customer_uat.ntf_notification_action OWNER TO enterprisedb;

--
-- Name: ntf_notification_action_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_action_log (
    id numeric(18,0) NOT NULL,
    notification_id numeric(18,0),
    process_code character varying(50),
    result character varying(50),
    user_id numeric(18,0),
    request_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.ntf_notification_action_log OWNER TO enterprisedb;

--
-- Name: ntf_notification_follow; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_follow (
    id numeric(18,0) NOT NULL,
    record_id numeric(18,0),
    user_id numeric(18,0),
    created_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.ntf_notification_follow OWNER TO enterprisedb;

--
-- Name: ntf_notification_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_log (
    id numeric(18,0) NOT NULL,
    action_date timestamp without time zone,
    notification_id numeric(18,0),
    process_notification_id numeric(18,0),
    system_meta_group_id numeric(18,0),
    ref_meta_group_id numeric(18,0),
    user_query character varying(2048),
    description character varying(2048)
);


ALTER TABLE cloud_customer_uat.ntf_notification_log OWNER TO enterprisedb;

--
-- Name: ntf_notification_param; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_param (
    notification_id numeric(18,0) NOT NULL,
    param_name character varying(512) NOT NULL,
    param_value character varying(500),
    param_id numeric(18,0) NOT NULL,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ntf_notification_param OWNER TO enterprisedb;

--
-- Name: ntf_notification_process; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_process (
    notification_process_id numeric(18,0) NOT NULL,
    process_meta_data_id numeric(18,0) NOT NULL,
    notification_id numeric(18,0),
    user_process_meta_data_id numeric(18,0),
    notify_date timestamp without time zone,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    is_use_criteria numeric(1,0) DEFAULT '0'::numeric,
    user_criteria character varying(4000),
    send_criteria character varying(4000)
);


ALTER TABLE cloud_customer_uat.ntf_notification_process OWNER TO enterprisedb;

--
-- Name: ntf_notification_process_param; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_process_param (
    notification_process_param_id numeric(18,0) NOT NULL,
    notification_process_id numeric(18,0) NOT NULL,
    notification_param_path character varying(256),
    process_param_path character varying(256),
    default_value character varying(256),
    created_date timestamp without time zone NOT NULL,
    created_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ntf_notification_process_param OWNER TO enterprisedb;

--
-- Name: ntf_notification_schedule_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_schedule_log (
    id numeric(18,0) NOT NULL,
    structure_id numeric(18,0),
    record_id numeric(18,0),
    wfm_status_id numeric(18,0),
    user_id numeric(18,0),
    notification_id numeric(18,0),
    created_date timestamp without time zone,
    is_mail numeric(1,0) DEFAULT '0'::numeric,
    is_sent numeric(1,0) DEFAULT '0'::numeric,
    sent_date timestamp without time zone,
    schedule_id numeric(18,0),
    created_user_id numeric(18,0),
    is_sms numeric(1,0) DEFAULT '0'::numeric
);


ALTER TABLE cloud_customer_uat.ntf_notification_schedule_log OWNER TO enterprisedb;

--
-- Name: ntf_notification_system; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_system (
    notification_id numeric(18,0) NOT NULL,
    system_id numeric(18,0) NOT NULL,
    id numeric(18,0) DEFAULT '0'::numeric NOT NULL,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ntf_notification_system OWNER TO enterprisedb;

--
-- Name: ntf_notification_template_map; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_template_map (
    id numeric(18,0) NOT NULL,
    meta_data_id numeric(18,0) NOT NULL,
    notification_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    user_criteria character varying(4000),
    send_criteria character varying(4000)
);


ALTER TABLE cloud_customer_uat.ntf_notification_template_map OWNER TO enterprisedb;

--
-- Name: ntf_notification_type; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_type (
    notification_type_id numeric(18,0) NOT NULL,
    notification_type_name character varying(512),
    notification_type_description character varying(4000),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    display_color character varying(50),
    icon character varying(50),
    icon_color character varying(50),
    system_id numeric(18,0),
    module_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ntf_notification_type OWNER TO enterprisedb;

--
-- Name: ntf_notification_user; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_user (
    notification_user_id numeric(18,0) NOT NULL,
    notification_id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    notify_date timestamp without time zone,
    read_date timestamp without time zone,
    role_id numeric(18,0),
    created_date timestamp(6) without time zone DEFAULT sysdate,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    direct_url character varying(1024),
    mobile_url character varying(1024),
    notification_data character varying(2048),
    viewed_date timestamp without time zone,
    message_old character varying(4000),
    record_id numeric(18,0),
    ref_stucture_id numeric(18,0),
    message clob
);


ALTER TABLE cloud_customer_uat.ntf_notification_user OWNER TO enterprisedb;

--
-- Name: ntf_notification_user_param; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notification_user_param (
    id numeric(18,0) NOT NULL,
    notification_user_id numeric(18,0),
    ntf_param_path character varying(50),
    ntf_param_value character varying(4000),
    action_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ntf_notification_user_param OWNER TO enterprisedb;

--
-- Name: ntf_notify; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notify (
    id numeric(18,0) NOT NULL,
    code character varying(50),
    user_id numeric(18,0),
    message character varying(4000)
);


ALTER TABLE cloud_customer_uat.ntf_notify OWNER TO enterprisedb;

--
-- Name: ntf_notify_all; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notify_all (
    id numeric(18,0) NOT NULL,
    notification_id numeric(18,0),
    meta_data_id numeric(18,0),
    is_active numeric(1,0) DEFAULT '0'::numeric
);


ALTER TABLE cloud_customer_uat.ntf_notify_all OWNER TO enterprisedb;

--
-- Name: ntf_notify_all_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_notify_all_log (
    id numeric(18,0) NOT NULL,
    notify_all_id numeric(18,0),
    user_id numeric(18,0),
    is_checked numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    created_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ntf_notify_all_log OWNER TO enterprisedb;

--
-- Name: ntf_template; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_template (
    template_id numeric(18,0) NOT NULL,
    template_name character varying(255),
    template_description character varying(4000),
    globe_dictionary_code character varying(100) NOT NULL,
    template_code character varying(50) NOT NULL,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ntf_template OWNER TO enterprisedb;

--
-- Name: ntf_template_system; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_template_system (
    template_id numeric(18,0) NOT NULL,
    system_id numeric(18,0) NOT NULL,
    id numeric(18,0) NOT NULL,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ntf_template_system OWNER TO enterprisedb;

--
-- Name: ntf_template_user; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_template_user (
    template_user_id numeric(18,0) NOT NULL,
    template_id numeric(18,0),
    user_id numeric(18,0),
    is_mail numeric(1,0) DEFAULT '0'::numeric,
    is_sms numeric(1,0) DEFAULT '0'::numeric,
    is_instant numeric(1,0) DEFAULT '0'::numeric,
    role_id numeric(18,0),
    template_code character varying(50) NOT NULL,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ntf_template_user OWNER TO enterprisedb;

--
-- Name: ntf_user_config; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ntf_user_config (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    notification_id numeric(18,0),
    schedule_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ntf_user_config OWNER TO enterprisedb;

--
-- Name: org_department; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.org_department (
    department_id numeric(18,0) NOT NULL,
    is_active numeric(1,0) DEFAULT '0'::numeric,
    display_order numeric(20,0),
    parent_id numeric(18,0),
    department_code character varying(256),
    department_name character varying(512),
    created_user_id numeric(18,0),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    coordinate character varying(128),
    type_id numeric(18,0),
    classification_id numeric(18,0),
    status_id numeric(18,0),
    wfm_status_id numeric(18,0),
    wfm_description character varying(1024),
    wfm_workflow_id numeric(18,0),
    dependency_department_id numeric(18,0),
    department_name_en character varying(512),
    segment_id numeric(18,0),
    channel_id numeric(18,0),
    company_id numeric(18,0),
    system_url character varying(512),
    wsdl_url character varying(512),
    director_prof_level_id numeric(18,0),
    customer_id numeric(18,0),
    salary_percent numeric(9,6),
    object_photo character varying(256),
    globe_code character varying(50),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    version_number numeric(3,0),
    name_path character varying(1024),
    hier_order character varying(4000),
    vatsp_number character varying(50),
    industry_id numeric(18,0),
    ownership_type_id numeric(18,0),
    registration_number character varying(512),
    tax_customer_id numeric(18,0),
    register_number character varying(50),
    is_person numeric(1,0) DEFAULT '0'::numeric,
    description character varying(4000),
    is_company numeric(1,0) DEFAULT '0'::numeric,
    company_department_id numeric(18,0),
    translation_value clob,
    time_zone_id numeric(18,0),
    primary_currency_id numeric(18,0),
    secondary_currency_id numeric(18,0),
    parent_department_level1 character varying(256),
    parent_department_level2 character varying(256),
    parent_department_level3 character varying(256),
    id numeric(18,0),
    indicator_id numeric(18,0),
    src_record_id numeric(18,0),
    data clob,
    name character varying(4000),
    created_user_name character varying(256),
    modified_user_name character varying(256),
    deleted_date timestamp without time zone,
    deleted_user_id numeric(18,0),
    deleted_user_name character varying(4000),
    cloud_department_id numeric(18,0),
    status_1 character varying(50),
    status_2 character varying(50),
    status_3 character varying(50),
    status_4 character varying(50),
    status_5 character varying(50),
    status_6 character varying(50),
    status_7 character varying(50),
    status_8 character varying(50),
    status_9 character varying(50),
    status_10 character varying(50),
    is_shop numeric(1,0) DEFAULT '0'::numeric,
    organization_type_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.org_department OWNER TO enterprisedb;

--
-- Name: org_department_language; Type: TABLE; Schema: cloud_customer_uat; Owner: cloud_platform_uat
--

CREATE TABLE cloud_customer_uat.org_department_language (
    id numeric(18,0) NOT NULL,
    department_id numeric(18,0),
    language_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.org_department_language OWNER TO cloud_platform_uat;

--
-- Name: prl_calc; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.prl_calc (
    id numeric(18,0) NOT NULL,
    calc_code numeric(18,0),
    calc_name character varying(256),
    calc_order numeric(18,0),
    year numeric(4,0),
    month numeric(2,0),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    work_day numeric(18,2),
    short_name character varying(512),
    calc_date timestamp without time zone,
    department_id numeric(18,0),
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.prl_calc OWNER TO enterprisedb;

--
-- Name: prl_calc_department; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.prl_calc_department (
    id numeric(18,0) NOT NULL,
    calc_id numeric(18,0),
    department_id numeric(18,0),
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.prl_calc_department OWNER TO enterprisedb;

--
-- Name: prl_calc_type; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.prl_calc_type (
    id numeric(18,0) NOT NULL,
    calc_type_code character varying(50),
    calc_type_name character varying(256),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    is_system numeric(1,0) DEFAULT '0'::numeric,
    is_employee numeric(1,0) DEFAULT '0'::numeric,
    list_meta_data_id numeric(18,0),
    emp_status_criteria character varying(256),
    emp_current_status_criteria character varying(256),
    use_book_number numeric(1,0),
    emp_position_criteria character varying(1024),
    is_prl_department numeric(1,0) DEFAULT '0'::numeric,
    version_number numeric(5,0),
    emp_notin_position_criteria character varying(1024),
    company_department_id numeric(18,0),
    description character varying(2000)
);


ALTER TABLE cloud_customer_uat.prl_calc_type OWNER TO enterprisedb;

--
-- Name: prl_salary_book; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.prl_salary_book (
    id numeric(18,0) NOT NULL,
    department_id numeric(18,0),
    calc_id numeric(18,0),
    created_user_id numeric(18,0),
    created_date timestamp without time zone,
    modified_user_id numeric(18,0),
    modified_date timestamp without time zone,
    wfm_workflow_id numeric(18,0),
    wfm_status_id numeric(18,0),
    calc_type_id numeric(18,0),
    wfm_description character varying(1024),
    is_locked numeric(1,0) DEFAULT '0'::numeric,
    batch_number numeric(18,0),
    book_number numeric(18,0),
    book_type_id numeric(18,0),
    employee_id numeric(18,0),
    related_record_id numeric(18,0),
    employee_key_id numeric(18,0),
    criteria_template_id numeric(18,0),
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.prl_salary_book OWNER TO enterprisedb;

--
-- Name: prl_salary_sheet; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.prl_salary_sheet (
    id numeric(18,0) NOT NULL,
    employee_key_id numeric(18,0),
    sal_book_id numeric(18,0),
    calc_type_id numeric(18,0),
    iscass numeric(1,0),
    wfm_status_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    f100 numeric(24,6),
    f101 numeric(24,6),
    f102 numeric(24,6),
    f103 numeric(24,6) DEFAULT NULL::numeric,
    f104 numeric(24,6),
    f105 numeric(24,6),
    f106 numeric(24,6),
    f107 numeric(24,6),
    f108 numeric(24,6),
    f109 numeric(24,6),
    f110 numeric(24,6),
    f111 numeric(24,6),
    f112 numeric(24,6),
    f113 numeric(24,6),
    f114 numeric(24,6),
    f115 numeric(24,6),
    f116 numeric(24,6),
    f117 numeric(24,6),
    f118 numeric(24,6),
    f119 numeric(24,6),
    f120 numeric(24,6),
    f121 numeric(24,6),
    f122 numeric(24,6),
    f123 numeric(24,6),
    f124 numeric(24,6),
    f125 numeric(24,6),
    f126 numeric(24,6),
    f127 numeric(24,6),
    f128 numeric(24,6),
    f129 numeric(24,6),
    f130 numeric(24,6),
    f131 numeric(24,6),
    f132 numeric(24,6),
    f133 numeric(24,6),
    f134 numeric(24,6),
    f135 numeric(24,6),
    f136 numeric(24,6),
    f137 numeric(24,6),
    f138 numeric(24,6),
    f139 numeric(24,6),
    f140 numeric(24,6),
    f141 numeric(24,6),
    f142 numeric(24,6),
    f143 numeric(24,6),
    f144 numeric(24,6),
    f145 numeric(24,6),
    f146 numeric(24,6),
    f147 numeric(24,6),
    f148 numeric(24,6),
    f149 numeric(24,6),
    f150 numeric(24,6),
    f151 numeric(24,6),
    f152 numeric(24,6),
    f153 numeric(24,6),
    f154 numeric(24,6),
    f155 numeric(24,6),
    f156 numeric(24,6),
    f157 numeric(24,6),
    f158 numeric(24,6),
    f159 numeric(24,6),
    f160 numeric(24,6),
    f161 numeric(24,6),
    f162 numeric(24,6),
    f163 numeric(24,6),
    f164 numeric(24,6),
    f165 numeric(24,6),
    f166 numeric(24,6),
    f167 numeric(24,6),
    f168 numeric(24,6),
    f169 numeric(24,6),
    f170 numeric(24,6),
    f171 numeric(24,6),
    f172 numeric(24,6),
    f173 numeric(24,6),
    f174 numeric(24,6),
    f175 numeric(24,6),
    f176 numeric(24,6),
    f177 numeric(24,6),
    f178 numeric(24,6),
    f179 numeric(24,6),
    f180 numeric(24,6),
    f181 numeric(24,6),
    f182 numeric(24,6),
    f183 numeric(24,6),
    f184 numeric(24,6),
    f185 timestamp without time zone,
    f186 timestamp without time zone,
    f187 numeric(24,6),
    f188 numeric(24,6),
    f189 timestamp without time zone,
    f190 timestamp without time zone,
    f191 numeric(24,6),
    f192 numeric(24,6),
    f193 numeric(24,6),
    f194 numeric(24,6),
    f195 numeric(24,6),
    f196 numeric(24,6),
    f197 numeric(24,6),
    f198 numeric(24,6),
    f199 numeric(24,6),
    f200 numeric(24,6),
    f201 numeric(24,6),
    f202 numeric(24,6),
    f203 numeric(24,6),
    f204 numeric(24,6),
    f205 numeric(24,6),
    f206 numeric(24,6),
    f207 numeric(24,6),
    f208 numeric(24,6),
    f209 numeric(24,6),
    f210 numeric(24,6),
    f211 numeric(24,6),
    f212 numeric(24,6),
    f213 numeric(24,6),
    f214 numeric(24,6),
    f215 numeric(24,6),
    f216 numeric(24,6),
    f217 numeric(24,6),
    f218 numeric(24,6),
    f219 numeric(24,6),
    f220 numeric(24,6),
    f221 numeric(24,6),
    f222 numeric(24,6),
    f223 numeric(24,6),
    f224 numeric(24,6),
    f225 numeric(24,6),
    f226 numeric(24,6),
    f227 numeric(24,6),
    f228 numeric(24,6),
    f229 numeric(24,6),
    f230 numeric(24,6),
    f231 numeric(24,6),
    f232 numeric(24,6),
    f233 numeric(24,6),
    f234 numeric(24,6),
    f235 numeric(24,6),
    f236 numeric(24,6),
    f237 numeric(24,6),
    f238 numeric(24,6),
    f239 numeric(24,6),
    f240 numeric(24,6),
    f241 numeric(24,6),
    f242 numeric(24,6),
    f243 numeric(1,0),
    f244 numeric(24,6),
    f245 numeric(24,6),
    f246 numeric(24,6),
    f247 numeric(24,6),
    f248 numeric(24,6),
    f249 numeric(24,6),
    f250 numeric(24,6),
    f251 numeric(24,6),
    f252 numeric(24,6),
    f253 numeric(24,6),
    f254 numeric(24,6),
    f255 numeric(24,6),
    f256 numeric(24,6),
    f257 numeric(24,6),
    f258 numeric(24,6),
    f259 numeric(1,0),
    f260 numeric(24,6),
    f261 numeric(1,0),
    f262 numeric(24,6),
    f263 numeric(24,6),
    f264 numeric(24,6),
    f265 numeric(24,6),
    f266 numeric(24,6),
    f267 numeric(24,6),
    f268 numeric(24,6),
    f269 numeric(24,6),
    f270 numeric(24,6),
    f271 numeric(24,6),
    f272 numeric(24,6),
    f273 numeric(24,6),
    f274 numeric(24,6),
    f275 numeric(24,6),
    f276 numeric(24,6),
    f277 numeric(24,6),
    f278 numeric(24,6),
    f279 numeric(24,6),
    f280 numeric(24,6),
    f281 numeric(24,6),
    f282 numeric(24,6),
    f283 numeric(24,6),
    f284 numeric(24,6),
    f285 numeric(24,6),
    f286 numeric(24,6),
    f287 numeric(24,6),
    f288 numeric(24,6),
    f289 numeric(24,6),
    f290 numeric(24,6),
    f291 numeric(24,6),
    f292 numeric(24,6),
    f293 numeric(24,6),
    f294 numeric(24,6),
    f295 numeric(24,6),
    f296 numeric(24,6),
    f297 numeric(24,6),
    f298 numeric(24,6),
    f299 numeric(24,6),
    f300 numeric(24,6),
    f301 numeric(24,6),
    f302 numeric(24,6),
    f303 numeric(24,6),
    f304 numeric(24,6),
    f305 numeric(24,6),
    f306 numeric(24,6),
    f307 numeric(24,6),
    f308 numeric(24,6),
    f309 numeric(24,6),
    f310 numeric(24,6),
    f311 numeric(24,6),
    f312 numeric(24,6),
    f313 numeric(24,6),
    f314 numeric(24,6),
    f315 numeric(24,6),
    f316 numeric(24,6),
    f317 numeric(24,6),
    f318 numeric(24,6),
    f319 numeric(24,6),
    f320 numeric(24,6),
    f321 numeric(24,6),
    f322 numeric(24,6),
    f323 numeric(24,6),
    f324 numeric(24,6),
    f325 numeric(24,6),
    f326 numeric(24,6),
    f327 numeric(24,6),
    f328 numeric(24,6),
    f329 numeric(24,6),
    f330 numeric(24,6),
    f331 numeric(24,6),
    f332 numeric(24,6),
    f333 numeric(24,6),
    f334 numeric(24,6),
    f335 numeric(24,6),
    f336 numeric(24,6),
    f337 numeric(24,6),
    f338 numeric(24,6),
    f339 numeric(24,6),
    f340 numeric(24,6),
    f341 numeric(24,6),
    f342 numeric(24,6),
    f343 numeric(24,6),
    f344 numeric(24,6),
    f345 numeric(24,6),
    f346 numeric(24,6),
    f347 numeric(24,6),
    f348 numeric(24,6),
    f349 numeric(24,6),
    f350 numeric(24,6),
    f351 numeric(24,6),
    f352 numeric(24,6),
    f353 numeric(24,6),
    f354 numeric(24,6),
    f355 numeric(24,6),
    f356 numeric(24,6),
    f357 numeric(24,6),
    f358 numeric(24,6),
    f359 numeric(24,6),
    f360 numeric(24,6),
    f361 numeric(24,6),
    f362 numeric(24,6),
    f363 numeric(24,6),
    f364 numeric(24,6),
    f365 numeric(24,6),
    f366 numeric(24,6),
    f367 numeric(24,6),
    f368 numeric(24,6),
    f369 numeric(24,6),
    f370 numeric(24,6),
    f371 numeric(24,6),
    f372 numeric(24,6),
    f373 numeric(24,6),
    f374 numeric(24,6),
    f375 numeric(24,6),
    f376 numeric(24,6),
    f377 numeric(24,6),
    f378 numeric(24,6),
    f379 numeric(24,6),
    f380 numeric(24,6),
    f381 numeric(24,6),
    f382 numeric(24,6),
    f383 numeric(24,6),
    f384 numeric(24,6),
    f385 numeric(24,6),
    f386 numeric(24,6),
    f387 numeric(24,6),
    f388 numeric(24,6),
    f389 numeric(24,6),
    f390 numeric(24,6),
    f391 numeric(24,6),
    f392 numeric(24,6),
    f393 numeric(24,6),
    f394 numeric(24,6),
    f395 numeric(24,6),
    f396 numeric(24,6),
    f397 numeric(24,6),
    f398 numeric(24,6),
    f399 numeric(24,6),
    f400 numeric(24,6),
    f1 character varying(2000),
    f2 character varying(2000),
    f3 character varying(2000),
    f4 character varying(2000),
    f5 character varying(2000),
    f6 character varying(2000),
    f7 character varying(2000),
    f8 character varying(2000),
    f9 character varying(2000),
    f10 character varying(2000),
    f11 timestamp without time zone,
    f12 timestamp without time zone,
    f13 timestamp without time zone,
    f14 timestamp without time zone,
    f15 timestamp without time zone,
    f16 timestamp without time zone,
    f17 timestamp without time zone,
    f18 timestamp without time zone,
    f19 timestamp without time zone,
    f20 timestamp without time zone,
    f21 numeric(1,0),
    f22 numeric(1,0),
    f23 numeric(1,0),
    f24 numeric(1,0),
    f25 numeric(1,0),
    f26 numeric(1,0),
    f27 numeric(1,0),
    f28 numeric(1,0),
    f29 numeric(1,0),
    f30 numeric(1,0),
    f31 numeric(18,0),
    f32 numeric(18,0),
    f33 numeric(18,0),
    f34 numeric(18,0),
    f35 numeric(18,0),
    f36 numeric(18,0),
    f37 numeric(18,0),
    f38 numeric(18,0),
    f39 numeric(18,0),
    f40 numeric(18,0),
    f41 numeric(18,0),
    f42 numeric(18,0),
    f43 numeric(18,0),
    f44 numeric(18,0),
    f45 numeric(18,0),
    f46 numeric(18,0),
    f47 numeric(18,0),
    f48 numeric(18,0),
    f49 numeric(18,0),
    f50 numeric(18,0),
    f51 numeric(24,6),
    f52 numeric(24,6),
    f53 numeric(24,6),
    f54 numeric(24,6),
    f55 numeric(24,6),
    f56 numeric(24,6),
    f57 numeric(24,6),
    f58 numeric(24,6),
    f59 numeric(24,6),
    f60 numeric(24,6),
    f61 numeric(24,6),
    f62 numeric(24,6),
    f63 numeric(24,6),
    f64 numeric(24,6),
    f65 numeric(24,6),
    f66 numeric(24,6),
    f67 numeric(24,6),
    f68 numeric(24,6),
    f69 numeric(24,6),
    f70 numeric(24,6),
    f71 numeric(24,6),
    f72 numeric(24,6),
    f73 numeric(24,6),
    f74 numeric(24,6),
    f75 numeric(24,6),
    f76 numeric(24,6),
    f77 numeric(24,6),
    f78 numeric(24,6),
    f79 numeric(24,6),
    f80 numeric(24,6),
    f81 numeric(24,6),
    f82 numeric(24,6),
    f83 numeric(24,6),
    f84 numeric(24,6),
    f85 numeric(24,6),
    f86 numeric(24,6),
    f87 numeric(24,6),
    f88 numeric(24,6),
    f89 numeric(24,6),
    f90 numeric(24,6),
    f91 numeric(24,6),
    f92 numeric(24,6),
    f93 numeric(24,6),
    f94 numeric(24,6),
    f95 numeric(24,6),
    f96 numeric(24,6),
    f97 numeric(24,6),
    f98 numeric(24,6),
    f99 numeric(24,6),
    is_consolidated numeric(38,0),
    insuredtypecode numeric(18,0),
    general_ledger_book_id numeric(18,0),
    is_lock numeric(1,0) DEFAULT '0'::numeric,
    wfm_description character varying(1024),
    f401 numeric(24,6),
    f402 numeric(24,6),
    f403 numeric(24,6),
    f404 numeric(24,6),
    f405 numeric(24,6),
    f406 numeric(24,6),
    f407 numeric(24,6),
    f408 numeric(24,6),
    f409 numeric(24,6),
    f410 numeric(24,6),
    f411 numeric(24,6),
    f412 numeric(24,6),
    f413 numeric(24,6),
    f414 numeric(24,6),
    f415 numeric(24,6),
    f416 numeric(24,6),
    f417 numeric(24,6),
    f418 numeric(24,6),
    f419 numeric(24,6),
    f420 numeric(24,6),
    f421 numeric(24,6),
    f422 numeric(24,6),
    f423 numeric(24,6),
    f424 numeric(24,6),
    f425 numeric(24,6),
    f426 numeric(24,6),
    f427 numeric(24,6),
    f428 numeric(24,6),
    f429 numeric(24,6),
    f430 numeric(24,6),
    f431 numeric(24,6),
    f432 numeric(24,6),
    f433 numeric(24,6),
    f434 numeric(24,6),
    f435 numeric(24,6),
    f436 numeric(24,6),
    f437 numeric(24,6),
    f438 numeric(24,6),
    f439 numeric(24,6),
    f440 numeric(24,6),
    f441 numeric(24,6),
    f442 numeric(24,6),
    f443 numeric(24,6),
    f444 numeric(24,6),
    f445 numeric(24,6),
    f446 numeric(24,6),
    f447 numeric(24,6),
    f448 numeric(24,6),
    f449 numeric(24,6),
    f450 numeric(24,6),
    f451 numeric(24,6),
    f452 numeric(24,6),
    f453 numeric(24,6),
    f454 numeric(24,6),
    f455 numeric(24,6),
    f456 numeric(24,6),
    f457 numeric(24,6),
    f458 numeric(24,6),
    f459 numeric(24,6),
    f460 numeric(24,6),
    f461 numeric(24,6),
    f462 numeric(24,6),
    f463 numeric(24,6),
    f464 numeric(24,6),
    f465 numeric(24,6),
    f466 numeric(24,6),
    f467 numeric(24,6),
    f468 numeric(24,6),
    f469 numeric(24,6),
    f470 numeric(24,6),
    f471 numeric(24,6),
    f472 numeric(24,6),
    f473 numeric(24,6),
    f474 numeric(24,6),
    f475 numeric(24,6),
    f476 numeric(24,6),
    f477 numeric(24,6),
    f478 numeric(24,6),
    f479 numeric(24,6),
    f480 numeric(24,6),
    f481 numeric(24,6),
    f482 numeric(24,6),
    f483 numeric(24,6),
    f484 numeric(24,6),
    f485 numeric(24,6),
    f486 numeric(24,6),
    f487 numeric(24,6),
    f488 numeric(24,6),
    f489 numeric(24,6),
    f490 numeric(24,6),
    f491 numeric(24,6),
    f492 numeric(24,6),
    f493 numeric(24,6),
    f494 numeric(24,6),
    f495 numeric(24,6),
    f496 numeric(24,6),
    f497 numeric(24,6),
    f498 numeric(24,6),
    f499 numeric(24,6),
    f500 numeric(24,6),
    f502 character varying(2400),
    f503 character varying(2400),
    f504 character varying(2400),
    f505 character varying(2400),
    f506 character varying(2400),
    f507 character varying(2400),
    f508 character varying(2400),
    f509 character varying(2400),
    f510 character varying(2400),
    f511 character varying(2400),
    f512 character varying(2400),
    f513 character varying(2400),
    f514 character varying(2400),
    f515 character varying(2400),
    f516 character varying(2400),
    f517 character varying(2400),
    f518 character varying(2400),
    f519 character varying(2400),
    f520 character varying(2400),
    f521 numeric(24,6),
    f522 numeric(24,6),
    f523 numeric(24,6),
    f524 numeric(24,6),
    f525 numeric(24,6),
    f526 numeric(24,6),
    f527 numeric(24,6),
    f528 numeric(24,6),
    f529 numeric(24,6),
    f530 numeric(24,6),
    f531 numeric(24,6),
    f532 numeric(24,6),
    f533 numeric(24,6),
    f534 numeric(24,6),
    f535 numeric(24,6),
    f536 numeric(24,6),
    f537 numeric(24,6),
    f538 numeric(24,6),
    f539 numeric(24,6),
    f540 numeric(24,6),
    f541 numeric(24,6),
    f542 numeric(24,6),
    f543 numeric(24,6),
    f544 numeric(24,6),
    f545 numeric(24,6),
    f546 numeric(24,6),
    f547 numeric(24,6),
    f548 numeric(24,6),
    f549 numeric(24,6),
    f550 numeric(24,6),
    f551 numeric(24,6),
    f552 numeric(24,6),
    f553 numeric(24,6),
    f554 numeric(24,6),
    f555 numeric(24,6),
    f556 numeric(24,6),
    f557 numeric(24,6),
    f558 numeric(24,6),
    f559 numeric(24,6),
    f560 numeric(24,6),
    f561 numeric(24,6),
    f562 numeric(24,6),
    f563 numeric(24,6),
    f564 numeric(24,6),
    f565 numeric(24,6),
    f566 numeric(24,6),
    f567 numeric(24,6),
    f568 numeric(24,6),
    f569 numeric(24,6),
    f570 numeric(24,6),
    f571 numeric(24,6),
    f572 numeric(24,6),
    f573 numeric(24,6),
    f574 numeric(24,6),
    f575 numeric(24,6),
    f576 numeric(24,6),
    f577 numeric(24,6),
    f578 numeric(24,6),
    f579 numeric(24,6),
    f580 numeric(24,6),
    f581 numeric(24,6),
    f582 numeric(24,6),
    f583 numeric(24,6),
    f584 numeric(24,6),
    f585 numeric(24,6),
    f586 numeric(24,6),
    f587 numeric(24,6),
    f588 numeric(24,6),
    f589 numeric(24,6),
    f590 numeric(24,6),
    f591 numeric(24,6),
    f592 numeric(24,6),
    f593 numeric(24,6),
    f594 numeric(24,6),
    f595 numeric(24,6),
    f596 numeric(24,6),
    f597 numeric(24,6),
    f598 numeric(24,6),
    f599 numeric(24,6),
    f600 numeric(24,6),
    f501 character varying(2400),
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.prl_salary_sheet OWNER TO enterprisedb;

--
-- Name: process_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.process_log (
    id numeric(18,0) NOT NULL,
    command_name character varying(512),
    request_data_element clob,
    start_time timestamp without time zone DEFAULT sysdate,
    end_time timestamp without time zone,
    node_id numeric(18,0),
    used_second numeric(10,0)
);


ALTER TABLE cloud_customer_uat.process_log OWNER TO enterprisedb;

--
-- Name: ref_bank; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ref_bank (
    bank_id numeric(18,0) NOT NULL,
    bank_name character varying(512),
    description character varying(4000),
    parent_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    bank_code character varying(50) NOT NULL,
    phone_number character varying(50),
    email_address character varying(50),
    fax_number character varying(50),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    is_system_value numeric(1,0) DEFAULT '0'::numeric,
    is_default numeric(1,0) DEFAULT '0'::numeric,
    country_id numeric(18,0),
    is_get_bank_bill numeric(1,0) DEFAULT '0'::numeric,
    customer_id numeric(18,0),
    transaction character varying(256),
    transaction_code character varying(256),
    transaction_ext character varying(50),
    swift_code character varying(128),
    department_id numeric(18,0),
    iban character varying(256),
    bank_name2 character varying(512),
    icon character varying(512),
    qpay_link character varying(512),
    country_code character varying(50),
    company_department_id numeric(18,0),
    translation_value clob,
    priority_number numeric(3,0)
);


ALTER TABLE cloud_customer_uat.ref_bank OWNER TO enterprisedb;

--
-- Name: ref_language; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.ref_language (
    language_id numeric(18,0) NOT NULL,
    language_code character varying(100) NOT NULL,
    language_name character varying(512) NOT NULL,
    is_active numeric(1,0) DEFAULT '1'::numeric NOT NULL,
    display_order numeric(3,0) DEFAULT '1'::numeric NOT NULL,
    short_code character varying(100),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.ref_language OWNER TO enterprisedb;

--
-- Name: sch_process; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.sch_process (
    id numeric NOT NULL,
    process_id numeric(18,0),
    input_param character varying(500),
    schedule_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.sch_process OWNER TO enterprisedb;

--
-- Name: sch_schedule; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.sch_schedule (
    schedule_id numeric(18,0) NOT NULL,
    schedule_code character varying(50),
    schedule_name character varying(256),
    every_minute character varying(4),
    every_hour character varying(4),
    end_date timestamp without time zone,
    start_date timestamp without time zone,
    schedule_type_id numeric(18,0),
    day_of_week numeric(2,0),
    repeat_days numeric(2,0),
    week_of_month numeric(2,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    every_second character varying(4),
    is_write_log numeric(1,0) DEFAULT '0'::numeric,
    month_of_year numeric(3,0),
    start_time timestamp without time zone,
    end_time timestamp without time zone
);


ALTER TABLE cloud_customer_uat.sch_schedule OWNER TO enterprisedb;

--
-- Name: sch_schedule_book; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.sch_schedule_book (
    schedule_book_id numeric(18,0) NOT NULL,
    book_number character varying(50),
    book_type_id numeric(18,0),
    book_date timestamp without time zone,
    wfm_status_id numeric(18,0),
    wfm_description character varying(400),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    start_time character varying(20),
    end_time character varying(20),
    description character varying(400),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    schedule_type_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.sch_schedule_book OWNER TO enterprisedb;

--
-- Name: sch_schedule_config; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.sch_schedule_config (
    id numeric(18,0) NOT NULL,
    code character varying(128) NOT NULL,
    description character varying(4000) NOT NULL,
    class_name character varying(128) NOT NULL,
    method_name character varying(128) NOT NULL,
    is_active numeric(1,0) DEFAULT '0'::numeric NOT NULL,
    schedule_id numeric(18,0),
    is_write_log numeric(1,0) DEFAULT '0'::numeric
);


ALTER TABLE cloud_customer_uat.sch_schedule_config OWNER TO enterprisedb;

--
-- Name: sch_schedule_email; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.sch_schedule_email (
    id numeric(18,0) NOT NULL,
    schedule_id numeric(18,0),
    email character varying(512),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    first_name character varying(512)
);


ALTER TABLE cloud_customer_uat.sch_schedule_email OWNER TO enterprisedb;

--
-- Name: sch_schedule_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.sch_schedule_log (
    id numeric(18,0) NOT NULL,
    created_date timestamp without time zone,
    error_message character varying(4000)
);


ALTER TABLE cloud_customer_uat.sch_schedule_log OWNER TO enterprisedb;

--
-- Name: sch_schedule_type; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.sch_schedule_type (
    schedule_type_id numeric(18,0) NOT NULL,
    schedule_type_code character varying(50),
    schedule_type_name character varying(256),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.sch_schedule_type OWNER TO enterprisedb;

--
-- Name: session_refresh_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.session_refresh_log (
    session_user_id numeric(18,0),
    meta_data_id numeric(18,0),
    last_refreshed_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.session_refresh_log OWNER TO enterprisedb;

--
-- Name: sysint_service_method_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.sysint_service_method_log (
    id numeric(18,0) NOT NULL,
    web_service_name character varying(4000) NOT NULL,
    web_service_url character varying(4000),
    created_date timestamp without time zone NOT NULL,
    parameter_de clob,
    response_de clob,
    user_id numeric(18,0),
    is_successful numeric(1,0) DEFAULT '0'::numeric,
    request_string clob,
    response_string clob,
    general_ledger_book_id numeric(18,0),
    sub_id numeric(18,0),
    ip_address character varying(4000),
    modified_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.sysint_service_method_log OWNER TO enterprisedb;

--
-- Name: sysint_service_method_log_dtl; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.sysint_service_method_log_dtl (
    id numeric(18,0) NOT NULL,
    log_id numeric(18,0),
    reg_num character varying(256),
    citizen_reg_num character varying(256),
    citizen_finger character varying(256),
    operator_reg_num character varying(256),
    operator_finger character varying(256),
    legal_entity_number character varying(256),
    property_number character varying(256)
);


ALTER TABLE cloud_customer_uat.sysint_service_method_log_dtl OWNER TO enterprisedb;

--
-- Name: system_access_config; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.system_access_config (
    id numeric(18,0) NOT NULL,
    access_code character varying(50),
    access_name character varying(256),
    is_active numeric(1,0) DEFAULT '0'::numeric
);


ALTER TABLE cloud_customer_uat.system_access_config OWNER TO enterprisedb;

--
-- Name: system_access_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.system_access_log (
    id numeric(18,0) NOT NULL,
    access_date timestamp without time zone,
    main_meta_data_id numeric(18,0),
    access_meta_data_id numeric(18,0),
    access_code character varying(50),
    access_name character varying(256),
    access_user_id numeric(18,0),
    ref_structure_id numeric(18,0),
    mac_address character varying(64),
    ip_address character varying(180),
    table_name character varying(256),
    record_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.system_access_log OWNER TO enterprisedb;

--
-- Name: system_action_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.system_action_log (
    id numeric(18,0) NOT NULL,
    table_name character varying(256),
    record_id numeric(18,0),
    action_name character varying(256),
    action_date timestamp without time zone,
    user_id numeric(18,0),
    customer_id numeric(18,0),
    id_string character varying(128),
    action_type character varying(512),
    description character varying(4000),
    action_data character varying(256),
    created_user_id numeric(20,0),
    modified_user_id numeric(20,0),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    related_record_id numeric(18,0),
    created_crm_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.system_action_log OWNER TO enterprisedb;

--
-- Name: system_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.system_log (
    id numeric(18,0) NOT NULL,
    request_key character varying(2048),
    command_name character varying(144),
    db_unit_name character varying(144),
    user_name character varying(144),
    request_data_element clob,
    response_data_element clob,
    created_date timestamp without time zone,
    ip_address character varying(180),
    user_id numeric(18,0),
    system_meta_group_id numeric(18,0),
    user_agent character varying(1024)
);


ALTER TABLE cloud_customer_uat.system_log OWNER TO enterprisedb;

--
-- Name: system_log_dtl; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.system_log_dtl (
    id numeric(18,0) NOT NULL,
    system_log_id numeric(18,0),
    record_id numeric(18,0),
    entity_name character varying(1024),
    data_element clob,
    operation_type character varying(36),
    sub_id numeric(18,0),
    created_date timestamp without time zone,
    command_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.system_log_dtl OWNER TO enterprisedb;

--
-- Name: system_log_php; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.system_log_php (
    id numeric(20,0) NOT NULL,
    user_id numeric(20,0),
    ip character varying(20),
    created_date timestamp without time zone,
    url character varying(512),
    php_session_id character varying(50),
    referer_url character varying(512),
    meta_data_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.system_log_php OWNER TO enterprisedb;

--
-- Name: system_write_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.system_write_log (
    id numeric(18,0),
    request_name character varying(2048),
    created_date timestamp without time zone,
    ip_address character varying(180),
    user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.system_write_log OWNER TO enterprisedb;

--
-- Name: tmp_in_criteria_table; Type: VIEW; Schema: cloud_customer_uat; Owner: cloud_customer_uat
--

CREATE VIEW cloud_customer_uat.tmp_in_criteria_table AS
 SELECT tmp_in_criteria_table.field_path,
    tmp_in_criteria_table.company_department_id,
    tmp_in_criteria_table.value
   FROM public.tmp_in_criteria_table() tmp_in_criteria_table(field_path, company_department_id, value);


ALTER TABLE cloud_customer_uat.tmp_in_criteria_table OWNER TO cloud_customer_uat;

--
-- Name: um_config_value; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_config_value (
    id numeric(18,0) NOT NULL,
    config_group_id numeric(18,0) NOT NULL,
    name character varying(1024) NOT NULL,
    value character varying(4000) NOT NULL
);


ALTER TABLE cloud_customer_uat.um_config_value OWNER TO enterprisedb;

--
-- Name: um_criteria; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_criteria (
    id numeric(18,0) NOT NULL,
    code character varying(100),
    name character varying(512),
    description character varying(2048),
    meta_data_id numeric(18,0),
    criteria_string character varying(2048),
    is_system numeric(1,0) DEFAULT '0'::numeric
);


ALTER TABLE cloud_customer_uat.um_criteria OWNER TO enterprisedb;

--
-- Name: um_global_user; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_global_user (
    id numeric(18,0) NOT NULL,
    system_user_id numeric(18,0),
    username character varying(256),
    password character varying(256),
    cloud_id character varying(256),
    domain_name character varying(512),
    after_login_url character varying(512)
);


ALTER TABLE cloud_customer_uat.um_global_user OWNER TO enterprisedb;

--
-- Name: um_login_attempts; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_login_attempts (
    id numeric(18,0) NOT NULL,
    username character varying(128) NOT NULL,
    ip_address character varying(64),
    user_agent character varying(512),
    is_loggedin numeric(1,0) DEFAULT '0'::numeric,
    is_success numeric(1,0) DEFAULT '0'::numeric,
    session_id character varying(128),
    failed_type character varying(20),
    system_user_id numeric(18,0),
    created_date timestamp without time zone NOT NULL,
    browser_name character varying(64),
    platform_name character varying(64),
    logout_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.um_login_attempts OWNER TO enterprisedb;

--
-- Name: um_login_device; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_login_device (
    id numeric(18,0) NOT NULL,
    system_user_id numeric(18,0),
    ip_address character varying(64),
    user_agent character varying(512),
    browser_name character varying(64),
    platform_name character varying(64),
    created_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.um_login_device OWNER TO enterprisedb;

--
-- Name: um_login_failed; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_login_failed (
    id numeric(18,0) NOT NULL,
    ip_address character varying(64),
    failed_count numeric(5,0) NOT NULL,
    modified_date timestamp without time zone NOT NULL,
    system_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_login_failed OWNER TO enterprisedb;

--
-- Name: um_menu_config; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_menu_config (
    id numeric(18,0) NOT NULL,
    module_menu_id numeric(18,0),
    top_menu_id numeric(18,0),
    role_id numeric(18,0),
    user_id numeric(18,0),
    is_default_menu numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    created_command_id numeric(18,0),
    modified_command_id numeric(18,0),
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_menu_config OWNER TO enterprisedb;

--
-- Name: um_meta_block; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_meta_block (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    menu_meta_data_id numeric(18,0),
    action_meta_data_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    is_change_password numeric(1,0) DEFAULT '1'::numeric,
    related_id numeric(18,0),
    related_record_id numeric(18,0),
    is_all_user numeric(1,0) DEFAULT 0,
    system_user_id numeric(18,0),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    ignore_close numeric(1,0),
    ignore_save numeric(1,0),
    get_process_id numeric(18,0),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    customer_id numeric(18,0),
    role_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_meta_block OWNER TO enterprisedb;

--
-- Name: um_meta_lock; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_meta_lock (
    id numeric(18,0) NOT NULL,
    meta_data_id numeric(18,0),
    user_id numeric(18,0),
    password_hash character varying(256),
    created_date timestamp without time zone,
    created_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_meta_lock OWNER TO enterprisedb;

--
-- Name: um_meta_permission; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_meta_permission (
    permission_id numeric(18,0) NOT NULL,
    meta_data_id numeric(18,0) NOT NULL,
    action_id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    role_id numeric(18,0),
    field_criteria character varying(4000),
    record_criteria character varying(4000),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    is_denied numeric(1,0) DEFAULT '0'::numeric,
    description character varying(1024),
    permission_code character varying(20),
    batch_number character varying(50),
    is_system_value numeric(1,0) DEFAULT '0'::numeric,
    order_id numeric(18,0),
    company_department_id numeric(18,0),
    access_log_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_meta_permission OWNER TO enterprisedb;

--
-- Name: um_meta_permission_cache; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_meta_permission_cache (
    id numeric(18,0) NOT NULL,
    meta_data_id numeric(18,0),
    parent_meta_data_id numeric(18,0),
    action_id numeric(18,0),
    icon_name character varying(512),
    order_num numeric(10,0),
    globe_code character varying(512),
    label_name character varying(512)
);


ALTER TABLE cloud_customer_uat.um_meta_permission_cache OWNER TO enterprisedb;

--
-- Name: um_meta_permission_ignore; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_meta_permission_ignore (
    meta_data_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_meta_permission_ignore OWNER TO enterprisedb;

--
-- Name: um_meta_permission_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_meta_permission_log (
    log_id numeric(18,0) NOT NULL,
    permission_id numeric(18,0) NOT NULL,
    meta_data_id numeric(18,0) NOT NULL,
    action_id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    role_id numeric(18,0),
    field_criteria character varying(4000),
    record_criteria character varying(4000),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    is_denied numeric(1,0) DEFAULT '0'::numeric,
    description character varying(1024),
    permission_code character varying(20),
    batch_number character varying(50),
    is_system_value numeric(1,0) DEFAULT '0'::numeric,
    deleted_date timestamp without time zone,
    deleted_user_id numeric(18,0),
    updated_date timestamp without time zone,
    updated_user_id numeric(18,0),
    log_action character varying(20),
    log_created_date timestamp without time zone,
    log_created_user_id numeric(18,0),
    order_id numeric(18,0),
    company_department_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_meta_permission_log OWNER TO enterprisedb;

--
-- Name: um_quick_menu; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_quick_menu (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    system_id numeric(18,0),
    system_url character varying(256),
    meta_type character varying(20),
    meta_data_id numeric(18,0),
    display_order numeric(3,0),
    created_date timestamp without time zone,
    menu_name character varying(128),
    icon_name character varying(25),
    url_code character varying(128),
    hot_key character varying(20)
);


ALTER TABLE cloud_customer_uat.um_quick_menu OWNER TO enterprisedb;

--
-- Name: um_record_permission; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_record_permission (
    object_id numeric(18,0),
    record_id numeric(18,0),
    permission_id numeric(18,0),
    user_id numeric(18,0),
    role_id numeric(18,0),
    id numeric(18,0) NOT NULL,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_record_permission OWNER TO enterprisedb;

--
-- Name: um_role_customer; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_role_customer (
    id numeric(18,0) NOT NULL,
    customer_id numeric(18,0),
    role_id numeric(18,0),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    start_date timestamp without time zone,
    end_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.um_role_customer OWNER TO enterprisedb;

--
-- Name: um_system_user; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_system_user (
    user_id numeric(18,0) NOT NULL,
    username character varying(256),
    password_hash character varying(256),
    password_salt character varying(256),
    password_reset character varying(256),
    password_expiry_date timestamp without time zone,
    allow_con_current_logins numeric(1,0),
    inactive numeric(1,0),
    failed_login_attempts numeric(1,0),
    created_date timestamp without time zone,
    change_date timestamp without time zone,
    email character varying(4000),
    person_id numeric(18,0),
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    google_key character varying(256),
    user_full_name character varying(256),
    language_id numeric(18,0),
    ldap_display_name character varying(256),
    phone_number character varying(128),
    signature_picture character varying(256),
    type_code character varying(50) DEFAULT 'internal'::character varying,
    stamp_picture character varying(256),
    chat_contact_view character varying(20),
    is_touch_mode numeric(1,0) DEFAULT '0'::numeric,
    ip_address character varying(64),
    mobile_password_hash character varying(256),
    password_reset_date timestamp without time zone,
    facebook_key character varying(512),
    profile_photo character varying(1024),
    firebase_uid character varying(1024),
    provider_id character varying(128),
    wfm_password_hash character varying(100),
    tinode character varying(30),
    pin_code character varying(256),
    company_department_id numeric(18,0),
    ldap_login_name character varying(50),
    response_msg character varying(4000),
    time_zone_id numeric(18,0),
    mobile_device_platform character varying(50),
    imei character varying(20),
    is_use_chat numeric(1,0) DEFAULT 1,
    external_hash character varying(128)
);


ALTER TABLE cloud_customer_uat.um_system_user OWNER TO enterprisedb;

--
-- Name: um_system_user_info; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_system_user_info (
    id numeric(18,0) NOT NULL,
    system_user_id numeric(18,0),
    store_keeper_code character varying(64),
    store_keeper_name character varying(256)
);


ALTER TABLE cloud_customer_uat.um_system_user_info OWNER TO enterprisedb;

--
-- Name: um_transaction_permission; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_transaction_permission (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    permission_code character varying(50),
    role_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_transaction_permission OWNER TO enterprisedb;

--
-- Name: um_user; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user (
    user_id numeric(18,0) NOT NULL,
    is_active numeric(1,0) DEFAULT '1'::numeric,
    system_user_id numeric(18,0),
    department_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    username character varying(50),
    customer_id numeric(18,0),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    is_not_parent numeric(1,0) DEFAULT '0'::numeric,
    is_mobile numeric(1,0) DEFAULT '0'::numeric,
    is_mobile_default numeric(1,0) DEFAULT '0'::numeric,
    is_use_folder_permission numeric(1,0) DEFAULT '1'::numeric,
    db_user_name character varying(256),
    default_menu_id numeric(18,0),
    company_department_id numeric(18,0),
    is_main numeric(1,0) DEFAULT '0'::numeric,
    click_menu_id numeric(18,0),
    alias_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_user OWNER TO enterprisedb;

--
-- Name: um_user_alias; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_alias (
    id numeric(18,0) NOT NULL,
    alias_system_user_id numeric(18,0),
    alias_user_id numeric(18,0),
    system_user_id numeric(18,0),
    user_id numeric(18,0),
    ref_structure_id numeric(18,0),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    related_book_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    description character varying(4000)
);


ALTER TABLE cloud_customer_uat.um_user_alias OWNER TO enterprisedb;

--
-- Name: um_user_data_permission; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_data_permission (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    role_id numeric(18,0),
    db_structure_id numeric(18,0),
    record_id numeric(18,0),
    action_id numeric(18,0),
    is_hierarchy numeric(1,0) DEFAULT '0'::numeric,
    is_active numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    access_log_id numeric(18,0)
)
PARTITION BY RANGE (db_structure_id) NULLS LAST;


ALTER TABLE cloud_customer_uat.um_user_data_permission OWNER TO enterprisedb;

--
-- Name: um_user_data_permission_cache; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_data_permission_cache (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    db_structure_id numeric(18,0),
    record_id numeric(18,0),
    action_id numeric(18,0),
    is_hierarchy numeric(1,0) DEFAULT '0'::numeric,
    is_active numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
)
PARTITION BY RANGE (db_structure_id) NULLS LAST;


ALTER TABLE cloud_customer_uat.um_user_data_permission_cache OWNER TO enterprisedb;

--
-- Name: um_user_data_permission_old; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_data_permission_old (
    id numeric(18,0),
    user_id numeric(18,0),
    role_id numeric(18,0),
    db_structure_id numeric(18,0),
    record_id numeric(18,0),
    action_id numeric(18,0),
    is_hierarchy numeric(1,0) DEFAULT '0'::numeric,
    is_active numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
)
PARTITION BY RANGE (db_structure_id) NULLS LAST;


ALTER TABLE cloud_customer_uat.um_user_data_permission_old OWNER TO enterprisedb;

--
-- Name: um_user_email; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_email (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    email character varying(256) NOT NULL,
    password_hash character varying(4000),
    is_default numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_user_email OWNER TO enterprisedb;

--
-- Name: um_user_finger; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_finger (
    user_finger_id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    finger_id numeric(18,0),
    user_finger clob,
    file_path character varying(2048)
);


ALTER TABLE cloud_customer_uat.um_user_finger OWNER TO enterprisedb;

--
-- Name: um_user_gps_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_gps_log (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    coordinate character varying(1024),
    "timestamp" timestamp without time zone,
    battery_level numeric(3,0),
    latitude character varying(1024),
    longitude character varying(1024),
    customer_id numeric(18,0),
    crm_user_id numeric(18,0),
    user_agent character varying(512)
);


ALTER TABLE cloud_customer_uat.um_user_gps_log OWNER TO enterprisedb;

--
-- Name: um_user_monpass_map; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_monpass_map (
    id numeric(20,0) NOT NULL,
    user_id numeric(20,0),
    monpass_user_id character varying(128) NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    is_active numeric(1,0) DEFAULT '0'::numeric,
    certificate_serial_number character varying(50),
    token_serial_number character varying(50),
    token_mode character varying(50)
);


ALTER TABLE cloud_customer_uat.um_user_monpass_map OWNER TO enterprisedb;

--
-- Name: um_user_otp; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_otp (
    id numeric(18,0) NOT NULL,
    passcode character varying(512),
    user_id numeric(18,0),
    phone_number character varying(124),
    state_reg_number character varying(50),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.um_user_otp OWNER TO enterprisedb;

--
-- Name: um_user_permission_alias; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_permission_alias (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0) NOT NULL,
    alias_user_id numeric(18,0) NOT NULL,
    is_active numeric(1,0) DEFAULT '0'::numeric,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_user_permission_alias OWNER TO enterprisedb;

--
-- Name: um_user_relation; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_relation (
    user_relation_id numeric(18,0) NOT NULL,
    src_user_id numeric(18,0),
    trg_user_id numeric(18,0),
    src_group_id numeric(18,0),
    trg_group_id numeric(18,0),
    src_role_id numeric(18,0),
    trg_role_id numeric(18,0),
    permission_id numeric(18,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_user_relation OWNER TO enterprisedb;

--
-- Name: um_user_role; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_role (
    user_id numeric(18,0) NOT NULL,
    role_id numeric(18,0) NOT NULL,
    id numeric(18,0) NOT NULL,
    is_active numeric(1,0) DEFAULT '1'::numeric NOT NULL,
    modified_user_id numeric(18,0),
    modified_date timestamp without time zone,
    created_user_id numeric(18,0),
    created_date timestamp without time zone,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    wfm_status_id numeric(18,0),
    wfm_description character varying(1024),
    access_log_id numeric(18,0),
    alias_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_user_role OWNER TO enterprisedb;

--
-- Name: um_user_role_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_role_log (
    user_id numeric(18,0) NOT NULL,
    role_id numeric(18,0) NOT NULL,
    id numeric(18,0) NOT NULL,
    is_active numeric(1,0) DEFAULT '0'::numeric NOT NULL,
    modified_user_id numeric(18,0),
    modified_date timestamp without time zone,
    created_user_id numeric(18,0),
    created_date timestamp without time zone,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    wfm_status_id numeric(18,0),
    wfm_description character varying(1024),
    log_id numeric(18,0),
    log_created_date timestamp without time zone,
    log_action character varying(64),
    log_created_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_user_role_log OWNER TO enterprisedb;

--
-- Name: um_user_send_email; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_send_email (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    email character varying(150)
);


ALTER TABLE cloud_customer_uat.um_user_send_email OWNER TO enterprisedb;

--
-- Name: um_user_session; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_session (
    session_id character varying(50) NOT NULL,
    user_id numeric(18,0),
    created_date timestamp without time zone DEFAULT sysdate,
    updated_date timestamp without time zone DEFAULT sysdate NOT NULL,
    unit_name character varying(256),
    employee_id numeric(18,0),
    employee_key_id numeric(18,0),
    department_id numeric(18,0),
    system_user_id numeric(18,0),
    language_code character varying(100),
    is_mobile numeric(1,0) DEFAULT '0'::numeric,
    scenario_id numeric(18,0),
    customer_id numeric(18,0),
    company_department_id numeric(18,0),
    store_keeper_key_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_user_session OWNER TO enterprisedb;

--
-- Name: um_user_session_value; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_session_value (
    id numeric(18,0) NOT NULL,
    field_path character varying(100),
    select_query character varying(4000),
    created_date timestamp without time zone,
    created_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.um_user_session_value OWNER TO enterprisedb;

--
-- Name: um_user_set_from_email; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.um_user_set_from_email (
    id numeric(18,0) NOT NULL,
    system_user_id numeric(18,0),
    email character varying(512)
);


ALTER TABLE cloud_customer_uat.um_user_set_from_email OWNER TO enterprisedb;

--
-- Name: user_authentication_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.user_authentication_log (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    phone_number numeric(18,0),
    description character varying(512),
    otp character varying(256),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    error_log character varying(1024),
    customer_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.user_authentication_log OWNER TO enterprisedb;

--
-- Name: user_management_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.user_management_log (
    id numeric(18,0) NOT NULL,
    action_type_id numeric(18,0),
    action_type_string character varying(512),
    meta_data_id numeric(18,0),
    meta_data_string character varying(2048),
    description character varying(1024),
    user_id numeric(18,0),
    user_name character varying(256),
    role_id numeric(18,0),
    role_name character varying(256),
    message_id numeric(18,0),
    message_string character varying(512),
    table_name character varying(512),
    table_pk_column character varying(256),
    db_structure_id numeric(18,0),
    record_id numeric(18,0),
    record_value character varying(1024),
    is_hierarchy numeric(1,0) DEFAULT '0'::numeric,
    is_active numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    created_user_name character varying(256),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    modified_user_name character varying(256),
    department_id numeric(18,0),
    department_name character varying(512),
    table_description character varying(1024),
    action_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.user_management_log OWNER TO enterprisedb;

--
-- Name: view_log; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.view_log (
    id numeric(18,0) NOT NULL,
    ref_structure_id numeric(18,0),
    record_id numeric(18,0),
    user_id numeric(18,0),
    role_id numeric(18,0),
    is_active numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.view_log OWNER TO enterprisedb;

--
-- Name: vw_customer_proxy_config; Type: VIEW; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE VIEW cloud_customer_uat.vw_customer_proxy_config AS
 SELECT cpc.id,
    cpc.proxy_meta_data_id,
    cpc.action_meta_data_id
   FROM cloud_customer_uat.customer_proxy_config cpc
  WHERE (cpc.is_default = (1)::numeric)
UNION ALL
 SELECT (('1000000000000'::bigint)::numeric + mpm.id) AS id,
    mpm.src_meta_data_id AS proxy_meta_data_id,
    mpm.trg_meta_data_id AS action_meta_data_id
   FROM cloud_platform_uat.meta_proxy_map mpm
  WHERE ((mpm.is_default = (1)::numeric) AND (NOT (mpm.src_meta_data_id IN ( SELECT cpc.proxy_meta_data_id
           FROM cloud_customer_uat.customer_proxy_config cpc
          WHERE (cpc.is_default = (1)::numeric)))));


ALTER TABLE cloud_customer_uat.vw_customer_proxy_config OWNER TO enterprisedb;

--
-- Name: vw_user; Type: VIEW; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE VIEW cloud_customer_uat.vw_user AS
 SELECT ur.user_id,
    ur.person_id,
    ur.employee_id,
    ur.employee_key_id,
    ur.username,
    ur.last_name,
    ur.first_name,
    ur.state_reg_number,
    ur.employee_mobile,
    ur.employee_phone,
    ur.employee_email,
    ek.position_name,
    ek.department_name,
    ek.department_id,
    ur.picture,
    ur.emp_picture,
    ur.employee_code,
    ur.password_hash,
    ur.password_expiry_date,
    ur.language_id,
    ur.mobile_password_hash,
    ((substr((ur.last_name)::text, (0)::numeric, (1)::numeric) || '.'::text) || (ur.first_name)::text) AS employee_name
   FROM (( SELECT um.user_id,
            bp.person_id,
            emp.employee_id,
            emp.employee_code,
            emp.employee_mobile,
            nvl(emp.employee_phone, um.phone_number) AS employee_phone,
            nvl(emp.employee_email, um.email) AS employee_email,
            um.username,
            bp.last_name,
            bp.first_name,
            bp.state_reg_number,
            ( SELECT max(hrm_employee_key.employee_key_id) AS max
                   FROM cloud_customer_uat.hrm_employee_key
                  WHERE ((hrm_employee_key.employee_id = emp.employee_id) AND (hrm_employee_key.is_active = (1)::numeric))
                  GROUP BY hrm_employee_key.employee_id) AS employee_key_id,
            emp.picture,
            emp.picture AS emp_picture,
            um.password_hash,
            um.password_expiry_date,
            um.language_id,
            um.mobile_password_hash
           FROM ((cloud_customer_uat.um_system_user um
             JOIN cloud_customer_uat.base_person bp ON ((bp.person_id = um.person_id)))
             LEFT JOIN cloud_customer_uat.hrm_employee emp ON ((emp.person_id = um.person_id)))
          WHERE ((um.inactive = (0)::numeric) OR (um.inactive IS NULL))) ur
     LEFT JOIN ( SELECT ek_1.employee_key_id,
            pos.position_name,
            pos.position_id,
            dep.department_id,
            dep.department_name
           FROM (((cloud_customer_uat.hrm_employee_key ek_1
             LEFT JOIN cloud_customer_uat.hrm_position_key pk ON ((ek_1.position_key_id = pk.position_key_id)))
             LEFT JOIN cloud_customer_uat.hrm_position pos ON ((pk.position_id = pos.position_id)))
             LEFT JOIN cloud_customer_uat.org_department dep ON ((pk.department_id = dep.department_id)))) ek ON ((ek.employee_key_id = ur.employee_key_id)));


ALTER TABLE cloud_customer_uat.vw_user OWNER TO enterprisedb;

--
-- Name: zzchat; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.zzchat (
    id numeric(18,0) NOT NULL,
    from_id numeric(18,0) NOT NULL,
    to_id numeric(18,0),
    message character varying(4000),
    sent numeric(18,0),
    read numeric(1,0) NOT NULL,
    direction numeric(1,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0),
    is_file numeric(1,0) DEFAULT '0'::numeric,
    chatroomid numeric(18,0),
    header_id numeric(18,0),
    is_file_downloaded numeric(1,0) DEFAULT '0'::numeric,
    deleted_by_from numeric(18,0),
    deleted_by_to numeric(18,0),
    parent_id numeric(18,0),
    forward_id numeric(18,0),
    forward_message character varying(4000),
    forward_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.zzchat OWNER TO enterprisedb;

--
-- Name: zzchat_block; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.zzchat_block (
    id numeric(18,0) NOT NULL,
    fromid numeric(18,0) NOT NULL,
    toid numeric(18,0) NOT NULL,
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.zzchat_block OWNER TO enterprisedb;

--
-- Name: zzchat_chatrooms; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.zzchat_chatrooms (
    id numeric(18,0) NOT NULL,
    name character varying(1020) NOT NULL,
    lastactivity numeric(18,0),
    createdby numeric(18,0) NOT NULL,
    password character varying(1020),
    type numeric(1,0) NOT NULL,
    vidsession character varying(2048),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.zzchat_chatrooms OWNER TO enterprisedb;

--
-- Name: zzchat_chatrooms_users; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.zzchat_chatrooms_users (
    userid numeric(18,0) NOT NULL,
    chatroomid numeric(18,0) NOT NULL,
    lastactivity numeric(18,0),
    isbanned numeric(1,0),
    created_date timestamp without time zone,
    created_user_id numeric(18,0),
    modified_date timestamp without time zone,
    modified_user_id numeric(18,0)
);


ALTER TABLE cloud_customer_uat.zzchat_chatrooms_users OWNER TO enterprisedb;

--
-- Name: zzchat_status; Type: TABLE; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE TABLE cloud_customer_uat.zzchat_status (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0) NOT NULL,
    status character varying(1024) NOT NULL,
    is_active numeric(1,0) DEFAULT '0'::numeric,
    created_date timestamp without time zone,
    modified_date timestamp without time zone
);


ALTER TABLE cloud_customer_uat.zzchat_status OWNER TO enterprisedb;

--
-- Data for Name: base_company; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.base_company (company_id, company_name, is_active, company_register_number, created_date, modified_date, created_user_id, modified_user_id, is_affiliate, country_id, established_date, description, city_id, district_id, industry_id, parent_id, company_name_eng, ownership_form_id, is_province, address, phone, email, website, state_reg_number, tax_pay_number, vat_pay_number, special_license_info, phone2, sub_industry_id, company_type_id) FROM stdin;
\.


--
-- Data for Name: base_person; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.base_person (person_id, first_name, last_name, date_of_birth, gender, state_reg_number, country_id, title, is_active, created_date, created_user_id, modified_date, modified_user_id, family_name, first_email, second_email, first_phone, second_phone, en_first_name, en_last_name, picture, branch_title, origin_id, profession_name, address_type_id, city_id, district_id, street_id, address_region_id, address_town_id, address_apartment_id, post_box, door, full_address, coordinate, address_street_id, orts, parent_id, picture_large_thumb, picture_small_thumb, picture_middle_thumb, state_reg_id, translation_value, industry_id, social_address, citizenship_id, code, created_command_id, bio, marital_status_id) FROM stdin;
1234567890	Admin name	admin last name	\N	\N	\N	\N	\N	1	2023-09-18 04:52:36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: base_person_finger; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.base_person_finger (id, person_id, userid) FROM stdin;
\.


--
-- Data for Name: config; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.config (id, description, value_type, display_order, code, default_value, system_id, module_id, config_description) FROM stdin;
15877112512694076	Төлбөрийн төрөл Мобайл интернэт	boolean	\N	CONFIG_POS_PAYMENT_MOBILENET	\N	999	\N	\N
15877112512694077	Төлбөрийн төрөл Бартер	boolean	\N	CONFIG_POS_PAYMENT_BARTER	\N	999	\N	\N
15877112512694078	Төлбөрийн төрөл Лизинг	boolean	\N	CONFIG_POS_PAYMENT_LEASING	\N	999	\N	\N
15877112512694079	Төлбөрийн төрөл Дараа тооцоо	boolean	\N	CONFIG_POS_PAYMENT_EMPLOAN	\N	999	\N	\N
15877112512694080	Төлбөрийн төрөл Дотоод зардал	boolean	\N	CONFIG_POS_PAYMENT_LOCALEXPENSE	\N	999	\N	\N
15877112512694081	Төлбөрийн төрөл Даатгал	boolean	\N	CONFIG_POS_PAYMENT_UNITRECEIVABLE	\N	999	\N	\N
15877112512694082	E-token тохиргоо	url	\N	MONPASS_SERVER	\N	999	\N	\N
15877112512694083	doc, docx, xsl viewer in IIS	url	\N	CONFIG_FILE_VIEWER_ADDRESS	\N	999	\N	\N
15877112512694084	PHP config баазаас уншдаг болгох	\N	\N	phpconfigtodb	\N	999	\N	\N
1602126115466	Дансны кодны маск. 9-н тоогоор нэг тоон цифрийг илэрхийлнэ. /999-999/	\N	\N	CONFIG_ACCOUNT_CODE_MAS	\N	1	\N	\N
1602126119312	Statement тайлангийн IIS дээрхи хаяг	\N	\N	CONFIG_REPORT_SERVER_ADDRESS	\N	1	\N	\N
1581404722080075	Төсвийн дэлгэрэнгүй хаяг	\N	\N	CONFIG_BUDGET_SERVER_ADDRESS	\N	1	\N	\N
1568018297998	ХААН банкны цалингийн гүйлгээтэй холбоотой тохиргоо	\N	\N	PAYROLL_TRANSACTION_KHANBANK	\N	\N	\N	\N
21552546548578	Mobile offline 1 or 0	\N	\N	MobileOffline	\N	\N	\N	\N
1567753938950	Хувь хүн бүртгэхэд регистр заавал эсэх	\N	\N	ISREQUIREDPERSONREGISTER	\N	1	\N	\N
1567754883357	Дансны нэг төлөвлөгөөгөөр группын бүх компани явах эсэх	\N	\N	ISUSEGROUPACCOUNT	\N	1	1556077225255	\N
1018	Эрх тохируулах хэрэглэгчдэд өөрийн эрхээс үл хамааран бүх цэсийг тохируулах боломжтой харуулах	\N	\N	SHOW_ALL_MENU_ON_PERMISSION	\N	\N	\N	\N
10216	Электрон талоны нэхэмжлэх хэвлэх загвар	\N	\N	ELECTRON_BILL_REPORT	\N	\N	\N	\N
272543999432	header_logo_path	image	\N	header_logo_path	\N	\N	\N	\N
555	Template	\N	\N	saveCustomerFilter	\N	\N	\N	\N
91002	Цалин бодолт шүүлтийг popup болгож өөрчлөх тохиргоо	\N	\N	prlFilterTheme	\N	\N	\N	\N
91003	Цалин бодолтын цонх дээр хайлтын загвар заавал эсэх	\N	\N	prlCalculateTemplateCretriaRequired	\N	\N	\N	\N
50005	Посын хүлээлгийн талоны гарчиг	\N	\N	POS_BASKET_HEADER_NAME	\N	\N	\N	\N
50006	Посын хүлээлгийн талоны дунд гарчиг	\N	\N	POS_BASKET_CONFIG_INFO	\N	\N	\N	\N
1559203603556	Харилцагч харуулах эсэх	\N	\N	FAISUSECUSTOMER	\N	1	1553855623757	\N
1573630919192	Түрээсийн бүртгэл дээр данс ашиглахдаа placeholder ашиглахаар бол тохируулна	\N	\N	ISUSEFARENTACCOUNTPLACEHOLDER	\N	1	\N	\N
1574249825784	Түрээсийн нэмэлт талбар ашиглах бол	\N	\N	ISUSEFARENTADDITIONAL	\N	1	1556077225255	\N
21573123740242	Утасны дугаараар нууц үг сэргээж авах	\N	\N	RECOVER_PASSWORD_BY_PHONE	\N	\N	\N	\N
1577180028544	Өглөгийн жагсаалт тайлангийн жагсаалтын тохиргоо	\N	\N	FIN_REPORT_AP_LIST_DV	\N	1	1553855624049	\N
1578069266418	Дансны эрхийн тохиргоог cache дээр хөтлөх	\N	\N	ISUSEPERMISSIONCACHE	\N	1	\N	\N
19	passwordSuggest	\N	\N	passwordSuggest	\N	\N	\N	\N
1581315297301	Электрон талоноос хэвлэх баримт	\N	\N	PosOrderTemplateID	\N	\N	\N	\N
888	http://iis101.veritech.mn/fileconverter/Converter.aspx?mode=1&FromUrl=	\N	\N	convertFileToThumbUrl	\N	\N	\N	\N
101011	http://dev.veritech.mn/	\N	\N	thumbSourceFileUrl	\N	\N	\N	\N
14107	ПОС төлбөрийн хэлбэр дээрх what3words нуух	\N	0	configPosIsHideAddress	\N	7	16655658620209	ПОС төлбөрийн хэлбэр дээрх what3words нуух
14108	ПОС төлбөрийн хэлбэр дээрх баримтын дугаар нуух	\N	0	configPosIsHideRecipe	\N	7	16655658620209	ПОС төлбөрийн хэлбэр дээрх баримтын дугаар нуух
21552546548786	Банкны хуулгыг татсаны дараа баримт үүсгэнэ	\N	\N	isAutoConnectBillingToBankBook	\N	\N	\N	\N
1026	Нууцлалтай өгөгдөл харах нууц үг	\N	\N	isDataSecurityPassword	\N	\N	\N	\N
232323	Server address for report template DEV express tool	\N	\N	CONFIG_REPORT_TEMPLATE_SERVER_ADDRESS	\N	\N	\N	\N
1027	Утаснаас зөвхөн zip гаралт авах	\N	\N	MOBILE_ZIP_RESPONSE	\N	\N	\N	\N
999074	WebSocket холболт үүсгэх эсэх	boolean	\N	isUseWebSocket	\N	\N	\N	\N
15877112512693388	erp_skin	\N	\N	systemTheme	\N	\N	\N	\N
1590393817131	Магнай Трейд ХХК -н системүүдийн интеграци хийх тохиргоо	\N	\N	MT_SYSTEMS_INTEGRATION	\N	1	\N	\N
10306	Олон баазаас сонгох эсэх	\N	\N	isUseMultiDatabase	\N	\N	\N	\N
15877112512693394	Үндсэн хөрөнгийн элэгдэл бодох цонхны нярав шүүлтийг нуух тохиргоо	\N	\N	isHideDeprFilterAssetKeeperId	\N	\N	\N	\N
1029	Цалингийн мэйлыг post_address руу илгээх	\N	\N	SEND_PAYROLL_INFO_TO_POST_ADDRESS	\N	\N	\N	\N
1592355365227	Candy -н API тохиргоо	\N	\N	CANDY_API	\N	1	\N	\N
15877112512693397	bankIntegrationGetTokenCustomURLKhaan	\N	\N	bankIntegrationGetTokenCustomURLKhaan	\N	\N	\N	\N
57	Нууц үг Hash шалгах	\N	\N	userPasswordHash	\N	\N	\N	\N
15877112512693399	Пос хаалт хийхдээ хэвлэх баримтын метаны ID	\N	\N	posDayClosePrintReportMetaId	\N	\N	\N	\N
15877112512693400	Харилцагчийн сонголтыг бараа дуудахын дээр байрлуулах	\N	\N	posCrmChoosePosition	\N	\N	\N	\N
40	defaultPasswordCheckGet	\N	\N	defaultPasswordCheckGet	\N	\N	\N	\N
20009549	mobile_location	string	\N	mobile_location	\N	\N	\N	\N
20009550	mobile_location_time	string	\N	mobile_location_time	\N	\N	\N	\N
1599818240051	Интермед эмнэлэгийн FTP серверийн тохиргоо	\N	\N	INTERMED_FTP	\N	1	\N	\N
21	Тухайн системийг клоудад ашиглах эсэх	\N	\N	isCloud	\N	\N	\N	\N
15877112512693520	Үлдэгдэлтэй купоны дүнг хасахруу ордог болгох	\N	\N	IS_POS_COUPON_AMOUNT_APPROVE_NEGATIVE_VALUE	\N	\N	\N	\N
232323242424	Сугалаа емэйлээр илгээх тохиргоо	boolean	\N	POS_CONFIG_LOTTERY_SENT_EMAIL	\N	\N	\N	\N
1603266677652	U-Point урамшууллын системийн API -тай холбоотой тохиргоонууд	\N	\N	UPOINT_API	\N	1	\N	\N
20018189	TETRIS_SITE_LOG_PATH	string	\N	TETRIS_SITE_LOG_PATH	\N	\N	\N	\N
15877112512693499	Санхүүрүү илгээхэд барааны гэрээ шалгах эсэх	boolean	\N	SM_TO_GL_CHECK_CONTRACT_ITEM	\N	\N	\N	\N
1603860331938	Эдийн засгийн ангилал харуулах эсэх	\N	\N	IS_ECONOMIC_CLASS	\N	1	\N	\N
1603958677581	Гайхам GPS API -тай холбоотой тохиргоо	\N	\N	GAIKHAM_API	\N	1	\N	\N
44	rootLaw	\N	\N	rootLaw	\N	\N	\N	\N
2323232323	MONPAY	boolean	\N	CONFIG_POS_PAYMENT_CANDY	\N	\N	\N	\N
15877112512694089	Бараа материал дээр гэрээ ашиглах эсэх /агуулах/	\N	\N	ISUSECONTRACTWAREHOUSE	\N	1	1553855535011	\N
11000	startBgColor	\N	\N	startBgColor	\N	\N	\N	\N
11002	endBgColor	\N	\N	endBgColor	\N	\N	\N	\N
1604885703241	блок хайрцаг ашиглах эсэх	check	\N	ISUSEBLOCK	\N	1	\N	Блок, хайрцаг бүртгэлд ашиглах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
1472543466450	anket	\N	\N	anketHoverColor	\N	\N	\N	\N
15877112512694090	Санхүүгийн баримт давхар үүсэх эсэх	\N	\N	ISCREATEITEMBOOK	\N	1	\N	\N
1212	POS Test Print харуулах эсэх	boolean	\N	CONFIG_POS_TEST_PRINT	\N	\N	\N	\N
28	Өөр газраас логин хийхэд зөв хүн логин хийсэн талаарх мэдээллийг сануулсан имэйлийн загвар / EML_TEMPLATE- н таблийн id-g config_value- д тавина /	\N	\N	deviceVerificationEmailTemplateId	\N	\N	\N	\N
15877112512694092	Хөнгөлөлтийн карт уншуулсан үед бүх бараанд хөнгөлөлт тооцох	boolean	\N	IS_DISCOUNT_ALL_ITEMS_ON_MEMBERSHIP	\N	\N	\N	\N
15877112512694093	isExcelImportNoWait	boolean	\N	isExcelImportNoWait	\N	\N	\N	\N
61	monpassServerAddress	\N	\N	monpassServerAddress	\N	\N	\N	\N
62	XYP_TOKEN_ACCESS_TOKEN	\N	\N	XYP_TOKEN_ACCESS_TOKEN	\N	\N	\N	\N
334	XYP_TOKEN_KEY_STR	\N	\N	XYP_TOKEN_KEY_STR	\N	\N	\N	\N
15877112512694094	Дотоод гүйлгээ хийх үед баримт холбох цонх дуудах эсэх	\N	\N	config_fin_internalTransactionTypeId	\N	\N	\N	\N
1472543466440	anket	\N	\N	anketColor	\N	\N	\N	\N
1472543466441	anket	\N	\N	anketLogo	\N	\N	\N	\N
1472543466442	anket	\N	\N	anketFacebookLink	\N	\N	\N	\N
1472543466443	anket	\N	\N	anketTwitterLink	\N	\N	\N	\N
1472543466444	anket	\N	\N	anketLinkedinLink	\N	\N	\N	\N
1472543466445	anket	\N	\N	anketContactLocation	\N	\N	\N	\N
1472543466446	anket	\N	\N	anketContactPhone	\N	\N	\N	\N
1472543466447	anket	\N	\N	anketContactHeaderLocation	\N	\N	\N	\N
1472543466448	anket	\N	\N	anketWorkTime	\N	\N	\N	\N
1472543466449	anket	\N	\N	anketCopyrigthtext	\N	\N	\N	\N
14725434664409	anket	\N	\N	anketOrgName	\N	\N	\N	\N
14725434664401	Ажилд бүртгүүлэх өргөдлийн маягт харагдах цагаан лого байна	\N	\N	anketLogoWhite	\N	\N	\N	\N
21552546548582	APP MENU background picture	\N	\N	bg_appmenu_path	\N	\N	\N	\N
16005	App server-ийн лог бичих эсэх	\N	\N	WRITE_LOG_ON_APPSERVER	\N	\N	\N	\N
21552546548784	Тухайн метаны хувьд орчуулга хийх товчыг харуулна	\N	\N	META_TRANSLATE_BUTTON	\N	\N	\N	\N
1571727423046	Барааны үлдэгдэл шалгах огноо	check	\N	CHECK_ITEM_END_QTY_DATE	\N	1	1553855535011	Барааны үлдэгдэлд бүртгэлд шалгах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
1020	Дэлгүүрээс санхүү рүү төлбөрийн даалгаврын гүйлгээ хийх эсэх.	\N	\N	SM_TO_FIN_PAYMENT_ORDER	\N	\N	\N	Дэлгүүрээс санхүү рүү төлбөрийн даалгаврын гүйлгээ хийх эсэх.
91001	Цалин бодолт тэмплэйтийн шүүх DV	\N	\N	prlCalculateTemplateDV	\N	\N	\N	\N
91000	Цалин бодолт тэмплэйтийн шүүлтээс ажиллах эсэх	\N	\N	prlCalculateTemplateCretria	\N	\N	\N	\N
1574404969618	Түрээсийн модуль дээр төлбөрийн хүсэлттэй холбоотой тохиргоо ашиглах эсэх	\N	\N	ISUSEFFININVOICE	\N	1	1556077225255	Түрээсийн модуль дээр төлбөрийн хүсэлттэй холбоотой тохиргоо ашиглах эсэх
1574933373012	Инсентив үнэлгээ - Борлуулалтын үзүүлэлтийн гүйцэтгэлийн файлтай холбоотой тохиргоо	\N	\N	KHANBANK_SPR_FILE	\N	\N	\N	\N
1575862515934	Өглөг үүсгэхэд үлдэгдэл татахгүй. Өглөг хаахад нэмэх товч байхгүй	\N	\N	ISUSEAPSTANDART	\N	1	1553855624049	\N
42952	DDISH	\N	\N	IS_DDISH	\N	\N	\N	\N
1024	PRL_DELETE_GL_INVOICE.	\N	\N	PRL_DELETE_GL_INVOICE	\N	\N	\N	\N
91004	Цалин бодолтын загвар, дугаарын хамаарал	\N	\N	prlCalculateTemplateCretria2	\N	\N	\N	\N
1025	Top menu - логин хэсэгт scenario сонголт харагдах эсэх (тайлант үетэй ижил)	\N	\N	isEaScenario	\N	\N	\N	\N
1584585363759	НӨАТ-н өглөгийн данс тохируулга	\N	\N	CONFIG_GL_VAT_DEDUCTION_CREDIT	\N	1	1556077225255	\N
153060903533	Цаг бүртгэлийн балансын цонхны DV унших dynamic тохиргоо	\N	\N	tnaTimeBalanceHdrDV	\N	\N	\N	\N
153060903534	Цаг бүртгэлийн балансын цонхны шилжилт хөдөлгөөнөөр харуулах тохиргоо	\N	\N	tmsBalanceIsMovementEmployee	\N	\N	\N	\N
1585909969496	Борлуулалт dtl дээр төлбөрин хэлбэр авах эсэх	\N	\N	ISUSEDTLPAYMENTTYPE	\N	1	1553855535011	Борлуулалт dtl дээр төлбөрин хэлбэр авах эсэх
1587711251269336	1	\N	\N	1581404722080081	\N	\N	\N	\N
1587711251269335	1	\N	\N	1581404722080080	\N	\N	\N	\N
1581404722080080	Мобайл дээр нууц үг сэргээх товч ашиглахгүй бол тохируулна	\N	\N	MobileIsUsePasswordReset	\N	\N	\N	\N
1581404722080081	Мобайл дээр Профайл ашиглахгүй бол тохируулна	\N	\N	MobileIsUseProfile	\N	\N	\N	\N
1589269242587	AD RMS холбогдох API -н хаяг	\N	\N	AD_RMS_API	\N	1	\N	\N
15877112512693390	Нээлт хийхдээ бутархай мөнгө оруулдаг эсэх	\N	\N	CONFIG_POS_IS_CASHIER_INSERT_C1	0	\N	\N	\N
15877112512693391	Үлдэгдэлтэй бэлгийн карт ашиглах эсэх	\N	\N	CONFIG_POS_IS_USE_REMAINDER_COUPON	0	\N	\N	\N
15877112512693395	Орлого зарлагын нэгдсэн данс	accountCode	\N	incomeOutcomeAccountDefaultId	\N	\N	\N	Хайлтын гүйлгээ хийх үед дуудагдах ОЗНД-г тохируулж өгта үү
15877112512693396	Тайлант үеийн ашиг алдагдлын данс	accountCode	\N	extAccountDefaultId	\N	\N	\N	Хайлтын гүйлгээ хийх үед дуудагдах тайлант үеийн ашгийн дансыг тохируулж өгта үү
22222	POS_CANDY_USER_PASS	\N	\N	POS_CANDY_USER_PASS	\N	\N	\N	\N
58	UM_META_PERMISSION_IGNORE дүр шалгах	\N	\N	checkPermissionIgnore	\N	\N	\N	\N
15877112512694091	Посын цонхонд үйлчилгээ буюу job сонгуулах эсэх	boolean	\N	CONFIG_POS_SERVICEJOB	\N	999	\N	\N
15877112512694095	Пос дээрээс депозит үүсгэх	\N	\N	POS_CREATE_DEPOSIT	\N	\N	\N	\N
15877112512694096	Пос дээр авлага сонгох эсэх. Мөн авлагыг хэн дээр тооцохыг тохируулна.	\N	\N	CONFIG_POS_PAYMENT_RECEIVABLE	\N	\N	\N	\N
15877112512695001	Pos Right Sidebar дээр дотоод хэрэгцээнд хэвлэх дугаар оруулах эсэх.	boolean	\N	CONFIG_POS_IS_SHOW_ADDITIONAL_NUMBER	\N	\N	\N	\N
1202012	Пос локал маржины тохиргоо	\N	\N	CONFIG_POS_LOCAL_BILL_MARGIN	\N	\N	\N	\N
100010	Нөхөж амрах фонд цаг тооцох хугацаа	\N	\N	FONT_ALL_MINUT	\N	\N	\N	\N
66	companyRegId	\N	\N	companyRegId	\N	\N	\N	\N
429520	Харьцуулалт нэмэх дээрх нэгж үнийн дүн солих	\N	\N	COMPARISON_ADD_CHANGE_PRICE	\N	\N	\N	\N
429521	Харьцуулалт засах дээрх нэгж үнийн дүн солих	\N	\N	COMPARISON_EDIT_CHANGE_PRICE	\N	\N	\N	\N
1101010	hideDtlInfo	\N	\N	hideDtlinfo	\N	\N	\N	\N
15877112512695003	Пос дээр банкны шилжүүлэг буюу PaymentTypeId = 4 үед заавал Bank_Billing_Id заавал тохируулдаг байх	boolean	\N	CONFIG_POS_IS_REQUIRED_BANK_BILLING_ID	\N	999	\N	\N
15877112512695004	Мөрийг устгах үед дүнг 0-лэх эсэх. Хэрвээ 0 утгатай бол мөрийг устгана. 1 утгатай бол мөрийг 0 болгоно.	boolean	\N	CONFIG_POS_IS_RETURN_VALUE_IS_ZERO	\N	999	\N	\N
15877112512694087	Картын дугаар ашиглах эсэх	\N	\N	ISUSECARDNUMBER	\N	1	1553855535011	\N
15877112512694088	Бараа материал дээр ажилтан ашиглах эсэх /агуулах/	\N	\N	ISUSEEMPLOYEE	\N	1	1553855535011	\N
15877112512695007	Пос дээр барааны нэгжийн үнэ өөрчлөх боломжтой болгох эсэх	boolean	\N	CONFIG_POS_SERVICE_EDIT_PRICE	\N	999	\N	\N
429522	Гаалийн жишиг үнээс нөат бодох	\N	\N	CUSTOM_PRICE_CALC_VAT	\N	\N	\N	\N
15877112512695008	cloudDepartmentConfig	\N	\N	CLOUD_DEPARTMENT_CONFIG	\N	\N	\N	\N
15877112512695009	Тайлангын custom фонт	string	\N	reportCustomFonts	\N	\N	\N	\N
15877112512695010	abs	\N	\N	52eb72d7322a0425088dc4c455f58653	\N	\N	\N	\N
110000	hrmPasswordHash	\N	\N	hrmuserpasswordhash	\N	\N	\N	\N
15877112512695011	Сектор менежерээр бүртгэлгүй ажилтнууд	string	\N	EMPLOYEES_NOT_SALESPERSON_TYPE_7	\N	\N	\N	\N
15877112512695012	ХТ-ээр бүртгэлгүй ажилтнууд	string	\N	EMPLOYEES_NOT_SALESPERSON_TYPE_1	\N	\N	\N	\N
15877112512695013	Мерчиндайзераар бүртгэлгүй ажилтнууд	string	\N	EMPLOYEES_NOT_SALESPERSON_TYPE_8	\N	\N	\N	\N
15877112512695014	Түгээгчээр бүртгэлгүй ажилтнууд	string	\N	EMPLOYEES_NOT_SALESPERSON_TYPE_2	\N	\N	\N	\N
15877112512695015	Жолоочоор бүртгэлгүй ажилтнууд	string	\N	EMPLOYEES_NOT_SALESPERSON_TYPE_3	\N	\N	\N	\N
900	Нууц үг сэргээх "Нууц үг сэргээх мэйл хаягаа мартсан бол хариуцсан IT инженертэйгээ холбогдоно уу" гэх байдлаар info өгөх зорилгоор ашиглав.	\N	\N	passwordResetInfoMessage	\N	\N	\N	\N
16302979003311	Open Banking Interface	\N	\N	GOLOMT_OPEN_BANK_API	\N	1	\N	\N
1052	WEB_EXECUTABLE_PATH	\N	\N	WEB_EXECUTABLE_PATH	\N	\N	\N	\N
505	Барааны үлдэгдэл шалгах эсэх /Зарлага/	\N	\N	IS_CHECK_END_QTY	\N	\N	\N	\N
9846521	Салбар нэгжийн олон ажлын урсгал ашиглах эсэх	boolean	\N	IS_USER_PROC_TENDER_METHOD_DEPARTMENT_WORKFLOW	\N	21	16783427019219	\N
783	DEPR_USAGE_METHOD	\N	\N	DEPR_USAGE_METHOD	\N	\N	\N	\N
15878112512694088	Барааны үлдэгдлийн жагсаалтыг пос дээр харуулах эсэх	boolean	\N	CONFIG_POS_IS_SHOW_ITEM_ENDQTY_LIST	\N	999	\N	\N
149429109	Онлайн шопын QPAY төлбөр тооцооны системтэй холбогдох тохиргоо	\N	\N	QPAY_API_ESHOP	\N	7	16655658620209	Онлайн шопын QPAY төлбөр тооцооны системтэй холбогдох тохиргоо
15878112513694069	Онлайн посын нэхэмжлэхийн жагсаалтын meta_data_id	number	\N	CONFIG_POS_INVOICE_LIST_META_DATA_ID	\N	999	\N	\N
16588037440449	loginLayout	\N	\N	loginLayout	\N	\N	\N	\N
16648566390549	Журналд холбох check харагдахгүй байх	check	\N	ISNOTVIEWGL	\N	1	1553855535011	\N
22	TDB дээр нэвтрэх нэр , нэвтрэх пассворд ашиглах эсэх	\N	\N	isTdbRequirePassword	\N	1	\N	\N
1666499655755	Сард явуулах цагийн хүсэлтийн хязгаар	\N	\N	TIME_REQUEST_LIMIT	\N	\N	\N	\N
15878112513694076	Түрээсийн гэрээний жагсаалтын тохиргоо	\N	\N	FA_RENT_CONTRACT	\N	1	\N	\N
16311554350421	Голомт API салбарын байршил	string	1	CITIZEN_ERP_CONFIG_FINENCIAL_INFORMATION_BANK_LOCATION_URL	\N	1	\N	\N
1055	Бүх мөрийг амжилттай үед хадгалах боломж нээх	\N	\N	ALLOW_BULK_COMMIT_ON_EXCEL_IMPORT	\N	\N	\N	\N
15878112512694085	kpiDbSchemaName	string	\N	kpiDbSchemaName	\N	999	\N	\N
15878112513694065	EMAIL_SENDING_LIMIT_FOR_MINUT	number	\N	EMAIL_SENDING_LIMIT_FOR_MINUT	\N	\N	\N	\N
1061	MICROSOFT EXCHANGE SERVER түр хийлээ	\N	\N	PAYROLL_FROM_PHP_MAI_ADDRESS	\N	\N	\N	\N
45487273	Mobile-с ирц бүртгүүлэх 2 байршилын хоорондох зай	\N	\N	coordinateDistance	\N	\N	\N	\N
656565	bbalance-н цонхон дээр шалтгаан нуух	\N	\N	hideReason	\N	\N	\N	\N
15877112512694186	22:00 -ээс шөнийн цаг эхлэх	\N	\N	22:00	\N	2	16165834960711	\N
15877112512694187	22:30 -ээс шөнийн цаг тооцох	\N	\N	22:30	\N	2	16165834960711	\N
15877112512694189	06:00 -ээс шөнийн цаг дуусах	\N	\N	06:00	\N	2	16165834960711	\N
16608786584959	Monpay account_id тохируулах	\N	\N	POS_MONPAY_ACCOUNT_ID	\N	1	\N	\N
15877112512693470	Харилцагчид тус бүрийн Voucher загварууд /folder name/	string	\N	CONFIG_POS_VOUCHER_PATH	\N	\N	\N	\N
15877112512693472	Дагалдах бараа	boolean	\N	CONFIG_POS_ACCOMPANY_ITEM	\N	\N	\N	\N
15877112512693473	Төлбөрийн төрөл Урьдчилгаа төлбөр	boolean	\N	CONFIG_POS_PREPAYMENT	\N	7	16655658620209	Төлбөрийн төрөл Урьдчилгаа төлбөр
15877112512693433	PosApi PHP сервисийн хаяг	url	\N	CONFIG_POSAPI_SERVICE_ADDRESS	\N	\N	\N	\N
999100	Худалдан авалт - Төлбөрийн хүсэлтийн төсөв шалгах эсэх	boolean	\N	IS_PROC_PAYMENT_CHECK_BUDGET	\N	21	16783427019219	Proc Feature
15878112513694077	Баримтын загвар дээр хүргэлтийн хаяг нэмэлтээр гаргах метаны ID	\N	\N	POS_BILL_PRINT_ADD_DELIVERY_ADDRESS	\N	\N	\N	Сагснаас сонгогдож байгаа мэдээллийн хүргэлтийн хаягийг баримтан дээр давхар хэвлэгдэх тохиргоо
15878112512694072	Банкны гүйлгээнд BillingBook table ашиглах эсэх	string	\N	IS_USE_BANK_BILLING_BOOK	\N	\N	16139112215352	\N
1051	TEST_CASE_HTML_URL	\N	\N	TEST_CASE_HTML_URL	\N	\N	\N	\N
9846515	Үнийн санал - Бодох товч ашиглах эсэх	boolean	\N	PROC_COMPARISON_USE_CALC_BUTTON	\N	21	16783427019219	\N
15878112512694081	Үүссэн огноогоор салгах	\N	\N	ISUSEITEMBOOKDATE	\N	1	1553855535011	\N
16484398779069	test	\N	\N	Config_bankaccount_code_mask	\N	1	\N	\N
15878112513694066	Пос дээр бичигдэх барааны оронгийн нарийвчлалын тохиргоо	number	\N	CONFIG_POS_ITEM_FRACTIONAL_QTY	\N	999	\N	\N
999080	Харьцуулалт хийхэд хувийн хэтрэлт харах эсэх	\N	\N	PROC_COMPARISON_IS_OVERDUE_PERCENT	\N	\N	\N	\N
9846513	Харьцуулалт файл хавсаргах эсэх	\N	\N	proc_isrequired_file	\N	\N	\N	\N
15878112513694075	Олон хэмжих нэгж ашиглах эсэх	\N	\N	IS_USE_MULTIBLE_MEASURE	\N	\N	\N	\N
1077	FILTER USER DATA ON MUIS	\N	\N	FILTER_USER_DATA_ON_MUIS	\N	\N	\N	\N
1072	Капитрон банк гэтвэ	\N	\N	CAPITRONBANK_EGATEWAY	\N	\N	\N	\N
1073	Төрийн банк гэтвэ	\N	\N	STATEBANK_EGATEWAY	\N	\N	\N	\N
1667448432213	Ирсэн болон явсан цагийн интервал	\N	\N	ATTENDANCE_INTERVAL_TIME	\N	\N	\N	Ирсэн болон явсан цагийн интервал
64	ERP меню дээр текст голлож харагдах	\N	\N	appmenuTopCenterTitle	\N	\N	\N	\N
10001001	Нэг удаагийн нууц үг солих линкийг хэрэглэгчийн мэйлрүү илгээх 	\N	\N	OTP_TEMP_URL	\N	\N	\N	\N
15878112512694080	Meta send to domains	string	\N	metaSendToDomains	\N	\N	\N	\N
9846520	Гааль - Үнэгүй барааны бодолт ашиглах эсэх	boolean	\N	PROC_CUSTOM_NO_PRICE_CALC	\N	21	16783427019219	\N
1638523516468	isDeviceVerificationByEmail	\N	\N	isDeviceVerificationByEmail	\N	\N	\N	\N
1638523530172	isDeviceVerificationByPhone	\N	\N	isDeviceVerificationByPhone	\N	\N	\N	\N
15878112513694067	Сүүлийн худалдан авалтын өртөг харах эсэх	\N	\N	ISUSELASTCOST	\N	1	1553855535011	\N
686868	ip address	\N	\N	IP_ADDRESS	\N	\N	\N	\N
16553732388679	ҮНДСЭН ХӨРӨНГИЙН ЭХНИЙ ҮЛДЭГДЛИЙН ОГНОО	\N	\N	FABEGINDATE	\N	1	\N	\N
89	Бүртгүүлэх товч	\N	\N	showLoginRegister	\N	\N	\N	\N
222223254235	Бүтээгдэхүүний төрлийн тогтмол утга	\N	\N	PLM_PRODUCT_TYPE_DEFAULT	\N	\N	\N	\N
1667536025302	Хувийн имэйл рүү солисон нууц үгийн мэдээлэл явуулах	\N	\N	getPasswordResetUserDataByEmail	\N	\N	\N	getPasswordResetUserDataByEmail
999082	Feature ашиглах эсэх: Худалдан авалтын хүсэлт ашиглах эсэх	boolean	\N	IS_PROC_USE_FEATURE_PURCHASE_REQUEST	\N	21	16783427019219	Proc Feature
999083	Feature ашиглах эсэх: Худалдан авалтын тусгай нөхцөл	boolean	\N	IS_PROC_USE_FEATURE_PURCHASE_SPECIAL_SUPPLIER	\N	21	16783427019219	Proc Feature
999084	Feature ашиглах эсэх: Худалдан авалтын харьцуулалт	boolean	\N	IS_PROC_USE_FEATURE_PURCHASE_COMPARISON	\N	21	16783427019219	Proc Feature
999085	Feature ашиглах эсэх: Худалдан авалтын тендер	boolean	\N	IS_PROC_USE_FEATURE_PURCHASE_TENDER	\N	21	16783427019219	Proc Feature
88	hrmExamMinPoint	\N	\N	hrmExamMinPoint	\N	\N	\N	\N
1060	GENERAL_LEDGER_BOOK_STRUCTURE_ID	\N	\N	GENERAL_LEDGER_BOOK_STRUCTURE_ID	\N	\N	\N	\N
1062	Гар утаснаас нэвтрэхдээ IMEI Давхар шалгах	\N	\N	MOBILE_LOGIN_WITH_IMEI	\N	\N	\N	\N
15878112512694099	Пос төлбөрийн хэлбэр дээр баталгаат засварыг харуулах эсэх	boolean	\N	CONFIG_POS_PAYMENT_VERIFIED_SERVICE	\N	7	16655658620209	Пос төлбөрийн хэлбэр дээр баталгаат засварыг харуулах эсэх
1068	Дараагийн төлөвийг тохиргооноос хайх	\N	\N	FILTER_FOR_NEXT_STATUS_IN_VW_DEPARTMENT	\N	\N	\N	\N
16626907465869	Төлбөрийн төрөл Лизинг НӨАТ-тэй гарах эсэх	boolean	\N	CONFIG_POS_PAYMENT_LEASING_IS_VAT	\N	1	\N	\N
1664619113353	Үндсэн хөрөнгийн тайлан	\N	\N	FIN_REPORT_FA	\N	\N	\N	\N
77	is_testing	\N	\N	is_testing	\N	\N	\N	\N
177	STAMP дарахад DOCROOT PATH ашиглах эсэх	\N	\N	USE_DOCUMENT_ROOT_PATH	\N	\N	\N	\N
16703847086679	Агуулах бараан дээрээ 2 хэмжих нэгж тооцох эсэх	\N	\N	ISUSEEQITEMWH	\N	1	\N	\N
454545	TMS_PLAN_ARCHIEVE_BY_DEPARTMENT	\N	\N	TMS_PLAN_ARCHIEVE_BY_DEPARTMENT	\N	\N	\N	\N
15878112512694076	userKeyDiffAction	\N	\N	userKeyDiffAction	\N	\N	\N	\N
15878112512694077	Төлбөрийн хэлбэр дээр Бартерийг disable болгох	boolean	\N	POS_IS_DISABLE_PAYMENT_BARTER	\N	999	\N	\N
15878112512694078	Төлбөрийн хэлбэр дээр Ажилтны зээлийг disable болгох	boolean	\N	POS_IS_DISABLE_PAYMENT_EMPLOAN	\N	999	\N	\N
15878112512694079	Төлбөрийн хэлбэр дээр Дотоод зардалыг disable болгох	boolean	\N	POS_IS_DISABLE_PAYMENT_LOCALEXPENSE	\N	999	\N	\N
215844360972460	HUNNU	\N	\N	IS_HUNNU	\N	\N	\N	\N
15878112512694082	abs	\N	\N	11fe5a45126ac8fbff1d82f50439409b	\N	\N	\N	\N
15878112513694068	Посын цонхны зүүн хэсэгт бараа, харилцагч 2ийн голд нэхэмжлэхийн төрлийн жагсаалт харуулах эсэх	boolean	\N	POS_IS_SHOW_INVOICE_TYPE_LIST	\N	999	\N	\N
1065	Веритек мэйл дээрх гарын үсэг	\N	\N	VERITECH_SIGNATURE_ON_MAIL	\N	\N	\N	\N
160868660	Delivey patch url	\N	\N	bugfixServiceAddress	\N	\N	\N	\N
160868661	160868660	\N	\N	https://install.veritech.mn/	\N	\N	\N	\N
1111111	TextEditor	\N	\N	WORD_EDITOR_FOLDER_MODE	\N	\N	\N	\N
1050	WAITING_SECOND_PROCESS_LOG	\N	\N	WAITING_SECOND_PROCESS_LOG	\N	\N	\N	\N
2001	Шалгалтанд тэнцэх хувь	\N	\N	EMS_PASS_EXAM_POINT	\N	16569215335320	\N	\N
15878112513694070	GET_DEPARTMENT_ID	\N	\N	GET_DEPARTMENT_ID	\N	\N	\N	\N
15878112513694071	GET_DEPARTMENT_LOGO	image	\N	GET_DEPARTMENT_LOGO	\N	\N	\N	\N
15878112513694072	GET_DEPARTMENT_THEME	\N	\N	GET_DEPARTMENT_THEME	\N	\N	\N	\N
15878112513694073	GET_DEPARTMENT_TITLE	\N	\N	GET_DEPARTMENT_TITLE	\N	\N	\N	\N
15878112513694074	GET_DEPARTMENT_ICON	image	\N	GET_DEPARTMENT_ICON	\N	\N	\N	\N
63	ERP меню дээр дуудагдаж байгаа картуудыг томруулах зориулалттай	\N	\N	isAppmenuBigCard	\N	\N	\N	\N
15878112512694071	Гольфийн бараанууд	string	\N	POS_GOLF_ITEM_CODES	\N	999	\N	\N
16311554583871	Голомт API салбарын байршил service	string	\N	CITIZEN_ERP_CONFIG_FINENCIAL_INFORMATION_BANK_LOCATION_SERVICE	\N	1	\N	\N
15878112512694073	Захиалгаас талон үүсгэхэд нэмэлт мэдээллийн харилцагчийг засах боломжгүй байлгах	boolean	\N	POS_IS_EDIT_CUSTOMER_INFO_FROM_ORDER_BOOK	\N	999	\N	\N
15878112512694074	Хүргэлттэй үед заавал үйлчилгээ сонгосон байх	boolean	\N	POS_IS_REQUIRED_MES_JOB_FOR_IS_DELIVERY	\N	999	\N	\N
15878112512694075	isBpTemplateNormalMode	boolean	\N	isBpTemplateNormalMode	\N	\N	\N	\N
14725434664412	anketInstaLink 	\N	\N	anketInstaLink 	\N	\N	\N	\N
21552546548785	Хөгжүүлэлтийн орчин эсэхийг ялгана	\N	\N	isCustomerServer	\N	\N	\N	\N
16394007712791	Хоёрдогч валют ашиглах эсэх	\N	\N	ISUSESECONDARYRATE	\N	1	\N	\N
15878112512694083	Пос төлбөрийн хэлбэр дээр даатгалыг харуулах эсэх	boolean	\N	CONFIG_POS_PAYMENT_INSURANCE	\N	7	16655658620209	Пос төлбөрийн хэлбэр дээр даатгалыг харуулах эсэх
15878112512694084	Пос төлбөрийн хэлбэр дээр бусад гэдэг мөрийг харуулах эсэх	boolean	\N	CONFIG_POS_PAYMENT_OTHER	\N	7	16655658620209	Пос төлбөрийн хэлбэр дээр бусад гэдэг мөрийг харуулах эсэх
100000	APPMENU дээр таг(tag) харуулдаггүй болгох (10-аас дээш менютэй тохиолдолд таг харагддаг)	\N	\N	appmenuGroupingCount	\N	\N	\N	\N
784	DEPR_CALC_DATAVIEW	\N	\N	DEPR_CALC_DATAVIEW	\N	\N	\N	\N
999081	Тусгай нөхцөл олон нийлүүлэгч сонгох эсэх	\N	\N	SS_MULTI_SUPPLIER	\N	\N	\N	\N
16394007712792	Хоёрдогч валют таслалаас хойш 12 орон авах	\N	\N	ISSECONDARYRATEFRACTION	0	1	\N	\N
60	Хангамжийн удирдлага ашиглах эсэх	\N	\N	finSupply	\N	\N	\N	\N
167183284	Захиалга хийхэд Гэрээнд сонгосон нийлүүлэгч автоматаар татах эсэх	boolean	\N	IS_USE_CONTRACT_CUSTOMER_GET	\N	21	16783427019219	\N
6667	Бэлэн бүтээгдэхүүн, түүхий эд материал	\N	\N	itemCategoryFilter	\N	\N	\N	\N
1602233847664	Портын дугаар, барьцаа ашиглах эсэх	\N	\N	ISUSEFARENTADDITIONAL1	\N	1	\N	\N
16716812091959	Нэр	\N	3	firstname	\N	100	16716810934389	\N
16716811373129	Байгууллагын хэлбэр	\N	2	formentity	\N	100	16716810929729	\N
16716811387529	Хувьцаа эзэмшигчийн тоо	\N	13	numberowner	\N	100	16716810929729	\N
16716812110979	Гэрийн утас	\N	8	homephone	\N	100	16716810934389	\N
16716812120589	Нас	\N	12	age	\N	100	16716810934389	\N
16716812121549	Төрсөн газар	\N	13	birthplace	\N	100	16716810934389	\N
16716812131099	Хаягийн эзэмшлийн байдал	\N	13	whoowns	\N	100	16716810934389	\N
16719550315769	Байгууллагын танилцуулга	string	15	aboutCompany	\N	100	16716810929729	\N
1673865318036	Байгууллагын үндсэн байршил	\N	\N	MOBILE_DEFAULT_COORDINATE	\N	\N	\N	\N
158781125126940646	2 html файл харьцуулж өөрчлөлтийг хадгалах	boolean	\N	is_html_diff_ecm_content	\N	\N	\N	\N
16765198220679	Зөвшөөрсөн тоо ашиглах эсэх	\N	\N	ISUSERAPPROVEDQTY	\N	1	1556077225255	\N
250001	Захиалгад валют ашиглах эсэх	boolean	\N	PO_USE_CURRENCY_RATE	\N	21	16783427019219	proc
17	IM_ITEM_SKK_ITEM_LEVEL	\N	\N	IM_ITEM_SKK_ITEM_LEVEL	\N	\N	\N	\N
158781125126940648	Дебит/валютын/	\N	\N	IS_USE_DEBIT_AMOUNT_BASE	\N	\N	\N	\N
158781125126940649	Дебит/валютын/	\N	\N	ISUSEPAYABLEDEBITAMOUNTBASE	\N	\N	\N	\N
16797267176869	гаалийн процэсс hdr дээр customCost(гаалийн татварын дүн) оруулж dtl рүүгээ хуваарьлаж бодно	boolean	\N	isUseHdrCustomCost	\N	21	\N	\N
16797267715339	Барааны шаардах үүсгэхдээ бүтэзлэх эсэх	\N	\N	ISIMNVOICEBUTEZ	\N	1	1553855623869	\N
16800724561769	Гэрээ сонгож өгхөд төлбөрийн хуваарь fillGroupByDV ашиглан татах	boolean	\N	isUseFillGroupContractToPayment	\N	21	\N	\N
666666	Account filter	\N	\N	IsAccountFilterFinancial	\N	\N	\N	\N
16823213880569	Үүссэн огноогоор салах	\N	\N	ISUSERECEIVABLEBOOKDATE	\N	1	\N	\N
16837129323229	Харилцагч дээр бүртгэлтэй НӨАТ төлөгч эсэхийг Баримтын бүртгэл дээр сэт хийхгүй байх	\N	\N	ISUNSETCUSTOMERVAT	\N	1	\N	\N
16855224597499	Борлуулалт түгээлт мобайл процесс	\N	\N	MobileProcessIconV2	\N	8	\N	\N
158781125126940652	Дэлгүүрийн ПОС төлбөр төлөх сагс	\N	\N	POS_PAY_BASKET_LIST	\N	\N	\N	\N
1042	Бодолтой тайлан дээр зардлын төв, өртгийн төвийг журнал бичилтээс шүүх	\N	\N	IS_FILTER_COST_AND_EXPENSE_CENTER_FROM_GLO	\N	\N	\N	\N
1462339415236	Салбарын цалингийн доод хэмжээ	\N	\N	HRM_EMP_DEFAULT_SALARY	\N	\N	\N	\N
1587711251269338	is hide sql exception	boolean	\N	IS_HIDE_SQL_EXCEPTION	\N	\N	\N	\N
1687944104672	isLdapModifyPassword	\N	\N	isLdapModifyPassword	\N	\N	\N	\N
1600	Active directory ашиглах эсэх	\N	\N	ldap_login_mobile	\N	\N	\N	\N
16899265503269	Хүний нөөцийн гэрээний авто дугаарлалт	\N	\N	hrmContractObjectId	\N	2	\N	\N
16899329606669	Нэгжийн бүртгэл цалин бодогдох нэгж ашиглах эсэх	\N	\N	isUsePrlDepartment	\N	2	\N	\N
16899340461959	Нэгжийн бүртгэл дээр шууд удирдах албан тушаал сонгох эсэх	\N	\N	isUseDirectorPosition	\N	2	\N	\N
8007	Баримт бичгийн ангилал эрх шалгах тохиргоо	\N	\N	doc_vw_classification	\N	\N	\N	\N
1000	TBank Login	\N	\N	tbankLogin	\N	\N	\N	\N
52	createMapSignedFiles	\N	\N	createMapSignedFiles	\N	\N	\N	\N
169632097937810	isNotVatSalesDepartment	\N	\N	isNotVatSalesDepartment	\N	1	\N	\N
158781125126940658	Эргүүлэн томилгоо хийхэд ажилд орсон огноо солигдох эсэх	\N	\N	hrmStartDateChange	\N	\N	\N	\N
158781125126940611	POS төлбөрийн хэлбэр | T-Card	\N	\N	CONFIG_POS_PAYMENT_T_CARD	\N	\N	\N	\N
158781125126940622	POS төлбөрийн хэлбэр | Shoppy	\N	\N	CONFIG_POS_PAYMENT_SHOPPY	\N	\N	\N	\N
158781125126940633	POS төлбөрийн хэлбэр | Golomt reward	\N	\N	CONFIG_POS_PAYMENT_GOLOMT_REWARD	\N	\N	\N	\N
158781125126940644	POS төлбөрийн хэлбэр | Social pay reward	\N	\N	CONFIG_POS_PAYMENT_SOCIAL_PAY_REWARD	\N	\N	\N	\N
16716811089169	Хуулийн этгээдийн нэр	\N	1	companyName	\N	100	16716810929729	\N
16716811182539	Регистрийн дугаар	\N	3	registrationnumber	\N	100	16716810929729	\N
16716811194459	Утасны дугаар	\N	5	phone	\N	100	16716810929729	\N
16716811214719	Үйл ажиллагааны чиглэл	\N	8	sector	\N	100	16716810929729	\N
16716811351249	Хуулийн этгээдийн хаяг	\N	10	address	\N	100	16716810929729	\N
16716811352599	Хуулийн этгээдийн дэлгэрэнгүй хаяг	\N	11	detailedaddress	\N	100	16716810929729	\N
16716812086289	Овог	\N	2	lastname	\N	100	16716810934389	\N
16716812083379	Ургийн овог	\N	1	familyname	\N	100	16716810934389	\N
16716812093099	Яс үндэс	\N	4	nationality	\N	100	16716810934389	\N
16716812105489	Төрсөн он сар өдөр	\N	6	birthdate	\N	100	16716810934389	\N
16716812107229	Гар утас	\N	7	cellphone	\N	100	16716810934389	\N
16716812117999	Хүйс	\N	11	gender	\N	100	16716810934389	\N
16716812146719	Гэр бүлийн байдал	\N	17	maritalstatus	\N	100	16716810934389	\N
158781125126940645	Тайлангууд	\N	\N	pandaStatements	\N	\N	\N	\N
16746352134839	Борлуулалт түгээлт мобайл процесс icon	\N	\N	MobileProcessIcon	\N	8	\N	\N
99100	СШ нөөц сангаас ажилтан сонгох хугацаа тохируулах /сар/	\N	\N	REC_RESOURCE_ADD_MONTH	\N	\N	\N	\N
1991	isbalanceTableAutoHeight	\N	\N	isbalanceTableAutoHeight	\N	\N	\N	\N
158781125126940651	Харилцагч дээр PATH харагдах эсэх	\N	\N	IS_SHOW_PATH	\N	\N	\N	\N
16832531199359	Баркодоор орлого зарлага хийх	\N	\N	ISBARCODEBOOK	\N	1	\N	\N
169361552198210	Салбар нэгж НӨАТ төлөгч биш эсэх	boolen	\N	isNotVatDepartment	\N	8	\N	\N
1686713189075	Гэрээний авто дугаарлалт	\N	\N	HRM_CONTRACT_AUTONUM	\N	\N	\N	\N
66666222	POS_NEXT_DISCOUNT_PAYMENT	\N	\N	POS_NEXT_DISCOUNT_PAYMENT	\N	\N	\N	\N
3000	Файл харсан лог	\N	\N	IS_FILE_PREVIEW_LOG	\N	\N	\N	\N
8000	Ирсэн бичгийн авто дугаарлалт	\N	\N	doc_in_auto_number	\N	\N	\N	\N
8001	Тэргүү нэр авто бөглөх	\N	\N	doc_name	\N	\N	\N	\N
8002	Хавсралтын тоогоор мөр нэмэгдэх	\N	\N	doc_no_of_attach	\N	\N	\N	\N
786	Элэгдэл бодоход дансаар шүүхгүй эсэх	\N	\N	IS_NOT_SHOW_ACC_IN_DEPR	\N	1	1553855623757	\N
8003	Ирсэн бичгийн авто дугаарлалтын оролтын утга	\N	\N	doc_in_auto_number_mode	\N	\N	\N	\N
787	Элэгдэл бодоход нярваар шүүхгүй эсэх	\N	\N	IS_NOT_SHOW_SK_IN_DEPR	\N	1	1553855623757	\N
788	Элэгдэл бодоход эд хариуцагчаар шүүхгүй эсэх	\N	\N	IS_NOT_SHOW_EMPLOYEE_IN_DEPR	\N	1	1553855623757	\N
789	Элэгдэл бодоход харилцагчаар шүүхгүй эсэх	\N	\N	IS_NOT_SHOW_CUSTOMER_IN_DEPR	\N	1	1553855623757	\N
790	Элэгдэл бодоход бүлгээр шүүхгүй эсэх	\N	\N	IS_NOT_SHOW_CAT_IN_DEPR	\N	1	1553855623757	\N
791	Элэгдэл бодоход зөрүүгийн бичилт хийхгүй эсэх	\N	\N	IS_NOT_SHOW_DIFF_IN_DEPR	\N	1	1553855623757	\N
16881793358699	Гүйлгээ гарсан бол мэдээлэл засахгүй байх	\N	\N	ISUSECUSTOMERTRANSACTIONDISABLE	\N	1	\N	\N
8004	Явсан бичгийн авто дугаарлалт	\N	\N	doc_out_auto_number	\N	\N	\N	\N
8005	Явсан бичгийн авто дугаарлалтын оролтын утга	\N	\N	doc_out_auto_number_mode	\N	\N	\N	\N
16899258575059	Тушаалын авто дугаарлалтын Id	\N	\N	hrmRectorshipObjectId	\N	2	\N	\N
8006	Явсан бичиг хэвлэх загвар	\N	\N	doc_print_paper_size	\N	\N	\N	\N
158781125126940655	Дэлгүүрийн ПОС хөнгөлөлтийн товч харах эсэх	boolean	\N	CONFIG_POS_ROW_ORDER_DISCOUNT	\N	\N	\N	\N
99080	Төлвийн түүхийн устгах товч	\N	\N	IS_WFM_NOT_ASSIGN_DELETE	\N	\N	\N	\N
99081	Төлвийн түүхийн буцаах товч	\N	\N	IS_WFM_NOT_ASSIGN_RETURN	\N	\N	\N	\N
8009	Цохолтын мөр устгах товч харуулах эсэх	\N	\N	doc_assign_delete_button	\N	\N	\N	\N
8010	Дотоод бичгийн дугаарлалат	\N	\N	doc_auto_number	\N	\N	\N	Дотоод бичгийн дугаарлалтынд ашиглана
8011	Дотоод бичгийн дугаарлалтын оролтын утга	\N	\N	doc_auto_number_mode	\N	\N	\N	\N
158781125126940656	Харилцагч бүртгэх товч SIDEBAR дээр харуулах эсэх	boolean	\N	CONFIG_POS_ADD_CUSTOMER_SIDEBAR	\N	\N	\N	\N
89922234	WE_CHAT	\N	\N	WE_CHAT	\N	\N	\N	\N
16716811098329	Улсын бүртгэлийн дугаар	\N	2	companyNumber	\N	100	16716810929729	\N
16716811189899	Вэб сайт	\N	4	website	\N	100	16716810929729	\N
16716811197829	Мэйл хаяг	\N	6	email	\N	100	16716810929729	\N
16716811207299	Байгуулагдсан огноо	\N	6	dateofestablishment	\N	100	16716810929729	\N
16716811210949	Ажилчдын тоо	\N	7	numberemploy	\N	100	16716810929729	\N
785	Элэгдэл тооцох жагсаалтад харилцагч харуулах эсэх	\N	\N	IS_SHOW_CUSTOMER_DEPR	\N	\N	\N	\N
16750634345829	БМ -ийн бүх процессууд дээр харилцагч заавал сонох	\N	\N	ISREQUIREDALWAYSCUSTOMER	\N	1	\N	\N
20001000100	Санхүүгээрх гэрээний гүйцэтгэл	\N	\N	FINCONPERFORMANCE	\N	\N	\N	\N
158781125126940123	POS төлбөрийн хэлбэр Qpay	\N	\N	CONFIG_POS_PAYMENT_QPAY	\N	\N	\N	\N
1678343789682	digital_Signature_Api_Url	\N	\N	digital_Signature_Api_Url	\N	\N	\N	\N
16783528176289	Худалдан авалтанд гэрээ ашиглах эсэх	boolean	\N	IS_USE_MASTER_CONTRACT_ON_PROC	\N	21	16783528175309	\N
99101	ГҮ болон АҮГ хамт үнэлэх	\N	\N	KPITASKPERFORMANCE	\N	\N	\N	\N
158781125126940650	Ажил үүргийн ангилалын шүүлт	\N	\N	tmTaskClassification	\N	\N	\N	\N
16817800800379	Авлага хариуцсан ажилтнаар салах эсэх	\N	\N	ISUSERECEIVABLEEMPLOYEE	\N	1	\N	\N
16832526160189	Харилцагчийг төрлөөр шүүж харуулах эсэх	\N	\N	ISUSECUSTOMERTYPE	\N	1	\N	\N
16832530950799	Баримтын огноо идэвхигүй болгох	\N	\N	ISBOOKDATEDISABLED	\N	1	\N	\N
16835224658229	Key үйлдвэрлэсэн огноогоор салахгүй	\N	\N	ISNOTSPLITKEYMANUFACTUREDATE	\N	1	\N	\N
16835224662649	Key дуусах огноогоор салахгүй	\N	\N	ISNOTSPLITKEYENDDATE	\N	1	\N	\N
14725434664	Элэгдэл журнал холбохгүй эсэх	\N	\N	IS_NOT_USE_GL_ASSET	\N	1	1553855623757	\N
100002	Хуримтлагдсан илүү цагаас цалинд тооцож олгох хувь	\N	\N	HRM_OVERTIME_SALARY_PERFORMANCE	\N	\N	\N	\N
158781125126940653	Дэлгүүрийн ПОС харилцагчийн бүртгэл	\N	\N	POS_CUSTOMER_ADD_FORM	\N	\N	\N	\N
15878112513694078	isSentShowWorkflowLog	boolean	\N	isSentShowWorkflowLog	\N	\N	\N	\N
161	Ээлжийн амралт бодоход олгохоор тооцсон цалин аль үзүүлэлтээс авах тохиргоо	\N	\N	PAYROLL_VACATION_CALC_F	\N	\N	\N	\N
169440925873610	Агуулахын боломжит үлдэгдэл дээр орлогын хүсэлтийн тоог нэмэх	\N	\N	ISUSEWHINREQUESTQTY	\N	1	\N	\N
444	Custom login	\N	\N	custom_login	\N	\N	\N	\N
9992222115	Токен авах URL	\N	\N	ECM_URL_TOKEN	\N	\N	\N	\N
169466114641010	Байршлаар ирц бүртгүүлэх тойргийн radius ийн зайг тохируулах	\N	\N	tnaLocationDistance	\N	2	\N	\N
8012	Баримт бичгийн тохиргоо	\N	\N	doc_1	\N	\N	\N	\N
8013	Баримт бичгийн тохиргоо	\N	\N	doc_2	\N	\N	\N	\N
8014	Баримт бичгийн тохиргоо	\N	\N	doc_3	\N	\N	\N	\N
8015	Баримт бичгийн тохиргоо	\N	\N	doc_4	\N	\N	\N	\N
8016	Ажил үүргийн гүйцэтгэгч олноор сонгох	\N	\N	tm_multi_assign	\N	\N	\N	\N
8017	Ажил үүргийн тохиргоо	\N	\N	tm_1	\N	\N	\N	\N
8018	Ажил үүргийн тохиргоо	\N	\N	tm_2	\N	\N	\N	\N
8019	Ажил үүргийн тохиргоо	\N	\N	tm_3	\N	\N	\N	\N
8020	Ажил үүргийн тохиргоо	\N	\N	tm_4	\N	\N	\N	\N
8021	Гэрээний тохиргоо	\N	\N	con_1	\N	\N	\N	\N
8022	Гэрээний тохиргоо	\N	\N	con_2	\N	\N	\N	\N
8023	Гэрээний тохиргоо	\N	\N	con_3	\N	\N	\N	\N
8024	Гэрээний тохиргоо	\N	\N	con_4	\N	\N	\N	\N
8025	Гэрээний тохиргоо	\N	\N	con_5	\N	\N	\N	\N
99102	БМ-ын зарлага нэмэх дээр text1,2,3 харуулах эсэх 	\N	\N	ISHEALTHORGANIZARION \r\n	\N	\N	\N	\N
89922233	Хаанбанк сонордуулга дээрх гэрээний ажилтан	\N	\N	ProcBidderReportTemplateNtf	\N	\N	\N	\N
16716812096829	Регистрийн дугаар	\N	5	resgistr	\N	100	16716810934389	\N
16716812115199	Ажлын утас	\N	9	officephone	\N	100	16716810934389	\N
16716812134999	Орон сууцны нөхцөл	\N	15	typehouse	\N	100	16716810934389	\N
16716812143129	Гэрийн дэлгэрэнгүй хаяг	\N	17	detailaddress	\N	100	16716810934389	\N
16716812189979	Мэйл хаяг	\N	17	cemail	\N	100	16716810934389	\N
16716812194319	Гэрийн хаяг	\N	15	caddress	\N	100	16716810934389	\N
16716812196479	Энэ хаягт оршин суугаа хугацаа	\N	17	livingyearaddress	\N	100	16716810934389	\N
16751562040849	Хас дээр хийгдэх хийгдэхгүй үйлдлүүдийг таних	boolean	\N	isXac	\N	21	16783427019219	\N
14109	Файл татах эрхтэй дүрийн код	\N	\N	USER_FILE_DOWNLOAD	\N	\N	\N	\N
1676012894360	Хүсэлт үүсгэх нэмэх товчны оронд текст харуулах	boolean	\N	isCreateButtonText	\N	\N	\N	\N
16783356737519	Бие даасан захиалга хийх эсэх	boolean	\N	USE_SELF_SERVICE_PO	\N	21	16783427012529	Бие даасан захиалга хийх эсэх
178685281	ТГҮ байгууллагаруу илгээх	\N	\N	digital_Signature_Api_Url_To_Org	\N	\N	\N	\N
158781125126940647	Is test case mode	boolean	\N	IS_TESTCASE_MODE	\N	\N	\N	\N
16835224651249	Key сериалаар салахгүй тохиргоо	\N	\N	ISNOTSPLITKEYSERIALNUMBER	\N	1	1553855535011	\N
16842280788409	Gateway тест хийх	\N	\N	isCGTestMode	\N	1	\N	\N
16842330987869	Өдрийн бүртгэл өдөрт нь устгах	\N	\N	ISUSEDAILYBOOKREMOVE	\N	1	\N	\N
250	echarts сан ашиглах эсэх	\N	\N	useEchartsBuilder	\N	\N	\N	\N
201	Голомт open bank service	\N	\N	openBankGolomtService	\N	\N	\N	\N
202	Голомт open bank session key	\N	\N	openBankSessionKey	\N	\N	\N	\N
203	Голомт open bank iv key	\N	\N	openBankIvKey	\N	\N	\N	\N
204	Голомт open bank client id	\N	\N	openBankClientId	\N	\N	\N	\N
205	Голомт open bank callback url	\N	\N	openBankCallbackUrl	\N	\N	\N	\N
206	Голомт open bank corp id	\N	\N	openBankCorpId	\N	\N	\N	\N
207	Голомт open bank corp account id	\N	\N	openBankCorpAccountId	\N	\N	\N	\N
208	Голомт open bank corp account name	\N	\N	openBankCorpAccountName	\N	\N	\N	\N
300002	Ажилтны үйлчилгээ календарь Процесс	\N	1	hrmCalendarAddProcessId	\N	\N	\N	\N
149	hrmCalendarAddProcessId2	\N	2	hrmCalendarAddProcessId2	\N	2	\N	\N
152	hrmCalendarAddProcessId3	\N	3	hrmCalendarAddProcessId3	\N	\N	\N	\N
153	hrmCalendarAddProcessId5	\N	5	hrmCalendarAddProcessId5	\N	\N	\N	\N
154	hrmCalendarAddProcessId6	\N	6	hrmCalendarAddProcessId6	\N	\N	\N	\N
155	hrmCalendarAddProcessId7	\N	7	hrmCalendarAddProcessId7	\N	\N	\N	\N
156	hrmCalendarAddProcessId8	\N	8	hrmCalendarAddProcessId8	\N	\N	\N	\N
157	hrmCalendarAddProcessId9	\N	9	hrmCalendarAddProcessId9	\N	\N	\N	\N
15800	hrmCalendarAddProcessId10 -Ээлжийн амралт урьдчилж авах	\N	10	hrmCalendarAddProcessId10	\N	\N	\N	\N
158781125126940654	Борлуулалтын ажилтаны тохиргоо ашиглах	boolean	\N	SalespersonSetConfig	\N	\N	\N	Борлуулалтын ажилтаны тохиргоо ашиглах
9992222110	ECM холболтын URL	\N	\N	ECM_URL	\N	\N	\N	\N
9992222111	ECM холболтын USER	\N	\N	ECM_USER	\N	\N	\N	\N
9992222112	ECM холболтын PASSWORD	\N	\N	ECM_PASSWORD	\N	\N	\N	\N
8008	Баримт бичгийн үндсэн эрх шалгах тохиргоо	\N	\N	doc_vw_doc_data	\N	\N	\N	\N
158781125126940657	Дэлгүүрийн ПОС сэжим бүртгэх	\N	\N	POS_PAY_LEFT_SIDE_SHOW_LEAD	\N	\N	\N	\N
45487274	Mobile-с борлуулалт бүртгэх 2 байршилын хоорондох зай салбар	\N	\N	salesCoordinateDistance	\N	\N	\N	\N
10034	Салбарын авлага	\N	\N	DeptArAccount	\N	\N	\N	\N
10035	Салбарын өглөг	\N	\N	DeptApAccount	\N	\N	\N	\N
10036	Дэлгүүртэй бол тэмдэглэ	\N	\N	IsUseShop	\N	\N	\N	\N
99002	CrmAPService	\N	\N	WEB_SERVICE_CRM_AP_SERVICE	\N	\N	\N	\N
10078	Үндсэн хөрөнгийн бүртгэлийг физик	\N	\N	IsUseMetaDataForFA	\N	\N	\N	\N
10079	Үндсэн хөрөнгийн хөдөлгөөнийг салбар хоорондоор бүртгэдэг	\N	\N	IsUseBranchMovementForFA	\N	\N	\N	\N
10080	Үндсэн хөрөнгийн баримт шинээр үүсгэх нь үлдэгдлийн шалгууртай	\N	\N	IsCheckQtyForCreateFAInv	\N	\N	\N	\N
10081	Үндсэн хөрөнгийн баримт засахад үлдэгдэл шалгах	check	\N	IsCheckQtyForEditFAInv	\N	\N	\N	Баримт засахад үндсэн хөрөнгө хасах болох эсэхийг шалгах бол   ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
10082	Үндсэн хөрөнгийн баримт устгахад үлдэгдэл шалгах	check	\N	IsCheckQtyForDelFAInv	\N	\N	\N	Баримт устгахад үндсэн хөрөнгө хасах болох эсэхийг шалгах бол   ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
10083	Үндсэн хөрөнгийн нэгжийн бүртгэлийн дугаар ашиглах	\N	\N	IsUseUnitRegistry	\N	\N	\N	\N
10084	Үндсэн хөрөнгийн бүртгэлтэй холбоотой ажил үүргийн дараалал ашиглах	\N	\N	IsUseWorkFlowForFA	\N	\N	\N	\N
10085	Өмнөх системийн кодын мэдээлэл ашиглах	\N	\N	IsUseOldSystemCodeForFA	\N	\N	\N	\N
10086	Үндсэн хөрөнгийн элэгдэл тооцох арга	\N	\N	AssetDeprMethod	\N	\N	\N	\N
10095	IMAGE_UPLOAD_PATH	\N	\N	IMAGE_UPLOAD_PATH	\N	\N	\N	\N
10096	Ү/Х борлуулснаас үүдсэн алдагдал	\N	\N	LOSS_ON_TANGIBLE_ASSET_SALE	\N	\N	\N	\N
10097	Ү/Х борлуулснаас үүдсэн ашиг	\N	\N	GAIN_ON_TANGIBLE_ASSET_SALE	\N	\N	\N	\N
10077	Дансны баланс /Актив/	\N	\N	DEFAULT_ACCOUNT_BALANCE_TYPE_ID	\N	\N	\N	\N
99001	FinGLService	\N	\N	WEB_SERVICE_FIN_GL_SERVICE	\N	\N	\N	\N
10087	Хөнгөлөлт урамшууллын картын бүртгэл хөтлөх	\N	\N	IsUseBonusCard	\N	\N	\N	\N
10088	Барааны үнийн бодлого ашиглах	\N	\N	IsUsePriceStrategy	\N	\N	\N	\N
10089	Сери цуврал ашиглах	\N	\N	IsUseSerialNumber	\N	\N	\N	\N
10090	Талон устгахад түлхүүр үг асуух 	\N	\N	IsUsePasswordForDelete	\N	\N	\N	\N
10091	Барааны орлогын тоо үнэ бүртгэх	\N	\N	IsUseIncomeQtyAndPrice	\N	\N	\N	\N
10092	Барааны худалдах үнэнд НӨТ шингэсэн эсэх	boolean	\N	IsPricedWithVAT	0	\N	\N	\N
10093	Бренд нэр	\N	\N	BrandName	\N	\N	\N	\N
10094	Журнал бичилт хийгдэх бол тэмдэглэ	\N	\N	IsUseVoucherForSaleConfig	\N	\N	\N	\N
99007	ImInvService	\N	\N	WEB_SERVICE_IM_ITEM_BOOK_SERVICE	\N	\N	\N	\N
10098	Барааны худалдан авах үнийн төрөл (ORG_WIDE, DEPT_WIDE)	\N	\N	PurchasePriceType	\N	\N	\N	\N
10099	Барааны худалдан авах үнийг өөрчилж болдог эсэх	boolean	\N	IsPurchasePriceEditable	1	\N	\N	\N
99008	FinGLTmpService	\N	\N	WEB_SERVICE_FIN_GL_TMP_SERVICE	\N	\N	\N	\N
99009	ImStoreKeeperService	\N	\N	WEB_SERVICE_IM_STORE_KEEPER_SERVICE	\N	\N	\N	\N
99010	ImStoreKeeperKeyService	\N	\N	WEB_SERVICE_IM_STORE_KEEPER_KEY_SERVICE	\N	\N	\N	\N
99011	AccountUserRoleService	\N	\N	WEB_SERVICE_FIN_ACCOUNT_USER_ROLE_SERVICE	\N	\N	\N	\N
99012	ImMovementService	\N	\N	WEB_SERVICE_IM_MOVEMENT_SERVICE	\N	\N	\N	\N
99013	ImWarehouseService	\N	\N	WEB_SERVICE_IM_WAREHOUSE_SERVICE	\N	\N	\N	\N
99014	AccountUserRoleService	\N	\N	WEB_SERVICE_WH_ACC_USER_ROLE_SERVICE	\N	\N	\N	\N
11001	сонгогдон тайлант үе	\N	\N	SELECTED_FISCAL_PERIOD	\N	\N	\N	\N
99016	ImItemInfoService	\N	\N	WEB_SERVICE_IM_ITEM_INFO_SERVICE	\N	\N	\N	\N
99017	ImCalculateCostService	\N	\N	WEB_SERVICE_IM_CALCULATE_COST_SERVICE	\N	\N	\N	\N
99018	WhUserRoleServiceService	\N	\N	WEB_SERVICE_WH_IM_CAT_USER_ROLE_SERVICE	\N	\N	\N	\N
99019	CmSavingBankService	\N	\N	WEB_SERVICE_CM_SAVING_BANK_SERVICE	\N	\N	\N	\N
99021	БМ-ын өртөг бодох арга (FIFO, GENERAL_AVERAGE, NON_STANDART)	\N	\N	COST_METHOD	\N	\N	\N	\N
99023	Хувь хүний орлогын албан татвар данс(ХХОАТ)	accountCode	\N	PersonIncomeTaxAccount	\N	\N	\N	ХХОАТ  үүсэх журнал бичих үед дуудагдах дансыг тохируулж өгху үү
10100	Борлуулалтын хөнгөлөлтийн данс	\N	\N	SALE_DISCOUNTS_ACC_ID	\N	\N	\N	\N
99024	CmService	\N	\N	WEB_SERVICE_CM_SERVICE	\N	\N	\N	\N
12000	Зардлын үзүүлэлт	\N	\N	META_DATA_EXPENSE	\N	\N	\N	\N
11004	0 үед тодорхойлсон өдрөөр элэгдэл бодно. 1 үед сүүлд элэгдүүлсэн огнооноос хойш бодогдоно	\N	\N	ASSET_DEPR_RANGE_MANUAL	\N	\N	\N	\N
99015	ImInvService	\N	\N	WEB_SERVICE_IM_ITEM_BOOK_SERVICE_BY_OBJECT	\N	\N	\N	\N
99020	ImItemUtilService	\N	\N	WEB_SERVICE_IM_ITEM_UTIL_SERVICE	\N	\N	\N	\N
99022	Хувь хүний орлогын албан татвар(ХХОАТ)	\N	\N	PersonIncomeTaxPercent	\N	\N	\N	\N
11006	Демо эсэх	\N	\N	IS_DEMO	\N	\N	\N	\N
13001	Банкнаас татагдсан гүйлгээнд тавигдах харилцагч	\N	\N	SVBM_DEFAULT_CUSTOMER_ID	\N	\N	\N	\N
13002	Төрийн банкны хэрэглэгчийн нэр	\N	\N	SVBM_USER_NAME	\N	\N	\N	\N
13003	Төрийн банкны хэрэглэгчийн нууц үг	\N	\N	SVBM_USER_PASS	\N	\N	\N	\N
10000	Байгууллагын лого	file	\N	ORGANIZATION_LOGO_PATH	\N	100	16716810929729	Компаны логог файлаар оруулна уу
12002	Салбарын үзүүлэлт	\N	\N	META_DATA_DEPARTMENT	\N	\N	\N	\N
14001	Дэлгүүрийн ПОС дээрх авлагын данс	\N	\N	SM_RECEIVABLE_ACCOUNT_ID	\N	\N	\N	\N
12001	Орлогын үзүүлэлт	\N	\N	META_DATA_INCOME_TYPE	\N	\N	\N	\N
99028	profit	\N	\N	PROFIT_ACCOUNT	\N	\N	\N	\N
99029	loss	\N	\N	LOSS_ACCOUNT	\N	\N	\N	\N
99073	Цалин бодолтод ашиглах хэлтэс тасаг	\N	\N	Department11	\N	\N	\N	\N
14003	Дэлгүүрийн ПОС дээрх дуусаагүй үйлдвэрлэлийн данс	\N	\N	SM_WORK_IN_PROCESS_ACCOUNT_ID	\N	\N	\N	\N
14006	Дэлгүүрийн ПОС дээрх түр данс	\N	0	SM_TEMPORARY_ACCOUNT	\N	\N	\N	\N
14005	Дэлгүүрийн ПОС дээрх урьдчилж орсон орлого данс	\N	0	SM_UNEARNED_REVENUE_ACCOUNT	\N	\N	\N	\N
10076	Системийн огнооны формат	\N	\N	DEFAULT_DATE_FORMAT	\N	\N	\N	\N
99004	FaAssetInvService	\N	\N	WEB_SERVICE_FA_ASSET_INV_SERVICE	\N	\N	\N	\N
99005	FaAssetKeyService	\N	\N	WEB_SERVICE_FA_ASSET_KEY_SERVICE	\N	\N	\N	\N
10037	3-р албан тушаалтны нэр.	\N	\N	3thPersonName	\N	\N	\N	\N
10038	Байгууллагын нэр	string	10038	OrganizationName	\N	\N	\N	Хуулийн этгээдийн нэрийг статусын хамт бичнэ үү
10039	Байгууллагын регистрийн дугаар	string	10039	OrganizationID	\N	\N	\N	Байгууллагын регистрийн дугаарыг оруулна уу. 
10040	Агуулахын барааны байршил ашиглахр эсэх. Y бол барааны байршилын мэдээлэл ашиглана. N бол ашиглахгүй.	\N	\N	IsUseWhLocations	\N	\N	\N	\N
10041	Агуулахын байрааны байршилын сегмент ашиглах эсэх. Y бол агуулахын барйшилын сегмент ашиглана. N бол ашиглахгүй	\N	\N	IsUseWhLocationSegment	\N	\N	\N	\N
10042	Барааны үзүүлэлтийн мэдээлэл ашиглах эсэх. Y бол барааны үзүүлэлтийн бүртгэл ашиглана. N бол ашиглахгүй.	\N	\N	IsUseItemAttribute	\N	\N	\N	\N
10043	Журнал бичилт ашиглах эсэх. Y бол дансны бичилт гарна. N бол дан баримт шивэгдэнэ.	\N	\N	IsUseVoucher	\N	\N	\N	\N
10044	Систем дээр бүртгэл хийгдэж эхлэх огноо	date	\N	SystemStartDateForInv	\N	1	\N	Бүртгэл хийгдэж эхлэж буй огноог оруулж өгнө үү
10045	НӨАТ-ийн хувь	\N	\N	VATPercent	\N	\N	\N	\N
10046	НӨАТ-ын өглөг дансны дугаар	accountCode	\N	ApVatAccountID	\N	\N	\N	НӨАТ-н өглөг үүсэх журнал бичих үед дуудагдах дансыг тохируулж өгнө үү
10047	НӨАТ-ын авлага дансны дугаар	accountCode	\N	ArVatAccountID	\N	\N	\N	НӨАТ-н авлага үүсэх журнал бичих үед дуудагдах дансыг тохируулж өгнө үү
10048	1-р албан тушаалтны нэр	string	10044	1stPersonName	\N	\N	\N	Санхгийн яамны батлагдсан маягтад хэвлэгдэх 1-р гарын үсгийн ажилтны нэрийг оруулна уу
10049	1-р албан тушаалын нэр. Энэ нь баримтууд дээр гарах албан тушаалын дэс дараа	string	\N	1stName	\N	\N	\N	Санхгийн яамны батлагдсан маягтад хэвлэгдэх 1-р гарын үсгийн албан тушаалын нэрийг оруулна уу
10050	2-р албан тушаалын нэр. Энэ нь баримтууд дээр гарах албан тушаалын дэс дараа	string	\N	2ndName	\N	\N	\N	Санхгийн яамны батлагдсан маягтад хэвлэгдэх 2-р гарын үсгийн албан тушаалын нэрийг оруулна уу
10051	2-р албан тушаалтны нэр	string	10045	2ndPersonName	\N	\N	\N	Санхгийн яамны батлагдсан маягтад хэвлэгдэх 2-р гарын үсгийн ажилтны нэрийг оруулна уу
10013	Бараа материалын бүртгэлийг баркодоор бүртгэх бол тэмдэглэ	\N	\N	IsUseBarcodeForInv	\N	\N	\N	\N
10014	Бараа материаолын бүртгэлийг сери цувралаар бүртгэх бол тэмдэглэ	\N	\N	IsUseSerialForInv	\N	\N	\N	\N
10015	Мөнгөн хөрөнгийн бүртгэлд үзүүлэлтийн мэдээлэл ашиглах бол тэмдэглэ	\N	\N	IsUseMetaDataForCash	\N	\N	\N	\N
10016	Мөнгөн хөрөнгийн зарлагын баримт нь үлдэгдэл шалгах бол тэмдэглэ	\N	\N	IsCheckEndQtyInCash	\N	\N	\N	\N
10017	Гадаад валютын ханшийг баримтын цонхонд гараар өөрчлөх боломжтой бол тэмдэглэ	\N	\N	IsEditBaseRateInCash	\N	\N	\N	\N
10018	Бэлэн мөнгөний бүртгэлийг дэвсгэртээр хөтлөх бол тэмдэглэ	\N	\N	IsUseCashNote	\N	\N	\N	\N
10019	Мөнгөн хөрөнгийн бүртгэлтэй холбоотой ажил үүргийн дараалал ашиглах бол тэмдэглэ	\N	\N	IsUseWorkFlowForCash	\N	\N	\N	\N
10020	Харилцагчийн лавлах мэдээлэлд үзүүлэлт ашиглах бол тэмдэглэ	\N	\N	IsUseMetaDataForCustomer	\N	\N	\N	\N
10021	Харилцагчийн тооцоонд гэрээ ашиглах бол тэмдэглэ	\N	\N	IsUseContract	\N	\N	\N	\N
10022	Харилцагчийн гадаад валютын тооцооны дүн, үлдэгдлийг гэрээний ханшаар тооцдог бол тэмдэглэ	\N	\N	IsUseContractRate	\N	\N	\N	\N
10023	Харилцагчийн тооцоо үүсгэх ажил үүргийн дараалал ашиглах бол тэмдэглэ	\N	\N	IsUseWorkFlowForCreateApAr	\N	\N	\N	\N
10024	Харилцагчийн тооцоо хаах ажил үүргийн дараалал ашиглах бол тэмдэглэ	\N	\N	IsUseWorkFlowForCloseApAr	\N	\N	\N	\N
10025	Харилцагчийн тооцоо нэгтгэх ажил үүргийн дараалал бүртгэх бол тэмдэглэ	\N	\N	IsUseWorkFlowForMergeApAr	\N	\N	\N	\N
10026	Харилцагчийн тооцоонд үзүүлэлт ашиглах бол тэмдэглэ	\N	\N	IsUseMetaDataForApAr	\N	\N	\N	\N
10027	Өмнөх системийн кодын мэдээлэл ашиглах бол тэмдэглэ	\N	\N	IsUseOldSystemCodeForCustomer	\N	\N	\N	\N
99003	CrmARService	\N	\N	WEB_SERVICE_CRM_AR_SERVICE	\N	\N	\N	\N
10028	Салбарын хаяг	\N	\N	DepartmentAddress	\N	\N	\N	\N
10029	1-р албан тушаал	\N	10040	DeptFirstPosition	\N	\N	\N	\N
10030	1-р а. тушаалтны нэр	\N	\N	DeptFirstPerson	\N	\N	\N	\N
10031	2-р албан тушаал	\N	10041	deptSecondPosition	\N	\N	\N	\N
10032	2-р а. тушаалтны нэр	\N	\N	deptSecondPerson	\N	\N	\N	\N
10033	Цалингийн нягтлан	\N	\N	DeptPayrollAccountant	\N	\N	\N	\N
10052	3-р албан тушаалын нэр. Энэ нь баримтууд дээр гарах албан тушаалын дэс дараа	string	\N	3thName	\N	\N	\N	Санхгийн яамны батлагдсан маягтад хэвлэгдэх 3-р гарын үсгийн албан тушаалын нэрийг оруулна уу
10053	Тайлант үеийн хугацаа. byMonth - Сараар, byQuarter - Улирлаар, byHalfYear - Хагас жилээр, byYear - Жилээр	\N	\N	FinancialPeriodType	\N	\N	\N	\N
10054	Системийн балансын эхний үлдэгдлийн огноо	date	\N	SystemStartDateForBeginBalance	\N	\N	\N	Системийн эхний үлдэгдлийн огноог оруулж өгнө үү
10055	Барааны баримтан дахь үнийг гараар засах эсэх	\N	\N	IsChangePrice	\N	\N	\N	\N
10056	Баримтанд барааны үлдэгдэл шалгах эсэх. Y бол тухайн барааны зарлагын тоо хэмжээ үлдэгдлийн тоо хэмжээнээс их байхгүй. N бол зарлагын тоо хэмжээ үлдэгдлийн тоо хэмжээнээс их бага хамаагүй байж болно.	check	\N	IsCheckItemOutQtyForSave	\N	\N	\N	Барааны зарлага гаргахад үлдэгдэл шалгах бол   ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
10057	Барааны баримт устгахад барааны үлдэгдэл шалгах эсэх. Y  бол тухайн барааны баримтыг устгахад тухайн барааны үлдэгдэл хасах болохоор бол шалгаж устгуулахгүй. N бол шалгуургүйгээр барааны баримт устгана.	check	\N	IsCheckItemForDel	\N	\N	\N	Баримт устгахад барааны хасах болох эсэхийг шалгах бол   ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
10058	Дүнгийн урт	\N	\N	VoucherAmountPrecision	\N	\N	\N	\N
10059	Дүнгийн формат	\N	\N	VoucherAmountDisplayFormat	\N	\N	\N	\N
10060	Ханшийн дүнгийн формат	\N	\N	RateAmountDisplayFormat	\N	\N	\N	\N
10061	НӨАТ төлөгч эсэх	check	\N	IsVATPayer	\N	\N	\N	НӨАТ төлөгч байгууллага бол ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
10062	БМ-ын өртөг тооцох арга. GA бол Ерөнхий дундаж, FIFO бол эхэлж авсанаа эхэлж зарлагадах	\N	\N	CostMethodID	\N	\N	\N	\N
10063	Ашиглалтанд тавьж буй хангамжийн материалын ашиглалтын нормын хоног.	\N	\N	UsageNormCalcdate	\N	\N	\N	\N
10064	Үндсэн мөнгөн тэмдэгтийн код	\N	\N	SystemCurrencyCode	\N	\N	\N	\N
10065	Байгууллагын хаяг	string	\N	OrganizationAddress	\N	\N	\N	Баримт дээр хэвлэгдэх байгууллагын хаягийг оруулна уу
10066	Өмнөх системийн мэдээллийг ашиглах бол тэмдэглэ	\N	\N	isUseOldSystemInfo	\N	1	1556077225255	\N
10067	Борлуулалтын системтэй холбогдох бол тэмдэглэ	\N	\N	IsUseSalemanagement	\N	\N	\N	\N
10068	Харилцагчийн системтэй холбогдох бол тэмдэглэ	\N	\N	IsUseCustomerRelationshipManagement	\N	\N	\N	\N
10069	Агуулах бол тэмдэглэ	\N	\N	IsUseWarehouseSystem	\N	\N	\N	\N
10070	Санхүүгийн системийн баазын нэр	\N	\N	FinancialsystemBaseName	\N	\N	\N	\N
10071	Санхүүгийн системийн сервер	\N	\N	FinancialServerName	\N	\N	\N	\N
10072	Ханшийн зөрүүний бодит ашигийн данс	accountCode	\N	NetForeignExchangeActualGainsAccount	\N	\N	\N	Ханшийн тэгшитгэл хийх үед бодит олз үүсэх журнал бичих үед дуудагдах дансыг тохируулж өгха үү
10073	Ханшийн зөрүүний бодит алдагдлын данс	accountCode	\N	NetForeignExchangeActualLossesAccount	\N	\N	\N	Ханшийн тэгшитгэл хийх үед бодит гарз үүсэх журнал бичих үед дуудагдах дансыг тохируулж өгха үү
10074	Ханшийн зөрүүний бодит бус ашгийн данс	accountCode	\N	NetForeignExchangeNonActualGainsAccount	\N	\N	\N	Ханшийн тэгшитгэл хийх үед бодит бус олз үүсэх журнал бичих үед дуудагдах дансыг тохируулж өгха үү
10075	Ханшийн зөрүүний бодит бус алдагдлын данс	accountCode	\N	NetForeignExchangeNonActualLossesAccount	\N	\N	\N	Ханшийн тэгшитгэл хийх үед бодит бус гарз үүсэх журнал бичих үед дуудагдах дансыг тохируулж өгха үү
99006	CrmApArService	\N	\N	WEB_SERVICE_CRM_APAR_SERVICE	\N	\N	\N	\N
10001	БМ-ын өртөг бодох арга (WEIGHTED_AVERAGE, GENERAL_AVERAGE, NON_STANDART)	\N	\N	ITEM_COST_METHOD	\N	\N	\N	\N
10002	Бараа материалын бүртгэлийг физик шинж чанараар ялгаж бүртгэх бол тэмдэглэ	\N	\N	IsUseMetaDataForItem	\N	\N	\N	\N
10003	Бараа материалын хөдөлгөөнийг салбар хоорондоор бүртгэдэг бол тэмдэглэ	\N	\N	IsUseBranchMovementForItem	\N	\N	\N	\N
10004	Бараа материалын баримт шинээр үүсгэх нь үлдэгдлийн шалгууртай бол тэмдэглэ	\N	\N	IsCheckQtyForCreateInv	\N	\N	\N	\N
10005	Бараа материалын падаан засахад үлдэгдэл шалгах бол тэмдэглэ	\N	\N	IsCheckQtyForEditInv	\N	\N	\N	\N
10006	Бараа материалын падаан устгахад үлдэгдэл шалгах бол тэмдэглэ	\N	\N	IsCheckQtyForDelInv	\N	\N	\N	\N
10007	Бараа материалаар харилцагчтай тооцоо нийлдэг бол тэмдэглэ	\N	\N	IsCustomerItem	\N	\N	\N	\N
10008	Өмнөх системийн кодын мэдээлэл ашиглах бол тэмдэглэ	\N	\N	IsUseOldSystemCodeForItem	\N	\N	\N	\N
10009	Бараа материалын ажил үүргийн дараалал ашиглах бол тэмдэглэ	\N	\N	IsUseWorkFlowForItem	\N	\N	\N	\N
10010	Бараа материалын төсөвт өртгийг тайланд ашиглах бол тэмдэглэ	\N	\N	IsUseItemBudgetByReport	\N	\N	\N	\N
10011	Бараа материалын зарлагын баримтанд худалдах үнийг гараар оруулах бол тэмдэглэ	\N	\N	IsChangePriceOutInv	\N	\N	\N	\N
10012	Бараа материалын хөдөлгөөний цонхонд үнийг гараар оруулах бол	\N	\N	IsChangePriceMovement	\N	\N	\N	\N
20001	Эд хариуцагч /Бараа материал/ - check_book дээр ашиглана	\N	\N	RP_ITEM_OWNER	\N	1	1553855535011	\N
80001	Баазын архивыг хадгалах газар	\N	\N	SYS_DB_BACKUP_PATH	\N	\N	\N	\N
80002	Баазын архивыг авахдаа ssh-р хандаж авах эсэх. 1:тийм	\N	\N	SYS_DB_BACKUP_USE_SSH	\N	\N	\N	\N
80003	Баазын архивыг авах ssh-н холболт [username]/[password]@[host]:[port]	\N	\N	SYS_DB_BACKUP_SSH_CONN	\N	\N	\N	\N
80004	Баазын архивыг авах нууц үг	\N	\N	SYS_DB_BACKUP_PASSWORD	\N	\N	\N	\N
80005	Баазын зам	\N	\N	SYS_DB_BACKUP_ORACLE_HOME	\N	\N	\N	\N
12003	НӨАТ-н зардалын үзүүлэлт	\N	\N	META_VALUE_VAT_EXPENSE	\N	\N	\N	\N
10101	БАРААНЫ ҮЛДЭГДЛИЙГ ШАЛГАЖ ЗАРЛАГАДАХ (ОДОО АШИГЛАЖ БАЙГАА)	\N	\N	CHECK_ITEM_BALANCE	\N	\N	\N	\N
99051	Системийн өссөн дүнгийн огноо	\N	\N	SystemDateForAccrual	\N	\N	\N	\N
99052	Байгууллагын утас	string	\N	OrganizationPhone	\N	\N	\N	Баримт дээр хэвлэгдэх байгууллагын утасны дугаарыг оруулна уу
99053	Байгууллагын факс	string	\N	OrganizationFax	\N	\N	\N	Баримт дээр хэвлэгдэх байгууллагын факсын дугаарыг оруулна уу
99054	Байгууллагын банкны мэдээлэл	string	\N	OrganizationBankInfo	\N	\N	\N	Тооцоо нийлсэн акт дээр хэвлэгдэх банкны мэдээллийг оруулна уу
99040	Гүйлгээний утга	\N	\N	MSG_INFO_CONFIG	\N	\N	\N	\N
15001	Борлуулалтын авлагын данс	\N	\N	SD_RECEIVABLE_ACCOUNT_ID	\N	\N	\N	\N
99043	Нэвтэрсэн хэрэглэгчийн нэр тайлан-д хэвлэх	\N	\N	PRINT_LOGIN_NAME	\N	\N	\N	\N
99044	МХ-н ханшийн тэгшитгэл ашиг - Мөнгөн гүйлгээний тайлангийн үзүүлэлт	\N	\N	CmRevalCashFlowProfit	\N	\N	\N	\N
99041	Орлогын төрөл	\N	\N	META_DATA_INCOME	\N	\N	\N	\N
99042	Зарлагын төрөл	\N	\N	META_DATA_OUTCOME	\N	\N	\N	\N
99045	МХ-н ханшийн тэгшитгэл алдагдал - Мөнгөн гүйлгээний тайлангийн үзүүлэлт	\N	\N	CmRevalCashFlowLost	\N	\N	\N	\N
10102	БАРААНЫ ҮНИЙГ ЛАВЛАХААС ТАТАЖ ХАРУУЛАХ	\N	\N	GET_ITEM_PRICE_FROM_INFO	\N	\N	\N	\N
99050	UserLanguage	\N	\N	UserLanguage	\N	\N	\N	\N
10103	БАРААНЫ ӨРТГИЙГ ДАНС БҮРЭЭР ТООЦООЛОХ	\N	\N	ITEM_COST_BY_ACCOUNT	\N	\N	\N	\N
14002	Дэлгүүрийн системд хамаатай харилцагчдын фолдерын ID	\N	\N	SM_DEFAULT_CUSTOMER_FOLDER	\N	\N	\N	\N
11007	Баримтын дугаар гараар засагдах боломжтой эсэх	\N	\N	MANUAL_BOOK_NUMBER	\N	\N	\N	\N
30000	Ажлын хугацаа хэтрэлтийг системийн цагаас тооцохгүй төлвүүд	\N	\N	TASK_TIMEOUT_NOT_COUNT_FROM_SYSDATE_STATUS_IDS	\N	\N	\N	\N
14004	Дэлгүүрийн ПОС дээрх хөнгөлөлтийн данс	\N	\N	SM_DISCOUNT_ACCOUNT_ID	\N	\N	\N	\N
99059	Жирэмсний амралтийн төлөв	\N	\N	CONFIG_GESTATION_STATUS_ID	\N	\N	\N	\N
16002	Notification type info	\N	\N	NOTIFICAITON_TYPE_INFO	\N	\N	\N	\N
16001	Notification type success	\N	\N	NOTIFICAITON_TYPE_SUCCESS	\N	\N	\N	\N
16003	Notification type warning	\N	\N	NOTIFICAITON_TYPE_WARNING	\N	\N	\N	\N
16004	Notification type error	\N	\N	NOTIFICAITON_TYPE_ERROR	\N	\N	\N	\N
99055	ERP цэсийг үүсгэх фолдер	\N	\N	ErpRootFolderId	\N	\N	\N	\N
99056	Дансны үзүүлэлт (metaDataId)	\N	\N	ACCOUNT_META_DATA_ID	\N	\N	\N	\N
99060	Email domains	string	\N	EmailDomains	\N	\N	\N	\N
99061	Төхөөрөмжөөс цагийн мэдээлэл татах	string	\N	GET_DEVICE_ATTENDANCE_IP	\N	\N	\N	\N
99063	Захиргааны арга хэмжээний нөхцөл	\N	\N	HrmAdminstepInvDtl	\N	\N	\N	\N
80006	Баазын сайжруулалт хийх эсэх	boolean	\N	SYS_DB_UPDATE	0	\N	\N	\N
99066	Дотоодын валютын кодыг бүртгэнэ	long	\N	LOCAL_CURRENCY	\N	\N	\N	\N
99067	БМ-ын өртгийн хамрах хүрээ (ORG_WIDE, CC_WIDE, ACC_WIDE)	STRING	\N	ITEM_COST_SCOPE	\N	\N	\N	\N
80007	Дансанд тохируулсан хэлтэс тасгаар тайлан гаргана.	\N	\N	SET_ACCOUNT_DEPARTMENT	1	\N	\N	\N
9999	Токений үнэ	\N	\N	TokenPrice	44000	\N	\N	\N
1461717571403	Ldap, domain ашиглах	\N	\N	IS_USE_LDAP	\N	\N	\N	\N
1462339412232	3-р албан тушаалтны нэр	string	10046	3rdPersonName	\N	\N	\N	Санхгийн яамны батлагдсан маягтад хэвлэгдэх 3-р гарын үсгийн ажилтны нэрийг оруулна уу
1462339412233	4-р албан тушаалтны нэр	string	10047	4thPersonName	\N	\N	\N	Санхгийн яамны батлагдсан маягтад хэвлэгдэх 4-р гарын үсгийн ажилтны нэрийг оруулна уу
1462339412234	3-р албан тушаал	\N	10042	DeptThirdPosition	\N	\N	\N	\N
1462339412235	4-р албан тушаал	\N	10043	DeptFourthPosition	\N	\N	\N	\N
1234567891	CUSTOMER_ERP	\N	\N	CUSTOMER_ERP	1	\N	\N	\N
10105	Аймаг нийслэл код	number	\N	OrganizationAddressCityCode	\N	\N	\N	Тайланд харуулах аймаг нийслэлийн кодоо оруулна уу
1472543466383	Email	\N	\N	ConfigEmail	\N	\N	\N	\N
99034	CM_AUTO_CASH_FLOW_PROFIT	\N	\N	CM_AUTO_CASH_FLOW_PROFIT	\N	\N	\N	\N
99035	CM_AUTO_ECONOMIC_PROFIT	\N	\N	CM_AUTO_ECONOMIC_PROFIT	\N	\N	\N	\N
99036	CM_AUTO_CASH_FLOW_LOSS	\N	\N	CM_AUTO_CASH_FLOW_LOSS	\N	\N	\N	\N
99037	CM_AUTO_ECONOMIC_LOSS	\N	\N	CM_AUTO_ECONOMIC_LOSS	\N	\N	\N	\N
99065	Page Id	string	\N	PAGE_ID	\N	\N	\N	\N
99064	2 сарын хугацаатай Facebook Page - н Token (2 сар тутамд солино)	string	\N	TOKEN	\N	\N	\N	\N
10200	Google appKey	string	\N	GOOGLE_APPKEY	\N	\N	\N	\N
99068	Дансны эхний үлдэгдэлийг баталгаажуулсан эсэх	\N	\N	IS_CONFIRM_BEGIN_BALANCE	\N	\N	\N	\N
99069	Гүйлгээг шалгуургүй хадгалах эсэх	\N	\N	CREATE_SIMPLE_BOOK	\N	\N	\N	\N
99070	Бодолтын дугаар	\N	\N	PRL_CALC_DV	\N	\N	\N	\N
99072	Өртөг бодох ангиллын бүлэг	\N	\N	IM_COST_CLASS_GROUP	\N	\N	\N	\N
99071	Өртөг бодох хугацаа	\N	\N	IM_COST_TIME_TYPE	\N	\N	\N	\N
1234567890	WINDOW_TYPE	\N	\N	WINDOW_TYPE	1	\N	\N	\N
99075	Журнал устгахад холбогдсон бүх баримт устана	\N	\N	GL_DELETE_ALL_INVOICE	\N	\N	\N	\N
1472543466414	mail.golomt.address	\N	\N	mail.golomt.address	\N	\N	\N	\N
1472543466415	mail.golomt.user	\N	\N	mail.golomt.user	\N	\N	\N	\N
1472543466416	mail.golomt.password	\N	\N	mail.golomt.password	\N	\N	\N	\N
1472543466417	mail.golomt.port	\N	\N	mail.golomt.port	\N	\N	\N	\N
1472543466412	Anket process id	\N	\N	anketFormProcessId	\N	\N	\N	\N
10104	Аймаг нийслэл	string	\N	OrganizationAddressCityName	\N	\N	\N	Тайланд харуулах аймаг нийслэлийн нэрээ оруулна уу
1234567892	Импортын тооцоо	\N	\N	IM_ITEM_BOOK_DV	2	\N	\N	\N
1472543466413	mail.golomt.host	\N	\N	mail.golomt.host	\N	\N	\N	\N
1472543466418	mail.interactive.port	\N	\N	mail.interactive.port	\N	\N	\N	\N
1472543466419	mail.interactive.password	\N	\N	mail.interactive.password	\N	\N	\N	\N
1014	META_DATAMART_CONNECTION	\N	\N	META_DATAMART_CONNECTION	\N	\N	\N	\N
1467274989090	Нотариат	\N	\N	100	\N	\N	\N	\N
1472543466420	mail.interactive.user	\N	\N	mail.interactive.user	\N	\N	\N	\N
10106	Сум дүүрэг	string	\N	OrganizationAddressDistrictName	\N	\N	\N	Тайланд харуулах сум дүүргийн кодоо оруулна уу
10107	Сум дүүргийн код	number	\N	OrganizationAddressDistrictCode	\N	\N	\N	Тайланд харуулах сум дүүргийн нэрээ оруулна уу
10108	Өмч эзэмшигчийн дугаар	\N	\N	OwnerNumber	\N	\N	\N	\N
1472543466421	mail.interactive.address	\N	\N	mail.interactive.address	\N	\N	\N	\N
1472543466422	mail.interactive.host	\N	\N	mail.interactive.host	\N	\N	\N	\N
99032	Мөнгөн хөрөнгийн ханшийн тэгшитгэл: кредит: ҮҮА-ны бусад мөнгөн зарлага	accountCode	\N	CM_REVAL_CASH_FLOW_LOSS	\N	\N	\N	Мөнгөн хөрөнгийн ханшийн тэгшитгэл хийх үеийн олз дансыг тохируулна уу
99033	Мөнгөн хөрөнгийн ханшийн тэгшитгэл: кредит: Бусад	\N	\N	CM_REVAL_ECONOMIC_LOSS	\N	\N	\N	\N
1472543466423	default_email_config_prefix	\N	\N	email_config_default	\N	\N	\N	\N
101	Цалингийн тайлан группын код	\N	\N	PRL_REPORT_CODE	\N	\N	\N	\N
106	Дотоод тайлан - ИНЕГ	\N	\N	PRL_REPORTS_I	\N	\N	\N	\N
99	Ажлын өдөр тооцох function-д амралтын өдөр тооцох эсэх	\N	\N	IS_IGNORE_WEEKEND	\N	\N	\N	\N
1472543466389	Цалинг бодолт дээр нэг эсвэл олон employeeKey харуулах эсэх	\N	\N	PRL_MULTIPLE_KEYS_CONF	0	\N	\N	\N
7777	Session time	\N	\N	SESSION_TIME	\N	\N	\N	\N
1472116142572	Цалингийн түр данс	\N	\N	PayrollTempAccountTDB	\N	\N	\N	\N
1472543466384	Кассын зарлага үед үлдэгдэл шалгах эсэх	check	\N	CHECK_CASH_BALANCE_OUTCOME	\N	\N	\N	Кассын зарлага хийх үед үлдэгдэл шалгаж байх бол ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
1472543466385	Харилцахын зарлага үед үлдэгдэл шалгах эсэх	check	\N	CHECK_BANK_BALANCE_OUTCOME	\N	\N	\N	Харилцахын зарлага хийх үед үлдэгдэл шалгаж байх бол ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
1472543466386	Ecm content move to folder dataview id	\N	\N	ECM_CONTENT_FOLDER_DV	\N	\N	\N	\N
1472543466387	Process excel загвар	\N	\N	ECM_CONTENT_TYPE_EXCEL	\N	\N	\N	\N
1472543466388	Um object dv id	\N	\N	UM_OBJECT_DV_ID	\N	\N	\N	\N
105	Дотоод тайлан - Голомт	\N	\N	PRL_REPORTS_GOLOMT	\N	\N	\N	\N
1472543466390	Clix vehicle parameter	\N	\N	clix_customer_id	\N	\N	\N	\N
100	Veritech ашиглаж байгаа айлын нэр. Тухайн айлын бааз дээр өөр өөрийн нэрээр байна.	string	\N	veritech_customer_name	internal_dev	\N	\N	\N
1472543466391	BankTDBM	\N	\N	BankTDBM	\N	\N	16139112215352	\N
100001	Харилцагчийн бусад системийн код	\N	\N	CRM_EXTERNAL_CUSTOMER_MAP	\N	\N	\N	\N
103	НД тайлан группын код	\N	\N	SOCIAL_INSURANCE_REPORT	\N	\N	\N	\N
95000	Цалингийн бодогдсон дүнгүүдийг нууцлалтай хадгалах эсэх (PRL_SALARY_SHEET)	\N	\N	PRL_ENCRYPT_FIELD	\N	\N	\N	\N
102	Салбар нэгжийн код буцаах 1 бол DEPARTMENT_CODE, 2 бол SOL_ID	\N	\N	DEPARTMENT_CODE_VALUE	\N	\N	\N	\N
104	ХХОАТ ТАЙЛАН ГРУПП	\N	\N	TAX_REPORT	\N	\N	\N	\N
1472543466392	Төсвийн байгууллага эсэх	\N	\N	isBudgetary	\N	\N	\N	\N
1472543466393	Банкинд хэрэглэх	\N	\N	isUseBank	\N	1	1556077225255	\N
1472543466394	Кассын баримтын дугаарлалтыг гараас оруулах боломжтой эсэх	\N	\N	isEnableCashBookNumber	\N	\N	\N	\N
1472543466395	Баримтын дугаар идэвхитэй эсэх	\N	\N	BOOK_NUMBER_EDIT	\N	\N	\N	\N
1472543466396	дугаарлалтын 2-р загвар	\N	\N	IS_SECOND_NUMBER	\N	\N	\N	\N
30001	MSSQL бааз ашиглах эсэх	\N	\N	IS_MSSQL	\N	\N	\N	\N
70000	Байгууллагын нэр нөхцөлгүй	string	\N	OrganizationTitle	Veritech LLC	\N	\N	\N
20005	ҮХ ТОХИРГОО ЯЛГААТАЙ АЖИЛЛАХ	\N	\N	FA_DEPR_GL	\N	\N	\N	\N
1472543466397	JIRA_REST_API_URL	\N	\N	JIRA_REST_API_URL	\N	\N	\N	\N
1472543466398	JIRA_USERNAME	\N	\N	JIRA_USERNAME	\N	\N	\N	\N
1472543466399	JIRA_PASSWORD	\N	\N	JIRA_PASSWORD	\N	\N	\N	\N
1472543466400	ldap_host	\N	\N	ldap_host	\N	\N	\N	\N
1472543466401	ldap_port	\N	\N	ldap_port	\N	\N	\N	\N
1472543466402	ldap_port_ssl	\N	\N	ldap_port_ssl	\N	\N	\N	\N
1472543466403	ldap_dc1	\N	\N	ldap_dc1	\N	\N	\N	\N
1472543466404	ldap_dc2	\N	\N	ldap_dc2	\N	\N	\N	\N
1472543466405	ldap_domain	\N	\N	ldap_domain	\N	\N	\N	\N
1472543466406	ldap_dn	\N	\N	ldap_dn	\N	\N	\N	\N
1472543466407	ldap_admin_user	\N	\N	ldap_admin_user	\N	\N	\N	\N
1472543466408	ldap_admin_pass	\N	\N	ldap_admin_pass	\N	\N	\N	\N
1472543466409	Талоны дүн	\N	\N	talonAmount	3000	\N	\N	\N
1472543466410	Шатахуун дээр хэрэглэх нярав	\N	\N	fuelAccountant	\N	\N	\N	\N
200000	Гүйлгээ илгээх системийн код	\N	\N	XFER_SYSTEM	\N	\N	\N	\N
1555	Өөр салбарт захиалга өгөх эсэх	\N	\N	IS_DIFFERENT_DEPARTMENT_ORDER	\N	\N	\N	\N
1472543466411	Шатахуун дээр хэрэглэх харилцагч	\N	\N	fuelSupplier	\N	\N	\N	\N
107	Card-Menu-group	\N	\N	PRL_CARD_MENU_GROUP	\N	\N	\N	\N
1462339415234	Санхүүгийн тайлан	\N	\N	FIN_REPORT	\N	\N	\N	\N
7	login frame	\N	\N	loginFrameImage	\N	\N	\N	\N
1472543466424	golomt rate service url	\N	\N	golomt_rate_service_uri	\N	\N	\N	\N
1462339415235	Анкет бүрдүүлэлт ашиглах эсэх	\N	\N	EMP_INFO_KEY	\N	\N	\N	\N
99030	Мөнгөн хөрөнгийн ханшийн тэгшитгэл: дебит: ҮҮА-ны бусад мөнгөн орлого	accountCode	\N	CM_REVAL_CASH_FLOW_PROFIT	\N	\N	\N	Мөнгөн хөрөнгийн ханшийн тэгшитгэл хийх үеийн гарз дансыг тохируулна уу
12005	importIODeviceWarehouseLog	\N	\N	IO_DEVICE_LOG_URL	\N	\N	\N	\N
990002	Мөнгөн хөрөнгийн тайлан тохиргоо 	\N	\N	FIN_REPORT_CM	\N	\N	\N	\N
9000221	Авлагын тайлангын тохиргоо 	\N	\N	FIN_REPORT_AR	\N	\N	\N	\N
12006	Pda Tag Log	\N	\N	PDA_TAG_LOG	\N	\N	\N	\N
9000222	Өглөгийн тайлангийн тохиргоо 	\N	\N	FIN_REPORT_AP	\N	\N	\N	\N
20066	ldap_login	\N	\N	ldap_login	2	\N	\N	\N
140021	CORE-руу илгээгдэхгүй баримтын төрөл	\N	\N	notSentToCore	17, 21, 72, 19, 15	\N	\N	\N
20170716001	IM_ITEM_BOOK_DTL HIDESHOWCONFIG	\N	\N	IM_DTL	\N	\N	\N	\N
40000	URL Authenticate ашиглах эсэх	\N	\N	IS_URL_AUTHENTICATE	\N	\N	\N	\N
140022	CORE-руу илгээгдэх төлвүүд	\N	\N	wfmStatusSentToCore	\N	\N	\N	\N
12007	Pda Tag Log Finish	\N	\N	PDA_TAG_LOG_FINISH	\N	\N	\N	\N
108	Төлөвлөгөө шалгах төсвийн код	\N	\N	checkVaucherBudgetCode	FEC_001	\N	\N	\N
54764298	Хэрэглэгчийн эрхийн тохиргоо шалгах эсэх	\N	\N	RUN_CHECK_USER_PERMISSION	\N	\N	\N	\N
40001	GL туслахтай дансны баримтыг шалгах	\N	\N	IS_CHECK_GL_EMPTY_BOOK	\N	\N	\N	\N
40002	GL гүйлгээний утгыг масклах эсэх	\N	\N	IS_GL_DESC_MASK	\N	\N	\N	\N
147254346632	BankSDBM	\N	\N	BankSDBM	\N	\N	\N	\N
1472543466425	check_gl_book_date_forward	\N	\N	check_gl_book_date_forward	\N	\N	\N	\N
1472543466426	golomt rate service url 2	\N	\N	golomt_rate_service_uri_2	\N	\N	\N	\N
1472543466427	цагийн мэдээлэл авто татах	\N	\N	AUTO_IMPORT_TIME_ATTENDANCE	\N	\N	\N	\N
1472543466428	check_license	\N	\N	check_license	\N	\N	\N	\N
200001	Гүйлгээ илгээх системийн одоогийн огноо	\N	\N	XFER_SYSTEM_DATE	\N	\N	\N	\N
1472543466429	БМ баримтын дугаарлалт 	\N	\N	ImBookNumber	\N	\N	\N	\N
1001	PARTNUMBER HIDE SHOW	\N	\N	PARTNUMBER	\N	\N	\N	\N
200002	Шинэчлэлтийн сануулга өгсний дараа  процесс ажиллуулах эсэх	\N	\N	IS_RUN_PROCESS_AFTER_SHIFT_F1	\N	\N	\N	\N
200003	Logout хийхэд процесс ажиллуулах эсэх	\N	\N	IS_RUN_PROCESS_BEFORE_LOGOUT	\N	\N	\N	\N
96	НДШ төлдөг эсэх	\N	\N	hrm_isPayedNd	\N	\N	\N	\N
1472543466430	Login background image 1	image	\N	login_background_image1	\N	\N	\N	\N
98	Өөрийн компаний эсэх	\N	\N	hrm_isOwnCompany	\N	\N	\N	\N
95	Төрийн байгууллага эсэх	\N	\N	hrm_isGovernment	\N	\N	\N	\N
14007	Дэлгүүрээс санхүүрүү илгээхэд зөвхөн кассирын авлага үүсгэх эсэх	\N	\N	SM_TO_FIN_CASHIER_AR_ONLY	\N	\N	\N	\N
97	Салбар байгууллага эсэх	\N	\N	hrm_isAffiliate	\N	\N	\N	\N
40004	Санхүүгийн тайлангууд дээр эрх шалгах эсэх	\N	\N	IS_CHECK_REPORT_PERMISSION	\N	\N	\N	\N
1472543466431	Шинэ цаг бүртгэлийн систем ашиглах эсэх TMS	\N	\N	use_new_tms	\N	\N	\N	\N
99076	Тооцооны ханшийн тэгшитгэл ханш бодогдох эсэх	\N	\N	FIN_REVAL_DEFAULT	\N	\N	\N	\N
700002	Хаан банкны token авах api	\N	\N	authTokenKhaan	\N	\N	\N	\N
4589	Худалдах үнийн тохиргоо 	\N	\N	WHSALEPRICEKEY	\N	\N	\N	\N
1539153588389	Ажлаас гарсан болон дикреттэйй хүмүүс ийг ажилтны төлөвлөгөө нь дээр харуулах эсэх	\N	\N	tmsPlanPreview	\N	\N	\N	\N
700001	Хаан банкны гүйлгээний хуулга татах api	\N	\N	merchantStatementAccountKhaan	\N	\N	\N	\N
1472543999432	main_logo_path	image	\N	main_logo_path	\N	\N	\N	\N
21552546548435	MobileBackgroundcolor	\N	\N	MobileBackgroundcolor	\N	\N	\N	\N
21552546548436	Login background	\N	\N	MobileLoginBackground	\N	\N	\N	\N
1010	Журнал засах үед дансан дээрх төрлийн шүүлтийг хасах	\N	\N	GET_GL_IGNORE_ACCOUNT_TYPE_FILTER	\N	\N	\N	\N
8897	Төлөвлөсөн цаг	\N	\N	tmsPlanTimeDefault	\N	\N	\N	\N
1472543466432	PHANTOM_JS_PATH	\N	\N	PHANTOM_JS_PATH	\N	\N	\N	\N
667	GL огноогоор бичилтийн тохиргоо	\N	\N	FIN_GLINSERT_DATE	\N	\N	\N	\N
94	Ерөнхий журналын тайлангийн жагсаалтын код	\N	\N	FIN_REPORT_GL	\N	\N	\N	\N
324523745	Цалингийн түр данс - Голомт банк	\N	\N	PayrollTempAccountGolomt	\N	\N	\N	\N
576387	Цалингийн түр данс-Хаан банк	\N	\N	PayrollTempAccountKhaan	\N	\N	\N	\N
80	Menu tracking  user	\N	\N	MENU_TRACKING_USER	\N	\N	\N	\N
111	GOOGLE_APIKEY	\N	\N	GOOGLE_APIKEY	\N	\N	\N	\N
1472543466433	IMAP_CONFIG_FOR_WORKFLOW	\N	\N	IMAP_CONFIG_FOR_WORKFLOW	\N	\N	\N	\N
777	POS_PRINT_IP_ADDRESS	\N	\N	POS_PRINT_IP_ADDRESS	\N	\N	\N	\N
1472543466434	ҮХ элэгдлийн тохиргоо ашиглах эсэх	\N	\N	fa_asset_depr_use_config	\N	1	1553855623757	\N
1472543466435	fa_asset_depr_method_query_0	\N	\N	fa_asset_depr_method_query_0	\N	1	1553855623757	\N
1472543466436	fa_asset_depr_method_query_1	\N	\N	fa_asset_depr_method_query_1	\N	1	1553855623757	\N
1472543466437	fa_asset_depr_method_query_2	\N	\N	fa_asset_depr_method_query_2	\N	1	1553855623757	\N
200	POS_INVOICE_ITEM_TO_EQUIVALENT_ITEM	\N	\N	POS_INVOICE_ITEM_TO_EQUIVALENT_ITEM	\N	\N	\N	\N
778	CLOSURE_TRANSACTION_STATUS	\N	\N	CLOSURE_TRANSACTION_STATUS	\N	\N	\N	\N
1560235368685	Авлагын хэвлэх тайлангийн жагсаалтын тохиргоо	\N	\N	FIN_REPORT_AR_LIST	\N	1	1553855624021	\N
99077	GL book number run-time үүсгэх эсэх	\N	\N	IS_RUNTIME_GL_BOOK_NUMBER	\N	\N	\N	\N
779	Барааны захиалга өглөө хийх	\N	\N	AUTO_CREATE_ITEM_ORDER	\N	\N	\N	\N
780	Sale price use EQUIVALENT ITEM price	\N	\N	IS_USE_EQUIVALENT_ITEM_PRICE	\N	\N	\N	\N
781	is_use_new_item_cost_method	\N	\N	is_use_new_item_cost_method	\N	1	1553855623757	\N
1111	Системийн файл хадгалах үндсэн зам /Байгууллагын лого гэх мэт/	\N	\N	systemUploadPath	/home/www/html/devnew/storage/uploads/	\N	\N	\N
999073	Үлдэгдэл шалгах эсэх	\N	\N	CHECK_UPDATE_ITEM_BOOK	\N	1	1553855535011	\N
668	Цаг бүртгэлын цаг хадгалах тохиргоо утга (value : hour, minut defaultValue = minut)	\N	\N	TMS_PAYROLL_TIME_TYPE	\N	\N	\N	\N
889	Бараа материалын борлуулалт болон худалдан авалтын буцаалтыг анхы өртгөөр хөтлөх	\N	\N	IS_USE_SOURCE_COST_ITEM_REFUND	\N	\N	\N	\N
890	Ерөнхий журналын гүйлгээний Log -г бүх гүйлгээнд хадгалах	\N	\N	IS_SAVE_LOG_ALL_GENERAL_LEDGER	\N	\N	\N	\N
109	Төвсийн гүйцэтгэлд татагдахгүй төрөл	\N	\N	NOT_BUDGET_PERFORMECE_BOOK_TYPE	\N	\N	\N	\N
8906	Schedule ажилласан сүүлийн огноо	\N	\N	LAST_EXECUTE_SCHEDULE_DATE	\N	\N	\N	\N
24004	Авлага өглөгийн баримт ЕЖ-с хамааралгүй эсэх	\N	\N	IS_INDIVIDUAL_ARAP	\N	\N	\N	\N
6666	Хэлтэсийн төрөл хэсэг бол цалин дээр дуудахгүй	\N	\N	PRL_DEPARTMENT_CONFIG	\N	\N	\N	\N
1537976807018	Parent хэлтэс сонгогдсон эсэх	\N	\N	tmsParentFilter	\N	\N	\N	\N
2000100004	БМ баримтын дугаар өөрчлөх эсэх	\N	\N	EDITIMBOOKNUMBER	\N	1	1553855535011	\N
2000100005	БМ баримтын дугаар автоматаар үүсгэх	\N	\N	CREATEIMBOOKNUMBER	\N	1	1553855535011	\N
1558498398680	Үүссэн огноогоор салгах	check	\N	ISUSEPAYABLEBOOKDATE	\N	1	1553855624049	Өглөгийн бүртгэлийг үүссэн огноо  бүрээр салган, хааж, үүссэн огноогоор насжилтын тайлан авах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
2000100007	Баркод ашиглах эсэх	check	\N	ISUSEBARCODE	\N	1	1553855535011	Баркод ашиглах бол   ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
90	Олон дт, кт харьцсан гүйлгээ дэмжих эсэх	\N	\N	IS_MULTI_DEBIT_CREDIT	\N	\N	\N	\N
1561450133648	БМ борлуулалт дээр үнийг засах боломжгүй болгох	\N	\N	ISUSEIMSALEDISABLEPRICE	\N	1	1553855535011	\N
424003	Дотоод хөдөлгөөнийг журналд холбох эсэх	\N	\N	ISUSEIMINTMOVECONGL	\N	1	1553855535011	\N
15877112512693999	Пос төлбөр төлөх үед байгууллагын ТТД оруулахад нэмэлт мэдээллийн харилцагч дүүрдэг болгох	\N	\N	isPosFillCustomerByTTD	\N	\N	\N	Пос төлбөр төлөх үед байгууллагын ТТД оруулахад нэмэлт мэдээллийн харилцагч дүүрдэг болгох
15877112512694085	ECOMMERCE_GANTT_CHART	\N	\N	ECOMMERCE_GANTT_CHART	\N	999	\N	\N
1602126117086	Дансны кодны маск. 9-н тоогоор нэг тоон цифрийг илэрхийлнэ. /999-999/	\N	\N	CONFIG_ACCOUNT_CODE_MASK	\N	1	\N	\N
1602126118914	Тооцооны ханшийн тэгшитгэлийн шууд бодолтыг болиулах эсэх	\N	\N	CONFIG_GL_BILLRATE_IGNORE_CALC	\N	1	\N	\N
1602126119181	ref_bank таблийн Хаан банкны ID /Одоо ашиглаж байгаа нь Банкнаас хуулга татахад/	\N	\N	CONFIG_BANK_ID_KHAN	\N	1	\N	\N
151515	Анкетын хэлний үнэлгээний тайлбар	\N	\N	AnketEvalutionConfig	\N	\N	\N	\N
15877112512695000	Хэрэгслийн цаас хэвлэх баримт.	\N	\N	CONFIG_POS_ADDITIONAL_ITEM_PRINT	\N	\N	\N	\N
1472543466489	anket	\N	\N	anketBriefMessage	\N	\N	\N	\N
1472543466492	anket	\N	\N	anketInstaLink	\N	\N	\N	\N
15000	hideTab	\N	\N	hideJobTab	\N	\N	\N	\N
158	Шинээр ажилд орж байгаа ажилтны төлөвлөгөө 3 сараар оруулах	\N	\N	hrmEmployeeLongPlan	\N	\N	\N	\N
15877112512695016	Кассираар бүртгэлгүй ажилтнууд	string	\N	EMPLOYEES_NOT_CASHIER	\N	\N	\N	\N
15877112512695017	Ажилтны лавлах дээр төрөл олноор сонгох эсэх	boolean	\N	IS_INSERT_MULTI_SDM_SALESPERSON_TYPE	1	8	\N	\N
15877112512693459	Бичсэн талон цоожлох эсэх	boolean	\N	CONFIG_POS_TALONLIST_PROTECT	\N	\N	\N	\N
100005	CONFIG_STATEMENT_DOC_EXP	\N	\N	CONFIG_STATEMENT_DOC_EXP	\N	\N	\N	\N
16147351507171	Сангийн яамны API холбогдох тохиргоо	\N	\N	MOF_API	\N	1	\N	\N
16152960262251	ISUSEIMTRANSACTIONTYPE	\N	\N	ISUSEIMTRANSACTIONTYPE	\N	1	1553855535011	\N
16152960264731	Зардлын төв сонгох эсэх	\N	\N	ISUSEIMEXPENSECENTERID	\N	1	1553855535011	\N
16152960327181	НӨАТ ашиглахгүй эсэх	\N	\N	ISNOTUSEVAT	\N	1	1553855535011	\N
16154839518941	key Нэгж өртгөөр салах эсэх	\N	\N	ISUSEUNITCOST	\N	1	\N	\N
90000	isHideKeyUpdateSalary	\N	\N	isHideKeyUpdateSalary	\N	\N	\N	\N
90001	isHideDocumentationSalary	\N	\N	isHideSettingsSalary	\N	\N	\N	\N
15877112512695019	Процесийн хойно дуудах зураг	string	\N	mobileProcessHeaderImage	\N	\N	\N	\N
99998	Баримт хэвлэх эрх шалгах	\N	\N	reportTemplatePermission	\N	\N	\N	\N
50	XYP_TOKEN_FILE_URL	\N	\N	XYP_TOKEN_FILE_URL	\N	\N	\N	\N
15877112512695002	Бүх буцаалт өмнөх өдрийн буцаалтын зарчмаар үүсэх эсэх.	boolean	\N	CONFIG_POS_IS_ONLY_USE_PREV_DAY_RETURN_PROCESS	\N	999	\N	\N
51	UPLOADPATH	\N	\N	UPLOADPATH	\N	\N	\N	\N
15877112512694086	Sky улирлын дугаар	\N	\N	SEASON_NUMBER	\N	\N	\N	\N
75	Чат tooltip	\N	\N	chatTooltipDvId	\N	\N	\N	\N
15877112512695018	Амжилтгүй нэвтрэх оролдлого хийх тоо, тоонд тулсан үед хэрэглэгчийг идэвхигүй болгоно	number	\N	loginFailedCountUserBlock	\N	\N	\N	\N
232424	Top menu эхний үсгийн том харагдаад байгааг болиулах эсэх	\N	\N	ISFIRST_LETTER_UPPER_MENU	\N	\N	\N	\N
9013	Шинэ ажилтны төлөвлөгөө томилогдож буй огнооноос хэд хоногийн өмнөөс оруулах тохиргоо	\N	\N	dayOfPlanInsert	\N	\N	\N	\N
15877112512695020	intermedBeanUrl	string	\N	intermedBeanUrl	\N	\N	\N	\N
16163961188101	Хаалтын гүйлгээ - Сонгож орсон хэлтэс-ээс хамаарч данс гарах эсэх	\N	\N	FIN_CLOSING_TRANSACTION	\N	1	\N	\N
15877112512695021	IS_GET_BILL_AUTO	\N	\N	IS_GET_BILL_AUTO	\N	\N	16139112215352	\N
159	hrmCalendarDrillProcessId	\N	3	hrmCalendarDrillProcessId	\N	\N	\N	\N
1040	Баримтын дугаарлалтыг COMPANY_DEPARTMENT_ID -р салгана	\N	\N	IS_NOT_SPLIT_COMPANY_DEPARTMENT_ID	\N	\N	\N	\N
82	login style 2	image	\N	loginStyle2	\N	\N	\N	\N
15877112512695022	Борлуулалтын талоны буцаалтын хүсэлт илгээсэн төлвүүд	string	\N	SM_SALES_RETURN_PENDING_WFM_STATUS_IDS	\N	\N	\N	\N
1041	Sms илгээх custom процесс	\N	\N	CUSTOM_SEND_SMS	\N	\N	\N	\N
16178666601511	Өглөг авлага үүсгэх үед дэлгэрэнгүй аутоматаар гарж ирэх	\N	\N	ISSHOWMETAPAYABLERECEIEVABLE	\N	1	\N	\N
15878112512694060	Ажлын урсгалын нууц үг password_hash хадгалах	password_hash	\N	sys_wfm_password	\N	\N	\N	\N
16182862193881	&quot;ЦАХИМ ХЭЛБЭРЭЭР АРХИВ АЛБАН ХЭРЭГ ХӨТЛӨЛТИЙН \nНЭГДСЭН УРСГАЛ БИЙ БОЛГОХ НЭГДСЭН СИСТЕМ&quot; -тэй холбогдох тохиргоо	\N	\N	SMARTOFFICE_API	\N	1	\N	\N
15878112512694061	mobilecontentbackground	\N	\N	mobilecontentbackground	\N	\N	\N	\N
15878112512694062	isignorepermission	boolean	\N	isignorepermission	\N	\N	\N	\N
1603958677582	Гайхам GPS API -Лог сүүлд татсан огноо	\N	\N	GAIKHAM_DATE	\N	1	\N	\N
15878112512694063	Посын төлбөр төлөлтийн цонхны нэмэлт мэдээлэл хэсэг нуух	boolean	\N	POS_HIDE_ADDITIONAL_CUSTOMER_INFO	\N	7	16655658620209	Посын төлбөр төлөлтийн цонхны нэмэлт мэдээлэл хэсэг нуух
15878112512694065	Пос дээр бонус бодох дээд дүнг тохируулна	\N	\N	POS_BONUS_MAX_CALC_AMOUNT	\N	999	\N	\N
15878112512694066	Бараа бичих үед хамгийн доод авч болох тоо хэмжээ	\N	\N	POS_MIN_ITEM_QTY	\N	999	\N	\N
15878112512694067	Багцын гэрээгүй үед олон компаний төлбөрийг нэг төлөөд посоос баримт хэвлэх тохиргоо	boolean	\N	POS_IS_USE_MULTI_BILL_NOT_PACKAGE_POLICY	\N	7	\N	Багцын гэрээгүй үед олон компаний төлбөрийг нэг төлөөд посоос баримт хэвлэх тохиргоо
15877112512693463	Буцаалт хийхэд харилцагчдын мэдээлэл болох Овог, Нэр, РД, Утасны дугаар заавал эсэх	boolean	\N	CONFIG_POS_RETURN_INFO_REQUIRED	\N	\N	\N	\N
15878112512694068	Интермед бодлого	\N	\N	IntermedDiscount	\N	\N	\N	\N
1002	Токен авах сервис хаяг	\N	\N	bankIntegrationURLKhaan	\N	\N	16139112215352	\N
8889	Цалин бодох хэлтэс (FROM_DEP_DTL/FROM_OLD_KEY)	\N	\N	HRM_EMP_KEY_PRL_DEP	\N	\N	\N	\N
1529014684680	Хуудасны өндөр	\N	\N	tmsPageHeight	\N	\N	\N	\N
7779	Төлөв өөрчлсөн мэдэгдлийг майл-р илгээх	\N	\N	IS_SENT_MAIL_ON_WFMSTATUS_CHANGE	\N	\N	\N	\N
11	Банктай холбогдох байгууллагын код	\N	\N	OrganizationAnyBIC	\N	\N	16139112215352	\N
1003	Хэрэглэгчийн нэр, нууц үг (username:password)	\N	\N	bankIntegrationUsernamePWDKhaan	\N	\N	16139112215352	\N
9020000	Олголтоос санхүүрүү илгээх	\N	\N	OLGOLT_SANHUU	\N	\N	\N	\N
10301	Golomt bank sub url	\N	\N	GOLOMT_BANK_SUB_URL	\N	\N	16139112215352	\N
1004	API URL version (Domestic/Interbank сонголт залгана)	\N	\N	bankIntegrationAPIURLKhaan	\N	\N	16139112215352	\N
1007	Notifications майл илгээхэд хавсралт файлыг хасах	\N	\N	IGNORE_ATTACH_FROM_NOTIFICATION_MAIL	\N	\N	\N	\N
124162422	bankInfo	\N	\N	isUseBankInfo	\N	\N	\N	\N
2000100001	Сериал ашиглах эсэх	\N	\N	ISUSESERIAL	\N	1	1553855535011	\N
2000100002	Дуусах огноо ашиглах эсэх	check	\N	ISUSEENDDATE	\N	1	1553855535011	Бараа материалыг дуусах огноогоор ялган бүртгэх бол   ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
2000100003	Үйлдвэрлэсэн огноо ашиглах эсэх	\N	\N	ISUSEMANUFACTUREDDATE	\N	1	1553855535011	\N
2000100006	НХАТ ашиглах эсэх	check	\N	ISUSECITYTAX	\N	1	1553855535011	НХАТ төлөгч байгууллага бол ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
2000100010	Үнийн байршил ашиглах эсэх	\N	\N	ISUSEPRICELOCATION	\N	1	1553855535011	\N
2000100011	Баримтын дугаар идэвхигүй эсэх	\N	\N	DISABLEBOOKDATE	\N	1	1553855535011	\N
2000100014	ISREMOVEDUPLICATEROWIM	\N	\N	ISREMOVEDUPLICATEROWIM	\N	1	1553855535011	\N
2000100016	Худалдан авах үнэ идэвхитэй эсэх	\N	\N	DISABLEUNITFINALPRICE	\N	1	1553855535011	\N
2000100017	БМ-ын dtl дээр данс ашиглах эсэх	\N	\N	ISUSEITEMACCOUNTINDTL	\N	1	1553855535011	\N
2000100018	Эквивалент бараа ашиглах эсэх	check	\N	ISUSEEQITEM	\N	1	1553855535011	Блок, хайрцаг бүртгэлд ашиглах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
2000100019	Эквивалент хэмжих нэгж ашиглах эсэх	\N	\N	ISUSEEQMEASURE	\N	1	1553855535011	\N
2000100020	Эквивалент.коеф ашиглах эсэх	\N	\N	ISUSEEQCOEF	\N	1	1553855535011	\N
2000100021	БМ гүйлгээний утга автоматоор үүсэх эсэх	\N	\N	ISUSEIMCREATEDESCRIPTION	\N	1	1553855535011	\N
200070005	Өгсөн валютыг төгрөг рүү хөрвүүлэх	\N	\N	ISUSECURRENCYINMNT	\N	1	1553855624021	\N
8	Ажилласан жилийг сараар тооцох	\N	\N	workYearByMonth	\N	\N	\N	\N
21552546548426	Ажилласан жилийг сараар авчрах эсэх	\N	\N	hcmWorkYearByMonth	\N	\N	\N	\N
21552546548427	Logo 	\N	\N	MobileLogo 	\N	\N	\N	\N
21552546548428	Background Image	\N	\N	MobileBackground 	\N	\N	\N	\N
21552546548429	Text Color	\N	\N	MobileColor 	\N	\N	\N	\N
21552546548430	Theme 	\N	\N	MobileTheme 	\N	\N	\N	\N
21552546548431	LoginType 	\N	\N	MobileLoginType 	\N	\N	\N	\N
21552546548432	LoginUrl 	\N	\N	MobileLoginURL 	\N	\N	\N	\N
21552546548433	MenuType 	\N	\N	MobileMenuType 	\N	\N	\N	\N
21552546548434	Submenu 	\N	\N	MobileSubMenu 	\N	\N	\N	\N
1559203573298	Гэрээ харуулах эсэх	\N	\N	ISUSEFAINCOMECONTRACT	\N	1	1553855623757	\N
113	NETCOM	\N	\N	IS_NETCOM	\N	\N	\N	\N
1559203603546	Гүйлгээний төрөл харуулах эсэх	\N	\N	ISUSEFATRANSACTIONTYPE	\N	1	1553855623757	\N
1558083754557	Капиталжуулалтын элэгдэл	\N	\N	ISCALCDEPRCAPITALIZATION	\N	1	1553855623757	\N
123	FingerPrint_URL	\N	\N	FingerPrint_URL	\N	\N	\N	\N
1	Unitel sms holbolt	\N	\N	sms.unitel	\N	\N	\N	\N
1558083754811	Баркод ашиглах эсэх	check	\N	FAISUSESTRINGBARCODE	\N	1	1553855623757	Баркод ашиглах бол   ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
1558083754919	Харилцагч заавал эсэх	\N	\N	FAISREQUIREDCUSTOMER	\N	1	1553855623757	\N
232323242425	Сугалааг мэйлээр илгээх, subject дээрх нэршилийн тохиргоо	string	\N	POS_SEND_LOTTERY_BY_MAIL_SUBJECT	\N	\N	\N	\N
1603335140398	Англиар хөтлөх	\N	\N	isGLDescrEnglish	\N	1	\N	\N
40010	Худалдан авалтын хүсэлт Хавсралт	\N	0	PR_ATTACHMENT	\N	\N	\N	\N
12121332	Харьцуулалт дээр дэлгэрэнгүй тайлбар оруулах	\N	\N	PROC_IS_USE_DESCRIPTION_MORE_COMPARISON	\N	\N	\N	\N
16443796680739	Төсвийн хүсэлтээс шууд зузаатгал хийх эсэх	\N	\N	ISBMINVOICETOBUDGETSPENDING	\N	1	\N	\N
20213290	mobile success message color	string	\N	mobileSuccessMessageColor	\N	\N	\N	\N
20213291	mobile warning message color	string	\N	mobileWarningMessageColor	\N	\N	\N	\N
20213295	mobile error message color	string	\N	mobileErrorMessageColor	\N	\N	\N	\N
20200	hideemployeeInfo	\N	\N	hideemployeeInfo	\N	\N	\N	\N
15877112512695005	Пос дээр буцаалт хийхэд баримт хэвлэх эсэх	boolean	\N	CONFIG_POS_TALON_RETURN_PRINT	\N	999	\N	\N
15877112512695006	1 үед буцаалт хийхэд 1524480473421331 төлвийг шалгахгүй. 0 үед шалгана.	boolean	\N	CONFIG_POS_IS_NOT_CHECK_WFM_STATUS_ON_RETURN	\N	999	\N	\N
16127623358771	Онлайн ибаримт авах тохиргоо	\N	\N	EBARIMT_API	\N	\N	\N	\N
1038	Платформ дээр DELETE, SELECT дээрх PARALLEL CPU-ний тоо	\N	\N	PARALLEL_CPU_COUNT	\N	\N	\N	\N
16170026418101	RENTCALCULATEKHANBANK	\N	\N	RENTCALCULATEKHANBANK	\N	1	\N	\N
15878112512694064	Mobile ажиллахад GPS заавал асаалттай байх	boolean	\N	MobileGPSmandatory	\N	\N	\N	\N
1045	Баримт журналын огнооны шалгуурын хэмжээ [1 сар, 2 улирал, 3 хагас жил 4 жил]	\N	\N	CHECK_PERIOD_RANGE_OD_GL_INVOICE	\N	\N	\N	\N
164560267084010	Жолоочын тооцоонд үндсэн хөрөнгө ашиглах	\N	0	ISUSEDRIVE_FA	\N	1	1556077225255	\N
15878112512694069	MOBILE_CHECK_ROOT	boolean	\N	MOBILE_CHECK_ROOT	\N	\N	\N	\N
16226056688801	Шууд гадаад захиалга ашиглах. ХАхүсэлт ашиглахгүй	\N	\N	IS_USE_EXT_ORDER	\N	1	\N	\N
14725434664411	anketFooterTextColor	\N	\N	anketFooterTextColor	\N	\N	\N	\N
15878112512694086	ТТД оруулахад sidebar хоослох эсэх	boolean	\N	CONFIG_POS_IS_CLEAR_SIDEBAR_DATA	\N	999	\N	\N
669	Kpi загвар дээр орчуулга оруулдаггүй болгох	\N	\N	isIgnoreKpiMultiLang	\N	\N	\N	\N
121212	Төлөвлөгөөний цонх дээр хэмжээ тавьж өгөх	\N	\N	tnaPlanColumnSize	\N	\N	\N	\N
67	KHALAMJ_CLIENT_ID	\N	\N	KHALAMJ_CLIENT_ID	\N	\N	\N	\N
68	KHALAMJ_REDIRECT_URI	\N	\N	KHALAMJ_REDIRECT_URI	\N	\N	\N	\N
69	KHALAMJ_CONSUMER_SECRET	\N	\N	KHALAMJ_CONSUMER_SECRET	\N	\N	\N	\N
70	CONFIG_USE_KHALAMJ	\N	\N	CONFIG_USE_KHALAMJ	\N	\N	\N	\N
16257352058791	Монгол банкны ханш татах сервисын хаяг	\N	\N	MONGOLBANK_URL	\N	\N	1	\N
15878112512694070	Хөнгөлөлтийн арга хэмжээ төлбөрийн хэлбэрийг посын төлбөр төлөлтийн цонхонд харуулах эсэх	boolean	\N	POS_PAYMENT_IS_SHOW_DISCOUNT_ACTIVITY	\N	7	16655658620209	Хөнгөлөлтийн арга хэмжээ төлбөрийн хэлбэрийг посын төлбөр төлөлтийн цонхонд харуулах эсэх
164575577988410	Төсөв төлөвлөлт дээр kpi indicator ашиглах эсэх	\N	\N	ISUSEBUDGETKPIINDICATOR	\N	1	\N	\N
15878112512694087	Eshop qr code харуулах эсэх	boolean	\N	CONFIG_POS_IS_SHOW_QRCODE	\N	999	\N	\N
1058	Тайлан бололт дээр зөвхөн шүүсэн салбараар бодно	\N	\N	IS_FILTER_SINGLE_DEPARTMENT_FROM_GLO	\N	\N	\N	\N
1059	GLO-г алгасах	\N	\N	IS_SKIP_GLO	\N	\N	\N	\N
300004	Ажилтны үйлчилгээ календарь Процесс харах	\N	\N	hrmCalendarViewProcessId	\N	\N	\N	\N
300005	Ажилтны үйлчилгээ календарь Процесс устгах	\N	\N	hrmCalendarDeleteProcessId	\N	\N	\N	\N
56708779	IMAP_CONFIG_FOR_WORFLOW_MAILTO	\N	\N	IMAP_CONFIG_FOR_WORFLOW_MAILTO	\N	\N	\N	\N
1472543466439	Is gl rate disabled	\N	\N	IS_GL_RATE_DISABLED	\N	\N	\N	\N
14008	Дэлгүүрийн үндсэн үнийн байршил	\N	\N	MAIN_PRICE_LOCATION_ID	\N	\N	\N	\N
1534390362656	Мессеж URL	\N	\N	SMS_URL	\N	\N	\N	\N
1534390362657	Мессеж Password	\N	\N	SMS_PASSWORD	\N	\N	\N	\N
200060003	Гэрээгээр салж үүсэх	\N	\N	ISUSEPAYABLECONTRACT	\N	1	1553855624049	\N
80008	Борлуулах үнийг сериалаар хөтлөх эсэх.	\N	\N	IS_SALE_PRICE_BY_SERIAL	1	\N	\N	\N
21552546548439	Mobile session time	\N	\N	mobile_session_time	\N	\N	\N	\N
1530609035338	УБЕГ scan url	\N	\N	ubegscanlink	\N	\N	\N	\N
1530609035339	УБЕГ ftp_username	\N	\N	ftp_username	\N	\N	\N	\N
1530609035340	УБЕГ ftp_password	\N	\N	ftp_password	\N	\N	\N	\N
1530609035341	УБЕГ scan ftp url	\N	\N	ubegscanftplink	\N	\N	\N	\N
110	Банкнаас гүйлгээ татахад харилцахын баримт автоматаар үүсгэх эсэх	\N	\N	IsCreateBankBookFromBankBilling	\N	\N	\N	\N
10	Байгууллагын васко дугаар	\N	\N	OrganizationVascoNumber	\N	\N	16139112215352	\N
10214	Амжилтгүй нэвтрэх үйлдэл нь утга дээрх тооноос хамаарч Captcha асууна	\N	\N	CAPTCH_LOGIN_FAILED_COUNT	\N	\N	\N	\N
1534390362658	Мессеж Username	\N	\N	SMS_USERNAME	\N	\N	\N	\N
200060001	Өглөгийн төрөл ашиглах эсэх	check	\N	ISUSEPAYABLETYPE	\N	1	1553855624049	Өглөгийн бүртгэлийг өглөг төрөл бүрээр салган, хааж, авлагын төрлөөр тайлан авах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
200060004	Гүйлгээний утгаар салгах	check	\N	ISUSEPAYABLEDESCRIPTION	\N	1	1553855624049	Өглөгийн бүртгэлийг гүйлгээний утга бүрээр салган, хааж байх бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
1539681551874	googlemap-c request дуудахад ашиглах	\N	\N	googleMapApiKey	\N	\N	\N	\N
1558406103474	БМ тайлангийн тохиргоо	\N	\N	FIN_REPORT_IM	\N	1	1553855535011	\N
2	Mobicom sms holbolt	\N	\N	sms.mobicom	\N	\N	\N	\N
3	Skytel sms holbolt	\N	\N	sms.skytel	\N	\N	\N	\N
4	Gmobile sms holbolt	\N	\N	sms.gmobile	\N	\N	\N	\N
782	depr_method	\N	\N	depr_method	\N	1	1553855623757	\N
1561974912010	IS_CALC_DEPR_CAPITALIZATION	\N	\N	IS_CALC_DEPR_CAPITALIZATION	\N	1	1553855623757	\N
300006	Ажилтны үйлчилгээ календарь Ажлын урсгал	\N	\N	hrmCalendarStructureId	\N	\N	\N	\N
150	php-н хандах URL	\N	\N	PHP_URL	\N	\N	\N	\N
160	Veritech ашиглаж байгаа айлын customerId	\N	\N	veritech_customer_id	\N	\N	\N	\N
2000200001	ISUSEPRICE	\N	\N	ISUSEPRICE	\N	\N	\N	\N
2000200002	ISUSEALLPRICE	\N	\N	ISUSEALLPRICE	\N	\N	\N	\N
1550652522957	Толгой хэсгийн дэвсгэр зураг	image	\N	header_bg_path	\N	\N	\N	\N
1529014682823	Жагсаалтын хуудаслалт	\N	\N	tmsPageSize	\N	\N	\N	\N
1534390362643	Ажилтны статус	\N	\N	tmsCurrentStatus	\N	\N	\N	\N
1534390362654	Ажилтны төлөв	\N	\N	tmsStatus	\N	\N	\N	\N
7781	Ханшийн тэгшитгэл дээр олз гарзын нэг данс ашиглах	\N	\N	IS_USE_SINGLE_ACCOUNT_ON_REVALUATION	\N	\N	\N	\N
2000100015	Нярав ашиглахгүй эсэх	\N	\N	ISNOTUSESKK	\N	1	1553855535011	\N
12	Байгууллагын нэвтрэх код	\N	\N	OrganizationGolomtLoginId	\N	\N	16139112215352	\N
1550652522958	Комманд хэсгийн дэвсгэр зураг	image	\N	toolbar_bg_path	\N	\N	\N	\N
1009	Өртгийг салбараар хуваарилах	\N	\N	IM_COST_ALLOCATE	\N	\N	\N	\N
1561363197074	Татварын хуримтлагдсан элэгдэл бодох эсэх	check	\N	ISUSECALCTAXDEPR	\N	1	1553855623757	Татварын хуримтлагдсан элэгдэл зөрүүтэй боддог бол   ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
10303	Is Use Webmail	\N	\N	isUseWebmail	\N	\N	\N	\N
10304	webmail login url	\N	\N	webmailLoginUrl	\N	\N	\N	\N
1521636366688	ldap_email_text	\N	\N	ldap_email_text	\N	\N	\N	\N
2000100008	Тендерийн арга ашиглах эсэх	\N	\N	ISUSETENDERMETHOD	\N	1	1553855535011	\N
2000100009	Харилцагч заавал эсэх	\N	\N	ISREQUIERDCUSTOMER	\N	1	1553855535011	\N
200070003	Гэрээгээр салж үүсэх	check	\N	ISUSERECEIVABLECONTRACT	\N	1	1553855624021	Авлагын бүртгэлийг гэрээ  бүрээр салган, хааж, гэрээ бүрээр авлагын дүнгээр тайлан авах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
10212	Нэвтрэх үйлдлийг лог руу хадгалах, IPADDRESS OR COOKIE track аль нэг төрлөөр шалгах	\N	\N	IS_CHECK_LOGIN_FAILED	\N	\N	\N	\N
10213	Амжилтгүй нэвтрэх үйлдлийг ipaddress OR cookie track аль нэг төрөл байна	\N	\N	LOGIN_FAILED_TRACK_TYPE	\N	\N	\N	\N
200070004	Гүйлгээний утгаар салгах	check	\N	ISUSERECEIVABLEDESCRIPTION	\N	1	1553855624021	Авлагын бүртгэлийг гүйлгээний утга бүрээр салган, хааж байх бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
200070001	Авлагын төрөл ашиглах эсэх	check	\N	ISUSERECEIVABLETYPE	\N	1	1553855624021	Авлагын бүртгэлийг авлагын төрөл бүрээр салган, хааж, авлагын төрлөөр тайлан авах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
200070006	Валютын дүнгээр салж үүсэх	check	\N	ISUSERECEIVABLERATE	\N	1	1553855624021	Авлагын бүртгэлийг валютын дүн бүрээр салган, хааж, валютын дүн бүрээр тайлан авах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
200070002	Төлөгдөх огноо ашиглах эсэх	check	\N	ISUSERECEIVABLEDUEDATE	\N	1	1553855624021	Авлагын бүртгэлийг төлөгдөх огноо  бүрээр салган, хааж, төлөгдөх огноогоор насжилтын тайлан авах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
9010	skillEventExpression	\N	\N	skillEventExpression	\N	\N	\N	\N
9011	skillLoadExpression	\N	\N	skillLoadExpression	\N	\N	\N	\N
9012	skillVarExpression	\N	\N	skillVarExpression	\N	\N	\N	\N
1558498428931	Сар дотороо нэгтгэгдэх	\N	\N	ISUSEPAYABLEMERGEMONTH	\N	1	1553855624049	\N
1558498308199	Сар дотороо нэгтгэгдэнэ	\N	\N	ISUSERECEIVABLEMERGEMONTH	\N	1	1553855624021	\N
1011	Social Pay	\N	\N	SOCIAL_PAY	\N	\N	\N	\N
9	Block meta шалгах эсэх	\N	\N	useMetaBlock	\N	\N	\N	\N
116699	Хадгалсан бодолтыг шинэ бодолт хийх цонхонд дуудах эсэх	\N	\N	PRL_CALCULATION	\N	\N	\N	\N
1008	Процесс лог хадгалах эсэх	\N	\N	SAVE_PROCESS_LOG	\N	\N	\N	\N
6724819	smtp mail configuration(host,fromAddress,user,pass,port)	\N	\N	SMTP_MAIL_CONFIG	\N	\N	\N	\N
11111	Кассруу нийлүүлэлт хийдэг харилцагчийн төрөл	\N	\N	CRM_CUSTOMER_TYPE	\N	\N	\N	\N
7778	Удаан ажилласан хүсэлтийг системээс хаах	\N	\N	KILL_LONG_RUNNING_SESSION	\N	\N	\N	\N
99078	Нэмэхжлэх харуулах /Касс , Харилцах/	\N	\N	ISSHOWINVOICE	\N	\N	\N	\N
2000500002	ҮХ Баримт дээр нэгдсэн нярав ашиглах эсэх	\N	\N	FAISUSEKEEPER	\N	1	1553855623757	\N
1530609035337	Харилцагч	\N	\N	tmsCustomerCode	\N	\N	\N	\N
2000100012	Бүтэз хорогдолтой эсэх	check	\N	ISCALCDEPRITEM	\N	1	1553855535011	Хорогдол тооцдог бол  ТИЙМ, шууд зардалд бичиж эд харицагч руу өртөггүй бараа материал шилжүүлэх бол ҮГҮЙ сонголт хийнэ үү.
2222	IMAP_CONFIG_FOR_WORKFLOW_MAILTO	\N	\N	IMAP_CONFIG_FOR_WORKFLOW_MAILTO	\N	\N	\N	\N
1534390362655	Parent_id гаар дансны эрх тавьдаг эсэх	\N	\N	IS_PARENT_PERM_ACCOUNT	\N	\N	\N	\N
200060006	Валютын дүнгээр салж үүсэх	check	\N	ISUSEPAYABLERATE	\N	1	1553855624049	Өглөгийн бүртгэлийг валютын дүн бүрээр салган, хааж, валютын дүн бүрээр тайлан авах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
20	dataviewDocumentCriteria	textarea	\N	dataviewDocumentCriteria	\N	\N	\N	\N
101111	Цалин бодолтын цонх дээр бодсон бодолтын өнгө	\N	\N	PRL_CALCULATION_COLOR_CODE1	\N	\N	\N	\N
200060002	Төлөгдөх огноо ашиглах эсэх	check	\N	ISUSEPAYABLEDUEDATE	\N	1	1553855624049	Өглөг бүртгэлийг төлөгдөх огноо  бүрээр салган, хааж, төлөгдөх огноогоор насжилтын тайлан авах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
13	Файл хаах огноо	\N	\N	CLOSE_DATE	\N	\N	\N	\N
9000223	??????? ??????	\N	\N	SCM_CUSTOM_TYPE	\N	\N	\N	\N
1550066493066	123456	\N	\N	tmsMonthFilter	\N	\N	\N	\N
200060007	Автоматаар харилцагчийн үлдэгдэл татах эсэх	\N	\N	ISUSEAPAUTOFILL	\N	1	1553855624049	\N
200070007	Автоматаар харилцагчийн үлдэгдэл татах эсэх	\N	\N	ISUSEARAUTOFILL	\N	1	1553855624021	\N
2000500006	CIVIL_FOREIGN_PASSPORT	\N	\N	CVL_PASSPORT	\N	\N	\N	\N
300003	Ажилтны үйлчилгээ календарь Процесс засах	\N	\N	hrmCalendarEditProcessId	\N	\N	\N	\N
66666	Ажилтан нэмэхэд сонголттойгоор утга татах	\N	\N	PRL_COPYCALCULATECONFIG	\N	\N	\N	\N
1556278330849	Баримт бичгийн дэлгэрэнгүй харах эсэх	\N	\N	docviewer	\N	\N	\N	\N
1560235730462	Өглөгийн хэвлэх тайлангийн жагсаалтын тохиргоо	\N	\N	FIN_REPORT_AP_LIST	\N	1	1553855624049	\N
300001	Ажилтны үйлчилгээ календарь DV	\N	\N	hrmCalendarDVId	\N	\N	\N	\N
1522125322438	Нярав дээр дэлгүүр сонгох	\N	\N	ISSELECTSTORE	\N	1	1553855535011	\N
1522125322437	Нярав дээр агуулах сонгох	\N	0	ISSELECTWAREHOUSE	\N	1	1553855535011	\N
151	FINACLE_SERVICE_STATUS	\N	\N	FINACLE_SERVICE_STATUS	\N	\N	\N	\N
1550652522956	Том жагсаалтын хуудаслалт	\N	\N	tmsPageNumber	\N	\N	\N	\N
1525387990003	Агуулахын тайлан тохиргоо	\N	\N	WH_REPORT_LIST_IM	\N	\N	\N	\N
1525387990004	Агуулахын тайлан тохиргоо	\N	\N	WH_REPORT_IM	\N	\N	\N	\N
14010	Харилцагчийн овог нэр харуулахгүй байх	\N	\N	IS_NOT_SHOW_CUSTOMER_LAST_NAME	\N	\N	\N	\N
999	Цалингийн хуудаслалт	\N	\N	PRL_PAGER	\N	\N	\N	\N
1005	Монпасс Токен ашиглах эсэх	\N	\N	bankIntegrationUseMonpassKhaan	\N	\N	\N	\N
40003	GL тайлангууд эрх шалгах эсэх	\N	\N	IS_USE_PERMISSION_ON_GL_REPORT	\N	\N	\N	\N
21552546548437	2 оронгоор "round" хийх	\N	\N	IS_ROUND	\N	\N	\N	\N
2000200003	ISUSESKKINTORDER	\N	\N	ISUSESKKINTORDER	\N	\N	\N	\N
1558083756396	UPDATE_FA_ASSET_HDR	\N	\N	UPDATEFAASSETHDR	\N	1	1553855623757	\N
1560141499751	Авлага өглөгийн хэвлэх тайлангийн жагсаалтын тохиргоо	\N	\N	FIN_REPORT_AR_AP_LIST	\N	1	1553855535011	\N
1558083755845	IS_CHECK_BARCODE	\N	\N	ISCHECKBARCODE	\N	1	1553855535011	\N
1559127885789	ISUSEFAHIDEHELP	\N	\N	ISUSEFAHIDEHELP	\N	1	1553855623757	\N
1558083756136	CHECK_UPDATE_ITEM_BOOK	\N	\N	CHECKUPDATEITEMBOOK	\N	1	1553855535011	\N
1013	SM_SAVE_SALES_LOG	\N	\N	SM_SAVE_SALES_LOG	\N	\N	\N	\N
132456789	bsp	\N	\N	BSP_URL	\N	\N	\N	\N
1015	Посоос буцаасан талон нь буцаагдаж байгаа талоны төлбөр төлөлтийг хуулж үүсэх бол	\N	\N	POS_RETURN_BY_PARENT_PAYMENT	\N	\N	\N	Посоос буцаасан талон нь буцаагдаж байгаа талоны төлбөр төлөлтийг хуулж үүсэх бол
1563516528281	netCOM	\N	\N	NETCOM	\N	\N	\N	\N
2000500003	Хаан банкны дашбоардын багана тохируулга	\N	\N	KH_POS	\N	\N	\N	\N
8907	Өртөг бодсон ажилласан сүүлийн огноо	\N	\N	LAST_CALCULATE_COST_DATE	\N	\N	\N	\N
10210	ПОС-ийн талон хэвлэлт дээр харагдах холбоо барих мэдээлэл	\N	\N	POS_CONTACT_INFO	\N	\N	\N	\N
10211	ПОС-ийн талон хэвлэлт дээр харагдах дээд хэсгийн нэр	\N	\N	POS_HEADER_NAME	\N	\N	\N	\N
7780	Төлөв өөрчлсөн мэдэгдлийг майл-р илгээх	\N	\N	IS_SKIP_BALANCE_ITEM_COST	\N	\N	\N	\N
24003	НӨАТ-Н ӨГЛӨГ АВЛАГА НЭГТГЭХ ХАРИЛЦАГЧ	\N	\N	APAR_DEFAULT_CUSTOMER_ID	\N	\N	\N	\N
2000500004	CIVIL BOOK HEADER_PARAMS	\N	\N	CVL_HEADER	\N	\N	\N	\N
2000500005	CIVIL BOOK DETAIL_PARAMS (MARRIAGE)	\N	\N	CVL_DETAIL	\N	\N	\N	\N
9001	kpiEventExpression	\N	\N	kpiEventExpression	\N	\N	\N	\N
9002	kpiLoadExpression	\N	\N	kpiLoadExpression	\N	\N	\N	\N
9003	kpiVarExpression	\N	\N	kpiVarExpression	\N	\N	\N	\N
9004	mobileAndroidVersion	\N	\N	androidVersion	\N	\N	\N	\N
9005	mobileIosVersion	\N	\N	iosVersion	\N	\N	\N	\N
9006	mobileCache	\N	\N	mobileCache	\N	\N	\N	\N
11199	Локер удирдах URL хаяг	\N	\N	lockerControllerURL	\N	\N	\N	\N
21552546548438	Loader	\N	\N	MobileLoader	\N	\N	\N	\N
1012	IS_SINGLE_LOGIN	\N	\N	IS_SINGLE_LOGIN	\N	\N	\N	\N
1561960350684	Элэгдлийн бодох аргачлал	\N	\N	depr_usage_method	\N	1	1553855623757	\N
1568017213620	Шинжилгээний тайлан	\N	\N	FINANCIAL_ANALYSIS	\N	1	\N	\N
1568017559812	Няравын бүртгэл дээр дансны төрлөөр филтер хий	\N	\N	ISUSEIMSKKFILTER	\N	1	\N	\N
1568623777902	KPI Загварр ашиглах эсэх	\N	\N	ISUSEFAKPITEMPLATE	\N	1	\N	\N
1568623838924	Бараа материалын модуль дээр KPI загвар ашиглах эсэх	\N	\N	ISUSEIMKPITEMPLATE	\N	1	\N	\N
1569216051340	Үндсэн өртөг бодолтоос өөр буюу Custom өртөг ашиглах бол тохируулна	\N	\N	CUSTOMCOSTMETHOD	\N	1	1556077225255	\N
101010	Компанийн тамга	\N	\N	OrganizationStamp	\N	\N	\N	\N
6	MTGroup	\N	\N	IS_MTGROUP	\N	\N	\N	\N
500	SiSi Oauth callback URL	\N	\N	CONFIG_OAUTH_CALLBACK_URL	\N	\N	\N	\N
501	SiSi Oauth client ID	\N	\N	CONFIG_OAUTH_CLIENT_ID	\N	\N	\N	\N
502	SiSi Oauth client secret	\N	\N	CONFIG_OAUTH_CLIENT_SECRET	\N	\N	\N	\N
503	SiSi Oauth client token	\N	\N	CONFIG_OAUTH_CLIENT_TOKEN	\N	\N	\N	\N
504	SiSi Oauth client ME	\N	\N	CONFIG_OAUTH_CLIENT_ME	\N	\N	\N	\N
499	SiSi Oauth redirect URL	\N	\N	CONFIG_OAUTH_REDIRECT_URL	\N	\N	\N	\N
1575862511956	Авлага үүсгэхэд үлдэгдэл татахгүй. Авлага хаахад нэмэх товч байхгүй	\N	\N	ISUSERECEIVABLESTANDART	\N	1	1553855624021	\N
16	transdepServiceUrl	\N	\N	transdepServiceUrl	\N	\N	\N	\N
1577355908598	MDU системтэй холбоотой тохиргоо	\N	\N	MDU	\N	1	\N	\N
10121111	Цалин бодолтын цонх дээр гүйлгээнд холбосон бодолтын өнгө	\N	\N	PRL_CALCULATION_COLOR_CODE2_GL	\N	\N	\N	\N
1581075399134	Premium -н ашигладаг Centrals системийн API -тай холбоотой тохиргоо	\N	\N	CENTRALS_API	\N	1	\N	\N
1582164324141	Агуулахын байршил ашиглах эсэх	\N	\N	ISUSELOCATION	\N	1	1553855535011	\N
1581404722080073	Баркод уншигчаас тооллогын тоо татах	\N	\N	ISUSEBARCODEREADER	\N	\N	\N	\N
1584344429926	Qpay төлбөр тооцооны системтэй холбоотой тохиргоо	\N	\N	QPAY_API	\N	7	16655658620209	Qpay төлбөр тооцооны системтэй холбоотой тохиргоо
1585622064397	Парт дугаар ашиглах эсэх	check	\N	ISKEYPARTNUMBER	\N	1	1553855535011	Блок, хайрцаг бүртгэлд ашиглах  бол  ТИЙМ, биш бол ҮГҮЙ сонголт хийнэ үү.
1581404722080077	Парт дугаар ашиглах эсэх	\N	\N	ISUSEPARTNUMBER	\N	1	1553855535011	\N
55	Нууц үг солих огнооны шалгуурын хугацаа	\N	\N	ChangePasswordDate	\N	\N	\N	\N
56	Нууц үг солих тохиргоо ашиглах эсэх	\N	\N	IsChangePassword	\N	\N	\N	\N
19996610	intranetDvId	string	\N	intranetDvId	\N	\N	\N	\N
4296	Гаалийн бодолт хийхэд хувийн жин тооцох эсэх	\N	\N	IS_SPECIFIC_WEIGHT	\N	\N	\N	\N
15877112512693389	Хүлээлгийн минут	\N	\N	CONFIG_POS_SDM_ORDER_TIME	\N	\N	\N	\N
153060903535	Цаг бүртгэлийн төлөвлөгөөний цонх DV унших dynamic тохиргоо	\N	\N	tnaTimePlanHdrDV	\N	\N	\N	\N
1591152930625	Барааны DTL дээр нярав ашиглах эсэх	\N	\N	ISSHOWSKKDTL	\N	1	1553855535011	\N
20002110	TETRIS_SITE_URL	\N	\N	TETRIS_SITE_URL	\N	\N	\N	\N
20002111	TETRIS_SITE_KEY	\N	\N	TETRIS_SITE_KEY	\N	\N	\N	\N
23232323	Цалингийн циклээр шүүх эсэх	\N	\N	tmsCalcIdCode	\N	\N	\N	\N
15877112512693402	Candy Cashback хэсгийг пос дээр харуулах эсэх	\N	\N	candyCashback	\N	\N	\N	\N
15877112512693403	Төлвийн өөрчлөлтийн түүх дээр зарцуулсан хугацаа харуулна	\N	\N	isShowTimeSpentWorkflowLog	\N	\N	\N	\N
15877112512694000	Системийн үндсэн HTML title	string	\N	TITLE	\N	999	\N	\N
15877112512694001	Олон хэл дэмжих эсэх	boolean	\N	MULTI_LANG	\N	999	\N	\N
15877112512694002	default xэлний REF_LANGUAGE таблийн ID	number	\N	LANG_ID	\N	999	\N	\N
15877112512694003	default xэлний нэр	string	\N	LANG_NAME	\N	999	\N	\N
15877112512694004	default xэлний код	string	\N	LANG	\N	999	\N	\N
15877112512694005	Upload хийхэд зөвшөөрөгдөх зурагны төрлүүд	string	\N	CONFIG_IMG_EXT	\N	999	\N	\N
15877112512694006	Upload хийхэд зөвшөөрөгдөх файлын төрлүүд	string	\N	CONFIG_FILE_EXT	\N	999	\N	\N
15877112512694007	Upload хийхэд зөвшөөрөгдөх файлын дээд хэмжээ (bytes)	number	\N	CONFIG_FILE_MAX_SIZE	\N	999	\N	\N
15877112512694008	Upload хийх фолдерийн бүтцийн огнооны формат /Ymd/	string	\N	CONFIG_FILE_UPLOAD_DATE_FOLDER	\N	999	\N	\N
15877112512694009	Логин хийсэний дараа орох дефаулт линк хаяг /appmenu/	string	\N	CONFIG_START_LINK	\N	999	\N	\N
15877112512694010	Үндсэн /тайлан, жагсаалт, layout, widget/ орсоны дараа мета удирдах руу буцах товч харуулах эсэх	boolean	\N	CONFIG_OBJECT_BACKLINK	\N	999	\N	\N
15877112512694011	Тайлант үе ашиглах эсэх	boolean	\N	CONFIG_FISCAL_PERIOD	\N	999	\N	\N
15877112512694013	Системийн олон табны боломж ашиглах эсэх	boolean	\N	CONFIG_MULTI_TAB	\N	999	\N	\N
15877112512694014	CONFIG_MULTI_TAB = 1 үед хэрэглэгдэнэ, шинэ таб нээгдэх эсэх	boolean	\N	CONFIG_ALWAYS_NEWTAB	\N	999	\N	\N
15877112512694015	Процессийн детайлын загвар ашиглах эсэх	boolean	\N	CONFIG_USE_BP_DTL_THEME	\N	999	\N	\N
15877112512694016	Тоон гарын үсэг ашиглах эсэх	boolean	\N	CONFIG_USE_ETOKEN	\N	999	\N	\N
15877112512694017	Active Directory ашиглах эсэх	boolean	\N	CONFIG_USE_LDAP	\N	999	\N	\N
15877112512694018	Webmail ашиглах эсэх	boolean	\N	CONFIG_USE_WEBMAIL	\N	999	\N	\N
15877112512694019	Дансны сегментийн тохиргоо ашиглах эсэх	boolean	\N	CONFIG_ACCOUNT_SEGMENT	\N	1	\N	\N
15877112512694020	Бүх кейшийг цэвэрлэх эсэх	boolean	\N	CONFIG_ALL_CACHE_CLEAR	\N	1	\N	\N
15877112512694021	Метаны түгжээг шалгахгүй эсэх	boolean	\N	CONFIG_IGNORE_CHECK_LOCK	\N	1	\N	\N
15877112512694022	Журнал бичилт хийх цонхны детайл мөр дээр гүйлгээний утга харуулах эсэх	boolean	\N	CONFIG_GL_ROW_DESC	\N	1	\N	\N
15877112512694023	Журнал бичилт хийх цонхны детайл мөр дээр хариуцлагын төв сонгох эсэх	boolean	\N	CONFIG_GL_ROW_EXPENSE_CENTER	\N	1	\N	\N
15877112512694024	Журнал бичилт дээр харьцсан дансан дээр МГ үзүүлэлт сонгоно	boolean	\N	CONFIG_GL_ALL_ACC_META	\N	1	\N	\N
15877112512694025	Авлага өглөгийн данс сонгосны дараа процессын цонх дуудагдахгүй, харин хэрэглэгч өөрөө товч дээр дарсан үед дуудагдах эсэх	boolean	\N	CONFIG_GL_IGNORE_ACC_AFTER_POPUP	\N	1	\N	\N
114	Баримт бичиг- Бүртгэлийн хяналт харуулах эсэх	\N	\N	docDocumentCard	\N	\N	\N	\N
115	Баримт бичиг-Түх харуулах эсэх	\N	\N	docDocumentWfmHistory	\N	\N	\N	\N
116	Баримт бичиг - Хариу төлөвлөх эсэх	\N	\N	docDocumentResponse	\N	\N	\N	\N
10001000	hideLoginForgotPassword	\N	\N	hideLoginForgotPassword	\N	\N	\N	\N
10305	Модул руу ороход зүүн хэсэгт бусад модулууд харагдах эсэх	\N	\N	isModuleSidebar	\N	\N	\N	\N
21552546548579	Цалин бодолтын өөрчлөлтийн тохиргоо	\N	\N	IS_PRL_CHANGE	\N	\N	\N	\N
21552546548580	Login main title	\N	\N	login_main_title	\N	\N	\N	\N
21552546548581	Login title	\N	\N	login_title	\N	\N	\N	\N
15010	Хаан банкны харилцагчилын роль	\N	\N	KHANBANK_ROLE_CODE	\N	\N	\N	\N
21552546548583	APP MENU text	\N	\N	bg_appmenu_text	\N	\N	\N	\N
1571041111045	Түрээсийн гэрээн дээр түрээсийн хүүг лавлахаас татаж ашиглах эсэх	\N	\N	ISUSEINTERESTPERCENT	\N	1	\N	\N
1021	И-Мэйл илгээхэд сонордуулга уншсан төлөвт оруулахгүй.	\N	\N	DISABLE_READ_NOTIFICATION_WITH_MAIL	\N	\N	\N	\N
15	Дэлгэрэнгүй хайлт зөвхөн Иргэний бүртгэл дээр	\N	\N	isCivilUseFullSearch	\N	\N	\N	\N
1573632256454	Biznetwork.mn сайтын холболтын тохируулга	\N	\N	BIZNETWORK_INTEGRATION	\N	\N	\N	\N
21573123740241	Mobile Config Cashe	\N	\N	MobileConfigCashe	\N	\N	\N	\N
1575533823041	Имэйл хаягийг username-н оронд ашиглах эсэх	1	\N	isMailLogin	\N	\N	\N	\N
1581404722080076	Локерийн харагдац	\N	\N	isTouchMode	\N	\N	\N	\N
69526089	НЕКСТ	\N	\N	IS_NEXT	\N	\N	\N	\N
429510	Олон тээвэр хийх эсэх	\N	\N	MULTI_SHIP	\N	\N	\N	\N
1577178008425	Авлагын жагсаалт тайлангийн тохиргоо	\N	\N	FIN_REPORT_AR_LIST_DV	\N	1	1553855624021	\N
1022	Mobile number login.	\N	\N	MOBILE_NUMBER_LOGIN	\N	\N	\N	\N
1577954513116	ХХОАТ өглөгийн данс	\N	\N	CONFIG_GL_INCOMETAX_DEDUCTION	\N	1	\N	\N
1577954769081	Гэмтэл саатлын мэдээлэл мессэжээр илгээх	\N	\N	SMS_SEND_INTERNAL	\N	\N	\N	\N
1578630024648	Премиум группын системтэй холбогдох тохиргоонууд	\N	\N	MS_NAVISION_API	\N	1	\N	\N
1579084962670	Unitel ESME	\N	\N	SMS_INTERNAL_URL	\N	\N	\N	\N
21573123740243	Барааны нэр давхардсан эсэх	\N	\N	ISCHECKITEMNAME	\N	\N	\N	\N
99999	payroll excel import with employeeKeyId	\N	\N	excelEmportwithKey	\N	\N	\N	\N
147868303	map color	\N	\N	map_market_color	\N	\N	\N	\N
24	staticTmsReport	\N	\N	staticTmsReport	\N	\N	\N	\N
21573123740245	Үзсэн notification -ийг харуулахгүй болгоно	\N	\N	hideSeenNotification	\N	\N	\N	\N
1581404722080072	0	\N	\N	21573123740245	\N	\N	\N	\N
300	anket	number	\N	anketNoAd	0	\N	\N	\N
1581404722080078	Мобайл чат ашиглах эсэх	\N	\N	isUseMobileChat	\N	\N	\N	\N
10302	Golomt bank api url	\N	\N	GOLOMT_BANK_API_URL	\N	\N	16139112215352	\N
1587711251269337	DEV орчинг ялгах тохиргоо	\N	\N	IS_DEV	\N	\N	\N	\N
34	unitVideoPath	\N	\N	unitVideoPath	\N	\N	\N	\N
35	agentVideoPath	\N	\N	agentVideoPath	\N	\N	\N	\N
1594091830697	Япон тайлант үеийн хаалт ашиглах эсэх	\N	\N	IS_USE_CLOSE_TRX_JAPAN	\N	1	\N	\N
1594274113514	Нууц үг сэргээхэд, Мобайлын нууц үгийг өөрчлөх бол тохируулна	\N	\N	IS_CHANGE_MOBILE_PASSWORD	\N	1	\N	\N
15877112512693401	Талон буцаахад шалтгаан сонгох эсэх	\N	\N	POS_IS_CHOOSE_INVOICE_RETURN_TYPE	\N	\N	\N	\N
2000001	Сонордуулга таб нээх	\N	\N	ISTABSELFNOTIFICATION	\N	\N	\N	\N
1031	CHECK_GL_USER_PERMISSION	\N	\N	CHECK_GL_USER_PERMISSION	\N	\N	\N	\N
99079	Хүсэлт гадаад дотоодоор ялгаж хуваарилах	boolean	\N	IS_USE_PROC_ASSIGN_FOREIGN	\N	21	16783427017789	\N
100899	It's need ot Monpass CLoud Login	\N	\N	mp_client_id	\N	\N	\N	\N
100898	It's need ot Monpass CLoud Login	\N	\N	mp_client_secret	\N	\N	\N	\N
100897	SSO login with MonPass	\N	\N	SSO_URI	\N	\N	\N	\N
1032	PRL_CHECK_VALIDATE_OF_CALCULATION	\N	\N	Цалин бодсоны дараа шалгуур ажлуулах	\N	\N	\N	\N
15877112512694028	Журнал бичилт дээр данс сонгоход үзүүлэлтүүд утга сонгогдсон үед үзүүлэлтийн цонхыг нээхгүй байх эсэх	boolean	\N	CONFIG_GL_ALL_META_NOTOPEN	\N	1	\N	\N
15877112512694029	Журнал бичилт дээрхи данс нь fin_account - parent_id талбарыг ашиглах эсэх	boolean	\N	CONFIG_GL_ACCOUNT_PARENT_ID	\N	1	\N	\N
15877112512694030	Тооцооны ханшийн тэгшитгэл дээр шинэ ханш дуудаж ажиллуулах эсэх	boolean	\N	CONFIG_GL_BILLRATE_HDR_RATE	\N	1	\N	\N
15877112512694031	Журнал бичилтийн дансны нөатийн үзүүлэлтийн датаны шалгуурыг болиулах эсэх	boolean	\N	CONFIG_GL_VAT_META_VALIDATE_IGNORE	\N	1	\N	\N
15877112512694032	Ханшийн тэгшитгэл дээр economicSourceId ашиглах эсэх	boolean	\N	CONFIG_CT_ECONOMIC_SRC	\N	1	\N	\N
15877112512694033	ref_bank таблийн Голомт банкны ID	number	\N	CONFIG_BANK_ID_GOLOMT	\N	1	\N	\N
15877112512694034	Менюг mega төрлөөр харуулах эсэх	boolean	\N	CONFIG_TOP_MEGA_MENU	\N	999	\N	\N
15877112512694035	Popup цонхыг дан ESC товчоор хаах эсэх	boolean	\N	CONFIG_IS_CLOSE_ON_ESCAPE	\N	999	\N	\N
15877112512694036	Дээд менюний дүрсийг харуулахгүй эсэх	boolean	\N	CONFIG_TOP_MENU_NOICON	\N	999	\N	\N
15877112512694037	Statement тайланг PDF ээр харуулах товчийг ашиглах эсэх	boolean	\N	CONFIG_STATEMENT_PDF_VIEW	\N	999	\N	\N
15877112512694038	Жагсаалтын баганын шүүлтийг enter товч дарж шүүх эсэх	boolean	\N	CONFIG_FILTER_ONLY_ENTER_KEY	\N	999	\N	\N
15877112512694039	Жагсаалтын мөр устгахаас өмнө жагсаалтыг заавал сэргээх эсэх	boolean	\N	CONFIG_IS_DELETEACTION_BEFORERELOAD	\N	999	\N	\N
15877112512694040	Дотоод чат систем ашиглах эсэх	boolean	\N	USE_CHAT	\N	999	\N	\N
15877112512694041	OCR API сервисийн хаяг	url	\N	CONFIG_OCR_SERVICE	\N	999	\N	\N
15877112512694043	Pivot тайлангийн IIS дээрхи хаяг	url	\N	CONFIG_PIVOT_SERVICE_ADDRESS	\N	1	\N	\N
15877112512694044	Тестийн сервер эсэх	boolean	\N	IS_TEST_SERVER	\N	999	\N	\N
15877112512694045	Smtp host	string	\N	SMTP_HOST	\N	999	\N	\N
15877112512694046	Smtp port	string	\N	SMTP_PORT	\N	999	\N	\N
15877112512694047	Smtp secure	string	\N	SMTP_SECURE	\N	999	\N	\N
15877112512694048	Smtp user	string	\N	SMTP_USER	\N	999	\N	\N
15877112512694049	Smtp password	string	\N	SMTP_PASS	\N	999	\N	\N
15877112512694050	From email	string	\N	EMAIL_FROM	\N	999	\N	\N
15877112512694051	From email name	string	\N	EMAIL_FROM_NAME	\N	999	\N	\N
15877112512694026	Ижил төрөлтай дансны үзүүлэлт ижилсүүлэх эсэх	boolean	\N	CONFIG_GL_META_DUPLICATE	\N	1	\N	\N
15877112512694027	Журнал бичилт дээр данс сонгоход зөвхөн нэг үзүүлэлттэй мөн утга сонгогдсон үед үзүүлэлтийн цонхыг нээхгүй байх эсэх	boolean	\N	CONFIG_GL_SINGLE_META_NOTOPEN	\N	1	\N	\N
1567153504664	Авоматаар шүүх	\N	\N	tmsDefaultFilter	\N	\N	\N	\N
1567753727300	Харилцагчийн код автоматаар үүсгэх эсэх	\N	\N	FINCREATECUSTOMERCODE	\N	1	1556077225255	\N
1567753883383	Байгууллага бүртгэхэд регистр заавал эсэх	\N	\N	ISREQUIREDCOMPANYREGISTER	\N	1	\N	\N
117	Баримт бичиг - Хугацаа сунгасан түүх харуулах эсэх	\N	\N	docExtendResponseDate	\N	\N	\N	\N
1017	Nes серверийн хаяг Url,Cookie,Company	\N	\N	NES_URL	\N	\N	\N	\N
1560235730463	Шүүлтийн талбарын = болон like -г hide хийнэ	\N	\N	HIDE_DV_FILTER_CONDITION	\N	\N	\N	\N
1560235730464	Popup controller -ийн code талбарыг hide хийнэ	\N	\N	HIDE_POPUP_LOOKUP_CODE	\N	\N	\N	\N
21552546548682	isPosSocialPay	\N	\N	isPosSocialPay	\N	\N	\N	\N
21552546548783	isPosCertificate	\N	\N	isPosCertificate	\N	\N	\N	\N
14	Бүлэг удирдах	\N	\N	SCL_GROUP_USER	\N	\N	\N	\N
4295	Премиум	\N	\N	IS_PREMIUM	\N	\N	\N	\N
21573123740239	Барааны DTL-ийн багана харуулах эсэх	\N	\N	ISSHOWDTL	\N	1	1553855535011	\N
1573631931137	EAN13 баркод ашиглах эсэх	\N	\N	ISUSEEAN13BARCODE	\N	1	1553855535011	\N
21573123740240	1 тохиолдолд нууц үгийг дуусах хугацаанаас шалгаж хэрэглэгчийг логин хийлгэхгүй	\N	\N	isUsePasswordExpiry	\N	\N	\N	\N
42951	UNITEL	\N	\N	IS_UNITEL	\N	\N	\N	\N
1577238630293	Авлага өглөгийн жагсаалт тайлангийн жагсаалтын тохиргоо	\N	\N	FIN_REPORT_AR_AP_LIST_DV	\N	1	\N	\N
1577356692589	Журналын цонх дээр ХХОАТ тооцох чек	\N	\N	FIN_INCOMETAX_DEDUCTION	\N	1	\N	\N
1579523043464	ХасБанкны eGateway системийн сервистэй холбогдох тохиргоо	\N	\N	XACBANK_EGATEWAY	\N	1	16139112215352	\N
21573123740244	Хурууны хээний төхөөрөмж Refresh хийх.	\N	\N	findFingerPrintServer	\N	\N	\N	\N
800	Төлөв өөрчлөхөд файл шууд нээгдэх	\N	\N	isFilePreview	\N	\N	\N	\N
1581404722080074	Төсвийн загварын дэлгэрэнгүй хаяг	\N	\N	CONFIG_BUDGET_SERVER_ADDRESS2	\N	\N	\N	\N
1584585363559	НӨАТ-н авлага данс тохируулга	\N	\N	CONFIG_GL_VAT_DEDUCTION_DEBIT	\N	1	1556077225255	\N
36	isNotaryServer	\N	\N	isNotaryServer	\N	\N	\N	\N
2000	Сар эхлэхэд автоматаар төлөвлөгөө зоох Цагийн ID	\N	\N	TMS_AUTO_PLAN_ID_BY_DEPARTMENT	\N	\N	\N	\N
1581404722080079	disabledNotifAllBtn	\N	\N	disabledNotifAllBtn	\N	\N	\N	\N
15877112512693392	Мобайлаар системд нэвтэрсэний дараа нууц үгийг заавал солих бол ажилла	\N	\N	MOBILE_RESET_PASSWORD_AFTER_LOGIN	\N	\N	\N	\N
15877112512693393	POS_CONFIG_MATRIX_HIDE_SALE	\N	\N	POS_CONFIG_MATRIX_HIDE_SALE	\N	\N	\N	\N
1591072806005	ХААН банкны CORPORATE GATEWAY холболтын тохиргоо	\N	\N	KHANBANK_CORPORATE_GATEWAY	\N	1	\N	\N
1593408760635	Албан тушаалын ангилалаар	\N	\N	tmsClassificationId	\N	\N	\N	\N
15877112512693398	Босоо цэсний өнгө	\N	\N	MobileSideMenuColor	\N	\N	\N	\N
1596443585800	Журнал засахад дансны төрлөөр ажилладаг эсэхийг шалгах	\N	\N	ISUSEACCOUNTTYPEUGLUPDATE	\N	1	1556077225255	\N
15877112512694052	Хишиг Арвинд зориулсан Цагийн системийн хувилбар	boolean	\N	CONFIG_TNA_HISHIGARVIN	\N	999	\N	\N
15877112512694053	Худалдааны зөвлөх	boolean	\N	CONFIG_POS_SALESPERSON	\N	999	\N	\N
15877112512694054	Хүргэллтэй эсэх	boolean	\N	CONFIG_POS_DELIVERY	\N	999	\N	\N
15877112512694055	Эмийн сан эсэх	boolean	\N	CONFIG_POS_HEALTHRECIPE	\N	999	\N	\N
15877112512694056	Барааг Сериал - аар сонгох	boolean	\N	CONFIG_POS_SERIALNUMBER	\N	999	\N	\N
15877112512694057	Харилцагч дээр баримт хэвлэх төрөл	string	\N	CONFIG_POS_PRINT_TYPE	\N	999	\N	\N
15877112512694058	Bill Paper Margins	string	\N	CONFIG_POS_BILL_MARGIN	\N	999	\N	\N
15877112512694059	Бараа давхцаж бичих эсэх	boolean	\N	CONFIG_POS_ITEM_CHECK_DUPLICATE	\N	999	\N	\N
15877112512694060	Барааны үлдэгдэл шалгах эсэх	boolean	\N	CONFIG_POS_ITEM_CHECK_ENDQTY	\N	999	\N	\N
15877112512694061	Барааны үлдэгдлийн мессеж харуулах эсэх	boolean	\N	CONFIG_POS_ITEM_CHECK_ENDQTY_MSG	\N	999	\N	\N
15877112512694062	Баримт хэвлэх хувь	boolean	\N	CONFIG_POS_PRINT_COPIES_COUNT	\N	999	\N	\N
15877112512694063	Хөнгөлөлт тооцоолох товч харуулах эсэх	boolean	\N	CONFIG_POS_ROW_DISCOUNT	\N	999	\N	\N
15877112512694064	Баримт дээр хөтөлбөрүүд харуулах эсэх	boolean	\N	CONFIG_POS_BILL_PROMOTION	\N	7	16655658620209	Баримт дээр хөтөлбөрүүд харуулах эсэх
15877112512694065	Гишүүнчлэлийн карт харуулах эсэх	boolean	\N	CONFIG_POS_ONLY_CARDNUMBER	\N	999	\N	\N
15877112512694066	Гүйлгээний утга заавал бөглөх эсэх	boolean	\N	CONFIG_POS_DESCRIPTION_REQUIRED	\N	999	\N	\N
15877112512694067	Сонгосон барааны GET Process	string	\N	CONFIG_POS_ITEM_GET	\N	999	\N	\N
15877112512694068	Харилцагчид ялгах тохиргоо	string	\N	CONFIG_POS_TEMP_INVOICE_KEY_FIELD	\N	999	\N	\N
15877112512694069	Нэхэмжлэлийн DataviewId	number	\N	CONFIG_POS_TEMP_INVOICE_DVID	\N	999	\N	\N
15877112512694070	Ажилтан сонгох эсэх	boolean	\N	CONFIG_POS_EMPLOYEE_CUSTOMER	\N	999	\N	\N
15877112512694071	Нэхэмжлэлийн жагсаалт харах эсэх	boolean	\N	CONFIG_POS_INVOICE_LIST	\N	999	\N	\N
15877112512694072	Гэрээний жагсаалт харах эсэх	boolean	\N	CONFIG_POS_CONTRACT_LIST	\N	999	\N	\N
15877112512694073	Купонтай эсэх	boolean	\N	CONFIG_POS_PAYMENT_COUPON	\N	999	\N	\N
15877112512694074	Хөнгөлөлтийн карт харуулах эсэх	boolean	\N	CONFIG_POS_PAYMENT_BONUSCARD	\N	999	\N	\N
15877112512694075	Төлбөрийн төрөл Дансны шилжүүлэг	boolean	\N	CONFIG_POS_PAYMENT_ACCOUNTTRANSFER	\N	999	\N	\N
\.


--
-- Data for Name: config_value; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.config_value (id, config_id, config_value, criteria, description, config_value_eng, modified_user_id, modified_date, company_department_id, translation_value) FROM stdin;
1425611135265	14004	1	STORE_ID=1	\N	\N	\N	\N	\N	\N
1425618186853	10046	21400829416401	STORE_ID=8060020	\N	\N	\N	\N	\N	\N
1425618186866	14004	21400829416411	STORE_ID=8060020	\N	\N	\N	\N	\N	\N
1425618186867	14005	1418888199783	STORE_ID=8060020	\N	\N	\N	\N	\N	\N
1425984400375	14001	21400829416300	STORE_ID=8060489	\N	\N	\N	\N	\N	\N
1423046982562	10094	0	\N	\N	\N	\N	\N	\N	\N
1423046982563	99004	http://127.0.0.1:7101/postwhws/FaAssetInvService?wsdl;/ia/postwh/webservices/model/services/fa/inv/common/;FaAssetInvService;/ia/postwh/webservices/model/services/fa/inv/common/;FaAssetInvServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982564	99005	http://127.0.0.1:7101/postwhws/FaAssetKeyService?wsdl;/ia/postwh/webservices/model/services/fa/assetkey/common/;FaAssetKeyService;/ia/postwh/webservices/model/services/fa/assetkey/common/;FaAssetKeyServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982565	10059	#,##0.00	\N	\N	\N	\N	\N	\N	\N
1423046982566	10087	0	\N	\N	\N	\N	\N	\N	\N
1423046982567	10088	1	\N	\N	\N	\N	\N	\N	\N
1423046982568	10086	10001	\N	\N	\N	\N	\N	\N	\N
1423046982569	10078	0	\N	\N	\N	\N	\N	\N	\N
1423046982570	10079	1	\N	\N	\N	\N	\N	\N	\N
1423046982571	10080	0	\N	\N	\N	\N	\N	\N	\N
1423046982572	10081	0	\N	\N	\N	\N	\N	\N	\N
1423046982573	10082	0	\N	\N	\N	\N	\N	\N	\N
1423046982574	10083	0	\N	\N	\N	\N	\N	\N	\N
1423046982575	10084	0	\N	\N	\N	\N	\N	\N	\N
1423046982576	10085	0	\N	\N	\N	\N	\N	\N	\N
1423046982577	10089	1	\N	\N	\N	\N	\N	\N	\N
1423046982578	10090	1	\N	\N	\N	\N	\N	\N	\N
1423046982579	10091	1	\N	\N	\N	\N	\N	\N	\N
1423046982580	10092	1	\N	\N	\N	\N	\N	\N	\N
1423046982581	10043	0	\N	\N	\N	\N	\N	\N	\N
1423046982582	10093	"Оргил Хүнс" ХХК	\N	\N	\N	\N	\N	\N	\N
1423046982583	99006	http://127.0.0.1:7101/postwhws/CrmApArService?wsdl;/ia/postwh/webservices/model/services/crm/apar/common/;CrmApArService;/ia/postwh/webservices/model/services/crm/apar/common/;CrmApArServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982584	99002	http://127.0.0.1:7101/postwhws/CrmAPService?wsdl;/ia/postwh/webservices/model/services/crm/ap/;CrmAPService;/ia/postwh/webservices/model/services/crm/ap/;CrmAPServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982585	99003	http://127.0.0.1:7101/postwhws/CrmARService?wsdl;/ia/postwh/webservices/model/services/crm/ar/;CrmARService;/ia/postwh/webservices/model/services/crm/ar/;CrmARServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982586	10047	501302041001100007	\N	\N	\N	\N	\N	\N	\N
1423046982587	10046	1412826485804	\N	\N	\N	\N	\N	\N	\N
1423046982588	10063	365	\N	\N	\N	\N	\N	\N	\N
1423046982589	10053	\N	\N	\N	\N	\N	\N	\N	\N
1423046982590	10070	\N	\N	\N	\N	\N	\N	\N	\N
1423046982591	10071	\N	\N	\N	\N	\N	\N	\N	\N
1423046982592	10058	\N	\N	\N	\N	\N	2022-04-07 12:06:24	\N	\N
1423046982593	10060	#,##0.00	\N	\N	\N	\N	\N	\N	\N
1423046982594	10095	/u03/user/images	\N	\N	\N	\N	\N	\N	\N
1423046982595	10062	12	\N	\N	\N	\N	\N	\N	\N
1423046982596	10076	yyyy-MM-dd	\N	\N	\N	\N	\N	\N	\N
1423046982597	10054	2019-09-30	\N	\N	\N	\N	\N	\N	\N
1423046982598	10044	2019-09-30	departmentId=1600064242904;	\N	\N	\N	\N	\N	\N
1423046982599	10064	11337947158805	\N	\N	\N	\N	\N	\N	\N
1423046982600	10038	Маркетингийн хэлтэс	\N	Маркетингийн хэлтэс	\N	\N	\N	\N	{"value":{"CONFIG_VALUE":{"en":"Marketing department"}}}
1423046982601	10039	5392489	\N	\N	\N	\N	\N	\N	\N
1423046982602	10045	10	\N	\N	\N	\N	\N	\N	\N
1423046982603	10020	1	\N	\N	\N	\N	\N	\N	\N
1423046982604	10021	1	\N	\N	\N	\N	\N	\N	\N
1423046982605	10022	1	\N	\N	\N	\N	\N	\N	\N
1423046982606	10023	1	\N	\N	\N	\N	\N	\N	\N
1423046982607	10024	1	\N	\N	\N	\N	\N	\N	\N
1423046982608	10025	1	\N	\N	\N	\N	\N	\N	\N
1423046982609	10026	1	\N	\N	\N	\N	\N	\N	\N
1423046982610	10027	1	\N	\N	\N	\N	\N	\N	\N
1423046982611	10007	1	\N	\N	\N	\N	\N	\N	\N
1423046982612	10069	0	\N	\N	\N	\N	\N	\N	\N
1423046982613	10042	0	\N	\N	\N	\N	\N	\N	\N
1423046982614	10040	1	\N	\N	\N	\N	\N	\N	\N
1423046982615	10041	1	\N	\N	\N	\N	\N	\N	\N
1423046982616	10056	1	\N	\N	\N	\N	\N	\N	\N
1423046982617	10057	Y	\N	\N	\N	\N	\N	\N	\N
1423046982618	10061	2	\N	\N	\N	\N	2022-04-07 12:04:46	\N	\N
1423046982620	10015	1	\N	\N	\N	\N	\N	\N	\N
1423046982621	10016	1	\N	\N	\N	\N	\N	\N	\N
1423046982622	10017	1	\N	\N	\N	\N	\N	\N	\N
1423046982623	10018	1	\N	\N	\N	\N	\N	\N	\N
1423046982624	10019	1	\N	\N	\N	\N	\N	\N	\N
1423046982625	10001	WEIGHTED_AVERAGE	\N	\N	\N	\N	\N	\N	\N
1423046982626	10065	Улаанбаатар хот, Монгол улс Үйлдвэрийн гудамж-1, Хан-Уул дүүрэг, 	\N	\N	\N	\N	\N	\N	\N
1423046982627	10002	0	\N	\N	\N	\N	\N	\N	\N
1423046982628	10003	0	\N	\N	\N	\N	\N	\N	\N
1423046982629	10004	0	\N	\N	\N	\N	\N	\N	\N
1423046982630	10005	1	\N	\N	\N	\N	\N	\N	\N
1423046982631	10006	1	\N	\N	\N	\N	\N	\N	\N
1423046982632	10008	0	\N	\N	\N	\N	\N	\N	\N
1423046982633	10009	0	\N	\N	\N	\N	\N	\N	\N
1423046982634	10010	0	\N	\N	\N	\N	\N	\N	\N
1423046982635	10011	0	\N	\N	\N	\N	\N	\N	\N
1423046982636	10012	0	\N	\N	\N	\N	\N	\N	\N
1423046982637	10013	0	\N	\N	\N	\N	\N	\N	\N
1423046982638	10014	0	\N	\N	\N	\N	\N	\N	\N
1423046982639	10077	DEBIT	\N	\N	\N	\N	\N	\N	\N
1423046982641	10048	Н.Батзаяа + оюуdfdfd	departmentId=1433907571501;	бөбөбөб	\N	\N	\N	\N	\N
1423046982642	10050	Н.Сэулегул	\N	\N	\N	\N	\N	\N	\N
1423046982643	10051	Оюу	departmentId=1433907571501;	Оюу	\N	\N	\N	\N	\N
1423046982644	10052	Хүний нөөцийн менежер	\N	\N	\N	\N	\N	\N	\N
1423046982645	10037	\N	\N	\N	\N	\N	\N	\N	\N
1423046982646	99007	http://127.0.0.1:7101/postwhws/ImInvService?wsdl;/ia/postwh/webservices/model/services/im/inv/common/;ImInvService;/ia/postwh/webservices/model/services/im/inv/common/;ImInvServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982647	10098	ORG_WIDE	\N	\N	\N	\N	\N	\N	\N
1423046982648	10099	0	\N	\N	\N	\N	\N	\N	\N
1423046982649	99001	http://127.0.0.1:7101/postwhws/FinGLService?wsdl;/ia/postwh/webservices/model/services/fin/gl/;FinGLService;/ia/postwh/webservices/model/services/fin/gl/;FinGLServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982650	99009	http://127.0.0.1:7101/ws/ImSKService?wsdl;http://storekeeper.im.ws.webservices.postwh.ia/;ImSKService;http://storekeeper.im.ws.webservices.postwh.ia/;ImSKService	\N	\N	\N	\N	\N	\N	\N
1423046982651	99010	http://127.0.0.1:7101/ws/ImSKKeyService?wsdl;http://storekeeper.im.ws.webservices.postwh.ia/;ImSKKeyService;http://storekeeper.im.ws.webservices.postwh.ia/;ImSKKeyService	\N	\N	\N	\N	\N	\N	\N
1423046982652	99011	http://127.0.0.1:7101/postwhws/AccountUserRoleService?wsdl;/ia/postwh/webservices/model/services/fin/userManag/common/;AccountUserRoleService;/ia/postwh/webservices/model/services/fin/userManag/common/;AccountUserRoleServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982653	99012	http://127.0.0.1:7101/postwhws/ImMovementService?wsdl;http://interactive.mn/postwh/im/;ImMovementService;http://interactive.mn/postwh/im/;ImMovementServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982654	99013	http://127.0.0.1:7101/ws/ImWarehouseService?wsdl;http://warehouse.im.ws.webservices.postwh.ia/;ImWarehouseService;http://warehouse.im.ws.webservices.postwh.ia/;ImWarehouseService	\N	\N	\N	\N	\N	\N	\N
1423046982655	99014	http://127.0.0.1:7101/postwhws/AccountUserRoleService?wsdl;/ia/postwh/webservices/model/services/fin/userManag/common/;AccountUserRoleService;/ia/postwh/webservices/model/services/fin/userManag/common/;AccountUserRoleServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982656	99016	http://127.0.0.1:7101/ws/ImItemInfoService?wsdl;http://iteminfo.im.ws.webservices.postwh.ia/;ImItemInfoService;http://iteminfo.im.ws.webservices.postwh.ia/;ImItemInfoService	\N	\N	\N	\N	\N	\N	\N
1423046982657	99017	http://127.0.0.1:7101/ws/ImCalculateCostService?wsdl;http://cost.im.ws.webservices.postwh.ia/;ImCalculateCostService;http://cost.im.ws.webservices.postwh.ia/;ImCalculateCostService	\N	\N	\N	\N	\N	\N	\N
1423046982658	99018	http://127.0.0.1:7101/postwhws/WhUserRoleServiceService?wsdl;/ia/postwh/webservices/model/services/wh/common/;WhUserRoleServiceService;/ia/postwh/webservices/model/services/wh/common/;WhUserRoleServiceServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982659	99019	http://127.0.0.1:7101/svbm-ws/CmSavingBankService?wsdl;http://webservices.svbm.postwh.ia/;CmSavingBankService;http://webservices.svbm.postwh.ia/;CmSavingBankService	\N	\N	\N	\N	\N	\N	\N
1423046982660	12000	11396286465905	\N	\N	\N	\N	\N	\N	\N
1423046982661	99015	http://127.0.0.1:7101/ws/ImInvService?wsdl;http://inv.im.ws.webservices.postwh.ia/;ImInvService;http://inv.im.ws.webservices.postwh.ia/;ImInvService	\N	\N	\N	\N	\N	\N	\N
1423046982662	99021	http://127.0.0.1:7101/postwhws/FinRateService?wsdl;/ia/postwh/webservices/model/services/fin/info/rate/common/;FinRateService;/ia/postwh/webservices/model/services/fin/info/rate/common/;FinRateServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982663	99024	http://127.0.0.1:7101/postwhws/CmService?wsdl;/ia/postwh/webservices/model/services/fin/cm/common/;CmService;/ia/postwh/webservices/model/services/fin/cm/common/;CmServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1423046982664	11004	0	\N	\N	\N	\N	\N	\N	\N
1423046982665	99008	http://127.0.0.1:7101/postwhws/FinGLTmpService?wsdl;/ia/postwh/webservices/model/services/fin/gl/tmp/common/;FinGLTmpService;/ia/postwh/webservices/model/services/fin/gl/tmp/common/;FinGLTmpServiceSoapHttpPort	\N	\N	\N	\N	\N	\N	\N
1676358535431263	20001000100	AR	\N	\N	\N	\N	\N	\N	\N
1676358541475365	20001000100	INVOICE	\N	\N	\N	\N	\N	\N	\N
1423046982666	99020	http://127.0.0.1:7101/ws/ImItemUtilService?wsdl;http://util.im.ws.webservices.postwh.ia/;ImItemUtilService;http://util.im.ws.webservices.postwh.ia/;ImItemUtilService	\N	\N	\N	\N	\N	\N	\N
1423046982667	99022	10	\N	\N	\N	\N	\N	\N	\N
1423046982668	11006	1	\N	\N	\N	\N	\N	\N	\N
1423046982669	13001	\N	\N	\N	\N	\N	\N	\N	\N
1423046982670	13002	\N	\N	\N	\N	\N	\N	\N	\N
1423046982671	13003	\N	\N	\N	\N	\N	\N	\N	\N
1423046982673	10074	21400829416477	\N	\N	\N	\N	\N	\N	\N
1423046982674	10075	21400829416474	\N	\N	\N	\N	\N	\N	\N
1423046982675	10072	21400829416476	\N	\N	\N	\N	\N	\N	\N
1423046982676	10073	21400829416475	\N	\N	\N	\N	\N	\N	\N
1423046982677	99028	21400829416477	\N	\N	\N	\N	\N	\N	\N
1423046982678	99029	21400829416474	\N	\N	\N	\N	\N	\N	\N
1423046982679	80001	C:\\dump	\N	\N	\N	\N	\N	\N	\N
1423046982680	80002	0	\N	\N	\N	\N	\N	\N	\N
1423046982681	80003	oracle/oracle123@192.168.100.92:22	\N	\N	\N	\N	\N	\N	\N
1423046982682	80004	Swast1ka	\N	\N	\N	\N	\N	\N	\N
1423046982683	80005	C:\\Oracle\\product\\11.2.0\\db_1	\N	\N	\N	\N	\N	\N	\N
1423046982684	12003	11400576931057	\N	\N	\N	\N	\N	\N	\N
1423046982685	10101	1	\N	\N	\N	\N	\N	\N	\N
1423046982686	10030	Н.Батзаяа	\N	\N	\N	\N	\N	\N	\N
1423046982687	10032	Н.Сэулегул	\N	\N	\N	\N	\N	\N	\N
1423046982688	10033	Мягмарцэцэг	\N	\N	\N	\N	\N	\N	\N
1423046982689	10029	Ерөнхий захирал	\N	\N	\N	\N	\N	\N	\N
1423046982690	10031	Ерөнхий нягтлан	\N	\N	\N	\N	\N	\N	\N
1423046982691	99051	2014/04/01	\N	\N	\N	\N	\N	\N	\N
1423046982692	99052	70115252, 89028206	\N	\N	\N	\N	\N	\N	\N
1423046982693	99053	+976 - 11 - 320334	\N	\N	\N	\N	\N	\N	\N
1423046982694	99054	Голомт банк 200011456	\N	\N	\N	\N	\N	\N	\N
1423046982695	99043	1	\N	\N	\N	\N	\N	\N	\N
1423046982696	99044	38	\N	\N	\N	\N	\N	\N	\N
1423046982697	99045	39	\N	\N	\N	\N	\N	\N	\N
1423046982698	15001	21400829416324	\N	\N	\N	\N	\N	\N	\N
1423046982699	10102	0	\N	\N	\N	\N	\N	\N	\N
1423046982701	99040	2	\N	\N	\N	\N	\N	\N	\N
1423046982702	99041	11396286465906	\N	\N	\N	\N	\N	\N	\N
1423046982703	99042	11396286465905	\N	\N	\N	\N	\N	\N	\N
1423046982704	11007	true	\N	\N	\N	\N	\N	\N	\N
1423046982705	14002	40001	\N	\N	\N	\N	\N	\N	\N
1423046982706	10103	0	\N	\N	\N	\N	\N	\N	\N
1425615241730	14001	21348115985823	STORE_ID=8060020	\N	\N	\N	\N	\N	\N
1425984400377	14004	21400829416411	STORE_ID=8060489	\N	\N	\N	\N	\N	\N
1425984400378	14005	1418888199783	STORE_ID=8060489	\N	\N	\N	\N	\N	\N
1426235800732	14001	21426244625861	STORE_ID=8060988	\N	\N	\N	\N	\N	\N
1426235800733	10046	1412826485804	STORE_ID=8060988	\N	\N	\N	\N	\N	\N
1426235800734	14004	21400829416411	STORE_ID=8060988	\N	\N	\N	\N	\N	\N
1426235800735	14005	1412826486656	STORE_ID=8060988	\N	\N	\N	\N	\N	\N
1426823944459	99059	161	\N	\N	\N	\N	\N	\N	\N
1426238058395	14004	21426134671500	STORE_ID=8085330	\N	\N	\N	\N	\N	\N
35759	30000	1462857902397	\N	WFM_STATUS.WFM_STATUS_ID	\N	\N	\N	\N	\N
1426238058396	14005	1419240484944	STORE_ID=8085330	\N	\N	\N	\N	\N	\N
1426238058393	14001	1419240482994	STORE_ID=8085330	\N	\N	\N	\N	\N	\N
1426823944454	14001	21400829416300	STORE_ID=8053747	\N	\N	\N	\N	\N	\N
1426238058394	10046	1419240484994	STORE_ID=8085330	\N	\N	\N	\N	\N	\N
1426823944455	14004	21400829416411	STORE_ID=8053747	\N	\N	\N	\N	\N	\N
1426823944457	14005	1410167493109	STORE_ID=8053747	\N	\N	\N	\N	\N	\N
1426823944458	14006	21400829416481	STORE_ID=8053747;STORE_ID=8053747;STORE_ID=8053747;	\N	\N	\N	\N	\N	\N
1426823944460	99056	14375585582120	\N	\N	\N	\N	\N	\N	\N
1439368732427	16003	3	\N	Warning - Анхааруулах төрлийн сонордуулга	\N	\N	\N	\N	\N
1438683865467	10049	Bataa9999999 8	\N	Bataa1010101010	\N	\N	\N	\N	\N
1439368732430	16004	4	\N	Error - Алдаа төрлийн сонордуулга	\N	\N	\N	\N	\N
1439368732413	16001	1	\N	Success - Амжилттай сонордуулга.	\N	\N	\N	\N	\N
1439368732424	16002	2	\N	Info - Мэдэгдэл төрлийн нордуулга	\N	\N	\N	\N	\N
1425517667078	10046	21400829416401	STORE_ID=8053747	\N	\N	\N	\N	\N	\N
5	99055	14263144293716	\N	\N	\N	\N	\N	\N	\N
1426823944461	99060	interactive.mn, veritech.mn	\N	\N	\N	\N	\N	\N	\N
1423046983000	10200	AAAArtEnpVo:APA91bE8DcpW7RC4AyhTsJmQ_XjRv0t72hzrs9Wnv9s1bvBVnafumCfwKHyOIuNG-5jRrflDzligDGX6lhm5K8rT-wCHPUan9D3VhCRFloRKUdoqn_btGmlFI-Cadn40L5ygjgOR1IJ8	\N	google key	\N	\N	\N	\N	\N
14230469826509	99061	https://win.interactive.mn/	\N	\N	\N	\N	\N	\N	\N
1425611135268	99072	10000	\N	\N	\N	\N	\N	\N	\N
1425611135267	99071	1	\N	\N	\N	\N	\N	\N	\N
9999	9999	44000	\N	\N	\N	\N	\N	\N	\N
1462247647094	99055	4500	departmentId = 1433907571501;	4500	\N	\N	\N	\N	\N
1003	1003	QGOT7iOuCt4WDXsw3alb9kGBtpBbSxFE:bYy95JJ29yoHuS99	\N	\N	\N	\N	2018-10-26 11:47:12	\N	\N
1462168019484	10039	ЛЮ9006200123	departmentId=1433907571501;	Регистэрдлээ	\N	\N	\N	\N	\N
1462536271976	1462339412233	4-р оюу	departmentId=1433907571501;	ыаыөа	\N	\N	\N	\N	\N
1462536271997	1462339412234	3-р албан тушаал	departmentId = 1433907571501;	бб	\N	\N	\N	\N	\N
1462536272018	1462339412235	4-р албан тушаал	departmentId=1433907571501;	өбөбө	\N	\N	\N	\N	\N
1439368732433	10106	Хэрлэн	\N	\N	\N	\N	\N	\N	\N
14230469826511	1462339412232	3-р албан тушаалтны нэр	\N	\N	\N	\N	\N	\N	\N
14230469826512	1462339412233	4-р албан тушаалтны нэр	\N	\N	\N	\N	\N	\N	\N
1462273871642	10039	бөб	departmentId = 14308094593753;	өбөб	\N	\N	\N	\N	\N
14230469826513	1462339412234	3-р албан тушаал	\N	\N	\N	\N	\N	\N	\N
14230469826514	1462339412235	4-р албан тушаал	\N	\N	\N	\N	\N	\N	\N
1462536271940	1462339412232	3-р оюучулуун	departmentId=1433907571501;	ыаыа	\N	\N	\N	\N	\N
10105	10105	1	\N	\N	\N	\N	\N	\N	\N
1439368732434	10107	01	\N	\N	\N	\N	\N	\N	\N
1439368732435	10108	123456	\N	\N	\N	\N	\N	\N	\N
99032	99032	15	\N	\N	\N	\N	\N	\N	\N
99033	99033	99999	\N	\N	\N	\N	\N	\N	\N
1462264265053	1472543466383	@	\N	\N	\N	\N	\N	\N	\N
1426823944463	99065	707863289358861	\N	\N	\N	\N	\N	\N	\N
1426823944462	99064	CAAV3ZAdUJZAyMBABDB2VKEq5II0VBLIzPY3OfzvzdE487FOkSnsHO3jC1gHSDWU8JLEueY7KUzblADMoX6vS0NMIByo0zQqixZBqJ2VKqZBJwZBZCVorhyB9uJjXPnlu9QTzlTeGJVKCo7CmueDzytCDUcIVbCmg0QBkZBj6zYZCXqnnNEKA2G8aNinWZAKFZBOgSFNvdmVeNkVUEZAgccitDCE	\N	\N	\N	\N	\N	\N	\N
1425611135266	99068	1	\N	\N	\N	\N	\N	\N	\N
14230469826510	99075	0	\N	\N	\N	\N	\N	\N	\N
1462339401793	10031	vvvv	departmentId = 1461043770227;	vvvv	\N	\N	\N	\N	\N
1462339401631	10031	fdf	departmentId=1433907571501;	dfdfdfdf	\N	\N	\N	\N	\N
10104	10104	0	\N	\N	\N	\N	\N	\N	\N
99034	99034	6	\N	\N	\N	\N	\N	\N	\N
99035	99035	140505	\N	\N	\N	\N	\N	\N	\N
99036	99036	15	\N	\N	\N	\N	\N	\N	\N
99037	99037	2139	\N	\N	\N	\N	\N	\N	\N
1439368732431	10104	Дорнод	\N	\N	\N	\N	\N	\N	\N
1439368732432	10105	21	\N	\N	\N	\N	\N	\N	\N
1462168016260	10038	Тестийн хэлтэс	departmentId=1433907571501;	FDSF	\N	\N	\N	\N	{"value":{"CONFIG_VALUE":{"en":"Test department"}}}
1462238201317	10029	456dd	departmentId=1433907571501;	456	\N	\N	\N	\N	\N
1462264265052	10031	Маркетингийн хэлтэс11	departmentId = 14308094593753;	Маркетингийн хэлтэс1	\N	\N	\N	\N	\N
1462238201318	1472116142572	123-123	departmentId=1000000000;	TDB	\N	\N	\N	\N	\N
1462238201319	1472116142572	321-321	departmentId=1433907571501;	Golomt	\N	\N	\N	\N	\N
14230469826519	1472543466387	55	\N	\N	\N	\N	\N	\N	\N
100005	100001	CORE	\N	CORE	CORE	\N	\N	\N	\N
1472543466393	1472543466393	1	\N	1 бол тийн 0 null бол үгүй	\N	\N	2019-06-24 15:31:02	\N	\N
1472543466392	1472543466392	1	\N	\N	\N	\N	\N	\N	\N
1491468612114817	1472543466411	1463464460646	\N	\N	\N	\N	\N	\N	\N
30001	30001	1	\N	\N	\N	\N	\N	\N	\N
20005	20005	1	\N	\N	\N	\N	\N	\N	\N
15456	70000	Veritech LLC	\N	Veritech LLC	Veritech LLC English	\N	\N	\N	\N
1490337205145123	1472543466398	administrator	\N	\N	\N	\N	\N	\N	\N
1490337370971980	1472543466404	local	\N	\N	\N	\N	\N	\N	\N
1490337379020274	1472543466405	interactive.local	\N	\N	\N	\N	\N	\N	\N
200000	200000	CORE	\N	\N	\N	\N	2017-10-04 10:43:42	\N	\N
1555	1555	1	\N	\N	\N	\N	\N	\N	\N
1491216627191517	1472543466389	1	\N	\N	\N	\N	\N	\N	\N
1491468612114818	1472543466412	16372245835031	\N	\N	\N	\N	\N	\N	\N
1491985814116318	1472543466415	noreply@interactive.mn	\N	\N	\N	\N	\N	\N	\N
1491985823044252	1472543466416	RN$N2xMaOQi6	\N	\N	\N	\N	\N	\N	\N
1491985834544996	1472543466417	26	\N	\N	\N	\N	\N	\N	\N
1491986211003219	1472543466419	RN$N2xMaOQi6	\N	\N	\N	\N	\N	\N	\N
1491986223836406	1472543466420	noreply@interactive.mn	\N	\N	\N	\N	\N	\N	\N
1491986229317029	1472543466421	noreply@interactive.mn	\N	\N	\N	\N	\N	\N	\N
1491986238762702	1472543466422	host154.hostmonster.com	\N	\N	\N	\N	\N	\N	\N
1492417392842487	103	socialInsuranceReport	\N	\N	\N	\N	\N	\N	\N
1492432182289039	106	payrollReports	\N	\N	\N	\N	\N	\N	\N
14230469826518	1472543466386	1481012531542147	\N	\N	\N	\N	\N	\N	\N
14230469826520	1472543466388	1456989358894	\N	\N	\N	\N	\N	\N	\N
1491986195248796	1472543466418	26	\N	\N	\N	\N	\N	\N	\N
101	100	Dev0$	\N	\N	\N	\N	\N	\N	\N
1492056069379	1072	/home/backend/TDB/cgw-test.pfx	certPath	test	\N	\N	2023-03-15 15:37:23	\N	\N
1492407398637647	101	PAYROLL_REPORT_001	\N	\N	\N	\N	\N	\N	\N
1461717571404	1461717571403	1	\N	\N	\N	\N	\N	\N	\N
102	102	1	\N	\N	\N	\N	2017-07-17 00:00:00	\N	\N
1472543466396	1472543466396	1	\N	\N	\N	\N	\N	\N	\N
1490337197289076	1472543466397	https://jira.golomtbank.local/rest/api/2/issue	\N	http://localhost:8080/erp-services/resources/jira/issue	\N	\N	\N	\N	\N
1490337214116798	1472543466399	mamacita123	\N	password	\N	\N	\N	\N	\N
1490337352107267	1472543466402	\N	\N	\N	\N	\N	\N	\N	\N
1490337395564302	1472543466407	Administrator	\N	\N	\N	\N	\N	\N	\N
1490337407259800	1472543466408	Veritech2o20	\N	\N	\N	\N	\N	\N	\N
1491985807075815	1472543466414	noreply@interactive.mn	\N	\N	\N	\N	\N	\N	\N
1492418190116907	104	taxReports	\N	\N	\N	\N	\N	\N	\N
14230469826516	1472543466384	1	\N	\N	\N	\N	\N	\N	\N
14230469826517	1472543466385	0	\N	\N	\N	\N	\N	\N	\N
1477543796166	10038	Оргил ХХК	departmentId=1477463077020;	\N	\N	\N	\N	\N	\N
1477543796239	10039	5057880	departmentId=1477463077020;	\N	\N	\N	\N	\N	\N
15877112512694061	15877112512694061	0	\N	\N	\N	\N	\N	\N	\N
1477543796325	10029	Чимэг	departmentId=1477463077020;	\N	\N	\N	\N	\N	\N
1477543796340	10031	Энх-Уянга	departmentId=1477463077020;	\N	\N	\N	\N	\N	\N
1477543796368	1462339412234	Батмягмар	departmentId=1477463077020;	\N	\N	\N	\N	\N	\N
100003	100001	JIRA	\N	JIRA	JIRA	\N	\N	\N	\N
1489656609496	10031	Ерөнхий нягтлан	departmentId=1000000000;	\N	\N	\N	\N	\N	\N
14230469826524	1472543466394	1	\N	\N	\N	\N	\N	\N	\N
1489656609434	10029	Ерөнхий захирал	departmentId=1000000000;	\N	\N	\N	\N	\N	\N
1490337333536143	1472543466400	172.169.88.2	\N	WIN-SERVER.interactive.local	\N	\N	\N	\N	\N
1490337343634625	1472543466401	389	\N	\N	\N	\N	\N	\N	\N
1490337362160204	1472543466403	interactive	\N	\N	\N	\N	\N	\N	\N
1490337387819396	1472543466406	OU=Employee,DC=interactive,DC=local	\N	\N	\N	\N	\N	\N	\N
1490611101817719	1472543466410	3	\N	\N	\N	\N	\N	\N	\N
1491985842353403	1472543466413	host154.hostmonster.com	\N	\N	\N	\N	\N	\N	\N
1491993318302064	1472543466423	mail.interactive.	\N	\N	\N	\N	\N	\N	\N
1492419785531218	105	prlReports	\N	\N	\N	\N	\N	\N	\N
1492486792188151	107	cardMenu1	\N	\N	\N	\N	\N	\N	\N
1539691394407483	8889	FROM_OLD_KEY	\N	\N	\N	\N	\N	\N	\N
1002	1002	https://api.khanbank.com/v1/auth/token?grant_type=client_credentials	\N	\N	\N	\N	2018-10-26 11:45:38	\N	\N
1004	1004	https://api.khanbank.com/v1/	\N	\N	\N	\N	2018-10-26 11:48:41	\N	\N
1492056069382	1072	https://192.168.191.27:8080/api/trusted	serviceUrl	test	\N	\N	2023-03-15 15:37:23	\N	\N
1492056069384	1472543466391	55	anyBIC departmentId=1	anyBIC	\N	\N	\N	\N	\N
1492056069386	1072	Sec#7677	certPass	test	\N	\N	2023-03-15 15:37:23	\N	\N
1495509006082064	1462339415235	0	\N	Ашиглана	\N	\N	\N	\N	\N
1495615471146329	1472543466424	http://192.168.204.4:8443/RateInfoServlet	\N	\N	\N	\N	\N	\N	\N
99029	12006	--------http://192.168.100.57:8085/GetTagDataConfirmed.aspx	\N	\N	\N	\N	\N	\N	\N
1501243252529284	140022	1499071751316241	\N	\N	\N	\N	\N	\N	\N
20170716001	20170716001	\N	\N	\N	\N	\N	\N	\N	\N
1501211109528829	140021	17, 21, 72, 15	\N	хаалт, ханш тэгшитгэл, салбар хооронд балансжуулах, цалин, элэгдэл	\N	\N	\N	\N	\N
1502094369224991	108	FEC_001	\N	Төлөвлөгөө шалгах төсвийн код	\N	\N	\N	\N	\N
54764298	54764298	1	\N	\N	\N	\N	\N	\N	\N
400001	40001	0	\N	\N	\N	\N	\N	\N	\N
1504759465047282	1472543466428	0	\N	\N	\N	\N	\N	\N	\N
200001	200001	2018-01-30	\N	\N	\N	\N	2017-10-04 10:43:24	\N	\N
1001	1001	1	\N	\N	\N	\N	\N	\N	\N
14007	14007	0	\N	\N	\N	\N	\N	\N	\N
1505985384116650	97	0	\N	\N	\N	\N	\N	\N	\N
40004	40004	1	\N	\N	\N	\N	\N	\N	\N
1506317205927697	4589	1	\N	\N	\N	\N	\N	\N	\N
1535964309217157	1534390362656	http://sms.unitel.mn/sendSMS.php?	\N	\N	\N	\N	\N	\N	\N
1535964309217158	1534390362657	BRHbRVW9SY	\N	\N	\N	\N	\N	\N	\N
1535964309217159	1534390362658	jdu	\N	\N	\N	\N	\N	\N	\N
9020000	9020000	1	\N	\N	\N	\N	\N	\N	\N
142304698264565	9003	kpiColDisable('fact3');	\N	\N	\N	\N	\N	\N	\N
14230469826522	1472543466390	99	\N	\N	\N	\N	\N	\N	\N
95000	95000	0	\N	\N	\N	\N	\N	\N	\N
113	8897	8	\N	\N	\N	\N	\N	\N	\N
114	667	1	\N	\N	\N	\N	\N	\N	\N
1509775716752175	94	FIN_REPORT_GL	FIN_REPORT_GL_ALL	\N	\N	\N	\N	\N	\N
1510333794618434	80	144532945991028	\N	\N	\N	\N	2021-11-07 18:33:33	\N	\N
14230469826525	1472543466395	1	\N	\N	\N	\N	\N	\N	\N
1510741692219817	1472543466433	host154.hostmonster.com;993;workflow@veritech.mn;Vs|4wsfN}M5(,	\N	\N	\N	\N	\N	\N	\N
1511146700366525	1472543466435	SELECT \n?1 AS LOCK_ID, \nCASE WHEN T1.ASSET_DEPR_METHOD_ID = 10005 THEN T1.UNIT_PROD_DEPR \nWHEN T1.CALCULATE_COST - T1.UNIT_DEPR < CALC_IN_DEPR_AMT THEN ( CASE WHEN T1.CALCULATE_COST - T1.UNIT_DEPR > 0 THEN T1.CALCULATE_COST - T1.UNIT_DEPR ELSE 0 END) ELSE T1.CALC_IN_DEPR_AMT END AS IN_DEPR_AMT, \nCASE WHEN T1.ASSET_DEPR_METHOD_ID = 10005 THEN T1.UNIT_PROD_DEPR \nWHEN T1.CALCULATE_COST - T1.TAX_DEPR_AMT < CALC_ST_IN_DEPR_AMT THEN ( CASE WHEN T1.CALCULATE_COST - T1.TAX_DEPR_AMT > 0 THEN T1.CALCULATE_COST - T1.TAX_DEPR_AMT ELSE 0 END) ELSE T1.CALC_ST_IN_DEPR_AMT END AS STANDARD_IN_DEPR_AMT, \nT1.* \nFROM \n( SELECT \nNVL(CASE WHEN T0.CALCULATE_COST = T0.UNIT_DEPR OR T0.USAGE_YEAR = 0 THEN 0 ELSE (T0.CALCULATE_COST / T0.USAGE_YEAR * T0.DAY_OF_DEPR) END,0) AS CALC_IN_DEPR_AMT, \nNVL(CASE WHEN CALC_DEPR_COST = T0.TAX_DEPR_AMT OR T0.ST_USAGE_YEAR = 0 THEN 0 ELSE (T0.CALCULATE_COST / T0.ST_USAGE_YEAR * T0.DAY_OF_DEPR) END,0) AS CALC_ST_IN_DEPR_AMT, \nT0.* FROM ( SELECT (LINE.IN_COST * LINE.BAL_QTY) - (LINE.SALVAGE_AMT * LINE.BAL_QTY) AS CALC_DEPR_COST,	\N	\N	\N	\N	\N	\N	\N
121212	12121332	1	\N	\N	\N	\N	\N	\N	\N
15878112512694085	15878112512694085	VT_DATA	\N	\N	\N	\N	\N	\N	\N
99077	99077	1	\N	\N	\N	\N	\N	\N	\N
1111	1111	/home/www/html/devnew/storage/uploads/	\N	\N	\N	\N	\N	\N	\N
1490338520099413	1472543466409	3000	\N	\N	\N	\N	\N	\N	\N
99073	999073	1	\N	\N	\N	\N	\N	\N	\N
668	668	hour	\N	\N	\N	\N	\N	\N	\N
1492056069380	1472543466391	Test#456	loginPass departmentId=1	Нэвтрэх нууц үг	\N	\N	\N	\N	\N
1539153588393	1539153588389	0	\N	\N	\N	\N	2018-10-29 11:37:06	\N	\N
1005	1005	1	\N	\N	\N	\N	2018-10-26 00:00:00	\N	\N
700001	700001	https://doob.world:6444/v1/merchant/statement/account/	\N	\N	\N	\N	\N	\N	\N
890	890	1	\N	\N	\N	\N	\N	\N	\N
56708779	56708779	\N	\N	\N	\N	\N	\N	\N	\N
991234	1472543466439	0	\N	\N	\N	\N	\N	\N	\N
1521636408658589	1521636366688	Нэг удаагийн нууц үг тул солино уу	\N	\N	\N	\N	\N	\N	\N
14008	14008	8059990	\N	\N	\N	\N	\N	\N	\N
1645081384835482	20213290	red	\N	\N	\N	\N	\N	\N	\N
1645081393170485	20213291	red	\N	\N	\N	\N	\N	\N	\N
700002	700002	https://doob.world:6444/v1/auth/token?grant_type=client_credentials	\N	\N	\N	\N	\N	\N	\N
9000223	9000223	1	\N	\N	\N	\N	\N	\N	\N
1527327965627523	1525387990004	WH_REPORT_IM_QTY	\N	\N	\N	\N	\N	\N	\N
1527755695922	10038	Юнител ХХК	departmentId=1522862360645;	\N	\N	\N	\N	\N	\N
10301	10301	rpc/interactive	\N	\N	\N	\N	\N	\N	\N
1667536105236953	1667536025302	ldapEmailGet_004	\N	\N	\N	\N	\N	\N	\N
1548382501824423	9004	1.1.12	\N	\N	\N	\N	2023-05-16 11:12:24	\N	\N
15878112513694068	15878112513694068	1	\N	\N	\N	\N	\N	\N	\N
16569215499889	10048	тест ажилтан	departmentId=1;	\N	\N	\N	\N	1	{"value":{"CONFIG_VALUE":{"en":"test employee"}}}
6565655	656565	0	\N	\N	\N	\N	\N	\N	\N
90	90	1	\N	\N	\N	\N	\N	\N	\N
15878112513694075	15878112513694070	16620845830709	msm	\N	\N	\N	\N	\N	\N
1527327965627524	1530609035338	https://dev.veritech.mn/viewer/convert.aspx	\N	\N	\N	\N	\N	\N	\N
1527327965627525	1530609035340	123	\N	\N	\N	\N	\N	\N	\N
1527327965627526	1530609035339	mroom	\N	\N	\N	\N	\N	\N	\N
1527327965627527	1530609035341	ftp://192.168.100.11	\N	\N	\N	\N	\N	\N	\N
24004	24004	1	\N	\N	\N	\N	\N	\N	\N
1548382518923811	9005	1.0.1	\N	\N	\N	\N	2023-05-16 10:24:01	\N	\N
1533107561841770	6666	3	\N	\N	\N	\N	\N	\N	\N
999	999	1	\N	\N	\N	\N	\N	\N	\N
1008	1008	1	\N	\N	\N	\N	\N	\N	\N
1548043996371797	9002	if (kpiCheckGroupSum() == false) {\n    message(info, Шалгана уу!);\n    return false;\n}	\N	\N	\N	\N	\N	\N	\N
1548043965527112	9001	[fact1].kpiColumnChange(){\n    setKpiColField('fact3', getKpiColField('fact1') * getKpiColField('fact2') / 100);\n    [totalPoint] = getKpiColSum('fact3');\n};\n[fact2].kpiColumnChange(){\n  \tsetKpiColField('fact3', getKpiColField('fact1') * getKpiColField('fact2') / 100);\n    [totalPoint] = getKpiColSum('fact3');\n};	\N	\N	\N	\N	\N	\N	\N
10212	10212	1	\N	\N	\N	\N	\N	\N	\N
10213	10213	cookie	\N	\N	\N	\N	\N	\N	\N
10214	10214	5	\N	\N	\N	\N	\N	\N	\N
1534853319601272	11	veritech2	departmentId=1;	\N	\N	\N	\N	\N	\N
1534853407886071	1539681551874	AIzaSyC8RYmijsVKDS8eju_24-lQ1YjTXnpuwF4	\N	\N	\N	\N	2018-10-18 18:05:54	\N	\N
1550066493070	1550066493066	30	\N	\N	\N	\N	\N	\N	\N
1550652522960	1550652522956	50	\N	\N	\N	\N	2020-01-27 14:16:50	\N	\N
1551592564801417	124162422	1	\N	\N	\N	\N	\N	\N	\N
2000500006	2000500006	stateregnumber,\nstateregisterednumber,\nfamilyname,\nlastname,\nfirstname,\ndateofbirth,\ngender,\nmotherregnumber,\nmotherlastname,\nmotherfirstname,\ncity,\ndistrict,\nstreet,\npreviouslastname,\npreviousfirstname,\nforiegnpassportnumber,\npasportchargerinnb,\npasportchargersurnm,\npasportchargernm, \n\nserialnumber,\ndeathdate,\nregistdate,\nregistbeginyearbnd,\nregistendyearbnd,\ncitybnd,\ndistrictbnd,\nstreetbnd,\npagecountbnd	\N	\N	\N	\N	\N	\N	\N
2000100006	2000100006	1	\N	\N	\N	\N	\N	\N	\N
2000100011	2000100011	1	\N	\N	\N	\N	\N	\N	\N
2000100014	2000100014	1	\N	\N	\N	\N	\N	\N	\N
2000100016	2000100016	1	\N	\N	\N	\N	\N	\N	\N
15878112513694076	15878112513694071	storage/uploads/process/202209/file_1663725713274459_15881351149111.png	msm	\N	\N	\N	\N	\N	\N
15878112513694077	15878112513694072	Green	msm	\N	\N	\N	\N	\N	\N
2000100021	2000100021	1	\N	\N	\N	\N	\N	\N	\N
1552989169277936	8	1	\N	\N	\N	\N	\N	\N	\N
1552991741514815	21552546548426	1	\N	\N	\N	\N	\N	\N	\N
1556096896358	10048	Батчимэг	departmentId=1024;	\N	\N	\N	\N	\N	\N
1556096896669	10051	Мими	departmentId=1024;	\N	\N	\N	\N	\N	\N
666666	66666	1	\N	\N	\N	\N	\N	\N	\N
1556641775837	10048	1110	departmentId=1000000000;	\N	\N	\N	\N	\N	\N
15878112513694078	15878112513694073	msm	msm	\N	\N	\N	\N	\N	\N
100004	100001	CORE_UAT_CASH	\N	CORE_UAT_CASH	CORE_UAT_CASH	\N	\N	\N	\N
1423046978946	990002	\N	\N	\N	\N	\N	\N	\N	\N
15878112513694079	15878112513694074	storage/uploads/process/202209/file_1662183132131406_15881351149111.png	msm	\N	\N	\N	\N	\N	\N
1663897949597072	15878112513694075	1	\N	\N	\N	\N	\N	\N	\N
1664007417388317	2000100005	1	\N	\N	\N	\N	\N	\N	\N
99030	99030	6	\N	\N	\N	\N	\N	\N	\N
99031	12005	http://192.168.100.57:8085/GetData.aspx?	\N	\N	\N	\N	\N	\N	\N
1423046987896	9000221	\N	\N	\N	\N	\N	\N	\N	\N
400000	40000	0	\N	\N	\N	\N	\N	\N	\N
1423046954857	9000222	\N	\N	\N	\N	\N	\N	\N	\N
1498115611227433	20066	1	\N	ldap_login	\N	\N	\N	\N	\N
1501243252529285	140022	1478604078396891	\N	\N	\N	\N	\N	\N	\N
12007	12007	--------http://192.168.100.57:8085/SetRefIdFinish.aspx?	\N	\N	\N	\N	\N	\N	\N
1501243252529286	140022	1478604064223931	\N	\N	\N	\N	\N	\N	\N
400002	40002	0	\N	\N	\N	\N	\N	\N	\N
1492056069387	147254346632	\N	userName	\N	\N	\N	\N	\N	\N
1492056069388	147254346632	\N	password	\N	\N	\N	\N	\N	\N
1492056069389	147254346632	\N	customer	\N	\N	\N	\N	\N	\N
1503915532672606	1472543466425	0	\N	\N	\N	\N	\N	\N	\N
1503915532672607	1472543466427	1	\N	\N	\N	\N	\N	\N	\N
779	779	0	\N	\N	\N	\N	\N	\N	\N
1505359318792003	200002	1	\N	\N	\N	\N	\N	\N	\N
1505396429905352	200003	0	\N	\N	\N	\N	\N	\N	\N
96	96	1	\N	\N	\N	\N	\N	\N	\N
1506333099109916	1472543466431	1	\N	\N	\N	\N	\N	\N	\N
98	98	1	\N	\N	\N	\N	\N	\N	\N
95	95	1	\N	\N	\N	\N	\N	\N	\N
1506317205927696	1472543466430	storage/uploads/process/config-file_1696813043895200.jpg	\N	Login-дох үеийн арын фон зураг	\N	\N	\N	\N	\N
6	99076	1	\N	\N	\N	\N	\N	\N	\N
1472543466432	1472543466432	/home/backend/phantomjs-2.1.1-linux-x86_64/bin/phantomjs	\N	\N	\N	\N	\N	\N	\N
115	111	AAAArtEnpVo:APA91bE8DcpW7RC4AyhTsJmQ_XjRv0t72hzrs9Wnv9s1bvBVnafumCfwKHyOIuNG-5jRrflDzligDGX6lhm5K8rT-wCHPUan9D3VhCRFloRKUdoqn_btGmlFI-Cadn40L5ygjgOR1IJ8	\N	Mobile notification key	\N	\N	\N	\N	\N
777	777	192.168.88.100	\N	\N	\N	\N	\N	\N	\N
1511146541970344	1472543466434	1	\N	\N	\N	\N	\N	\N	\N
200	200	1	\N	\N	\N	\N	\N	\N	\N
1537976807022	1537976807018	1	\N	\N	\N	\N	\N	\N	\N
7	778	\N	\N	\N	\N	\N	\N	\N	\N
1492056059387	1472543466391	9	roleId departmentId=1	roleId	\N	\N	\N	\N	\N
780	780	0	\N	\N	\N	\N	\N	\N	\N
781	781	0	\N	\N	\N	\N	\N	\N	\N
1472543999432	1472543999432	storage/uploads/process/config-file_1571047361568617.png	\N	Цагаан лого	\N	\N	\N	\N	\N
889	889	1	\N	\N	\N	\N	\N	\N	\N
1511146717293655	109	5100	\N	\N	\N	\N	\N	\N	\N
8906	8906	2023-10-11 18:32:01	1	\N	\N	\N	\N	\N	\N
8907	8907	2023-03-21	\N	\N	\N	\N	\N	\N	\N
150	150	https://dev.veritech.mn/	\N	http://dev.veritech.mn/	\N	\N	\N	\N	\N
1511146717293666	7777	240	\N	\N	\N	\N	\N	\N	\N
1	10038	ЦАХИУР ХХК	departmentId=21573125170457;	Тавилгын худалдаа	\N	\N	2019-11-12 11:50:57	\N	\N
1521509507107353	116699	0	\N	\N	\N	\N	\N	\N	\N
160	160	1516093916953	\N	\N	\N	\N	\N	\N	\N
6724819	6724819	host154.hostmonster.com,helpdesk@veritech.mn,helpdesk@veritech.mn,TNld64khefCZ,465,1,1	\N	smtp.gmail.com,veritechnoreply@gmail.com,veritechnoreply@gmail.com,Veritech123$-123456,465,1,1	\N	\N	\N	\N	\N
1522201831589920	11111	2	\N	Кассруу нийлүүлэлт хийдэг харилцагчийн төрөл	\N	\N	\N	\N	\N
2000200001	2000200001	1	\N	\N	\N	\N	\N	\N	\N
2000200002	2000200002	65	\N	\N	\N	\N	\N	\N	\N
2	10211	ДАРХАН СПОРТ КОМПЛЕКС	\N	\N	\N	\N	\N	\N	\N
1007	1007	1	\N	\N	\N	\N	\N	\N	\N
2000500003	2000500003	'Батлах',\n'Банкны шалгалт хийгдэж байна',\n'Шинэ','Бүртгэл хийх',\n'Гэрээ хийх',\n'Шийдвэрлэх',\n'Хүргэлт хийх',\n'Мэдээлэл шинэчлэх',\n'Пос хураах',\n'Хүсэлт хүлээн авах',\n'Хүлээгдэж байгаа',\n'Пос хүлээн авах',\n'Утсаар шийдвэрлэсэн',\n'Хасалт хийх',\n'Түдгэлзсэн',\n'Татгалзсан',\n'Татгалзах',\n'Хүлээгдэж байна'	\N	\N	\N	\N	\N	\N	\N
7778	7778	0	\N	\N	\N	\N	\N	\N	\N
99078	99078	1	\N	\N	\N	\N	\N	\N	\N
1529014682827	1529014682823	35	\N	\N	\N	\N	2018-09-27 10:54:38	\N	\N
1529014684684	1529014684680	600	\N	\N	\N	\N	2018-07-03 17:30:40	\N	\N
7779	7779	0	\N	\N	\N	\N	\N	\N	\N
1530609035341	1530609035337	govее	\N	\N	\N	\N	2020-06-03 15:15:04	\N	\N
2000100012	2000100012	1	\N	\N	\N	\N	2021-04-21 13:39:17	\N	\N
24003	24003	200108101001108990	\N	\N	\N	\N	\N	\N	\N
15877112512694062	15877112512694062	1	\N	\N	\N	\N	\N	\N	\N
15877112512694063	15877112512694063	1	\N	\N	\N	\N	\N	\N	\N
2000500004	2000500004	stateregnumber,\nstateregisterednumber,\nfamilyname,\nlastname,\nfirstname,\ndateofbirth,\ngender,\nmotherregnumber,\nmotherlastname,\nmotherfirstname,\ncity,\ndistrict,\nstreet,\npreviouslastname,\npreviousfirstname,\n\nforiegnpassportnumber,\nserialnumber,\n\ndeathdate,\nregistdate,\nregistbeginyearbnd,\nregistendyearbnd,\ncitybnd,\ndistrictbnd,\nstreetbnd,\npagecountbnd	\N	\N	\N	\N	\N	\N	\N
7781	7781	0	\N	\N	\N	\N	\N	\N	\N
7780	7780	0	\N	\N	\N	\N	\N	\N	\N
1534390362647	1534390362643	0	\N	\N	\N	\N	2018-09-12 11:48:16	\N	\N
1534390362658	1534390362654	0	\N	\N	\N	\N	2018-09-12 11:48:23	\N	\N
1535964309217156	2222	workflow@veritech.mn	\N	\N	\N	\N	\N	\N	\N
2000500005	2000500005	wiferegnumber,\r\nwifelastname,\r\nwifefirstname,\r\nhusbandregnumber,\r\nhusbandlastname,\r\nhusbandfirstname,\r\nmarrieddate,\r\nregdate	\N	\N	\N	\N	\N	\N	\N
1548382476144702	9006	2022-09-15 21:20:00	\N	\N	\N	\N	\N	\N	\N
123	123	192.168.193.11	\N	\N	\N	\N	\N	\N	\N
1009	1009	1	\N	\N	\N	\N	\N	\N	\N
2000200003	2000200003	1	\N	\N	\N	\N	\N	\N	\N
1556096896286	10038	Авто тээврийн үндэсний төв	departmentId=1024;	\N	\N	\N	\N	\N	\N
1556096896418	10049	Захирал	departmentId=1024;	\N	\N	\N	\N	\N	\N
1556096896745	10050	Мэргэжилтэн	departmentId=1024;	\N	\N	\N	\N	\N	\N
1556278330853	1556278330849	1	\N	\N	\N	\N	\N	\N	\N
1556108017113034	21552546548427	https://dev.veritech.mn/storage/uploads/process/202210/metavalue/file/file_1666261142735871.png	\N	https://dev.veritech.mn/storage/uploads/process/202203/file_1647921674634375_161580288699411.png	\N	\N	\N	\N	\N
1556108017113035	21552546548428	storage/uploads/process/202105/file_1620105483411253_15895090084881.png	\N	Background Image	\N	\N	\N	\N	\N
1556108017113036	21552546548429	#CD2A5A	\N	#CD2A5A	\N	\N	\N	\N	\N
1556108017113037	21552546548430	1	\N	\N	\N	\N	\N	\N	\N
1556108017113038	21552546548431	1	\N	\N	\N	\N	\N	\N	\N
1556108017113039	21552546548432	null	\N	\N	\N	\N	\N	\N	\N
1556108017113040	21552546548433	1	\N	\N	\N	\N	\N	\N	\N
1556108017113041	21552546548434	1	\N	\N	\N	\N	\N	\N	\N
1556108017113042	21552546548436	storage/uploads/process/202105/file_1620105483411253_15895090084881.png	\N	\N	\N	\N	\N	\N	\N
21557417747215	10048	test15	departmentId=1522862390600;	\N	\N	\N	2019-05-10 12:47:40	\N	\N
21557417747231	10051	test123456789	departmentId=1522862390600;	\N	\N	\N	2019-05-14 15:10:52	\N	\N
1548043965527200	9010	[fact1].kpiColumnChange(){\n    if(getKpiColField('fact3') > 0){\n        setKpiColField('fact4', getKpiColField('fact3') - getKpiColField('fact1') ); \n    }else {\n        setKpiColField('fact4', getKpiColField('fact2') - getKpiColField('fact1'));\n    }\n    [totalPoint] = getKpiColSum('fact4');\n};\n[fact2].kpiColumnChange(){\n    if(getKpiColField('fact3') > 0){\n        setKpiColField('fact4', getKpiColField('fact3') - getKpiColField('fact1'));\n    }else {\n        setKpiColField('fact4', getKpiColField('fact2') - getKpiColField('fact1'));\n    }\n    var a=[point].val();\n    [totalPoint] = getKpiColSum('fact2')/a;\n};\n[fact3].kpiColumnChange(){\n    if(getKpiColField('fact3') > 0){\n        setKpiColField('fact4', getKpiColField('fact3') - getKpiColField('fact1'));        \n    }else {\n        setKpiColField('fact4', getKpiColField('fact2') - getKpiColField('fact1'));\n    }\n    var a=[point].val();\n    [totalPoint] = getKpiColSum('fact3')/a;\n};	\N	\N	\N	\N	\N	\N	\N
1548043996371201	9011	\N	\N	\N	\N	\N	\N	\N	\N
1423046982645202	9012	kpiColDisable('fact4');\n\nvar a = [wfmStatusCode].val();\nvar b= [typeCode].val();\n\n\nif(b=='SELF' && (a=='NEW' || a=='SELF1' || a=='HEAD3')){\n    kpiColDisable('fact1');\n    kpiColEnable('fact2');\n    kpiColDisable('fact3');\n    kpiColDisable('fact4');\n    kpiColDisable('fact5');\n} else if (b=='SELF' &&(a=='HEAD'|| a=='HEAD1' || a=='RESELF' || a=='SELF'|| a=='DONE')){\n    kpiColDisable('fact2');\n    kpiColDisable('fact1');\n    kpiColDisable('fact3');\n   kpiColDisable('fact4');\n    kpiColDisable('fact5');\n} else if(b=='DEP' && (a=='NEW' || a=='SELF1' || a=='HEAD3'|| a=='DONE'|| a=='HEAD')){\n    kpiColDisable('fact1');\n    kpiColDisable('fact2');\n    kpiColDisable('fact3');\n    kpiColDisable('fact4');\n    kpiColDisable('fact5');\n} else if (b=='DEP' &&(a=='SELF'|| a=='HEAD1' || a=='RESELF' || a=='016')){\n    kpiColDisable('fact1');\n    kpiColDisable('fact2');\n    kpiColEnable('fact3');\n    kpiColDisable('fact4');\n    kpiColDisable('fact5');\n};	\N	\N	\N	\N	\N	\N	\N
1558596111872949	1	http://sms.unitel.mn/sendSMS.php,jdu,WXrPgq$bG,133029	\N	\N	\N	\N	\N	\N	\N
1558596710276441	2	http://27.123.214.168/smsmt/mt?servicename=jdu&username=jdu&from=133029&to=[to]&msg=[msg]	\N	\N	\N	\N	\N	\N	\N
1558596833126168	3	http://sms.skytel.mn/skysms/pushsms.php?src=133029&id=100378&dest=[to]&msg=[msg]	\N	\N	\N	\N	\N	\N	\N
1563516528285	1563516528281	http://183.177.97.56/nar/apiService/vt_product	listurl	Бараа материалын жагсаалт лавлах API	\N	\N	\N	\N	\N
1562037031310951	21552546548437	0	\N	\N	\N	\N	\N	\N	\N
1234567890	132456789	http://iis101.veritech.mn/AMADEUSBSB/index.aspx	\N	\N	\N	\N	\N	\N	\N
11199	11199	http://iis101.veritech.mn/locker/locker.aspx?	\N	\N	\N	\N	\N	\N	\N
3000011	300001	1564710586209	\N	\N	\N	\N	\N	\N	\N
3000031	300003	1548836365306	\N	\N	\N	\N	\N	\N	\N
10303	10303	1	\N	\N	\N	\N	\N	\N	\N
10304	10304	http://dev.veritech.mn/	\N	\N	\N	\N	\N	\N	\N
1018	1013	0	\N	\N	\N	\N	\N	\N	\N
3000061	300006	1447239014626	\N	\N	\N	\N	\N	\N	\N
1671606973102512	1073	uniteltest	username	\N	\N	\N	\N	\N	\N
1558596970194211	4	http://203.91.114.131/api/sendsms?sender=133029&target=[to]&content=[msg]	\N	\N	\N	\N	\N	\N	\N
1010	1010	0	\N	\N	\N	\N	\N	\N	\N
1560235822543	1560141499751	FIN_AR_AP_REPORT_STANDART_PRINT	\N	\N	\N	\N	2019-12-25 07:07:05	\N	\N
1560235914419	1560235368685	FIN_AR_REPORT_STANDART_PRINT	\N	\N	\N	\N	2019-12-24 17:30:00	\N	\N
1560235944807	1560235730462	FIN_AP_REPORT_STANDART_PRINT	\N	\N	\N	\N	2019-12-24 17:33:48	\N	\N
1011	1011	13133707	terminal	Голомтоос мэдээллийн гаргаж өгнө	\N	\N	\N	\N	\N
1012	1011	https://instore.golomtbank.com/pos/invoice/phone	socialurl	\N	\N	\N	\N	\N	\N
1013	1011	+d?#GxuL53v?{Shx=Gsw-/L;rzKdJ']Vrt7jc'H*e>(2j87u!!28YW!=rcW.7=zB	hash	Голомтоос мэдээллийн гаргаж өгнө	\N	\N	\N	\N	\N
1014	1011	https://instore.golomtbank.com/pos/invoice/check	checkurl	\N	\N	\N	\N	\N	\N
1015	1011	https://instore.golomtbank.com/pos/invoice/qr	qrurl	\N	\N	\N	\N	\N	\N
15877112512693999	15877112512693999	1	\N	\N	\N	\N	\N	\N	\N
1016	1011	https://instore.golomtbank.com/pos/settlement	settlementurl	\N	\N	\N	\N	\N	\N
15877112512694084	15877112512694085	0	\N	\N	\N	\N	\N	\N	\N
161616	151515	&lt;table class=&quot;b-table&quot;&gt; &lt;tbody&gt; &lt;tr&gt; &lt;td&gt;&lt;b&gt;Түлхүүр&lt;/b&gt;&lt;/td&gt; &lt;td&gt;1-Муу&lt;/td&gt; &lt;td&gt;2-Дундаас доош&lt;/td&gt; &lt;td&gt;3-Дунд&lt;/td&gt; &lt;td&gt;4-Сайн&lt;/td&gt; &lt;td&gt;5-Маш сайн&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td&gt;&lt;b&gt;Key&lt;/b&gt;&lt;/td&gt; &lt;td&gt;1-Unacceptable&lt;/td&gt; &lt;td&gt;2-Below average&lt;/td&gt; &lt;td&gt;3-Average&lt;/td&gt; &lt;td&gt;4-Above average&lt;/td&gt; &lt;td&gt;5-Excellent&lt;/td&gt; &lt;/tr&gt; &lt;/tbody&gt; &lt;/table&gt;	\N	\N	\N	\N	\N	\N	\N
15877112512694501	15877112512695000	001003	\N	\N	\N	\N	\N	\N	\N
1472543466489	1472543466489	Сонгон шалгаруулалтын бүртгэл 2021 оны 01 дүгээр сарын 08-ны өдрийн 17.30 цаг хүртэл явагдана.	\N	\N	\N	\N	\N	\N	\N
1472543466492	1472543466492	https://www.intagram.com	\N	\N	\N	\N	\N	\N	\N
1612778878173961	15000	1	\N	\N	\N	\N	\N	\N	\N
158	158	1	\N	\N	\N	\N	\N	\N	\N
1613022870686953	110000	677469b637342c09847623254e097f63	\N	\N	\N	\N	\N	\N	\N
1614920059393924	1578630024648	/Vendor/UpdateVendor	updateVendor	Vendor засах хаяг	\N	\N	\N	\N	\N
1614920158840112	1578630024648	/PurchaseOrder/CreatePurchaseOrder	createPO	Худалдан авалтын захиалга үүсгэх хаяг	\N	\N	\N	\N	\N
1614920251791740	1578630024648	/Item/UpdateItem	updateItem	Бараа засах хаяг	\N	\N	\N	\N	\N
16152960264761	16152960264731	1	\N	\N	\N	\N	\N	\N	\N
16170026418111	16170026418101	1	\N	\N	\N	\N	\N	\N	\N
1618368465291145	16182862193881	ylP)f2sBVfm#(xJm	password	\N	\N	\N	\N	\N	\N
1618368584812348	16182862193881	api/Org/	organizationSubUrl	\N	\N	\N	\N	\N	\N
1618974863429022	16182862193881	api/Upload	uploadSubUrl	Албан бичиг хавсаргах (.PDF өргөтгөлтэй) Дээд тал нь 100MB хэмжээ зөвшөөрнө!	\N	\N	\N	\N	\N
15878112512694067	15878112512694067	0	\N	\N	\N	\N	\N	\N	\N
1620715045855119	15878112512694068	1	\N	\N	\N	\N	\N	\N	\N
67	67	taxapi-client	\N	\N	\N	\N	\N	\N	\N
68	68	mdintegration/khalamjredirect/	\N	\N	\N	\N	\N	\N	\N
69	69	ipaddress	\N	\N	\N	\N	\N	\N	\N
70	70	0	\N	\N	\N	\N	\N	\N	\N
16660595781839	1574249825784	1	\N	\N	\N	\N	\N	1	\N
1645083140141633	20213295	red	\N	\N	\N	\N	\N	\N	\N
164575577988510	164575577988410	1	\N	\N	\N	\N	\N	\N	\N
1068	1060	1454051895826	\N	\N	\N	\N	\N	\N	\N
15878112513694070	15878112513694070	16617628147979	munkhada	\N	\N	\N	\N	\N	\N
15878112513694071	15878112513694071	storage/uploads/process/202209/file_1663725842035551_15881351149111.png	munkhada	\N	\N	\N	\N	\N	\N
15878112513694072	15878112513694072	Green	munkhada	\N	\N	\N	\N	\N	\N
15878112513694073	15878112513694073	Munkhada	munkhada	\N	\N	\N	\N	\N	\N
15878112513694074	15878112513694074	storage/uploads/process/202208/file_1661827237325028_15881351149111.png	munkhada	\N	\N	\N	\N	\N	\N
15878112513694085	15878112513694070	16626893621649	golomt	\N	\N	\N	\N	\N	\N
15878112513694086	15878112513694071	storage/uploads/process/202209/file_1663725889867717_15881351149111.png	golomt	\N	\N	\N	\N	\N	\N
15878112513694087	15878112513694072	Green	golomt	\N	\N	\N	\N	\N	\N
15878112513694088	15878112513694073	golomt	golomt	\N	\N	\N	\N	\N	\N
15878112513694089	15878112513694074	storage/uploads/process/202209/file_1662963928033286_15881351149111.png	golomt	\N	\N	\N	\N	\N	\N
16660595786989	1602233847664	1	\N	\N	\N	\N	\N	1	\N
16660595789169	1574404969618	1	\N	\N	\N	\N	\N	1	\N
999082	999082	1	\N	Feature ашиглах эсэх: Худалдан авалтын хүсэлт ашиглах эсэх	\N	\N	\N	\N	\N
999083	999083	1	\N	Feature ашиглах эсэх: Худалдан авалтын тусгай нөхцөл	\N	\N	2022-11-18 15:49:49	\N	\N
999084	999084	1	\N	Feature ашиглах эсэх: Худалдан авалтын харьцуулалт	\N	\N	\N	\N	\N
999085	999085	1	\N	Feature ашиглах эсэх: Худалдан авалтын тендер	\N	\N	\N	\N	\N
16703844340369	10038	Интерактив Групп	departmentId=1;	\N	\N	\N	\N	1	\N
16703844341579	10051	Лхамсүрэн	departmentId=1;	\N	\N	\N	\N	1	\N
16703844342119	10050	Нягтлан	departmentId=1;	\N	\N	\N	\N	1	\N
16514881151399	123	123	\N	\N	\N	\N	\N	1	\N
1019	1014	jdbc:oracle:thin:@//172.169.88.80:1521/veritech;vr_pa;30u80R9m	\N	\N	\N	\N	\N	\N	\N
1020	1015	0	\N	\N	\N	\N	\N	\N	\N
124456388	113	0	\N	\N	\N	\N	\N	\N	\N
1561450166223	1561450133648	1	\N	\N	\N	\N	\N	\N	\N
1591072821670	1591072806005	https://doob.world:6442/v1/tax/inquiry/capitalnumber?value=	capitalTaxUrl	ҮЛ ХӨДЛӨХ ХӨРӨНГИЙН ТАТВАРЫГ НЭХЭМЖЛЭХЭЭР ЛАВЛАХ ХАЯГ	\N	\N	\N	\N	\N
1587471008966697	12	veritech2	departmentId=1;	\N	\N	\N	\N	\N	\N
1017	1012	1	\N	\N	\N	\N	\N	\N	\N
1562221358546178	7	storage/uploads/process/file_1566359458873361_15647086977811.jpg	\N	\N	\N	\N	\N	\N	\N
1562221358546179	21552546548438	https://dev.veritech.mn/storage/uploads/process/file_1589774363352839_15871096374671.gif	\N	\N	\N	\N	\N	\N	\N
1564030097540912	1563516528281	http://183.177.97.56/nar/apiService/vt_balance	balanceurl	Бараа материалын үлдэгдэл лавлах API	\N	\N	\N	\N	\N
3000041	300004	1564467018719	\N	\N	\N	\N	\N	\N	\N
3000051	300005	1565065494554	\N	\N	\N	\N	\N	\N	\N
154984531	42951	0	\N	\N	\N	\N	\N	\N	\N
69526105	69526089	0	\N	\N	\N	\N	\N	\N	\N
4295199	429510	0	\N	\N	\N	\N	\N	\N	\N
1577268505900729	21552546548582	storage/uploads/process_template/app-menu-bg.jpg	app;	new year	\N	\N	\N	\N	\N
1577954513119	1577954513116	101119	\N	\N	\N	\N	2020-01-02 17:02:55	\N	\N
1579523043467	1579523043464	https://192.168.151.175:8003/	url	Үндсэн хаяг	\N	\N	\N	\N	\N
1579523043470	1579523043464	unitel	username	\N	\N	\N	\N	\N	\N
1579523043473	1579523043464	yUGzYKwCNfwX4CBM	password	\N	\N	\N	\N	\N	\N
1579523043476	1579523043464	ESYS1698	systemCode	Системийн код	\N	\N	\N	\N	\N
1583684081308017	1581404722080073	1	\N	\N	\N	\N	\N	\N	\N
1584585363562	1584585363559	012019	\N	\N	\N	\N	\N	\N	\N
1584344436068	1584344429926	https://api.qpay.mn/v1/bill/create	createUrl	\N	\N	\N	2020-03-17 12:18:33	\N	\N
1581913259017	1581075399134	/api/erp/contract/{0}	ContractPutAndDelete	\N	\N	\N	\N	\N	\N
1585622041494	200060001	1	\N	\N	\N	\N	\N	\N	\N
42961	4296	1	\N	\N	\N	\N	\N	\N	\N
1590393822983	1590393817131	http://203.91.114.108/fushion.php/api/response	changePrice	Үнэ солих сервисийн хаяг	\N	\N	\N	\N	\N
15010	15010	'pos_portal','p-001','p-002'	\N	\N	\N	\N	\N	\N	\N
157223830586315	4295	0	\N	\N	\N	\N	\N	\N	\N
21573097382439	1567753727300	1	\N	\N	\N	\N	\N	\N	\N
1574405443020	10038	SG	departmentId=1574405438332;	\N	\N	\N	\N	\N	\N
1574405443498	10049	Гүйцэтгэх захирал	departmentId=1574405438332;	\N	\N	\N	\N	\N	\N
1574405443543	10050	Ерөнхий нягтлан	departmentId=1574405438332;	\N	\N	\N	\N	\N	\N
1574405443652	10104	ХУД-ийн 11-р хороо	departmentId=1574405438332;	\N	\N	\N	\N	\N	\N
1027	1022	0	\N	\N	\N	\N	\N	\N	\N
1084	15877112512695018	3	crmUser	\N	\N	\N	\N	\N	\N
101010	101011	http://dev.veritech.mn/	\N	\N	\N	\N	\N	\N	\N
1584965330197	1584344429926	https://api.qpay.mn/v1/bill/check	checkPostUrl	POST хүсэлтээр bill_no дамжуулж төлбөр шалгах	\N	\N	\N	\N	\N
1584766560192	1584344429926	TEST_INVOICE	templateId	Төлбөр хүлээн авагч Qpay мерчант байгууллагын данс, шимтгэлийн мэдээлэл	\N	\N	2020-03-23 17:29:09	\N	\N
1584766560195	1584344429926	TEST	merchantId	Төлбөр хүлээн авагч Qpay мерчант байгууллагын данс, шимтгэлийн мэдээлэл	\N	\N	2020-03-23 17:29:09	\N	\N
1584965330200	1584344429926	https://api.qpay.mn/v1/payment/check/{0}	checkGetUrl	GET хүсэлтээр payment_id дамжуулж төлбөр шалгах	\N	\N	2020-03-24 14:51:10	\N	\N
15877112512695018	15877112512695018	3	\N	\N	\N	\N	\N	\N	\N
1586750274498331	232323	https://iis101.veritech.mn/reportdev/	\N	\N	\N	\N	\N	\N	\N
1587711251269333	19996610	1587710862408	\N	\N	\N	\N	\N	\N	\N
1587711251269337	1587711251269337	1	\N	\N	\N	\N	\N	\N	\N
1570504453235148	21552546548785	1	\N	\N	\N	\N	\N	\N	\N
888	888	http://iis101.veritech.mn/fileconverter/Converter.aspx?mode=1&FromUrl=	\N	\N	\N	\N	\N	\N	\N
1590393817372	1590393817131	http://dev.veritech.mn/api/opensslencrypt	openssl	OpenSSL encode хийх PHP	\N	\N	\N	\N	\N
1591072828842	1591072806005	https://doob.world:6442/v1/tax/job/corporate/transaction	transactionUrl	ТАТВАР ТӨЛӨХ ХАЯГ	\N	\N	\N	\N	\N
1591072829429	1591072806005	https://doob.world:6442/v1/tax/report/corporate/succeed/	reportUrl	АМЖИЛТТАЙ ТӨЛӨГДСӨН ТАТВАР ЛАВЛАХ ХАЯГ	\N	\N	\N	\N	\N
15877112512693395	15877112512693394	1	\N	\N	\N	\N	\N	\N	\N
23232323	23232323	0	\N	\N	\N	\N	\N	\N	\N
1592453372009	1592355365227	orgil_test	branchUsername	Мобифинансаас үүсгэж өгсөн мерчант вебсайтаар нэвтэрдэг unique username.	\N	\N	2020-06-19 14:25:34	\N	\N
1592453372012	1592355365227	8753340	accountId	Таны Candy мерчант account ID	\N	\N	2020-06-19 14:25:34	\N	\N
1593408760638	1593408760635	1	\N	\N	\N	\N	2020-06-30 09:26:43	\N	\N
1593676284011971	15877112512693400	top	\N	Хамгийн дээр харуулах	\N	\N	\N	\N	\N
2000002	2000001	1	\N	\N	\N	\N	\N	\N	\N
1596443585803	1596443585800	1	\N	\N	\N	\N	\N	\N	\N
1597285472907226	15877112512693391	0	\N	\N	\N	\N	\N	\N	\N
149363304	40010	1	\N	\N	\N	\N	\N	\N	\N
14230469825778	100899	e229e0f5e591565516ca56a49d556953e2dc67	\N	It's need ot Monpass CLoud Login	\N	\N	\N	\N	\N
1600069945294117	20009550	1	\N	\N	\N	\N	\N	\N	\N
1600664646132201	153060903533	1579679842700316	\N	\N	\N	\N	\N	\N	\N
50	50	xyp/notary.key	departmentId=1	\N	\N	\N	\N	\N	\N
51	51	storage/uploads/	\N	\N	\N	\N	\N	\N	\N
1605091163889259	15877112512694090	1	\N	\N	\N	\N	\N	\N	\N
15877112512695002	15877112512695002	0	\N	\N	\N	\N	\N	\N	\N
75	75	1614842915590041	\N	\N	\N	\N	\N	\N	\N
1611739217041323	15877112512695007	1	\N	\N	\N	\N	\N	\N	\N
16163958878511	1582164324141	0	\N	\N	\N	\N	\N	\N	\N
16178666601531	16178666601511	1	\N	\N	\N	\N	\N	\N	\N
82	82	0	\N	\N	\N	\N	\N	\N	\N
1618298485312229	16182862193881	api/Token/	tokenSubUrl	\N	\N	\N	\N	\N	\N
1618368442225102	16182862193881	a7463ec0-d9b2-42cf-86cc-7fbfcb7ae575	apiKey	\N	\N	\N	\N	\N	\N
15878112512694062	15878112512694062	1	\N	\N	\N	\N	\N	\N	\N
1618974916660274	16182862193881	api/SendDoc	sendDocSubUrl	Байгууллага руу бичиг илгээх	\N	\N	\N	\N	\N
1069	1061	api/sendMail	\N	\N	\N	\N	\N	\N	\N
1057	1051	https://dev.veritech.mn/mdprocess/renderByTestCase	\N	\N	\N	\N	\N	\N	\N
15878112512694075	15878112512694075	0	\N	\N	\N	\N	\N	\N	\N
164931342037110	164560267084010	1	\N	\N	\N	\N	\N	\N	\N
1055	1055	1	\N	\N	\N	\N	\N	\N	\N
45487273	45487273	100	\N	100м	\N	\N	\N	\N	\N
1659339153336225	15877112512694189	06:00:00	\N	\N	\N	\N	\N	\N	\N
77	77	1	\N	\N	\N	\N	\N	\N	\N
177	177	1	\N	\N	\N	\N	\N	\N	\N
1569814894889810	10001000	0	\N	0	\N	\N	\N	\N	\N
1612772360920416	16127623358771	http://192.168.100.11/ebarimtService/Services/EBarimt/PosApi/PosApiService.svc/ExecuteReturnBill	executeReturnBillUrl	Баримт буцаах API хаяг	\N	\N	\N	\N	\N
1570504453235147	21552546548784	1	\N	\N	\N	\N	\N	\N	\N
1572502583891990	91000	1	\N	\N	\N	\N	\N	\N	\N
21573125284615	10048	Б. Эрдэнэсайхан	departmentId=21573125170457;	Гүйцэтгэх захирал	\N	\N	\N	\N	\N
1026	1021	0	\N	\N	\N	\N	\N	\N	\N
1574405443226	10051	Мөнх	departmentId=1574405438332;	\N	\N	\N	\N	\N	\N
1574405443698	10052	Менежер	departmentId=1574405438332;	\N	\N	\N	\N	\N	\N
1574679024293602	21573123740241	2019-09-01 09:00:00	\N	\N	\N	\N	\N	\N	\N
1575596237141101	1575533823041	0	\N	\N	\N	\N	\N	\N	\N
1579752414803270	21573123740243	1	\N	\N	\N	\N	\N	\N	\N
1047	1041	1689933718314910	\N	\N	\N	\N	\N	\N	\N
1032	1026	1	\N	\N	\N	\N	\N	\N	\N
1587470926282936	10302	https://uatvpn.golomtbank.com/rpc/veritech2	departmentId=1;	Veritech -н Голомт банкны CG турших хаяг	\N	\N	\N	\N	\N
999074	999074	0	\N	\N	\N	\N	\N	\N	\N
1591072806397	1591072806005	61mR6PgT8vTy3BJsnJYsTTKhU78XvJFI	username	\N	\N	\N	\N	\N	\N
1589769679152221	15877112512693389	300	\N	\N	\N	\N	\N	\N	\N
15877112512693390	15877112512693390	1	\N	\N	\N	\N	\N	\N	\N
1591072806400	1591072806005	kPlJAyb6VGhAex1F	password	\N	\N	\N	\N	\N	\N
1591072817287	1591072806005	https://doob.world:6442/v1/tax/inquiry/invoicenumber?value=	invoiceUrl	НЭХЭМЖЛЭХЭЭР ТАТВАРЫН МЭДЭЭЛЭЛ ЛАВЛАХ ХАЯГ	\N	\N	\N	\N	\N
1592453380324	1592355365227	https://z-wallet.candy.mn/rest/branch/coupon/scan?couponCode={0}	couponScanUrl	\N	\N	\N	\N	\N	\N
1592360238601286	1592355365227	https://z-wallet.monpay.mn/rest/branch/qrpurchase/generate	qrPurchaseGenerateUrl	Generate Purchase Invoice	\N	\N	2020-06-17 10:24:43	\N	\N
1600833076781	1599818240051	2121	port	\N	\N	\N	\N	\N	\N
1564030097541053	21552546548439	15	\N	mobile deer vildel hiigeegvi dohioldol	\N	\N	\N	\N	\N
232323242425	232323242425	НӨАТУС баримт	\N	\N	\N	\N	\N	\N	\N
15878112512694082	15878112512694082	1	\N	\N	\N	\N	\N	\N	\N
9846521	9846521	1	\N	\N	\N	\N	\N	\N	\N
1066	1058	1	\N	\N	\N	\N	\N	\N	\N
1067	1059	1	\N	\N	\N	\N	\N	\N	\N
149429110	149429109	SKY_RESORT	clientId	\N	\N	\N	\N	\N	\N
149429111	149429109	ArijcRG7	clientSecret	\N	\N	\N	\N	\N	\N
1603958682859	1603958677581	tracker/list	trackerListUrl	get tracker list	\N	\N	\N	\N	\N
1605787318218658	20018189	/home/tetris_log	\N	\N	\N	\N	\N	\N	\N
1609917752214134	20200	1	\N	\N	\N	\N	\N	\N	\N
16127623358801	16127623358771	http://192.168.100.11/ebarimtService/Services/EBarimt/PosApi/PosApiService.svc/ExecutePut	executePutUrl	Сугалааны баримт авах API хаяг	\N	\N	\N	\N	\N
1612772421103162	16127623358771	http://192.168.100.11/ebarimtService/Services/EBarimt/PosApi/PosApiService.svc/ExecuteSendData	executeSendDataUrl	Борлуулалтын мэдээлэл илгээх API хаяг	\N	\N	\N	\N	\N
1612772495823310	16127623358771	http://192.168.100.11/ebarimtService/Services/EBarimt/PosApi/PosApiService.svc/ExecuteGetInformation	executeGetInformationUrl	PosApi мэдээлэл харах API хаяг 192.168.100.11	\N	\N	\N	\N	\N
1612772456407013	16127623358771	http://192.168.100.11/ebarimtService/Services/EBarimt/PosApi/PosApiService.svc/ExecuteCheckApi	executeCheckApiUrl	PosApi ажиллагааг шалгах API хаяг	\N	\N	\N	\N	\N
4295201	429520	PRICE_COMPARISON_GET_004	\N	Харьцуулалт нэмэх дээрх нэгж үнийн дүн солих	\N	\N	\N	\N	\N
4295211	429521	EXT_PRICE_COMPARISON_VIEW_GET_0041	\N	Харьцуулалт засах дээрх нэгж үнийн дүн солих	\N	\N	\N	\N	\N
1044	1038	4	\N	\N	\N	\N	\N	\N	\N
1614920235741221	1578630024648	/Item/CreateItem	createItem	Бараа үүсгэх хаяг	\N	\N	\N	\N	\N
149429112	149429109	INVOICE	object_type	\N	\N	\N	\N	\N	\N
1620106078234325	15878112512694061	storage/uploads/process/202105/file_1620105483411253_15895090084881.png	\N	\N	\N	\N	\N	\N	\N
16226056688811	16226056688801	1	\N	\N	\N	\N	\N	\N	\N
149429113	149429109	https://www.customer.veritech.mn/cozy/payment?payment_id	callback_url	\N	\N	\N	\N	\N	\N
1625631949024171	16127623358771	interactive	itc_username	Хүнсний эрхийн бичгийн сервис дуудах username	\N	\N	\N	\N	\N
1627958006896743	15878112512694065	50000	sectionid2=123123,sectionid2=22211,	\N	\N	\N	\N	\N	\N
16311554350551	16311554350421	https://openapi-uat.golomtbank.com/api/utility/sol/inq	\N	Голомт API салбарын байршил url	\N	\N	\N	\N	\N
15878112512694074	15878112512694074	1	\N	\N	\N	\N	\N	\N	\N
6549841560	215844360972460	0	\N	\N	\N	\N	\N	\N	\N
1649386874155671	1602126117086	99999999	\N	\N	\N	\N	\N	\N	\N
1651666113957330	686868	43.242.241.218	\N	\N	\N	\N	\N	\N	\N
1111111111111	1111111	Storagedev	\N	\N	\N	\N	\N	\N	\N
999081	999081	1	\N	\N	\N	\N	\N	\N	\N
2001	2001	10	\N	 % - аас дээш оноо авсан шалгуулагч шалгалтанд тэнцэнэ	\N	\N	\N	\N	\N
1667961883251173	15877112512695021	1	\N	\N	\N	\N	\N	\N	\N
1570434286662079	16005	1	\N	\N	\N	\N	\N	\N	\N
1569383250311923	21552546548583	ss	\N	\N	\N	\N	\N	\N	\N
1572665418242846	1568018297998	https://192.168.6.35:9040/transaction/code/21031	depositToInternalURL	Депозитын данснаас дотоод данс руу гүйлгээ хийх хаяг	\N	\N	\N	\N	\N
21573123740243	21573123740239	1	\N	\N	\N	\N	\N	\N	\N
1573631967343	1573631931137	1	\N	\N	\N	\N	\N	\N	\N
21573125285494	10049	Гүйцэтгэх захирал	departmentId=21573125170457;	Б. Эрдэнэсайхан	\N	\N	\N	\N	\N
21573125285696	10050	Ерөнхий нягтлан	departmentId=21573125170457;	Г. Мөнх	\N	\N	\N	\N	\N
1574071722523448	21573123740240	0	\N	\N	\N	\N	\N	\N	\N
1577180028643	1577180028544	FIN_AP_REPORT_STANDART_LIST	\N	\N	\N	\N	\N	\N	\N
20	20	_thisGridClass.find('td[field=&quot;documentdate&quot;]').show(); $.each(criteriaDataArr, function ($id, $path) { if ($path['name'] == &quot;param[directionId]&quot; && $path['value'] == '1') { _thisGridClass.find('td[field=&quot;documentdate&quot;]').hide(); } });	\N	\N	\N	\N	\N	\N	\N
1579487396145439	10121111	#59B8DB	\N	\N	\N	\N	\N	\N	\N
1579523109353	1579523043464	EGW_TRANSACTION/transaction/external	externalUrl	Банк хооронд гүйлгээ хийх хүсэлт	\N	\N	\N	\N	\N
1579523109356	1579523043464	EGW_TRANSACTION/transaction/internal	internalUrl	ХасБанкны данс хооронд гүйлгээ хийх хүсэлт	\N	\N	\N	\N	\N
1579523109359	1579523043464	EGW_ACCOUNT/account/info	accountInfoUrl	Дансны мэдээлэл авах хүсэлт	\N	\N	\N	\N	\N
1579523109362	1579523043464	EGW_ACCOUNT/account/data	bankTypeUrl	Банкны мэдээлэл авах	\N	\N	\N	\N	\N
1579523109365	1579523043464	EGW_ACCOUNT/account/statement	accountStatementUrl	Дансны хуулга авах	\N	\N	\N	\N	\N
1589958518182173	1589269242587	http://192.168.193.36:5555/api/rms/templates	templates	AD RMS сервер дээрх Темплэйтүүдийг татах API хаяг	\N	\N	\N	\N	\N
15878112512694080	15878112512694080	https://install.veritech.mn/,https://qa.veritech.mn/,https://devcloud.veritech.mn/app/,https://process.veritech.mn/	\N	\N	\N	\N	\N	\N	\N
1587711251269334	1581404722080079	1	\N	\N	\N	\N	\N	\N	\N
1590401081809	1590393817131	http://203.91.114.108/fushion.php/product_api/response	changeItem	Бүтээгдэхүүний мэдээлэл солих	\N	\N	\N	\N	\N
1592819222626	1592355365227	https://z-wallet.candy.mn/rest/branch/rewardphone	rewardPhoneUrl	Мерчантын урамшуулал авах бүртгэлтэй утасны дугаар харах	\N	\N	\N	\N	\N
22222	22222	Test Salbar 2#_#0000	cashRegister=111213;	\N	\N	\N	\N	\N	\N
1593676366769540	15877112512693399	1593507975875943	\N	Хаалт хийхэд хэвлэх тайлан загвар	\N	\N	\N	\N	\N
14230469826067	100897	https://sso.monpass.mn/oauth?type=login&client_id=e229e0f5e591565516ca56a49d556953e2dc67	\N	SSO login with MonPass	\N	\N	\N	\N	\N
15877112512693401	15877112512693401	0	\N	\N	\N	\N	\N	\N	\N
142304698257789	100898	4bd921bdff894f2a3963d57bd76975fe532c67c195bba5629563e76032606e691596761163631214	\N	\N	\N	\N	\N	\N	\N
44	44	1	\N	\N	\N	\N	\N	\N	\N
1472543466450	1472543466450	#66cc00	\N	\N	\N	\N	\N	\N	\N
62	62	36eb096dcffccb3777c5a4136f0628e7	\N	\N	\N	\N	\N	\N	\N
66	66	2097192	\N	\N	\N	\N	\N	\N	\N
15877112512694096	15877112512694096	1607915542340955	\N	\N	\N	\N	\N	\N	\N
1663143735330345	15878112513694069	1529014380513	\N	\N	\N	\N	\N	\N	\N
1624418683949645	16182862193881	api/GetDoc	getDocUrl	Ирсэн бичгийн жагсаалт авах	\N	\N	\N	\N	\N
1614516493678597	15877112512695005	1	\N	\N	\N	\N	\N	\N	\N
9846516	9846515	1	\N	\N	\N	\N	\N	\N	\N
1640145236382657	15878112512694083	1	\N	\N	\N	\N	\N	\N	\N
16443796712719	16443796680739	1	\N	\N	\N	\N	\N	\N	\N
1603783641532642	1603266677652	/product/get_product/get_product/	getProductUrl	Үйлдвэрлэгчийн барааны код буцаах	\N	\N	\N	\N	\N
1603958677696	1603958677581	user/auth	authUrl	HASH авах хаяг	\N	\N	2020-10-29 16:25:49	\N	\N
1472543466440	1472543466440	#1b4588	\N	\N	\N	\N	\N	\N	\N
1472543466441	1472543466441	assets/custom/anket/img/logo.png	\N	\N	\N	\N	\N	\N	\N
1472543466442	1472543466442	https://www.facebook.com/public/Veritech-Erp	\N	\N	\N	\N	\N	\N	\N
1472543466443	1472543466443	https://twitter.com/veritech_erp/	\N	\N	\N	\N	\N	\N	\N
1472543466444	1472543466444	https://www.linkedin.com/in/national-university-of-mongolia-58a2a7b6	\N	\N	\N	\N	\N	\N	\N
1472543466445	1472543466445	Монгол, УБ, СБД, Бага тойруу-49, Мэдээлэл Технологийн Үндэсний Парк, Урд корпус	\N	\N	\N	\N	\N	\N	\N
1472543466446	1472543466446	7777-8282	\N	\N	\N	\N	\N	\N	\N
1472543466447	1472543466447	            <span class="top-contact-title">Бага тойруу-49, Мэдээлэл Технологийн Үндэсний Парк, Урд корпус</span>\r\n            <span class="top-contact-desc">Сүхбаатар дүүрэг, Улаанбаатар</span>	\N	\N	\N	\N	\N	\N	\N
1472543466448	1472543466448	Даваа - Баасан <br/>09:00 - 18:00\n   	\N	\N	\N	\N	\N	\N	\N
1472543466449	1472543466449	© 2010 - 2021 Веритех ХХК (Veritech LLC)	\N	\N	\N	\N	\N	\N	\N
15877112512694064	15877112512694064	0	\N	\N	\N	\N	\N	\N	\N
15877112512694065	15877112512694065	0	\N	\N	\N	\N	\N	\N	\N
15877112512694066	15877112512694066	0	\N	\N	\N	\N	\N	\N	\N
14725434664409	14725434664409	© 2010 - 2021 Веритех ХХК (Veritech LLC)\nЗохиогчийн эрх хуулиар хамгаалагдсан. Сайт дээрх бүх материалыг хуулбарлахыг хориглоно.	\N	\N	\N	\N	\N	\N	\N
14725434664401	14725434664401	assets/custom/anket/img/logo_white.png	\N	\N	\N	\N	\N	\N	\N
1564030097541052	21552546548578	1	\N	\N	\N	\N	\N	\N	\N
1568265154991779	1568018297998	https://192.168.6.35:9040/transaction/code/20045	internalToInternalURL	Дотоодын данснаас дотоод данс руу гүйлгээ хийх хаяг	\N	\N	\N	\N	\N
1570070251925299	1011	https://instore.golomtbank.com/pos/payment/cancel	cancel	\N	\N	\N	\N	\N	\N
1562142297333019	1560235730463	0	\N	\N	\N	\N	\N	\N	\N
1562142297333020	1560235730464	0	\N	\N	\N	\N	\N	\N	\N
1570504441013865	21552546548682	1	\N	\N	\N	\N	\N	\N	\N
1577178008428	1577178008425	FIN_AR_REPORT_STANDART_LIST	\N	\N	\N	\N	\N	\N	\N
1582007915957	1581075399134	/api/erp/project/site	ProjectSite	\N	\N	\N	\N	\N	\N
1580262815093488	91004	1	\N	\N	\N	\N	\N	\N	\N
1578630024651	1578630024648	https://localhost:44375/api	mainUrl	MSDynamics -тай холбогдох манай API хаяг	\N	\N	\N	\N	\N
1578630024654	1578630024648	http://192.168.12.106:7047/CU_WEB1/WS/Central%20Express%20Co.%2C%20Ltd/Page/	customerServiceUrl	Премиумын сервисийн хаяг	\N	\N	\N	\N	\N
1579487367821420	101111	#92DC76	\N	\N	\N	\N	\N	\N	\N
1581075399137	1581075399134	veritech	username	Хэрэглэгчийн нэр	\N	\N	\N	\N	\N
1581075399140	1581075399134	Veritech!@#89	password	Нууц үг	\N	\N	\N	\N	\N
1581075399143	1581075399134	http://www.centrals.mn	url	Үндсэн хаяг	\N	\N	\N	\N	\N
1581075411324	1581075399134	/api/erp/company	Company	\N	\N	\N	\N	\N	\N
1581075416220	1581075399134	/api/erp/contract	Contract	\N	\N	\N	\N	\N	\N
1581075416224	1581075399134	/api/erp/contract/mix	ContractMix	\N	\N	\N	\N	\N	\N
1581075416230	1581075399134	/api/erp/driver	Driver	\N	\N	\N	\N	\N	\N
1581075416233	1581075399134	/api/erp/employee	Employee	\N	\N	\N	\N	\N	\N
1581075416236	1581075399134	/api/erp/pomp	Pomp	\N	\N	\N	\N	\N	\N
1581075416528	1581075399134	/api/erp/project	Project	\N	\N	\N	\N	\N	\N
1581075400302	1581075399134	/api/erp/user/login	Security	\N	\N	\N	2020-02-10 11:44:39	\N	\N
1581075414148	1581075399134	/api/erp/mix	Mix	\N	\N	\N	\N	\N	\N
1585622064400	1585622064397	1	\N	\N	\N	\N	\N	\N	\N
2000	2000	1561614463120	\N	\N	\N	\N	\N	\N	\N
1589769679152220	1581404722080080	1	\N	0 or 1	\N	\N	\N	\N	\N
34	34	1	\N	\N	\N	\N	\N	\N	\N
35	35	1	\N	\N	\N	\N	\N	\N	\N
1591072811350	1591072806005	https://doob.world:6442/v1/tax/inquiry/register?pin=	tinUrl	ТАТВАРААС ХАРИЛЦАГЧИЙН TIN ДУГААР ЛАВЛАХ хаяг	\N	\N	\N	\N	\N
1591668899818981	20002110	https://27.123.214.44/	\N	\N	\N	\N	\N	\N	\N
1594274113517	1594274113514	0	\N	\N	\N	\N	\N	\N	\N
1597911880217	10	veritech	departmentId=1517569851338;	\N	\N	\N	\N	\N	\N
15877112512693402	15877112512693402	1	\N	\N	\N	\N	\N	\N	\N
15877112512694001	15877112512694001	1	\N	\N	\N	\N	\N	\N	\N
15877112512694002	15877112512694002	1	\N	\N	\N	\N	\N	\N	\N
15877112512694003	15877112512694003	mongolian	\N	\N	\N	\N	\N	\N	\N
15877112512694004	15877112512694004	mn	\N	\N	\N	\N	\N	\N	\N
15877112512694005	15877112512694005	png,gif,jpeg,pjpeg,jpg,x-png,bmp,tiff	\N	\N	\N	\N	\N	\N	\N
15877112512694006	15877112512694006	png,gif,jpeg,pjpeg,jpg,x-png,bmp,tiff,webp,svg,pdf,doc,docx,xls,xlsx,xlsm,ppt,pptx,zip,rar,xml,vsdx,bpm,mp3,mp4,wav,txt,tif,wmv,ifc	\N	\N	\N	\N	\N	\N	\N
15877112512694007	15877112512694007	91943040	\N	\N	\N	\N	\N	\N	\N
15877112512694008	15877112512694008	1	\N	\N	\N	\N	\N	\N	\N
15877112512694009	15877112512694009	appmenu	\N	\N	\N	\N	\N	\N	\N
15877112512694010	15877112512694010	0	\N	\N	\N	\N	\N	\N	\N
15877112512694011	15877112512694011	1	\N	\N	\N	\N	\N	\N	\N
1592205309532185	11000	#38568c	\N	Төлөвлөгөөний цаг	\N	\N	\N	\N	\N
15877112512694013	15877112512694013	1	\N	\N	\N	\N	\N	\N	\N
15877112512694014	15877112512694014	1	\N	\N	\N	\N	\N	\N	\N
15877112512694015	15877112512694015	0	\N	\N	\N	\N	\N	\N	\N
15877112512694016	15877112512694016	1	\N	\N	\N	\N	\N	\N	\N
15877112512694017	15877112512694017	1	\N	\N	\N	\N	\N	\N	\N
15877112512694018	15877112512694018	0	\N	\N	\N	\N	\N	\N	\N
15877112512694019	15877112512694019	0	\N	\N	\N	\N	\N	\N	\N
15877112512694020	15877112512694020	1	\N	\N	\N	\N	\N	\N	\N
15877112512694021	15877112512694021	0	\N	\N	\N	\N	\N	\N	\N
15877112512694022	15877112512694022	1	\N	\N	\N	\N	\N	\N	\N
15877112512694023	15877112512694023	0	\N	\N	\N	\N	\N	\N	\N
15877112512694024	15877112512694024	1	\N	\N	\N	\N	\N	\N	\N
15877112512694025	15877112512694025	1	\N	\N	\N	\N	\N	\N	\N
15877112512694026	15877112512694026	1	\N	\N	\N	\N	\N	\N	\N
15877112512694027	15877112512694027	0	\N	\N	\N	\N	\N	\N	\N
15877112512694028	15877112512694028	0	\N	\N	\N	\N	\N	\N	\N
15877112512694029	15877112512694029	0	\N	\N	\N	\N	\N	\N	\N
15877112512694030	15877112512694030	0	\N	\N	\N	\N	\N	\N	\N
15877112512694031	15877112512694031	1	\N	\N	\N	\N	\N	\N	\N
15877112512694032	15877112512694032	0	\N	\N	\N	\N	\N	\N	\N
15877112512694033	15877112512694033	150000	\N	\N	\N	\N	\N	\N	\N
15877112512694034	15877112512694034	0	\N	\N	\N	\N	\N	\N	\N
15877112512694035	15877112512694035	1	\N	\N	\N	\N	\N	\N	\N
15877112512694036	15877112512694036	1	\N	\N	\N	\N	\N	\N	\N
15877112512694037	15877112512694037	1	\N	\N	\N	\N	\N	\N	\N
15877112512694038	15877112512694038	1	\N	\N	\N	\N	\N	\N	\N
15877112512694039	15877112512694039	0	\N	\N	\N	\N	\N	\N	\N
15877112512694040	15877112512694040	0	\N	\N	\N	\N	\N	\N	\N
15877112512694041	15877112512694041	http://192.168.100.22/VeritechOCR/OCR.svc?wsdl	\N	\N	\N	\N	\N	\N	\N
1584498474294	1581404722080075	https://erp.unitel.mn/budget/Pages/BudgetTemplate.aspx	template	Template дуудах хаяг	\N	\N	2020-03-18 00:00:00	\N	\N
15877112512694043	15877112512694043	https://win.interactive.mn/pivot_dev/index.aspx	\N	\N	\N	\N	\N	\N	\N
15877112512694044	15877112512694044	1	\N	\N	\N	\N	\N	\N	\N
15877112512694045	15877112512694045	smtp.gmail.com	\N	\N	\N	\N	\N	\N	\N
15877112512694046	15877112512694046	465	\N	\N	\N	\N	\N	\N	\N
15877112512694047	15877112512694047	ssl	\N	\N	\N	\N	\N	\N	\N
15877112512694048	15877112512694048	veritechnoreply@gmail.com	\N	\N	\N	\N	\N	\N	\N
15877112512694049	15877112512694049	Veritech123$	\N	\N	\N	\N	\N	\N	\N
15877112512694050	15877112512694050	veritechnoreply@gmail.com	\N	\N	\N	\N	\N	\N	\N
15877112512694051	15877112512694051	Veritech ERP	\N	\N	\N	\N	\N	\N	\N
15877112512694052	15877112512694052	1	\N	\N	\N	\N	\N	\N	\N
15877112512694053	15877112512694053	0	\N	\N	\N	\N	\N	\N	\N
15877112512694054	15877112512694054	0	\N	\N	\N	\N	\N	\N	\N
15877112512694055	15877112512694055	0	\N	\N	\N	\N	\N	\N	\N
15877112512694056	15877112512694056	0	\N	\N	\N	\N	\N	\N	\N
15877112512694057	15877112512694057	orgil	\N	\N	\N	\N	\N	\N	\N
15877112512694058	15877112512694058	0cm 0.1cm 0.5cm 0.1cm	\N	\N	\N	\N	\N	\N	\N
15877112512694059	15877112512694059	1	\N	\N	\N	\N	\N	\N	\N
15877112512694060	15877112512694060	0	\N	\N	\N	\N	\N	\N	\N
15877112512694067	15877112512694067	POS_ITEM_LIST_GET_004	\N	\N	\N	\N	\N	\N	\N
1614846120289580	1578630024648	/Vendor/CreateVendor	createVendor	Vendor үүсгэх хаяг	\N	\N	\N	\N	\N
15877112512694069	15877112512694069	1529014380513	\N	\N	\N	\N	\N	\N	\N
15877112512694070	15877112512694070	1	\N	\N	\N	\N	\N	\N	\N
15877112512694071	15877112512694071	1	\N	\N	\N	\N	\N	\N	\N
15877112512694072	15877112512694072	0	\N	\N	\N	\N	\N	\N	\N
15877112512694073	15877112512694073	1	\N	\N	\N	\N	\N	\N	\N
15877112512694074	15877112512694074	1	\N	\N	\N	\N	\N	\N	\N
15877112512694075	15877112512694075	1	\N	\N	\N	\N	\N	\N	\N
15877112512694076	15877112512694076	1	\N	\N	\N	\N	\N	\N	\N
15877112512694077	15877112512694077	1	\N	\N	\N	\N	\N	\N	\N
15877112512694078	15877112512694078	1	\N	\N	\N	\N	\N	\N	\N
15877112512694079	15877112512694079	1	\N	\N	\N	\N	\N	\N	\N
15877112512694080	15877112512694080	1	\N	\N	\N	\N	\N	\N	\N
15877112512694081	15877112512694081	0	\N	\N	\N	\N	\N	\N	\N
15877112512694082	15877112512694082	https://demo.monpass.mn/	\N	\N	\N	\N	\N	\N	\N
15877112512694083	15877112512694083	https://win.interactive.mn/document/	\N	https://iis101.veritech.mn/document/	\N	\N	\N	\N	\N
1584498474297	1581404722080075	https://erp.unitel.mn/budget/Pages/BudgetData.aspx	budget	Төсөв дуудах хаяг	\N	\N	2020-03-18 00:00:00	\N	\N
1592205359201836	11002	#4287f5	\N	Дуусах цаг	\N	\N	\N	\N	\N
100011	100010	2020-11-10	\N	\N	\N	\N	\N	\N	\N
16152960262281	16152960262251	1	\N	\N	\N	\N	\N	\N	\N
99998	99998	1	\N	\N	\N	\N	\N	\N	\N
9013	9013	30	\N	\N	\N	\N	\N	\N	\N
16165833684491	2000100003	1	\N	\N	\N	\N	\N	\N	\N
16165833683671	2000100001	1	\N	\N	\N	\N	2023-05-17 16:23:41	\N	\N
1618368452073373	16182862193881	golomtbank	username	\N	\N	\N	\N	\N	\N
1051	1045	1	\N	\N	\N	\N	\N	\N	\N
1619153767351271	15877112512694069	16191465968341	postype=4	Голф үед	\N	\N	\N	\N	\N
14725434664412	14725434664411	#FF0000	\N	\N	\N	\N	\N	\N	\N
669	669	1	\N	\N	\N	\N	\N	\N	\N
1627957976617772	15878112512694065	10000	sectionid=24234234	\N	\N	\N	\N	\N	\N
16305669671081	1579523043464	/home/backend/unitel.jks	jksFilePath	\N	\N	\N	\N	\N	\N
16305669671101	1579523043464	/home/backend/unitel.p12	pkcFilePath	\N	\N	\N	\N	\N	\N
1633932799003734	10001001	https://dev.veritech.mn/login/activeAccountByPass/	\N	\N	\N	\N	\N	\N	\N
15877112512693403	15877112512693403	1	\N	\N	\N	\N	\N	\N	\N
15877112512694000	15877112512694000	Veritech ERP	\N	\N	\N	\N	\N	\N	\N
1563516528286	1563516528281	http://183.177.97.56/nar/apiService/vt_asset	assetlisturl	Үндсэн хөрөнгө жагсаалт лавлах API	\N	\N	\N	\N	\N
1563516528287	1563516528281	http://183.177.97.56/nar/apiService/vt_balance_asset	assetbalanceurl	Үндсэн хөрөнгө үлдэгдэл лавлах API	\N	\N	\N	\N	\N
1568265026622018	1568018297998	https://192.168.6.35:9040/transaction/code/21051	internalToDepositURL	Дотоодын данснаас депозит данс руу гүйлгээ хийх хаяг	\N	\N	\N	\N	\N
1568269968181877	1568018297998	5099,18303,303,NF	defaultValues	branch,teller,terminal,promo	\N	\N	\N	\N	\N
1568269968181878	21552546548579	1	\N	\N	\N	\N	\N	\N	\N
1167	117	1	\N	\N	\N	\N	\N	\N	\N
1568269968181879	21552546548580	We develop together	\N	Developer Nation	\N	\N	\N	\N	\N
1023	1018	0	\N	\N	\N	\N	\N	\N	\N
21573125284435	10039	5339359	departmentId=21573125170457;	\N	\N	\N	\N	\N	\N
1423046982999	101010	storage/uploads/process/config-file_1551263712168272.png	departmentId=1433907571501;	Unitel llc	\N	\N	\N	\N	\N
1025	1020	0	\N	\N	\N	\N	\N	\N	\N
21573125285000	1462339412232	Г. Ганзул	departmentId=21573125170457;	Менежер	\N	\N	\N	\N	\N
21573125285211	10104	ХУД-ийн 11-р хороо	departmentId=21573125170457;	\N	\N	\N	\N	\N	\N
15877112512695009	15877112512695009	roboto	\N	\N	\N	\N	\N	\N	\N
1574405443068	10039	533939	departmentId=1574405438332;	\N	\N	\N	\N	\N	\N
1574405443180	10048	Эрдэнэсайхан	departmentId=1574405438332;	\N	\N	\N	\N	\N	\N
1574405443308	1462339412232	Ганзул	departmentId=1574405438332;	\N	\N	\N	\N	\N	\N
1574933373021	1574933373012	udata/insentiv	path	Файлын зам	\N	\N	\N	\N	\N
1587471008966698	55	360	\N	\N	\N	\N	\N	\N	\N
16	16	http://rest.transdep.mn:7879/Mobile/Service.asmx/	\N	\N	\N	\N	\N	\N	\N
1577355908601	1577355908598	http://10.133.11.160:5053/v1/uoffice/mdu	url	MDU байршлын нэр U-2000 руу Sync хийх хаягийн тохиргоо	\N	\N	2020-01-20 12:01:03	\N	\N
15878112512694084	15878112512694084	1	\N	\N	\N	\N	\N	\N	\N
1580280797212732	1025	0	\N	\N	\N	\N	\N	\N	\N
1581991925891	1581075399134	/api/erp/contract/mix/{0}	ContractMixPutAndDelete	\N	\N	\N	\N	\N	\N
1583304516013333	110	1	\N	\N	\N	\N	\N	\N	\N
1584344429929	1584344429926	21426AE6-5473-0B5C-700A-D7DFA7681E88	clientId	\N	\N	\N	\N	\N	\N
1584344429932	1584344429926	03573CFD-67B0-87E7-7539-A34E4AB47F68	clientSecret	\N	\N	\N	\N	\N	\N
1584344429935	1584344429926	https://api.qpay.mn/v1/auth/token	authUrl	\N	\N	\N	\N	\N	\N
1587471008966699	56	0	\N	\N	\N	\N	\N	\N	\N
1585297415849	2000100004	1	\N	\N	\N	\N	\N	\N	\N
1574071188672390	1573632256454	BiznetworkAuth [https://www.biznetwork.mn]	userAgent	\N	\N	\N	\N	\N	\N
1591668948459724	20002111	2B791562-3464-4B64-AD16-01DF34701F02	\N	\N	\N	\N	\N	\N	\N
15877112512693394	15877112512693393	1	\N	\N	\N	\N	\N	\N	\N
1591072806008	1591072806005	https://doob.world:6442/v1/auth/token?grant_type=client_credentials	tokenUrl	Токен үүсгэх хаяг	\N	\N	\N	\N	\N
1592355390789	1592355365227	https://z-wallet.monpay.mn/rest/branch/qrpurchase/check?uuid={0}	qrPurchaseCheckUrl	Check Purchase Transaction	\N	\N	2020-06-17 11:33:20	\N	\N
1592453381175	1592355365227	Test Salbar 2	couponBranchUsername	\N	\N	\N	\N	\N	\N
1592453381178	1592355365227	0000	couponBranchPassword	\N	\N	\N	\N	\N	\N
15877112512693396	15877112512693398	#CD2A5A	\N	#fff	\N	\N	\N	\N	\N
1511146709193862	1472543466436	SELECT \n?1 AS LOCK_ID,\nCASE WHEN T1.CALC_DEPR_COST - T1.UNIT_DEPR < CALC_IN_DEPR_AMT THEN (CASE WHEN T1.CALC_DEPR_COST - T1.UNIT_DEPR > 0 THEN T1.CALC_DEPR_COST - T1.UNIT_DEPR ELSE 0 END) ELSE T1.CALC_IN_DEPR_AMT END AS IN_DEPR_AMT,\nCASE WHEN T1.CALC_DEPR_COST - T1.TAX_DEPR_AMT < CALC_ST_IN_DEPR_AMT THEN (CASE WHEN T1.CALC_DEPR_COST - T1.TAX_DEPR_AMT > 0 THEN T1.CALC_DEPR_COST - T1.TAX_DEPR_AMT ELSE 0 END) ELSE T1.CALC_ST_IN_DEPR_AMT END AS STANDARD_IN_DEPR_AMT,\nT1.*\nFROM \n(SELECT CASE WHEN CALC_DEPR_COST = T0.UNIT_DEPR OR T0.USAGE_YEAR = 0 THEN 0 ELSE (T0.CALC_DEPR_COST / T0.USAGE_YEAR / ?3 * ?2) END AS CALC_IN_DEPR_AMT,\nCASE WHEN CALC_DEPR_COST = T0.TAX_DEPR_AMT OR T0.ST_USAGE_YEAR = 0 THEN 0 ELSE (T0.CALC_DEPR_COST / T0.ST_USAGE_YEAR / ?3 * ?2) END AS CALC_ST_IN_DEPR_AMT,\nT0.* FROM (SELECT ((LINE.depr_cost * LINE.BAL_QTY) - (LINE.SALVAGE_AMT * LINE.BAL_QTY) AS CALC_DEPR_COST,	\N	\N	\N	\N	\N	\N	\N
1599818240054	1599818240051	192.168.193.11	host	\N	\N	\N	\N	\N	\N
1599818240057	1599818240051	Baagii	username	\N	\N	\N	\N	\N	\N
1599818240060	1599818240051	123	password	\N	\N	\N	\N	\N	\N
1038	1032	1	\N	\N	\N	\N	\N	\N	\N
1021	21	1	\N	\N	\N	\N	\N	\N	\N
232323242424	232323242424	1	\N	\N	\N	\N	\N	\N	\N
1603266677655	1603266677652	http://66.181.175.8:8000/transaction	url	Үндсэн хаяг	\N	\N	2020-10-22 10:25:48	\N	\N
1603266677658	1603266677652	03e31be9b39f0ac618f1b4765675527b1e77648e	token	токен	\N	\N	2020-10-22 10:25:48	\N	\N
1603266677661	1603266677652	/thirdparty/check_info/	checkInfoUrl	Хэрэглэгчийн мэдээлэл шалгах URL	\N	\N	2020-10-22 10:25:48	\N	\N
1603782189526625	1603266677652	/thirdparty/check_transaction/	checkTransactionUrl	Гүйлгээний мэдээлэл шалгах	\N	\N	\N	\N	\N
1616665204254951	159	1616665153277622	\N	\N	\N	\N	\N	\N	\N
1652346463303363	15878112512694099	1	\N	\N	\N	\N	\N	\N	\N
1574071277304617	1573632256454	2794279322	apiCode	\N	\N	\N	\N	\N	\N
1574071293297601	1573632256454	ahyuqypza6emnrfw02tng2il00gbz0m398l9fq0neh8g1r8xzq2gjr9e46x58at4hqnu02dftg5r6m9g	apiSecret	\N	\N	\N	\N	\N	\N
1574071321123775	1573632256454	https://api.zangia.mn	baseUrl	API үндсэн хаяг	\N	\N	\N	\N	\N
1574071475180512	1573632256454	/send/job/format.json	sendJob	Ажлын байрны зар шинээр үүсгэх болон засварлах	\N	\N	\N	\N	\N
1574071618334345	1573632256454	/get/addrphone/format.json	getAddrphone	https://www.zangia.mn сайтад өөрийн гишүүнчлэл дээр үүсгэсэн хаяг байршил болон холбоо барих мэдээллийг авах	\N	\N	\N	\N	\N
1574071662082191	1573632256454	/get/ankets/format.json	getAnkets	Зарын тусгай кодоор тухайн зард ирсэн анкетуудын мэдээллийг авах	\N	\N	\N	\N	\N
1574071722523447	1573632256454	/get/options/format.json	getOptions	Ажлын байрны зар, анкетад хамааралтай сонголтын утгуудыг авах	\N	\N	\N	\N	\N
15877112512695003	15877112512695008	1539566200238	\N	\N	\N	\N	\N	\N	\N
15877112512695010	15877112512695010	1	\N	\N	\N	\N	\N	\N	\N
16147351507201	16147351507171	interactive_payroll	username	\N	\N	\N	2021-03-04 18:23:25	\N	\N
16147351507231	16147351507171	X3sTjxRJdJGX3uzD	password	\N	\N	\N	\N	\N	\N
16147351507261	16147351507171	https://payroll.gov.mn/rest/payroll-service/token/getUserToken	tokenUrl	\N	\N	\N	\N	\N	\N
16147351507291	16147351507171	https://payroll.gov.mn/rest/payroll-service/general/getGeneralAccountApi	getGeneralAccountApiUrl	\N	\N	\N	\N	\N	\N
1616128256247810	232424	0	\N	\N	\N	\N	\N	\N	\N
1625641721805113	16127623358771	https://auth.itc.gov.mn/auth/realms/ITC/protocol/openid-connect/token	itc_tokeUrl	Хүнсний эрхийн бичгийн сервис рүү хандах Access token авах хаяг	\N	\N	\N	\N	\N
16305669671111	1579523043464	45SYkdfc34fh2Zrr	certificatePass	\N	\N	\N	\N	\N	\N
1635837213822501	21552546548435	#FFFFFF	\N	Жишээ нь : #0077BD	\N	\N	\N	\N	\N
1511146717293654	1472543466437	SELECT \n?1 AS LOCK_ID, \nCASE WHEN T1.CALC_DEPR_COST - T1.UNIT_DEPR < CALC_IN_DEPR_AMT THEN (CASE WHEN T1.CALC_DEPR_COST - T1.UNIT_DEPR > 0 THEN T1.CALC_DEPR_COST - T1.UNIT_DEPR ELSE 0 END) ELSE T1.CALC_IN_DEPR_AMT END AS IN_DEPR_AMT, \nCASE WHEN T1.CALC_DEPR_COST - T1.TAX_DEPR_AMT < CALC_ST_IN_DEPR_AMT THEN (CASE WHEN T1.CALC_DEPR_COST - T1.TAX_DEPR_AMT > 0 THEN T1.CALC_DEPR_COST - T1.TAX_DEPR_AMT ELSE 0 END) ELSE T1.CALC_ST_IN_DEPR_AMT END AS STANDARD_IN_DEPR_AMT, \nT1.* \nFROM \n(SELECT CASE WHEN CALC_DEPR_COST = T0.UNIT_DEPR OR T0.USAGE_YEAR = 0 THEN 0 ELSE (T0.CALC_DEPR_COST / (12 * T0.USAGE_YEAR)) * ?2 END AS CALC_IN_DEPR_AMT, \nCASE WHEN CALC_DEPR_COST = T0.TAX_DEPR_AMT OR T0.ST_USAGE_YEAR = 0 THEN 0 ELSE (T0.CALC_DEPR_COST / (12 * T0.ST_USAGE_YEAR)) * ?2 END AS CALC_ST_IN_DEPR_AMT, \nT0.* FROM (SELECT (LINE.IN_COST * LINE.BAL_QTY) - (LINE.SALVAGE_AMT * LINE.BAL_QTY) AS CALC_DEPR_COST,	\N	\N	\N	\N	\N	\N	\N
782	782	1	\N	\N	\N	\N	\N	\N	\N
783	783	1	\N	\N	\N	\N	\N	\N	\N
15878112513694065	15878112513694065	30	\N	\N	\N	\N	\N	\N	\N
1070	1062	0	\N	\N	\N	\N	\N	\N	\N
1073	1065	\N	\N	\N	\N	\N	\N	\N	\N
16553732388689	16553732388679	2021-12-31	\N	\N	\N	\N	\N	1	\N
1076	1068	1	\N	\N	\N	\N	\N	\N	\N
1567153504668	1567153504664	0	\N	\N	\N	\N	2019-09-07 09:12:15	\N	\N
10305	10305	1	\N	\N	\N	\N	\N	\N	\N
1570504453235146	21552546548783	1	\N	\N	\N	\N	\N	\N	\N
1607523406224421	15877112512694094	0	\N	\N	\N	\N	\N	\N	\N
16139112535971	1559203603556	1	\N	\N	\N	\N	\N	\N	\N
16163961423591	16163961188101	1	\N	\N	\N	\N	\N	\N	\N
500	500	https://dev.veritech.mn/login/sisiOauth&state=OSCD6SX&scope=bio&response_type=code	\N	\N	\N	\N	\N	\N	\N
501	501	5aaf78cf1c91419196f1bc85159ebb5c	\N	\N	\N	\N	\N	\N	\N
502	502	2661535e292241999e1693ca19fe90b7.12f880b7acb9406694cec5ebca77374d	\N	\N	\N	\N	\N	\N	\N
503	503	https://auth.num.edu.mn/oauth2/oauth/token	\N	\N	\N	\N	\N	\N	\N
504	504	https://auth.num.edu.mn/resource/me	\N	\N	\N	\N	\N	\N	\N
499	499	\N	\N	\N	\N	\N	\N	\N	\N
1577238630296	1577238630293	FIN_AR_AP_REPORT_STANDART_LIST	\N	\N	\N	\N	\N	\N	\N
19	19	0	\N	\N	\N	\N	\N	\N	\N
1579084962673	1579084962670	http://10.21.64.200:8100/esme/submit	\N	ESME URL	\N	\N	\N	\N	\N
1579085384515	1577355908598	localhost	telnetHost	telnet host хаягийн тохиргоо	\N	\N	\N	\N	\N
1579085384518	1577355908598	9819	telnetPort	telnet port тохиргоо	\N	\N	\N	\N	\N
1579085384521	1577355908598	ERP-system	telnetUsername	telnet хэрэглэгчийн нэр	\N	\N	\N	\N	\N
1579085384524	1577355908598	Erp@2020	telnetPassword	telnet түлхүүр үг	\N	\N	\N	\N	\N
1031	1024	1	\N	\N	\N	\N	\N	\N	\N
147868304	147868303	1B9101	\N	\N	\N	\N	\N	\N	\N
1581404722080071	21573123740244	http://172.169.200.82/finger/FingerServiceZK.aspx?active=1	\N	\N	\N	\N	\N	\N	\N
1581913149984	1581075399134	/api/erp/company/{0}	CompanyPutAndDelete	\N	\N	\N	\N	\N	\N
301	300	0	\N	Зард анкет бөглөх	\N	\N	\N	\N	\N
1033	1027	0	\N	\N	\N	\N	\N	\N	\N
1588906770615152	15877112512693388	green	\N	Select from Erp theme. blue, purple, green,green2,orange,red,grey,dark-green,orange2	\N	\N	\N	\N	\N
1590401081419	1590393817131	http://203.91.114.108/fushion.php/shts_api/response	changeGasStation	ШТС-ийн мэдээлэл солих	\N	\N	\N	\N	\N
1603783442287519	1603266677652	/transaction/consumer/get_consumer_info/	consumerInfoUrl	Хэрэглэгчийн мэдээлэл	\N	\N	\N	\N	\N
15877112512694093	15877112512694093	0	\N	\N	\N	\N	\N	\N	\N
1603958677584	1603958677581	https://api.gaikham.com/	mainUrl	Үндсэн хаяг	\N	\N	\N	\N	\N
16154839518971	16154839518941	1	\N	\N	\N	\N	\N	\N	\N
15877112512695019	15877112512695019	storage/uploads/process/202105/file_1620105483411253_15895090084881.png	\N	\N	\N	\N	\N	\N	\N
1619144701691782	1603958677582	2022-02-14 17:49:46	\N	\N	\N	\N	\N	\N	\N
1605076428683	1604885703241	0	\N	\N	\N	\N	2020-11-12 13:04:14	\N	\N
1046	1040	0	\N	\N	\N	\N	\N	\N	\N
429522	429522	1	\N	\N	\N	\N	\N	\N	\N
15877112512693397	15877112512693397	https://mrtd.interactive.mn/mdupgrade/bugfixservice	\N	\N	\N	\N	\N	\N	\N
1624357093332243	121212	150	\N	\N	\N	\N	\N	\N	\N
15878112512694070	15878112512694070	1	\N	\N	\N	\N	\N	\N	\N
1630920359821262	15878112512694072	1	\N	\N	\N	\N	\N	\N	\N
88	88	80	\N	\N	\N	\N	\N	\N	\N
164575557874110	2000100007	1	\N	\N	\N	\N	2023-05-02 11:15:05	\N	\N
164930243874810	1472543466385	1	\N	\N	\N	\N	2022-04-07 14:58:23	1517569851338	\N
164930243875210	99054	sdfs fvvrbgbgb	\N	\N	\N	\N	2022-04-08 11:13:33	1517569851338	\N
164930243875410	10107	234234	\N	\N	\N	\N	2022-04-08 10:26:39	1517569851338	\N
164930243875610	10081	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243875810	1558083754811	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243876210	10106	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243876810	10082	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243877010	1472543466384	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243877210	10074	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243877510	99032	6516-51-65	\N	\N	\N	\N	2022-04-08 11:16:12	1517569851338	\N
164930243877910	10056	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243878110	10039	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243878310	10075	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243878510	10073	9849-84-98	\N	\N	\N	\N	2022-04-08 11:16:12	1517569851338	\N
164930243878910	15877112512693395	6516-51-65	\N	\N	\N	\N	2022-04-08 11:16:12	1517569851338	\N
164930243879310	1462339412232	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243879710	10065	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243879910	10052	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243880110	15877112512693396	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243880910	10072	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243881310	99052	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243881710	10104	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243882110	10047	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243882310	2000100002	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243882510	1585622064397	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243882710	99023	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243882910	10050	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243883110	10051	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243883510	2000100006	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243883710	10105	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243883910	2000100007	1	\N	\N	\N	\N	2023-05-02 11:15:05	1517569851338	\N
164930243884110	10038	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243884310	10061	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243884510	99030	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243884710	1462339412233	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243884910	10049	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243885110	99053	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243885310	10046	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243885510	10048	\N	\N	\N	\N	\N	\N	1517569851338	\N
164930243886110	10057	\N	\N	\N	\N	\N	\N	1517569851338	\N
1144	114	1	\N	\N	\N	\N	\N	\N	\N
1155	115	1	\N	\N	\N	\N	\N	\N	\N
1166	116	1	\N	\N	\N	\N	\N	\N	\N
1022	1017	https://sbv.digitalcredit.mn/api/nes.s.Web/NesFront;;STBM;147	\N	\N	\N	\N	\N	\N	\N
272543999432	272543999432	storage/uploads/process/config-file_1581161185710191.png	\N	Цагаан лого	\N	\N	\N	\N	\N
1572238305863155	14	1572247923506234	\N	GROUP -н жагсаалт болон нэмэх засах устгах процессийн хамт	\N	\N	\N	\N	\N
555	555	0	\N	\N	\N	\N	\N	\N	\N
21573125284777	10051	Г. Мөнх	departmentId=21573125170457;	Ерөнхий нягтлан	\N	\N	2019-11-12 11:54:47	\N	\N
21573125285852	10052	Менежер	departmentId=21573125170457;	Г. Ганзул	\N	\N	\N	\N	\N
1609922303533716	1101010	1	\N	\N	\N	\N	\N	\N	\N
1614920203702210	1578630024648	/PurchaseOrder/UpdatePurchaseOrder	updatePO	Худалдан авалтын захиалга засах хаяг	\N	\N	\N	\N	\N
1575601627883828	21573123740242	1	\N	\N	\N	\N	\N	\N	\N
12	6	1	\N	\N	\N	\N	\N	\N	\N
65498415	42952	0	\N	\N	\N	\N	\N	\N	\N
1581991928094	1581075399134	/api/erp/contract/payment/{0}	ContractPaymentPutAndDelete	\N	\N	\N	\N	\N	\N
1581991928097	1581075399134	/api/erp/driver/{0}	DriverPutAndDelete	\N	\N	\N	\N	\N	\N
1581991928100	1581075399134	/api/erp/employee/{0}	EmployeePutAndDelete	\N	\N	\N	\N	\N	\N
1581991928103	1581075399134	/api/erp/mix/{0}	MixPutAndDelete	\N	\N	\N	\N	\N	\N
1581991928106	1581075399134	/api/erp/pomp/{0}	PompPutAndDelete	\N	\N	\N	\N	\N	\N
1581991928109	1581075399134	/api/erp/project/{0}	ProjectPutAndDelete	\N	\N	\N	\N	\N	\N
1581991928112	1581075399134	/api/erp/project/site/{0}	ProjectSitePutAndDelete	\N	\N	\N	\N	\N	\N
800	800	1	\N	\N	\N	\N	\N	\N	\N
1583203225556	1577356692589	1	\N	\N	\N	\N	\N	\N	\N
1584585363762	1584585363759	09909	\N	\N	\N	\N	\N	\N	\N
1585622081036	1575862511956	1	\N	\N	\N	\N	\N	\N	\N
1586750274498332	1581404722080076	1	\N	\N	\N	\N	\N	\N	\N
1592453380006	1592355365227	https://z-wallet.candy.mn/rest/branch/coupon/check?couponCode={0}	couponCheckUrl	\N	\N	\N	\N	\N	\N
1590400967382	1590393817131	price	secretKey	Secret key	\N	\N	\N	\N	\N
1592453380009	1592355365227	https://z-wallet.candy.mn/rest/branch/login	branchLoginUrl	\N	\N	\N	\N	\N	\N
1592819222992	1592355365227	https://z-wallet.candy.mn/rest/branch/rewardphone/action	rewardPhoneActionUrl	Мерчантын урамшуулал авах утасны дугаар өөрчлөх	\N	\N	\N	\N	\N
91	57	02c29b26ca9570b569b47051d232b407	\N	\N	\N	\N	\N	\N	\N
1425611135269	58	888001	\N	\N	\N	\N	\N	\N	\N
99079	99079	1	\N	\N	\N	\N	\N	\N	\N
1600069898225091	20009549	1	\N	mobile gps location hadgalah eseh	\N	\N	\N	\N	\N
28	28	1601068302616	\N	\N	\N	\N	\N	\N	\N
1603782784528916	1603266677652	/thirdparty/cancel_transaction/	cancelTransactionUrl	Гүйлгээ цуцлах	\N	\N	\N	\N	\N
61	61	https://demo.monpass.mn/	\N	\N	\N	\N	\N	\N	\N
15877112512694095	15877112512694095	1604388712704	\N	\N	\N	\N	\N	\N	\N
1617804449914236	1602126119312	http://172.169.88.70/report_dev/	\N	\N	\N	\N	\N	\N	\N
1619145577640312	1603958677581	10	point_limit	Тохируулсан утгад тохирох тооны point -г буцаана	\N	\N	\N	\N	\N
1619247820262241	15878112512694063	0	\N	\N	\N	\N	\N	\N	\N
15878112512694068	15878112512694068	1	\N	\N	\N	\N	\N	\N	\N
1625631981239575	16127623358771	G8eFyx?Q9Ff)2aY&gt;	itc_password	Хүнсний эрхийн бичгийн сервис дуудах password	\N	\N	\N	\N	\N
16302979003321	16302979003311	https://openbank.golomtbank.com/api/v1/auth/login	loginUrl	Үндсэн хаяг	\N	\N	2021-08-30 18:29:14	\N	\N
16302979003331	16302979003311	veritech	name	\N	\N	\N	\N	\N	\N
16302979003341	16302979003311	V3r1t3ch$2021	password	\N	\N	\N	\N	\N	\N
16302979003351	16302979003311	qYeMpNNA4Uo4jzLG	sessionKey	\N	\N	\N	\N	\N	\N
16302979003361	16302979003311	0ZKgJBM0jsnK3J6e	ivKey	\N	\N	\N	\N	\N	\N
16311554583911	16311554583871	SOLINQ	\N	\N	\N	\N	\N	\N	\N
9846520	9846520	1	\N	\N	\N	\N	\N	\N	\N
1648522661212731	15877112512693459	0	\N	\N	\N	\N	\N	\N	\N
999100	999100	0	\N	Худалдан авалт - Төлбөрийн хүсэлтийн төсөв шалгах эсэх	\N	\N	\N	\N	
16537183428231	1472543466391	TESTCOR3	loginId departmentId=1	Нэвтрэх нэр	\N	\N	\N	\N	\N
164330535	999080	0	\N	\N	\N	\N	\N	\N	
164330536	9846513	0	\N	\N	\N	\N	\N	\N	
1658390522871388	1573632256454	2683121199	apiCode_companyCode=IMK	Айсмарк ХХК	\N	\N	\N	\N	\N
1658390753131402	1573632256454	2041503461	apiCode_companyCode=MLK LLC	Милко трейд ХХК	\N	\N	\N	\N	\N
1658390917333900	1573632256454	wbzobu4ktnsjumjex5l6y1ffguah2j6ni02t2u35o6er9upztu55qsxxlvbgdn7lt4f2j11w1n73hdyz	apiSecret_companyCode=IMK	Айсмарк ХХК -app secret	\N	\N	\N	\N	\N
1658390958509212	1573632256454	tzet5kjpbic2twr7sajpwvonkvlzvesqay09l26hhy9zkk0sdg73nsq2mbq5j6k8a0swtoj48kxu0xid	apiSecret_companyCode=MLK LLC	Милко трейд ХХК -app secret	\N	\N	\N	\N	\N
89	89	1	\N	\N	\N	\N	\N	\N	\N
1659338211929974	16394007712792	12	\N	\N	\N	\N	\N	\N	\N
1659339088245599	15877112512694186	22:00:00	\N	\N	\N	\N	\N	\N	\N
1659339128121052	15877112512694187	22:30:00	\N	\N	\N	\N	\N	\N	\N
15878112513694080	15878112513694070	16623420318069	buramhan	\N	\N	\N	\N	\N	\N
15878112513694081	15878112513694071	storage/uploads/process/202209/file_1662373495451274_15881351149111.jpg	buramhan	\N	\N	\N	\N	\N	\N
15878112513694082	15878112513694072	Green	buramhan	\N	\N	\N	\N	\N	\N
15878112513694083	15878112513694073	buramhan	buramhan	\N	\N	\N	\N	\N	\N
15878112513694084	15878112513694074	storage/uploads/process/202209/file_1662373495451274_15881351149111.jpg	buramhan	\N	\N	\N	\N	\N	\N
1663810973617019	1558083756136	1	\N	\N	\N	\N	\N	\N	\N
1663897270557732	15877112512693463	0	\N	\N	\N	\N	\N	\N	\N
1664172816918970	2000100010	1	\N	\N	\N	\N	\N	\N	\N
6667	6667	201403211002400047,200108111001200180,201403211002400122,201403211002400059	\N	\N	\N	\N	\N	\N	\N
1666160031304058	36	\N	\N	\N	\N	\N	\N	\N	\N
1666500058343758	1666499655755	88	\N	\N	\N	\N	\N	\N	\N
167238565	1472543466385	\N	\N	\N	\N	\N	\N	3	\N
167238567	99054	\N	\N	\N	\N	\N	\N	3	\N
167238568	10107	\N	\N	\N	\N	\N	\N	3	\N
167238569	10081	\N	\N	\N	\N	\N	\N	3	\N
167238570	1558083754811	\N	\N	\N	\N	\N	\N	3	\N
167238572	10106	\N	\N	\N	\N	\N	\N	3	\N
167238575	10082	\N	\N	\N	\N	\N	\N	3	\N
167238576	1472543466384	\N	\N	\N	\N	\N	\N	3	\N
167238577	10074	\N	\N	\N	\N	\N	\N	3	\N
167238578	99032	\N	\N	\N	\N	\N	\N	3	\N
1670294863741483	15878112513694077	16699785400639	\N	\N	\N	\N	\N	\N	\N
167238581	10056	\N	\N	\N	\N	\N	\N	3	\N
167238582	1020	\N	\N	\N	\N	\N	\N	3	\N
167238583	10039	\N	\N	\N	\N	\N	\N	3	\N
167238584	10075	\N	\N	\N	\N	\N	\N	3	\N
167238585	10073	\N	\N	\N	\N	\N	\N	3	\N
167238587	15877112512693395	\N	\N	\N	\N	\N	\N	3	\N
167238590	1462339412232	\N	\N	\N	\N	\N	\N	3	\N
167238594	10065	\N	\N	\N	\N	\N	\N	3	\N
167238595	10052	\N	\N	\N	\N	\N	\N	3	\N
167238596	1584344429926	\N	\N	\N	\N	\N	\N	3	\N
167238597	15877112512693396	\N	\N	\N	\N	\N	\N	3	\N
167238598	1585909969496	\N	\N	\N	\N	\N	\N	3	\N
167238602	10072	\N	\N	\N	\N	\N	\N	3	\N
167238604	149429109	\N	\N	\N	\N	\N	\N	3	\N
167238605	99052	\N	\N	\N	\N	\N	\N	3	\N
167238608	1574404969618	\N	\N	\N	\N	\N	\N	3	\N
167238611	10104	\N	\N	\N	\N	\N	\N	3	\N
167238614	10047	\N	\N	\N	\N	\N	\N	3	\N
167238616	2000100002	\N	\N	\N	\N	\N	\N	3	\N
167238617	1585622064397	\N	\N	\N	\N	\N	\N	3	\N
167238619	99023	\N	\N	\N	\N	\N	\N	3	\N
167238621	10050	\N	\N	\N	\N	\N	\N	3	\N
167238622	10051	\N	\N	\N	\N	\N	\N	3	\N
167238624	2000100006	\N	\N	\N	\N	\N	\N	3	\N
167238625	10105	\N	\N	\N	\N	\N	\N	3	\N
167238626	2000100007	1	\N	\N	\N	\N	2023-05-02 11:15:05	3	\N
167238628	10038	\N	\N	\N	\N	\N	\N	3	\N
167238629	10061	\N	\N	\N	\N	\N	\N	3	\N
167238630	99030	\N	\N	\N	\N	\N	\N	3	\N
167238631	1462339412233	\N	\N	\N	\N	\N	\N	3	\N
167238632	10049	\N	\N	\N	\N	\N	\N	3	\N
167238633	99053	\N	\N	\N	\N	\N	\N	3	\N
167238634	10046	\N	\N	\N	\N	\N	\N	3	\N
167238635	10048	\N	\N	\N	\N	\N	\N	3	\N
167238636	10044	2022-11-30	departmendId=16521440253979;	\N	\N	\N	2022-12-14 14:47:37	3	\N
167238638	10057	\N	\N	\N	\N	\N	\N	3	\N
1667448591122517	1667448432213	15	\N	\N	\N	\N	\N	\N	\N
1083	1077	1	\N	\N	\N	\N	\N	\N	\N
1568265264835725	1568018297998	eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJiYW5jcy10cmFuc2FjdGlvbi1zZXJ2aWNlLTEiLCJhdWQiOiJiYW5jcy10cmFuc2FjdGlvbi1zZXJ2aWNlLTEiLCJpc3MiOiJiYW5jcy10cmFuc2FjdGlvbi1zZXJ2aWNlLTEiLCJ0eXBlIjoiU3lzdGVtIiwiZXhwIjo0NTY3NjU1MDczLCJpYXQiOjE1Njc1Njg2NzN9.RfvNi0qgYBMDjNRU65HP2HLBmsNAvDP4Eg1hejmzCBD7xRfVyBCpsvBlcRmaRd3khekmePnBB7R9nhhJwfop2g	token	Гүйлгээ хийх токен	\N	\N	\N	\N	\N
1571727423050	1571727423046	2019-07-01	\N	\N	\N	\N	2019-10-22 15:47:02	\N	\N
1572502554392069	91001	1572489118022947	\N	\N	\N	\N	\N	\N	\N
1572502583891991	91002	1	\N	\N	\N	\N	\N	\N	\N
1572689636534281	91003	1	\N	\N	\N	\N	\N	\N	\N
1614245856359049	15877112512695017	0	\N	\N	\N	\N	\N	\N	\N
15	15	1	\N	\N	\N	\N	\N	\N	\N
1614508459428014	15877112512695006	1	\N	\N	\N	\N	\N	\N	\N
1577954769084	1577954769081	http://10.21.64.200:8100/esme/submit	\N	\N	\N	\N	\N	\N	\N
9999999	99999	1	\N	\N	\N	\N	\N	\N	\N
24	24	1581480427654	\N	\N	\N	\N	\N	\N	\N
1603681031303521	1603266677652	/thirdparty/process_transaction/	transactionUrl	Гүйлгээ бүртгэх - Оноо үүсгэх ба Оноо зарцуулах	\N	\N	\N	\N	\N
1603781320536538	1603266677652	/thirdparty/return_transaction/	returnUrl	Гүйлгээний буцаалт бүртгэх	\N	\N	\N	\N	\N
1577772046222132	21552546548786	0	\N	\N	\N	\N	\N	\N	\N
1594091830700	1594091830697	1	\N	\N	\N	\N	\N	\N	\N
1651116157281208	1462339412233	test	\N	test	\N	\N	\N	\N	\N
1663212278286415	16626907465869	1	\N	\N	\N	\N	\N	\N	\N
1586750274498333	1581404722080078	1	\N	\N	\N	\N	\N	\N	\N
1035	1029	1	\N	\N	\N	\N	\N	\N	\N
10306	10306	1	\N	\N	\N	\N	\N	\N	\N
1592796664258	1592355365227	Test Salbar 2	cashbackBranchUsername	\N	\N	\N	\N	\N	\N
1592796664261	1592355365227	0000	cashbackBranchPassword	\N	\N	\N	\N	\N	\N
1037	1031	1	\N	\N	\N	\N	\N	\N	\N
16165833684201	2000100002	1	\N	\N	\N	\N	\N	\N	\N
1603958677966	1603958677581	batjargal@teso.mn	username	\N	\N	\N	\N	\N	\N
1603958677969	1603958677581	35709987	password	\N	\N	\N	\N	\N	\N
1604387701866481	2323232323	1	\N	\N	\N	\N	\N	\N	\N
15877112512694091	15877112512694091	1	\N	\N	\N	\N	\N	\N	\N
1618298453621245	16182862193881	https://api.smartoffice.mn/	main_url	\N	\N	\N	\N	\N	\N
1621220295544576	15878112512694069	0	\N	\N	\N	\N	\N	\N	\N
1619097221235757	1603958677581	track/read	trackReadUrl	\N	\N	\N	\N	\N	\N
1058	1052	/home/backend/chrome/linux/chromedriver	\N	\N	\N	\N	\N	\N	\N
15878112512694076	15878112512694076	\N	\N	\N	\N	\N	\N	\N	\N
1638523568310363	1638523530172	0	\N	\N	\N	\N	\N	\N	\N
1638523586668309	1638523516468	0	\N	\N	\N	\N	\N	\N	\N
1056	1050	5	\N	\N	\N	\N	\N	\N	\N
222223254235	222223254235	1	\N	\N	\N	\N	\N	\N	\N
16703844339629	10049	Захирал	departmentId=1;	\N	\N	\N	\N	1	\N
16709819574469	10038	ИНТЕРАКТИВ	departmentId=16521440253979;	йыбөахролдп	\N	\N	\N	1	\N
1671164093369615	89922234	https://qa-starpay-easy-api.starboss.biz/	url	\N	\N	\N	\N	\N	\N
1671605240074012	1072	https://open.capitronbank.mn/v1/statements	url	\N	\N	\N	\N	\N	\N
1671606989362208	1073	UjAGnu	password	\N	\N	\N	\N	\N	\N
1671607035111620	1073	https://e.statebank.mn/CorporateGatewayTest/api/v1/Statement/Statements	url	\N	\N	\N	\N	\N	\N
1568269968181880	21552546548581	Future solutions for now — Ирээдүйн шийдлийг өнөөдрөөс	\N	\N	\N	\N	\N	\N	
1671684749283397	153060903535	1590409105168127	\N	\N	\N	\N	\N	\N	\N
167195510185291	16719550315769	Манай байгууллага нь тээвэр зуучлалын чиглэлээр нийслэл болон хөдөө орон нутагт нийт 450 гаруй объектод угсралт, суурилуулалтын ажил үйлчилгээ хийсэн туршлагатай хамт олон юм.	\N	\N	\N	\N	2023-03-09 12:54:41	1	
16719551075449	16716811387529	2	\N	\N	\N	\N	\N	16638363275429	\N
16719551075469	16719550315769	&quot;Түнэл&quot; ХХК нь 1998 онд барилгын салбарт өөрийн хувь нэмрээ оруулахаар барилга угсралт, интерьер, экстерьер, холбоо дохиолол, галын дохиолол, дотор, гадна цахилгаан угсралт, гал унтраах багаж хэрэгслийн нийлүүлэлтийн чиглэлээр Улаанбаатар хотод анх байгуулагдсан бөгөөд үйл ажиллагаагаа өргөжүүлэн аймгийн төвүүдэд салбараа нээн амжилттай ажиллаж байна. Манай хамт олон мэргэжлээрээ өндөр түвшинд бэлтгэгдсэн, туршлагатай чадварлаг ажилчид байдаг нь хийж гүйцэтгэсэн ажлын үр дүнгээрээ харагддаг билээ.	\N	\N	\N	\N	\N	16638363275429	\N
16719551075489	10000	\N	\N	\N	\N	\N	\N	16638363275429	\N
1673867903547326	1673865318036	47.92097804835511, 106.90438567289638	\N	\N	\N	\N	\N	\N	\N
1674209482286233	785	1	\N	\N	\N	\N	\N	\N	\N
1679381710803637	1472543466391	/home/backend/TDB/cgw-test.pfx	certPath	Сертификатын зам	\N	\N	\N	\N	\N
158781125126940646	158781125126940646	1	\N	\N	\N	\N	\N	\N	\N
16746349825509	16716811089169	aA	\N	\N	\N	\N	\N	1	\N
16746349825529	16716811373129	\N	\N	\N	\N	\N	\N	1	\N
16719550360879	16719550315769	123	\N	\N	\N	\N	\N	16719548733919	\N
16746349825549	16716811098329	\N	\N	\N	\N	\N	\N	1	\N
16746349825569	16716811182539	\N	\N	\N	\N	\N	\N	1	\N
16746349825589	16716811189899	\N	\N	\N	\N	\N	\N	1	\N
16746349825609	16716811194459	\N	\N	\N	\N	\N	\N	1	\N
16746349825629	16716811197829	\N	\N	\N	\N	\N	\N	1	\N
16746349825649	16716811207299	\N	\N	\N	\N	\N	\N	1	\N
16746349825669	16716811210949	\N	\N	\N	\N	\N	\N	1	\N
16746349825689	16716811214719	\N	\N	\N	\N	\N	\N	1	\N
16746349825709	16716811351249	\N	\N	\N	\N	\N	\N	1	\N
16746349825729	16716811352599	\N	\N	\N	\N	\N	\N	1	\N
16746349825749	16716811387529	\N	\N	\N	\N	\N	\N	1	\N
16746349825779	10000	\N	\N	\N	\N	\N	\N	1	\N
16746352114169	16716811089169	assets/core/image/icon/sales.png	\N	\N	\N	\N	\N	1	\N
16746352114189	16716811098329	assets/core/image/icon/sales.png	\N	\N	\N	\N	\N	1	\N
16746352114209	16716811373129	assets/core/image/icon/sales.png	\N	\N	\N	\N	\N	1	\N
16746352114229	16716811182539	\N	\N	\N	\N	\N	\N	1	\N
16746352114249	16716811189899	\N	\N	\N	\N	\N	\N	1	\N
16746352114269	16716811194459	\N	\N	\N	\N	\N	\N	1	\N
16746352114289	16716811197829	\N	\N	\N	\N	\N	\N	1	\N
16746352114309	16716811207299	\N	\N	\N	\N	\N	\N	1	\N
16746352114329	16716811210949	\N	\N	\N	\N	\N	\N	1	\N
16746352114349	16716811214719	\N	\N	\N	\N	\N	\N	1	\N
16746352114369	16716811351249	\N	\N	\N	\N	\N	\N	1	\N
16746352114389	16716811352599	\N	\N	\N	\N	\N	\N	1	\N
16746352114409	16716811387529	\N	\N	\N	\N	\N	\N	1	\N
16746352114429	16719550315769	\N	\N	\N	\N	\N	\N	1	\N
16746352114449	10000	\N	\N	\N	\N	\N	\N	1	\N
1674787132693225	16746352134839	assets/core/image/icon/sales.png	sales	Борлуулалт хийх	\N	\N	2023-01-27 12:51:09	\N	\N
1674789130875108	16746352134839	assets/core/image/icon/order.png	order	Захиалга авах	\N	\N	2023-01-30 17:05:20	\N	\N
1674789276532830	16746352134839	assets/core/image/icon/discount.png	discount	Урамшуулал	\N	\N	2023-01-30 17:44:42	\N	\N
1674789303780513	16746352134839	assets/core/image/icon/calendar.png	calendar	Хугацааны мэдэгдэл	\N	\N	2023-01-30 20:36:17	\N	\N
1674789325661822	16746352134839	assets/core/image/icon/return.png	return	Буцаалт авах	\N	\N	2023-01-30 17:44:42	\N	\N
1678353741712137	178685281	http://&lt;service-ip&gt;/erp/document/send/	\N	\N	\N	\N	\N	\N	\N
1679381885754292	1472543466391	Sec#7677	certPass	Сертификат нууц үг	\N	\N	\N	\N	\N
16751562040859	16751562040849	1	\N	\N	\N	\N	\N	1	\N
14109	14109	USER_FILE_DOWNLOAD_ROLE	\N	\N	\N	\N	\N	\N	\N
158781125126940647	158781125126940647	1	\N	\N	\N	\N	\N	\N	\N
1676012915210355	1676012894360	1	\N	f	\N	\N	\N	\N	\N
1676358520145540	20001000100	BANK	\N	\N	\N	\N	\N	\N	\N
1676358526613443	20001000100	CASH	\N	\N	\N	\N	\N	\N	\N
1676358531760103	20001000100	AP	\N	\N	\N	\N	\N	\N	\N
1677829548254330	158781125126940123	1	\N	\N	\N	\N	\N	\N	\N
200211	14002	ISUSEDEBITAMOUNTBASE	\N	\N	\N	\N	\N	\N	\N
1678791428411441	17	1	\N	\N	\N	\N	\N	\N	\N
1685430305208219	1603335140398	1	\N	\N	\N	\N	\N	\N	\N
1678864544185885	99100	6	\N	\N	\N	\N	\N	\N	\N
1679533950012048	158781125126940648	1	\N	\N	\N	\N	\N	\N	\N
16797267176879	16797267176869	1	\N	\N	\N	\N	\N	1	\N
1679978852375307	16746352134839	assets/core/image/icon/user.png	changecustomerdata	Харилцагчийн мэдээлэл өөрчлөх	\N	\N	\N	\N	\N
16800726032659	200070001	1	\N	\N	\N	\N	2023-09-07 16:43:20	1	\N
16817800800389	16817800800379	1	\N	\N	\N	\N	\N	1	\N
1682924843354808	158781125126940651	0	\N	\N	\N	\N	\N	\N	\N
16832526160219	16832526160189	1	\N	\N	\N	\N	\N	1	\N
16842280788419	16842280788409	1	\N	\N	\N	\N	\N	1	\N
1686015960682228	16855224597499	storage/uploads/process/202306/file_1686014607123943_161580288700411.png	item	Бараа	\N	\N	\N	\N	\N
1686015986197317	16855224597499	storage/uploads/process/202306/file_1686014616763912_161580288699411.png	report	Тайлан	\N	\N	\N	\N	\N
1686016043512169	16855224597499	storage/uploads/process/202306/file_1686014884103219_161580288699411.png	receivables	Авлага	\N	\N	\N	\N	\N
1686016071172435	16855224597499	storage/uploads/process/202306/file_1686014923513832_161580288699411.png	plan	Төлөвлөгөө	\N	\N	\N	\N	\N
1686016130704027	16855224597499	storage/uploads/process/202306/file_1686015004262076_161580288699411.png	return	Буцаалт	\N	\N	\N	\N	\N
1693474584829723	9992222110	http://202.21.125.54/finance/api/Check	\N	\N	\N	\N	\N	\N	\N
1686016242628148	16855224597499	storage/uploads/process/202306/file_1686015076264616_161580288699411.png	route	Маршрут	\N	\N	\N	\N	\N
1686016285177367	16855224597499	storage/uploads/process/202306/file_1686015112051159_161580288699411.png	shipmentOrder	Ачилтын захиалга	\N	\N	\N	\N	\N
1686016341512250	16855224597499	storage/uploads/process/202306/file_1686015200116831_161580288699411.png	income	Орлого	\N	\N	\N	\N	\N
1686884384394096	1462339415236	880000	\N	\N	\N	\N	\N	\N	\N
1687966099305323	100002	40	\N	\N	\N	\N	\N	\N	\N
3000	3000	1	\N	\N	\N	\N	\N	\N	\N
8000	8000	1459917010269	\N	Ирсэн бичгийн авто дугаарлалт	\N	\N	\N	\N	\N
8002	8002	0	\N	Хавсралтын тоогоор мөр нэмэгдэх	\N	\N	\N	\N	\N
16880071186139	790	1	\N	\N	\N	\N	\N	1	\N
16880071615829	791	1	\N	\N	\N	\N	\N	1	\N
8001	8001	\N	\N	Тэргүү нэр авто бөглөх	\N	\N	\N	\N	\N
8003	8003	noOfPages	\N	Ирсэн бичгийн авто дугаарлалтын оролтын утга	\N	\N	\N	\N	\N
8004	8004	1459917010269	\N	Явсан бичгийн авто дугаарлалт	\N	\N	\N	\N	\N
8005	8005	departmentId	\N	Явсан бичгийн авто дугаарлалтын оролтын утга	\N	\N	\N	\N	\N
1689912700141944	16899329606669	0	\N	\N	\N	\N	\N	\N	\N
1689928900372707	16899258575059	169632085978210	\N	\N	\N	\N	\N	\N	\N
8006	8006	0	\N	Явсан бичиг хэвлэх загвар сонгох эсэх	\N	\N	\N	\N	\N
8007	8007	0	\N	Баримт бичгийн ангилал эрх шалгах тохиргоо	\N	\N	\N	\N	\N
16925287884299	10038	TDB	departmentId=16855224187389;	\N	\N	\N	2023-08-01 13:48:03	\N	\N
99080	99080	0	\N	\N	\N	\N	\N	\N	
99081	99081	0	\N	\N	\N	\N	\N	\N	
8008	8008	0	\N	\N	\N	\N	\N	\N	\N
169515162836910	444	\N	\N	\N	\N	\N	\N	\N	\N
158781125126940651	99102	1	\N	\N	\N	\N	\N	\N	\N
16719551018269	16716811089169	Өсөх аялал ХХК	\N	\N	\N	\N	2022-12-26 11:55:20	16719548765619	\N
16719551018289	16716811098329	852963	\N	\N	\N	\N	2022-12-26 11:55:20	16719548765619	\N
16719551018309	16716811373129	Компани	\N	\N	\N	\N	2022-12-26 11:55:20	16719548765619	\N
321	10038	\N	departmentId=16706800465559;	\N	\N	\N	\N	1	\N
1671592122819204	158781125126940644	1	\N	\N	\N	\N	\N	\N	
1671592098667161	158781125126940611	1	\N	\N	\N	\N	\N	\N	
1671592106337165	158781125126940622	1	\N	\N	\N	\N	\N	\N	
1671592114209069	158781125126940633	1	\N	\N	\N	\N	\N	\N	
16716812267059	16716811089169	Түнэл	\N	\N	\N	\N	2022-12-23 01:55:51	16638363275429	\N
16716812267079	16716811373129	ХХК	\N	\N	\N	\N	\N	16638363275429	\N
16716812267099	16716811098329	9011462044	\N	\N	\N	\N	\N	16638363275429	\N
16716812267119	16716811182539	5802822	\N	\N	\N	\N	\N	16638363275429	\N
16716812267139	16716811189899	www.cozy.mn	\N	\N	\N	\N	\N	16638363275429	\N
16716812267159	16716811194459	77778080	\N	\N	\N	\N	\N	16638363275429	\N
16716812267179	16716811197829	ankhbayar@gmail.com	\N	\N	\N	\N	\N	16638363275429	\N
16716812267199	16716811207299	2014/02/19	\N	\N	\N	\N	\N	16638363275429	\N
16716812267219	16716811210949	15	\N	\N	\N	\N	2022-12-22 21:00:00	16638363275429	\N
16716812267239	16716811214719	Гадаад худалдаа, Програм хангамж	\N	\N	\N	\N	\N	16638363275429	\N
16716812267259	16716811351249	УБ, СХД, 1-р хороо, 41-592	\N	\N	\N	\N	\N	16638363275429	\N
16716812267279	16716811352599	Драгон төвийн зүүн тал	\N	\N	\N	\N	\N	16638363275429	\N
1674789208810311	16746352134839	assets/core/image/icon/returnWish.png	returnwish	Буцаалтын хүсэлт	\N	\N	2023-01-30 20:17:23	\N	\N
1674789226180965	16746352134839	assets/core/image/icon/card.png	card	Орлого хийх	\N	\N	2023-01-30 19:04:51	\N	\N
16719551018329	16716811182539	6323451	\N	\N	\N	\N	2022-12-26 11:55:20	16719548765619	\N
16719551018349	16716811189899	www.usukh-aylal.mn	\N	\N	\N	\N	2022-12-26 11:55:21	16719548765619	\N
16719551018369	16716811194459	77118822	\N	\N	\N	\N	2022-12-26 11:55:21	16719548765619	\N
16719551018389	16716811197829	mail.usukh.mn	\N	\N	\N	\N	2022-12-26 11:55:21	16719548765619	\N
16719551018409	16716811207299	2020-01-03	\N	\N	\N	\N	2022-12-26 11:55:21	16719548765619	\N
16719551018429	16716811210949	120	\N	\N	\N	\N	2022-12-26 11:55:21	16719548765619	\N
16719551018449	16716811214719	Тээвэр зуучлал	\N	\N	\N	\N	2022-12-26 11:55:21	16719548765619	\N
16719551018469	16716811351249	ЧД, 8-р хороо, Мон трейд, 4 давхар	\N	\N	\N	\N	2022-12-26 11:55:21	16719548765619	\N
16719551018489	16716811352599	ЧД, 8-р хороо, Мон трейд, 4 давхар, 4222 тоот	\N	\N	\N	\N	2022-12-26 11:55:21	16719548765619	\N
16719551018509	16716811387529	2	\N	\N	\N	\N	2022-12-26 11:55:21	16719548765619	\N
16719551018529	16719550315769	Манай байгууллага нь тээвэр зууялалын чиглэлээр нийслэл болон хөдөө орон нутагт нийт 450 гаруй объектод угсралт, суурилуулалтын ажил үйлчилгээ хийсэн туршлагатай хамт олон юм.	\N	\N	\N	\N	2022-12-26 11:55:21	16719548765619	\N
16719551018549	10000	storage/uploads/process/202212/file_1672026920818156_164930406363581114.jpg	\N	\N	\N	\N	2022-12-26 11:55:21	16719548765619	\N
1674789238433436	16746352134839	assets/core/image/icon/users.png	users	Миний туслах	\N	\N	2023-01-30 19:04:51	\N	\N
1674789253125617	16746352134839	assets/core/image/icon/chat.png	chat	Санал хүсэлт оруулах	\N	\N	2023-01-30 19:04:51	\N	\N
16783528176299	16783528176289	1	\N	\N	\N	\N	\N	1	\N
1678178432175632	1522125322438	1	\N	\N	\N	\N	\N	\N	\N
1678178579942378	1522125322437	1	\N	\N	\N	\N	\N	\N	\N
1679381521461870	99101	1	\N	\N	\N	\N	\N	\N	\N
1686016213461103	16855224597499	storage/uploads/process/202306/file_1686015042331212_161580288699411.png	promotion	Урамшуулал	\N	\N	\N	\N	\N
1679536979209267	158781125126940649	1	\N	\N	\N	\N	\N	\N	\N
16832530950809	16832530950799	1	\N	\N	\N	\N	\N	1	\N
16837129323239	16837129323229	1	\N	\N	\N	\N	\N	1	\N
1686016373120105	16855224597499	storage/uploads/process/202306/file_1686015249992491_161580288699411.png	distrubition	Түгээлт	\N	\N	\N	\N	\N
1048	1042	1	\N	\N	\N	\N	\N	\N	\N
16880070111439	787	1	\N	\N	\N	\N	\N	1	\N
250	250	1	\N	\N	\N	\N	\N	\N	\N
16880069532879	786	1	\N	\N	\N	\N	\N	1	\N
16880070860639	788	1	\N	\N	\N	\N	\N	1	\N
1687494201223243	784	FA_ASSET_BOOK_DEPR_BY_MONTH_LIST	\N	\N	\N	\N	\N	\N	\N
201	201	LNRQTADD	\N	\N	\N	\N	\N	\N	\N
202	202	hnFd5Qe9cB2Zpl6B	\N	qYeMpNNA4Uo4jzLG	\N	\N	\N	\N	\N
203	203	hnFd5Qe9cB2Zpl6B	\N	0ZKgJBM0jsnK3J6e	\N	\N	\N	\N	\N
204	204	26295934854330329627	\N	\N	\N	\N	\N	\N	\N
205	205	https://dev.veritech.mn/mdintegration/getLoanRequestResponse/golomt	\N	\N	\N	\N	\N	\N	\N
206	206	12sd	\N	\N	\N	\N	\N	\N	\N
207	207	1201272429	\N	\N	\N	\N	\N	\N	\N
208	208	Test	\N	\N	\N	\N	\N	\N	\N
1688525339188294	158781125126940653	1451013525557	\N	\N	\N	\N	\N	\N	
1690430407933173	161	F308	\N	\N	\N	\N	\N	\N	\N
1693474594318645	9992222111	User1	\N	\N	\N	\N	\N	\N	\N
1693474601380531	9992222112	h6ORSzQOs5j4Wu/PIR3NSA==	\N	\N	\N	\N	\N	\N	\N
1693538757414332	158781125126940655	1	\N	\N	\N	\N	\N	\N	\N
169515066764810	160868660	\N	\N	\N	\N	\N	2023-09-11 16:18:09	\N	\N
1695007601014484	16746352134839	assets/core/image/icon/returnWish.png	returnsales	Буцаалтын хүсэлт - Борлуулалт	\N	\N	\N	\N	\N
8009	8009	1	\N	\N	\N	\N	\N	\N	\N
1695203379079034	9992222115	http://202.21.125.54/finance/api/token	\N	\N	\N	\N	\N	\N	\N
1695267544524414	158781125126940656	1	\N	\N	\N	\N	\N	\N	\N
169466114641110	169466114641010	50	\N	50м	\N	\N	\N	1	\N
1695968287315483	52	1	\N	\N	\N	\N	\N	\N	\N
1696488931652954	158781125126940657	stCrmLead_DV_001	\N	\N	\N	\N	\N	\N	\N
1671091199988264	89922233	1522946448144	\N	Гэрээний ажилтан тохируулах	\N	\N	\N	\N	\N
1671164246493722	89922234	D14EBB1EE0E64EA29607857D60DE13EC	key	\N	\N	\N	\N	\N	\N
1671605258879422	1072	xq0PWwoNT0AEduFjKi2qxg	password	\N	\N	\N	\N	\N	\N
1671605270617234	1072	interactive	username	\N	\N	\N	\N	\N	\N
1674789376603623	16746352134839	assets/core/image/icon/location.png	location	Координат бүртгэх	\N	\N	2023-01-30 19:04:16	\N	\N
16750634345839	16750634345829	1	\N	\N	\N	\N	\N	1	\N
16765198220689	16765198220679	0	\N	\N	\N	\N	2023-03-07 17:15:37	1	\N
1673508931274711	10	veritech2	departmentId=1;	\N	\N	\N	\N	\N	\N
16783356737529	16783356737519	1	\N	Бие даасан захиалга хийх эсэх	Бие даасан захиалга хийх эсэх	\N	\N	1	Бие даасан захиалга хийх эсэх
16781547854909	16703847086679	0	\N	\N	\N	\N	2023-08-31 10:31:19	1	\N
1678343925626120	1678343789682	https://signature-document-service-1-dev-la.c2.khanbank.local/erp/document/signature	\N	\N	\N	\N	\N	\N	\N
1679380223958651	1472543466391	https://192.168.191.27:8080/api/trusted	serviceUrl	Хандах URL	\N	\N	\N	\N	\N
16881793360109	16881793358699	1	\N	\N	\N	\N	\N	1	\N
16800724561779	16800724561769	1	\N	\N	\N	\N	\N	1	\N
1680496937303532	1991	1	\N	\N	\N	\N	\N	\N	\N
16832531199369	16832531199359	1	\N	\N	\N	\N	\N	1	\N
158781125126940649	158781125126940650	2	\N	\N	\N	\N	\N	\N	\N
666666333	666666	1	\N	\N	\N	\N	\N	\N	\N
16835224651289	16835224651249	1	\N	\N	\N	\N	\N	1	\N
16835224658239	16835224658229	1	\N	\N	\N	\N	\N	1	\N
16835224662659	16835224662649	1	\N	\N	\N	\N	\N	1	\N
1425611135	14725434664	1	\N	\N	\N	\N	\N	\N	
16842330987879	16842330987869	1	\N	\N	\N	\N	\N	1	\N
1686015814744811	16855224597499	storage/uploads/process/202306/file_1686014594673433_161580288700411.png	order	Захиалга	\N	\N	\N	\N	\N
1686016094312637	16855224597499	storage/uploads/process/202306/file_1686014975044166_161580288699411.png	sales	Борлуулалт	\N	\N	\N	\N	\N
1686016312219266	16855224597499	storage/uploads/process/202306/file_1686015164888646_161580288700411.png	time	Хугацааны мэдэгдэл	\N	\N	\N	\N	\N
1686016408836286	16855224597499	storage/uploads/process/202306/file_1686015279861305_161580288699411.png	FAILED SALES	Амжилтүй борлуулалт	\N	\N	\N	\N	\N
1686016433693406	16855224597499	storage/uploads/process/202306/file_1686015310096164_161580288699411.png	COMMENT-DISCUSSION	Харилцагчийн санал хүсэлт	\N	\N	\N	\N	\N
1686041309241182	158781125126940652	16860252240099	\N	\N	\N	\N	\N	\N	\N
1686713691455010	1686713189075	16865631684929	\N	\N	\N	\N	\N	\N	\N
1686828835011041	10044	2020-12-31	departmentId=1;	\N	\N	\N	\N	\N	\N
16880072247369	789	1	\N	\N	\N	\N	\N	1	\N
1587711251269338	1587711251269338	0	\N	\N	\N	\N	\N	\N	\N
1687944123017267	1687944104672	1	\N	\N	\N	\N	\N	\N	\N
1687944432771460	1600	1	\N	\N	\N	\N	\N	\N	\N
1688538628311341	66666222	1	\N	\N	\N	\N	\N	\N	\N
15878112513694188	15878112513694078	1	\N	\N	\N	\N	\N	\N	\N
1692773185978150	169361552198210	1	departmentCode=IAG	\N	\N	\N	\N	\N	\N
1000	1000	1	\N	\N	\N	\N	\N	\N	\N
169440925897910	169440925873610	1	\N	\N	\N	\N	\N	1	\N
158781125126940650	16746352134839	assets/core/image/icon/order.png	orderqty|departmentId==16532683965959	Захиалга авах(Үлдтэй)	\N	\N	\N	\N	\N
8010	8010	123456789987654322	\N	Дотоод бичгийн дугаарлалт	\N	\N	\N	\N	\N
8011	8011	departmentId	\N	\N	\N	\N	\N	\N	\N
1694429761556962	99066	11337947158805	\N	\N	\N	\N	\N	\N	
8016	8016	1	\N	Ажил үүргийн гүйцэтгэгч олноор сонгох	\N	\N	\N	\N	\N
158781125126940652	158781125126940658	1	\N	Эргүүлэн томилгоо хийхэд ажилд орсон огноо солигдох эсэх	\N	\N	\N	\N	\N
1697018453218401	45487274	50	IAG	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: crm_company; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.crm_company (company_id, company_name, is_active, created_date, updated_date, company_register_number, user_id, created_user_id, modified_date, modified_user_id, base_company_id, industry_id, customer_id, company_type_id) FROM stdin;
\.


--
-- Data for Name: crm_customer; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.crm_customer (customer_id, customer_code, parent_id, person_id, company_id, is_active, is_primary, created_date, modified_date, logo, created_user_id, channel_type_id, object_photo, modified_user_id, position_name, customer_name, channel_subtype_id, customer_group_id, state_reg_number, si_reg_number, last_name, vatsp_number, priv_key, pub_key, department_id, age, appliaction_type_id, old_code, description, facebook_id, unique_id, mobile_app_id, mobile_token_id, template_id, url_path, is_vat_released, wfm_status_id, wfm_description, family_name, short_name, company_name, country_id, calc_percent, is_head_of_family, is_equivalent, created_command_id, modified_command_id, segmentation_id, priority_id, marital_status_id, organization_id, import_id, is_pos_use, phone_number, current_address_city_id, current_address_district_id, current_address_street_id, current_address_building, current_address_number, date_of_birth, gender, city_id, district_id, street_id, address_description, coordinate, tax_name, town_id, current_address_category_id, address_category_id, current_address_town_id, current_address_city_street_id, current_addr_sub_district_id, current_full_address, city_street_id, sub_district_id, building, door_number, mobile_number, current_address_coordinate, email, translation_value, is_impairment, education_level_id, contract_id, legal_entity_number, origin_id, ref_origin_name, company_department_id, id, indicator_id, src_record_id, data, name, created_user_name, modified_user_name, deleted_date, deleted_user_id, deleted_user_name, docx_id, is_package_policy, worldwide_state_reg_number, worldwide_name, health_status_id, health_description, health_status_date, health_status_user_id) FROM stdin;
\.


--
-- Data for Name: crm_customer_map; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.crm_customer_map (customer_id, employee_id, department_id) FROM stdin;
\.


--
-- Data for Name: crm_user; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.crm_user (cust_user_id, candidate_id, user_name, password, created_date, is_active, created_user_id, modified_date, modified_user_id, customer_id, parent_id, password_hash, password_reset, user_id, google_key, email, department_id, is_confirmed, created_command_id, person_id, failed_login_attempts, phone, company_id) FROM stdin;
\.


--
-- Data for Name: crm_user_kyc; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.crm_user_kyc (id, crm_user_id, kyc_type, kyc_key, kyc_value, confirmed_date, created_date, created_user_id, modified_date, modified_user_id, employee_id, department_id, customer_id, location_id, description, user_id, is_active, person_id) FROM stdin;
\.


--
-- Data for Name: crm_user_role; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.crm_user_role (id, user_id, role_id, created_date, created_user_id, start_date, end_date) FROM stdin;
\.


--
-- Data for Name: customer_bp_detail_config; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.customer_bp_detail_config (id, user_id, process_meta_data_id, param_path, label_name, order_num, is_show, is_freeze, group_path) FROM stdin;
\.


--
-- Data for Name: customer_dv_field; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.customer_dv_field (id, meta_data_id, field_path, label_name, is_required, is_active, is_criteria, is_mandatory_criteria, display_order, is_show, tab_name, default_value, is_disable, is_ignore_tree_group, lookup_type, choose_type, show_criteria, ability_toggle) FROM stdin;
\.


--
-- Data for Name: customer_dv_filter; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.customer_dv_filter (id, dv_meta_data_id, field_path, label_name, display_order, is_required, is_active) FROM stdin;
\.


--
-- Data for Name: customer_meta_user_config; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.customer_meta_user_config (id, meta_data_id, user_id, defaultviewer) FROM stdin;
\.


--
-- Data for Name: customer_proxy_config; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.customer_proxy_config (id, proxy_meta_data_id, action_meta_data_id, is_default, criteria, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: customer_st_grouping_config; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.customer_st_grouping_config (id, user_id, statement_meta_data_id, group_field_path, group_order) FROM stdin;
\.


--
-- Data for Name: db_dashboard_user; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.db_dashboard_user (id, db_dashboard_id, user_id, db_dashboard_dtl_id) FROM stdin;
\.


--
-- Data for Name: db_data_mart_config; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.db_data_mart_config (id, src_table_name, trg_table_name, trg_table_record_column, select_query, description) FROM stdin;
\.


--
-- Data for Name: db_data_mart_queue; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.db_data_mart_queue (id, src_table_name, operation_type, record_id, status, description, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: db_data_mart_schedule; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.db_data_mart_schedule (id, insert_query, delete_query, schedule_id, is_active, created_date, created_user_id, modified_date, modified_user_id, last_log) FROM stdin;
\.


--
-- Data for Name: db_fin_working_capital; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.db_fin_working_capital (month_id, working_capital_type, total_amount) FROM stdin;
\.


--
-- Data for Name: db_gl_analytic_pivot; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.db_gl_analytic_pivot (account_code, account_name, department_code, department_name, product_group_code, product_group_name, product_code, product_name, customer_category_code, customer_category_name, product_payment_code, product_payment_name, tax_category_code, tax_category_name, employee_code, employee_name, location_type_code, location_type_name, product_brand_code, product_brand_name, activity_code, activity_name, economic_class_code, economic_class_name, expense_center_code, expense_center_name, account_class_code, account_class_name, vat_sub_category_code, vat_sub_category_name, account_segment_code, m_01_debit_amount, m_02_debit_amount, m_03_debit_amount, m_04_debit_amount, m_05_debit_amount, m_06_debit_amount, m_07_debit_amount, m_08_debit_amount, m_09_debit_amount, m_10_debit_amount, m_11_debit_amount, m_12_debit_amount, total_debit_amount, m_01_credit_amount, m_02_credit_amount, m_03_credit_amount, m_04_credit_amount, m_05_credit_amount, m_06_credit_amount, m_07_credit_amount, m_08_credit_amount, m_09_credit_amount, m_10_credit_amount, m_11_credit_amount, m_12_credit_amount, total_credit_amount) FROM stdin;
\.


--
-- Data for Name: db_hcm_org_email; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.db_hcm_org_email (id, employee_id, employee_email, cc_email, manual_email, manager_id, created_user_id, created_date, modified_user_id, modified_date, second_manager_id) FROM stdin;
\.


--
-- Data for Name: ecm_content; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ecm_content (content_id, file_name, physical_path, thumb_physical_path, file_size, file_extension, created_date, created_user_id, modified_date, modified_user_id, wfm_status_id, wfm_description, is_locked, locked_user_id, locked_date, locked_ip_address, is_version, type_id, description, is_photo, is_signed, currency_id, is_default, page_count, is_email, page_settings, related_id, parent_id, widget_id, middle_physical_path, file_length, physical_file, is_external, qr_code) FROM stdin;
\.


--
-- Data for Name: ecm_content_clip; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ecm_content_clip (id, src_content_id, trg_content_id, relation_type_id) FROM stdin;
\.


--
-- Data for Name: ecm_content_directory; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ecm_content_directory (id, content_id, directory_id) FROM stdin;
\.


--
-- Data for Name: ecm_content_file_version; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ecm_content_file_version (id, content_id, version_number, physical_path, created_user_id, created_date, ip_address, description, prev_physical_path) FROM stdin;
\.


--
-- Data for Name: ecm_content_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ecm_content_log (id, content_id, created_date, created_user_id, show_date, show_user_id, show_user_ip, log_type) FROM stdin;
\.


--
-- Data for Name: ecm_content_map; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ecm_content_map (id, content_id, ref_structure_id, record_id, created_date, created_user_id, modified_date, modified_user_id, order_num, is_main, folder_id, page_count, tag_code, main_record_id) FROM stdin;
\.


--
-- Data for Name: ecm_content_meta; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ecm_content_meta (id, content_id, meta_data_id, meta_value_id, meta_value) FROM stdin;
\.


--
-- Data for Name: ecm_content_process_map; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ecm_content_process_map (id, type_id, process_meta_data_id, object_id, is_active) FROM stdin;
\.


--
-- Data for Name: ecm_content_type; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ecm_content_type (id, code, name, parent_id, ref_structure_id, is_active, template_id) FROM stdin;
\.


--
-- Data for Name: ecm_content_visitor; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ecm_content_visitor (id, table_name, ref_structure_id, record_id, user_id, created_date) FROM stdin;
\.


--
-- Data for Name: eml_email_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.eml_email_log (id, email, action_date, status, from_ip, newsletter_book_id, user_id, record_id, ref_stucture_id, email_template_id, notification_id) FROM stdin;
\.


--
-- Data for Name: eml_email_queue; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.eml_email_queue (id, to_mail, subject, body_text, sent_date, created_date) FROM stdin;
\.


--
-- Data for Name: eml_email_schedule; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.eml_email_schedule (id, schedule_id, from_address, to_address, cc_list, bcc_list, subject_text, attachment_url, body_text, created_date, created_user_id, batch_id) FROM stdin;
\.


--
-- Data for Name: eml_sms_schedule; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.eml_sms_schedule (id, schedule_id, to_phone_number, sms_message, created_date, created_user_id) FROM stdin;
\.


--
-- Data for Name: eml_template; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.eml_template (id, code, name, subject, message, direct_url, body_template, company_department_id) FROM stdin;
\.


--
-- Data for Name: file_attach; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: cloud_platform_uat
--

COPY cloud_customer_uat.file_attach (attach_id, attach_name, attach, created_date, created_user_id, file_extension, file_size, folder_id, system_id, attach_thumb, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: fin_fiscal_period_close_acc; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.fin_fiscal_period_close_acc (fiscal_period_id, account_id, id, created_date, created_user_id, modified_date, modified_user_id, close_date, company_department_id) FROM stdin;
\.


--
-- Data for Name: fin_fiscal_period_close_dep; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.fin_fiscal_period_close_dep (fiscal_period_id, department_id, id, created_date, created_user_id, modified_date, modified_user_id, company_department_id) FROM stdin;
\.


--
-- Data for Name: fin_fiscal_period_curr_object; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.fin_fiscal_period_curr_object (id, fiscal_period_id, object_id, created_date, created_user_id, modified_date, modified_user_id, department_id, transaction_date, type_code, company_department_id) FROM stdin;
\.


--
-- Data for Name: fin_fiscal_period_old; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.fin_fiscal_period_old (id, type_id, period_code, period_name, start_date, end_date, parent_id, is_current, is_closed, created_date, created_user_id, modified_date, modified_user_id, english, object_photo, is_hide, company_department_id) FROM stdin;
\.


--
-- Data for Name: fin_fiscal_period_user; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.fin_fiscal_period_user (id, fiscal_period_id, user_id, created_date, company_department_id) FROM stdin;
\.


--
-- Data for Name: hrm_employee; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.hrm_employee (employee_id, person_id, employee_code, employee_email, employee_phone, employee_mobile, picture, is_active, is_member_laborer_union, birth_place, urag, origin_id, first_name, last_name, date_of_birth, gender, state_reg_number, country_id, title, created_date, created_user_id, modified_date, modified_user_id, profession_id, social_insurance_number, medical_insurance_number, work_start_date, military_card_number, disability_percent, district_id, drive_id, social_origin_id, zodiac_sign_id, lunar_sign_id, position_field_id, marital_status_id, is_driver, no_of_family_member, birth_order_id, no_of_children, city_id, height, blood_type_id, drive_start_year_id, purpose, current_status_id, description, last_name_eng, first_name_eng, state_reg_number_eng, current_worked_month, initial_worked_month, post_address, fax, employee_index, birth_country_id, customer_id, key_start_date, plan_id, education_degree_code, profession_code, description2, education_level_id, contract_start_date, created_command_id, modified_command_id, profession_level_id, template_id, work_phone, nes_user_id, portfolio_percent, vacation_start_date, company_department_id, picture_thumb, picture_small_thumb, picture_middle_thumb, picture_large_thumb, group_id, username, translation_value, military_type_id, weight, created_user_name, modified_user_name, disability_type_id, disability_mode_type_id, disability_level_id, civil_reg_number) FROM stdin;
\.


--
-- Data for Name: hrm_employee_key; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.hrm_employee_key (employee_key_id, employee_id, department_id, position_key_id, salary_key_id, insured_type_id, status_id, is_active, employee_code, salary, currency_id, rectorship_id, rectorship_number, work_start_date, work_end_date, salary_level_id, is_paying_nd, employee_metadata_id, created_date, created_user_id, modified_date, modified_user_id, salary_extra, salary_percent, current_status_id, salary_sublevel_id, salary_type_id, is_salary_percent, position_field_id, prl_department_id, is_not_primary, is_cross_company, created_command_id, modified_command_id, nes_owner_id, project_id, current_status_start, current_status_end, company_department_id, is_degree, is_prl_type, is_prl_percent) FROM stdin;
\.


--
-- Data for Name: hrm_position; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.hrm_position (position_id, position_name, position_code, display_order, created_user_id, created_date, modified_date, modified_user_id, description, is_active, vocation_group_id, position_name_en, short_name, group_id, type_id, field_id, classification_id, prof_level_id, salary_type_id, version_number, start_date, end_date, globe_code, salary, icon, department_id, position_name2, company_department_id, translation_value, salary_key_id) FROM stdin;
\.


--
-- Data for Name: hrm_position_key; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.hrm_position_key (position_key_id, position_id, prof_level_id, salary_level_id, department_id, classification_id, updated_date, is_defined, is_active, created_user_id, created_date, modified_date, modified_user_id, condition_id, code, vacancy_count, direction_id, vacancy_description, salary_type_id, job_description_id, avoidance, salary_key_id, salary_sublevel_id, is_succession, is_talent, is_evaluation_year, is_evaluation_quarter, is_evaluation_month, company_department_id, wfm_status_id, wfm_description, position_key_name, position_group_id, job_functional_area_id, job_family_id) FROM stdin;
\.


--
-- Data for Name: im_cost_method; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.im_cost_method (id, code, name, description, parent_id, group_keys, is_calculate_full_range, scale_length, is_order_by_inserted_sequence, is_skip_fix_balance, is_use_department, is_skip_check_balance, company_department_id, is_check_cycle, department_id) FROM stdin;
\.


--
-- Data for Name: im_item_cost_key; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.im_item_cost_key (id, item_key_id, book_date, balance_qty, unit_cost_amount, total_cost_amount, created_user_id, created_date, department_id, company_department_id, store_keeper_key_id) FROM stdin;
\.


--
-- Data for Name: im_item_cost_key_fifo; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.im_item_cost_key_fifo (id, item_key_id, book_date, balance_qty, unit_cost_amount, total_cost_amount, cost_order, department_id, company_department_id, store_keeper_key_id) FROM stdin;
\.


--
-- Data for Name: im_item_cost_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.im_item_cost_log (id, cost_date, created_user_id, created_date, error_item_key_ids, department_id, error_text) FROM stdin;
\.


--
-- Data for Name: im_item_cost_method; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.im_item_cost_method (id, cost_method_id, time_type_id, department_id, account_id, warehouse_id, item_category_id, item_id, store_keeper_key_id, company_department_id) FROM stdin;
\.


--
-- Data for Name: im_item_cost_proportion; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.im_item_cost_proportion (id, general_ledger_id, general_ledger_book_id, general_ledger_book_sub_id, amount_percent) FROM stdin;
\.


--
-- Data for Name: im_item_cost_tmp; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.im_item_cost_tmp (id, item_book_dtl_id, item_book_id, in_cost_price, in_cost_amount, out_cost_price, out_cost_amount) FROM stdin;
\.


--
-- Data for Name: im_item_key_cost; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.im_item_key_cost (item_key_id, in_date, qty, cost, store_keeper_key_id, total_cost, income_date, created_date, created_user_id, modified_date, modified_user_id, item_id, department_id, id, start_date, end_date, company_department_id) FROM stdin;
\.


--
-- Data for Name: im_item_key_cost_calc; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.im_item_key_cost_calc (item_key_id, in_date, qty, cost, store_keeper_key_id, total_cost, income_date, created_date, created_user_id, modified_date, modified_user_id, item_id, department_id, id, company_department_id) FROM stdin;
\.


--
-- Data for Name: jira_template; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.jira_template (id, code, name, template, is_active, created_date, user_query, template_type_id, criteria, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: jira_template_param; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.jira_template_param (id, jira_template_id, template_param_path, process_param_path, default_value) FROM stdin;
\.


--
-- Data for Name: jira_template_type; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.jira_template_type (id, code, name, get_process_id, find_dtl_id_query, update_query) FROM stdin;
\.


--
-- Data for Name: knowledge_category; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.knowledge_category (id, code, name, description, created_date, created_user_id, parent_id, wfm_status_id, wfm_desription, icon, icon_color, order_number, modified_date, modified_user_id, related_indicator_id) FROM stdin;
\.


--
-- Data for Name: knowledge_copy; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.knowledge_copy (knowledge_id, knowledge_code, knowledge_name, is_active, parent_id, created_date, created_user_id, modified_date, modified_user_id, measure_id, category_id, wfm_status_id, wfm_description, recommendation, attention, real_example, sample, type_id, tag_ids, order_number, knowledge_description, knowledge_description3, knowledge_description1) FROM stdin;
\.


--
-- Data for Name: knowledge_helpful; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.knowledge_helpful (id, knowledge_id, yes, no, created_user_id, created_date) FROM stdin;
\.


--
-- Data for Name: knowledge_meta_data_map; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.knowledge_meta_data_map (id, meta_data_id, knowledge_id, created_date, created_user_id) FROM stdin;
\.


--
-- Data for Name: knowledge_type; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.knowledge_type (id, code, name, created_user_id, created_date, parent_id, icon, is_active) FROM stdin;
\.


--
-- Data for Name: meta_dm_record_map; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.meta_dm_record_map (id, src_table_name, src_record_id, trg_table_name, trg_record_id, on_delete, on_update, delete_process_id, semantic_type_id, semantic_value, wfm_status_id, wfm_description, fact_1, fact_2, fact_3, fact_4, fact_5, fact_6, fact_7, fact_8, fact_9, fact_10, dim_1, dim_2, dim_3, dim_4, dim_5, dim_6, dim_7, dim_8, dim_9, dim_10, text_1, text_2, text_3, text_4, text_5, text_6, text_7, text_8, text_9, text_10, date_1, date_2, date_3, date_4, date_5, date_6, date_7, date_8, date_9, date_10, check_1, check_2, check_3, check_4, check_5, check_6, check_7, check_8, check_9, check_10, clob_1, trg_record_char, src_record_char, order_num, src_wfm_workflow_id, trg_wfm_workflow_id, src_wfm_status_id, trg_wfm_status_id, template_id, src_name, trg_name, src_ref_structure_id, trg_ref_structure_id, created_user_id, created_date, department_id, dataview_id, object_id, src_code, trg_code) FROM stdin;
\.


--
-- Data for Name: meta_wfm_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.meta_wfm_log (id, ref_structure_id, record_id, wfm_status_id, wfm_description, created_date, created_user_id, content_hash, cipher_text, guid, alias_user_id, prev_wfm_status_id, time_spent, actual_time) FROM stdin;
\.


--
-- Data for Name: meta_wfm_status_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.meta_wfm_status_log (id, wfm_status_code, wfm_status_name, process_name, wfm_workflow_id, is_active, wfm_status_color, process_meta_data_id, is_direct, is_need_sign, is_desc_required, is_send_mail, wfm_global_status_id, from_notification_id, to_notification_id, is_notify_to_created_user, top, "left", parent_id, is_userdef_assign, is_userdef_rule, default_rule_id, default_rule_status_id, assigned_to_notif_id, assigned_from_notif_id, alias_name, notification_id, use_process_window, use_description_window, is_form_notsubmit, is_filter_users_by_department, created_user_notification_id, order_number, is_mail_action, is_check_assign_criteria, wfm_status_icon, mobile_process_meta_data_id, is_ignore_row, is_inherit_assign, is_hide_next_user, is_ignore_sorting, is_filter_log, from_status_name, to_status_name, assign_dataview_id, is_send_mail1, is_pack, close_process_window, is_hide_file, is_file_preview, log_action, log_created_date, log_created_user_id, log_id) FROM stdin;
\.


--
-- Data for Name: meta_wfm_status_permission; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.meta_wfm_status_permission (id, wfm_status_id, user_id, role_id, is_edit, modified_date, modified_user_id, access_log_id) FROM stdin;
\.


--
-- Data for Name: meta_wfm_status_permission_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.meta_wfm_status_permission_log (id, wfm_status_id, user_id, role_id, is_edit, log_action, log_created_date, log_created_user_id, log_id) FROM stdin;
\.


--
-- Data for Name: nlt_newsletter_book; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.nlt_newsletter_book (id, code, name, template_id, schedule_id, title_header, description, file_type, created_date, created_user_id, modified_date, modified_user_id, url, notification_id) FROM stdin;
\.


--
-- Data for Name: nlt_newsletter_dtl; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.nlt_newsletter_dtl (id, newsletter_book_id, title_name, meta_data_id, created_date, created_user_id, modified_date, modified_user_id, url, is_html) FROM stdin;
\.


--
-- Data for Name: nlt_newsletter_schedule; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.nlt_newsletter_schedule (id, book_id, schedule_id) FROM stdin;
\.


--
-- Data for Name: nlt_newsletter_template; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.nlt_newsletter_template (id, code, name, hdr_section, body_section, dtl_section, description, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: nlt_notification_map; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.nlt_notification_map (id, book_id, schedule_id) FROM stdin;
\.


--
-- Data for Name: ntf_dash_notification; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_dash_notification (id, type, user_id, content_id) FROM stdin;
\.


--
-- Data for Name: ntf_mention_config; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_mention_config (id, ref_structure_id, get_meta_data_id, notification_id, created_date, created_user_id) FROM stdin;
\.


--
-- Data for Name: ntf_notification; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification (notification_id, notification_type_id, direct_url, created_date, created_user_id, modified_date, modified_user_id, mobile_url, path_tag, message, subject, sms_message, is_by_user_email, is_no_msg_substr, is_mail_attach) FROM stdin;
\.


--
-- Data for Name: ntf_notification_action; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_action (id, notification_id, process_meta_data_id, display_name, order_num) FROM stdin;
\.


--
-- Data for Name: ntf_notification_action_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_action_log (id, notification_id, process_code, result, user_id, request_date) FROM stdin;
\.


--
-- Data for Name: ntf_notification_follow; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_follow (id, record_id, user_id, created_date) FROM stdin;
\.


--
-- Data for Name: ntf_notification_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_log (id, action_date, notification_id, process_notification_id, system_meta_group_id, ref_meta_group_id, user_query, description) FROM stdin;
\.


--
-- Data for Name: ntf_notification_param; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_param (notification_id, param_name, param_value, param_id, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: ntf_notification_process; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_process (notification_process_id, process_meta_data_id, notification_id, user_process_meta_data_id, notify_date, created_date, created_user_id, is_use_criteria, user_criteria, send_criteria) FROM stdin;
\.


--
-- Data for Name: ntf_notification_process_param; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_process_param (notification_process_param_id, notification_process_id, notification_param_path, process_param_path, default_value, created_date, created_user_id) FROM stdin;
\.


--
-- Data for Name: ntf_notification_schedule_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_schedule_log (id, structure_id, record_id, wfm_status_id, user_id, notification_id, created_date, is_mail, is_sent, sent_date, schedule_id, created_user_id, is_sms) FROM stdin;
\.


--
-- Data for Name: ntf_notification_system; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_system (notification_id, system_id, id, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: ntf_notification_template_map; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_template_map (id, meta_data_id, notification_id, created_date, created_user_id, user_criteria, send_criteria) FROM stdin;
\.


--
-- Data for Name: ntf_notification_type; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_type (notification_type_id, notification_type_name, notification_type_description, created_date, created_user_id, modified_date, modified_user_id, display_color, icon, icon_color, system_id, module_id) FROM stdin;
\.


--
-- Data for Name: ntf_notification_user; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_user (notification_user_id, notification_id, user_id, notify_date, read_date, role_id, created_date, created_user_id, modified_date, modified_user_id, direct_url, mobile_url, notification_data, viewed_date, message_old, record_id, ref_stucture_id, message) FROM stdin;
\.


--
-- Data for Name: ntf_notification_user_param; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notification_user_param (id, notification_user_id, ntf_param_path, ntf_param_value, action_id) FROM stdin;
\.


--
-- Data for Name: ntf_notify; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notify (id, code, user_id, message) FROM stdin;
\.


--
-- Data for Name: ntf_notify_all; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notify_all (id, notification_id, meta_data_id, is_active) FROM stdin;
\.


--
-- Data for Name: ntf_notify_all_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_notify_all_log (id, notify_all_id, user_id, is_checked, created_date, created_user_id) FROM stdin;
\.


--
-- Data for Name: ntf_template; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_template (template_id, template_name, template_description, globe_dictionary_code, template_code, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: ntf_template_system; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_template_system (template_id, system_id, id, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: ntf_template_user; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_template_user (template_user_id, template_id, user_id, is_mail, is_sms, is_instant, role_id, template_code, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: ntf_user_config; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ntf_user_config (id, user_id, notification_id, schedule_id, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: org_department; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.org_department (department_id, is_active, display_order, parent_id, department_code, department_name, created_user_id, created_date, modified_date, modified_user_id, coordinate, type_id, classification_id, status_id, wfm_status_id, wfm_description, wfm_workflow_id, dependency_department_id, department_name_en, segment_id, channel_id, company_id, system_url, wsdl_url, director_prof_level_id, customer_id, salary_percent, object_photo, globe_code, start_date, end_date, version_number, name_path, hier_order, vatsp_number, industry_id, ownership_type_id, registration_number, tax_customer_id, register_number, is_person, description, is_company, company_department_id, translation_value, time_zone_id, primary_currency_id, secondary_currency_id, parent_department_level1, parent_department_level2, parent_department_level3, id, indicator_id, src_record_id, data, name, created_user_name, modified_user_name, deleted_date, deleted_user_id, deleted_user_name, cloud_department_id, status_1, status_2, status_3, status_4, status_5, status_6, status_7, status_8, status_9, status_10, is_shop, organization_type_id) FROM stdin;
1	1	1	\N	IAG	Интерактив Групп	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6673244	0	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N
\.


--
-- Data for Name: org_department_language; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: cloud_platform_uat
--

COPY cloud_customer_uat.org_department_language (id, department_id, language_id, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
1	1	1	\N	\N	\N	\N
2	1	2	\N	\N	\N	\N
\.


--
-- Data for Name: prl_calc; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.prl_calc (id, calc_code, calc_name, calc_order, year, month, start_date, end_date, created_date, created_user_id, modified_date, modified_user_id, work_day, short_name, calc_date, department_id, company_department_id) FROM stdin;
\.


--
-- Data for Name: prl_calc_department; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.prl_calc_department (id, calc_id, department_id, company_department_id) FROM stdin;
\.


--
-- Data for Name: prl_calc_type; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.prl_calc_type (id, calc_type_code, calc_type_name, created_date, created_user_id, modified_date, modified_user_id, is_system, is_employee, list_meta_data_id, emp_status_criteria, emp_current_status_criteria, use_book_number, emp_position_criteria, is_prl_department, version_number, emp_notin_position_criteria, company_department_id, description) FROM stdin;
\.


--
-- Data for Name: prl_salary_book; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.prl_salary_book (id, department_id, calc_id, created_user_id, created_date, modified_user_id, modified_date, wfm_workflow_id, wfm_status_id, calc_type_id, wfm_description, is_locked, batch_number, book_number, book_type_id, employee_id, related_record_id, employee_key_id, criteria_template_id, company_department_id) FROM stdin;
\.


--
-- Data for Name: prl_salary_sheet; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.prl_salary_sheet (id, employee_key_id, sal_book_id, calc_type_id, iscass, wfm_status_id, created_date, created_user_id, modified_date, modified_user_id, f100, f101, f102, f103, f104, f105, f106, f107, f108, f109, f110, f111, f112, f113, f114, f115, f116, f117, f118, f119, f120, f121, f122, f123, f124, f125, f126, f127, f128, f129, f130, f131, f132, f133, f134, f135, f136, f137, f138, f139, f140, f141, f142, f143, f144, f145, f146, f147, f148, f149, f150, f151, f152, f153, f154, f155, f156, f157, f158, f159, f160, f161, f162, f163, f164, f165, f166, f167, f168, f169, f170, f171, f172, f173, f174, f175, f176, f177, f178, f179, f180, f181, f182, f183, f184, f185, f186, f187, f188, f189, f190, f191, f192, f193, f194, f195, f196, f197, f198, f199, f200, f201, f202, f203, f204, f205, f206, f207, f208, f209, f210, f211, f212, f213, f214, f215, f216, f217, f218, f219, f220, f221, f222, f223, f224, f225, f226, f227, f228, f229, f230, f231, f232, f233, f234, f235, f236, f237, f238, f239, f240, f241, f242, f243, f244, f245, f246, f247, f248, f249, f250, f251, f252, f253, f254, f255, f256, f257, f258, f259, f260, f261, f262, f263, f264, f265, f266, f267, f268, f269, f270, f271, f272, f273, f274, f275, f276, f277, f278, f279, f280, f281, f282, f283, f284, f285, f286, f287, f288, f289, f290, f291, f292, f293, f294, f295, f296, f297, f298, f299, f300, f301, f302, f303, f304, f305, f306, f307, f308, f309, f310, f311, f312, f313, f314, f315, f316, f317, f318, f319, f320, f321, f322, f323, f324, f325, f326, f327, f328, f329, f330, f331, f332, f333, f334, f335, f336, f337, f338, f339, f340, f341, f342, f343, f344, f345, f346, f347, f348, f349, f350, f351, f352, f353, f354, f355, f356, f357, f358, f359, f360, f361, f362, f363, f364, f365, f366, f367, f368, f369, f370, f371, f372, f373, f374, f375, f376, f377, f378, f379, f380, f381, f382, f383, f384, f385, f386, f387, f388, f389, f390, f391, f392, f393, f394, f395, f396, f397, f398, f399, f400, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30, f31, f32, f33, f34, f35, f36, f37, f38, f39, f40, f41, f42, f43, f44, f45, f46, f47, f48, f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63, f64, f65, f66, f67, f68, f69, f70, f71, f72, f73, f74, f75, f76, f77, f78, f79, f80, f81, f82, f83, f84, f85, f86, f87, f88, f89, f90, f91, f92, f93, f94, f95, f96, f97, f98, f99, is_consolidated, insuredtypecode, general_ledger_book_id, is_lock, wfm_description, f401, f402, f403, f404, f405, f406, f407, f408, f409, f410, f411, f412, f413, f414, f415, f416, f417, f418, f419, f420, f421, f422, f423, f424, f425, f426, f427, f428, f429, f430, f431, f432, f433, f434, f435, f436, f437, f438, f439, f440, f441, f442, f443, f444, f445, f446, f447, f448, f449, f450, f451, f452, f453, f454, f455, f456, f457, f458, f459, f460, f461, f462, f463, f464, f465, f466, f467, f468, f469, f470, f471, f472, f473, f474, f475, f476, f477, f478, f479, f480, f481, f482, f483, f484, f485, f486, f487, f488, f489, f490, f491, f492, f493, f494, f495, f496, f497, f498, f499, f500, f502, f503, f504, f505, f506, f507, f508, f509, f510, f511, f512, f513, f514, f515, f516, f517, f518, f519, f520, f521, f522, f523, f524, f525, f526, f527, f528, f529, f530, f531, f532, f533, f534, f535, f536, f537, f538, f539, f540, f541, f542, f543, f544, f545, f546, f547, f548, f549, f550, f551, f552, f553, f554, f555, f556, f557, f558, f559, f560, f561, f562, f563, f564, f565, f566, f567, f568, f569, f570, f571, f572, f573, f574, f575, f576, f577, f578, f579, f580, f581, f582, f583, f584, f585, f586, f587, f588, f589, f590, f591, f592, f593, f594, f595, f596, f597, f598, f599, f600, f501, company_department_id) FROM stdin;
\.


--
-- Data for Name: process_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.process_log (id, command_name, request_data_element, start_time, end_time, node_id, used_second) FROM stdin;
\.


--
-- Data for Name: ref_bank; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ref_bank (bank_id, bank_name, description, parent_id, created_date, created_user_id, modified_date, modified_user_id, bank_code, phone_number, email_address, fax_number, is_active, is_system_value, is_default, country_id, is_get_bank_bill, customer_id, transaction, transaction_code, transaction_ext, swift_code, department_id, iban, bank_name2, icon, qpay_link, country_code, company_department_id, translation_value, priority_number) FROM stdin;
\.


--
-- Data for Name: ref_language; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.ref_language (language_id, language_code, language_name, is_active, display_order, short_code, created_date, created_user_id, modified_date, modified_user_id, department_id) FROM stdin;
1	MONGOLIAN	Монгол хэл	1	1	mn	\N	\N	\N	\N	\N
2	ENGLISH	Англи хэл	1	2	en	\N	\N	\N	\N	\N
3	RUSSIAN	Орос хэл	1	3	ru	\N	\N	\N	\N	\N
4	KOREAN	Солонгос хэл	0	5	kr	\N	\N	\N	\N	\N
5	CHINESE	Хятад хэл	1	4	cn	\N	\N	\N	\N	\N
6	JAPANESE	Япон хэл	1	6	jp	\N	\N	\N	\N	\N
7	TURKISH	Türkçe	1	7	tr	\N	\N	\N	\N	\N
8	GERMANY	Герман хэл	0	8	de	\N	\N	\N	\N	\N
13	MONGOLIANSCRIPT	Монгол бичиг	1	13	mns	\N	\N	\N	\N	\N
9	OTHER	Бусад	0	9	ot	\N	\N	\N	\N	\N
10	ARABIC	Араб хэл	0	10	ae	\N	\N	\N	\N	\N
11	VIETNAMESE	Вьетнам	1	11	vn	\N	\N	\N	\N	\N
12	CAMBODIA	Камбож	1	12	kh	\N	\N	\N	\N	\N
\.


--
-- Data for Name: sch_process; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.sch_process (id, process_id, input_param, schedule_id) FROM stdin;
\.


--
-- Data for Name: sch_schedule; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.sch_schedule (schedule_id, schedule_code, schedule_name, every_minute, every_hour, end_date, start_date, schedule_type_id, day_of_week, repeat_days, week_of_month, created_date, created_user_id, modified_date, modified_user_id, every_second, is_write_log, month_of_year, start_time, end_time) FROM stdin;
\.


--
-- Data for Name: sch_schedule_book; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.sch_schedule_book (schedule_book_id, book_number, book_type_id, book_date, wfm_status_id, wfm_description, start_date, end_date, start_time, end_time, description, is_active, created_date, created_user_id, modified_date, modified_user_id, schedule_type_id) FROM stdin;
\.


--
-- Data for Name: sch_schedule_config; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.sch_schedule_config (id, code, description, class_name, method_name, is_active, schedule_id, is_write_log) FROM stdin;
\.


--
-- Data for Name: sch_schedule_email; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.sch_schedule_email (id, schedule_id, email, created_date, created_user_id, modified_date, modified_user_id, first_name) FROM stdin;
\.


--
-- Data for Name: sch_schedule_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.sch_schedule_log (id, created_date, error_message) FROM stdin;
\.


--
-- Data for Name: sch_schedule_type; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.sch_schedule_type (schedule_type_id, schedule_type_code, schedule_type_name, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: session_refresh_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.session_refresh_log (session_user_id, meta_data_id, last_refreshed_date) FROM stdin;
\.


--
-- Data for Name: sysint_service_method_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.sysint_service_method_log (id, web_service_name, web_service_url, created_date, parameter_de, response_de, user_id, is_successful, request_string, response_string, general_ledger_book_id, sub_id, ip_address, modified_date) FROM stdin;
\.


--
-- Data for Name: sysint_service_method_log_dtl; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.sysint_service_method_log_dtl (id, log_id, reg_num, citizen_reg_num, citizen_finger, operator_reg_num, operator_finger, legal_entity_number, property_number) FROM stdin;
\.


--
-- Data for Name: system_access_config; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.system_access_config (id, access_code, access_name, is_active) FROM stdin;
\.


--
-- Data for Name: system_access_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.system_access_log (id, access_date, main_meta_data_id, access_meta_data_id, access_code, access_name, access_user_id, ref_structure_id, mac_address, ip_address, table_name, record_id) FROM stdin;
\.


--
-- Data for Name: system_action_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.system_action_log (id, table_name, record_id, action_name, action_date, user_id, customer_id, id_string, action_type, description, action_data, created_user_id, modified_user_id, created_date, modified_date, related_record_id, created_crm_user_id) FROM stdin;
\.


--
-- Data for Name: system_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.system_log (id, request_key, command_name, db_unit_name, user_name, request_data_element, response_data_element, created_date, ip_address, user_id, system_meta_group_id, user_agent) FROM stdin;
\.


--
-- Data for Name: system_log_dtl; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.system_log_dtl (id, system_log_id, record_id, entity_name, data_element, operation_type, sub_id, created_date, command_id) FROM stdin;
\.


--
-- Data for Name: system_log_php; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.system_log_php (id, user_id, ip, created_date, url, php_session_id, referer_url, meta_data_id) FROM stdin;
\.


--
-- Data for Name: system_write_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.system_write_log (id, request_name, created_date, ip_address, user_id) FROM stdin;
\.


--
-- Data for Name: um_config_value; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_config_value (id, config_group_id, name, value) FROM stdin;
\.


--
-- Data for Name: um_criteria; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_criteria (id, code, name, description, meta_data_id, criteria_string, is_system) FROM stdin;
\.


--
-- Data for Name: um_global_user; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_global_user (id, system_user_id, username, password, cloud_id, domain_name, after_login_url) FROM stdin;
\.


--
-- Data for Name: um_login_attempts; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_login_attempts (id, username, ip_address, user_agent, is_loggedin, is_success, session_id, failed_type, system_user_id, created_date, browser_name, platform_name, logout_date, updated_date) FROM stdin;
1697071479293553	ankhbayar.z	192.168.192.241	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36	0	0	\N		\N	2023-10-12 08:44:39	Chrome	Windows	\N	\N
1697071484434443	admin	192.168.192.241	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36	1	1	a121255e-a3b7-4d9d-ac0d-4c1e3e25c5b5	\N	1	2023-10-12 08:44:44	Chrome	Windows	\N	\N
1697075833048640	admin	192.168.192.63	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36	1	1	02749d8a-8792-413d-b544-335649641c86	\N	1	2023-10-12 09:57:13	Chrome	Windows	2023-10-12 09:57:21	\N
1697075843855814	admin	192.168.192.63	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36	1	1	5182d5f6-b62d-42a7-b914-f9d0fbb8a5dd	\N	1	2023-10-12 09:57:23	Chrome	Windows	\N	2023-10-12 06:23:58.378711
1697160348247715	admin	192.168.192.63	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36	1	1	d515215e-58c4-47cc-9731-ed037a66f50e	\N	1	2023-10-13 09:25:48	Chrome	Windows	\N	2023-10-13 00:51:59.693706
\.


--
-- Data for Name: um_login_device; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_login_device (id, system_user_id, ip_address, user_agent, browser_name, platform_name, created_date) FROM stdin;
\.


--
-- Data for Name: um_login_failed; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_login_failed (id, ip_address, failed_count, modified_date, system_user_id) FROM stdin;
\.


--
-- Data for Name: um_menu_config; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_menu_config (id, module_menu_id, top_menu_id, role_id, user_id, is_default_menu, created_date, created_user_id, modified_date, modified_user_id, created_command_id, modified_command_id, company_department_id) FROM stdin;
\.


--
-- Data for Name: um_meta_block; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_meta_block (id, user_id, menu_meta_data_id, action_meta_data_id, created_date, created_user_id, is_change_password, related_id, related_record_id, is_all_user, system_user_id, is_active, ignore_close, ignore_save, get_process_id, start_date, end_date, customer_id, role_id) FROM stdin;
\.


--
-- Data for Name: um_meta_lock; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_meta_lock (id, meta_data_id, user_id, password_hash, created_date, created_user_id) FROM stdin;
\.


--
-- Data for Name: um_meta_permission; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_meta_permission (permission_id, meta_data_id, action_id, user_id, role_id, field_criteria, record_criteria, created_date, created_user_id, modified_date, modified_user_id, is_denied, description, permission_code, batch_number, is_system_value, order_id, company_department_id, access_log_id) FROM stdin;
1485222705791	1449205287230051	300101010000004	1	\N	\N	\N	2017-01-24 14:34:40	\N	\N	\N	0	\N	\N	\N	0	280455	\N	\N
\.


--
-- Data for Name: um_meta_permission_cache; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_meta_permission_cache (id, meta_data_id, parent_meta_data_id, action_id, icon_name, order_num, globe_code, label_name) FROM stdin;
\.


--
-- Data for Name: um_meta_permission_ignore; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_meta_permission_ignore (meta_data_id) FROM stdin;
\.


--
-- Data for Name: um_meta_permission_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_meta_permission_log (log_id, permission_id, meta_data_id, action_id, user_id, role_id, field_criteria, record_criteria, created_date, created_user_id, modified_date, modified_user_id, is_denied, description, permission_code, batch_number, is_system_value, deleted_date, deleted_user_id, updated_date, updated_user_id, log_action, log_created_date, log_created_user_id, order_id, company_department_id) FROM stdin;
\.


--
-- Data for Name: um_quick_menu; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_quick_menu (id, user_id, system_id, system_url, meta_type, meta_data_id, display_order, created_date, menu_name, icon_name, url_code, hot_key) FROM stdin;
\.


--
-- Data for Name: um_record_permission; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_record_permission (object_id, record_id, permission_id, user_id, role_id, id, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: um_role_customer; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_role_customer (id, customer_id, role_id, is_active, created_date, created_user_id, modified_date, modified_user_id, start_date, end_date) FROM stdin;
\.


--
-- Data for Name: um_system_user; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_system_user (user_id, username, password_hash, password_salt, password_reset, password_expiry_date, allow_con_current_logins, inactive, failed_login_attempts, created_date, change_date, email, person_id, created_user_id, modified_date, modified_user_id, google_key, user_full_name, language_id, ldap_display_name, phone_number, signature_picture, type_code, stamp_picture, chat_contact_view, is_touch_mode, ip_address, mobile_password_hash, password_reset_date, facebook_key, profile_photo, firebase_uid, provider_id, wfm_password_hash, tinode, pin_code, company_department_id, ldap_login_name, response_msg, time_zone_id, mobile_device_platform, imei, is_use_chat, external_hash) FROM stdin;
1	admin	677469b637342c09847623254e097f63	\N	\N	2030-09-30 02:11:59	1	0	\N	\N	\N	admin@interactive.mn	1234567890	\N	\N	\N	\N	admin	1	\N	\N	\N	internal	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N
\.


--
-- Data for Name: um_system_user_info; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_system_user_info (id, system_user_id, store_keeper_code, store_keeper_name) FROM stdin;
\.


--
-- Data for Name: um_transaction_permission; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_transaction_permission (id, user_id, permission_code, role_id) FROM stdin;
\.


--
-- Data for Name: um_user; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user (user_id, is_active, system_user_id, department_id, created_date, created_user_id, modified_date, modified_user_id, username, customer_id, start_date, end_date, is_not_parent, is_mobile, is_mobile_default, is_use_folder_permission, db_user_name, default_menu_id, company_department_id, is_main, click_menu_id, alias_id) FROM stdin;
1	1	1	1	\N	\N	\N	\N	vr-admin	\N	\N	\N	0	1	1	0	\N	\N	1	1	\N	\N
\.


--
-- Data for Name: um_user_alias; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_alias (id, alias_system_user_id, alias_user_id, system_user_id, user_id, ref_structure_id, start_date, end_date, related_book_id, created_date, created_user_id, modified_date, modified_user_id, description) FROM stdin;
\.


--
-- Data for Name: um_user_email; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_email (id, user_id, email, password_hash, is_default, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: um_user_finger; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_finger (user_finger_id, user_id, finger_id, user_finger, file_path) FROM stdin;
\.


--
-- Data for Name: um_user_gps_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_gps_log (id, user_id, coordinate, "timestamp", battery_level, latitude, longitude, customer_id, crm_user_id, user_agent) FROM stdin;
\.


--
-- Data for Name: um_user_monpass_map; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_monpass_map (id, user_id, monpass_user_id, start_date, end_date, is_active, certificate_serial_number, token_serial_number, token_mode) FROM stdin;
\.


--
-- Data for Name: um_user_otp; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_otp (id, passcode, user_id, phone_number, state_reg_number, is_active, created_date) FROM stdin;
\.


--
-- Data for Name: um_user_permission_alias; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_permission_alias (id, user_id, alias_user_id, is_active, start_date, end_date, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: um_user_relation; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_relation (user_relation_id, src_user_id, trg_user_id, src_group_id, trg_group_id, src_role_id, trg_role_id, permission_id, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: um_user_role; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_role (user_id, role_id, id, is_active, modified_user_id, modified_date, created_user_id, created_date, start_date, end_date, wfm_status_id, wfm_description, access_log_id, alias_id) FROM stdin;
\.


--
-- Data for Name: um_user_role_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_role_log (user_id, role_id, id, is_active, modified_user_id, modified_date, created_user_id, created_date, start_date, end_date, wfm_status_id, wfm_description, log_id, log_created_date, log_action, log_created_user_id) FROM stdin;
\.


--
-- Data for Name: um_user_send_email; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_send_email (id, user_id, email) FROM stdin;
\.


--
-- Data for Name: um_user_session; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_session (session_id, user_id, created_date, updated_date, unit_name, employee_id, employee_key_id, department_id, system_user_id, language_code, is_mobile, scenario_id, customer_id, company_department_id, store_keeper_key_id) FROM stdin;
2a177f55-b9a6-448c-9072-c14453465a51	1	2023-10-11 17:00:52	2023-10-11 06:17:11.836804	default_pu	\N	\N	1	1	mn	0	\N	\N	1	\N
ea8d5b37-d8de-4d20-ac41-328ce0b012ac	1	2023-10-11 11:15:41	2023-10-11 11:15:41	default_pu	\N	\N	1	1	mn	0	\N	\N	1	\N
0ce893ac-d35a-4093-9bea-15a0a9ef2bd5	1	2023-10-11 17:07:43	2023-10-11 06:54:22.850089	default_pu	\N	\N	1	1	mn	0	\N	\N	1	\N
a121255e-a3b7-4d9d-ac0d-4c1e3e25c5b5	1	2023-10-12 08:44:45	2023-10-12 08:44:45	default_pu	\N	\N	1	1	mn	0	\N	\N	1	\N
66e08475-5f33-4d0f-8ff5-52199e8c89fb	1	2023-10-11 11:27:30	2023-10-11 11:27:30	default_pu	\N	\N	1	1	mn	0	\N	\N	1	\N
5182d5f6-b62d-42a7-b914-f9d0fbb8a5dd	1	2023-10-12 09:57:24	2023-10-12 06:23:58.367615	default_pu	\N	\N	1	1	mn	0	\N	\N	1	\N
d515215e-58c4-47cc-9731-ed037a66f50e	1	2023-10-13 09:25:48	2023-10-13 00:51:59.660923	default_pu	\N	\N	1	1	mn	0	\N	\N	1	\N
7c8ff8e8-fbce-4b6e-b65e-64b9af1f392f	1	2023-10-11 17:47:37	2023-10-11 17:47:37	default_pu	\N	\N	1	1	mn	0	\N	\N	1	\N
fa4badd0-d0e7-44ac-9507-346db4083446	1	2023-10-11 16:39:39	2023-10-11 05:59:58.521594	default_pu	\N	\N	1	1	mn	0	\N	\N	1	\N
\.


--
-- Data for Name: um_user_session_value; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_session_value (id, field_path, select_query, created_date, created_user_id) FROM stdin;
\.


--
-- Data for Name: um_user_set_from_email; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.um_user_set_from_email (id, system_user_id, email) FROM stdin;
\.


--
-- Data for Name: user_authentication_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.user_authentication_log (id, user_id, phone_number, description, otp, is_active, error_log, customer_id) FROM stdin;
\.


--
-- Data for Name: user_management_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.user_management_log (id, action_type_id, action_type_string, meta_data_id, meta_data_string, description, user_id, user_name, role_id, role_name, message_id, message_string, table_name, table_pk_column, db_structure_id, record_id, record_value, is_hierarchy, is_active, created_date, created_user_id, created_user_name, modified_date, modified_user_id, modified_user_name, department_id, department_name, table_description, action_id) FROM stdin;
\.


--
-- Data for Name: view_log; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.view_log (id, ref_structure_id, record_id, user_id, role_id, is_active, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: zzchat; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.zzchat (id, from_id, to_id, message, sent, read, direction, created_date, created_user_id, modified_date, modified_user_id, is_file, chatroomid, header_id, is_file_downloaded, deleted_by_from, deleted_by_to, parent_id, forward_id, forward_message, forward_date) FROM stdin;
\.


--
-- Data for Name: zzchat_block; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.zzchat_block (id, fromid, toid, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: zzchat_chatrooms; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.zzchat_chatrooms (id, name, lastactivity, createdby, password, type, vidsession, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: zzchat_chatrooms_users; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.zzchat_chatrooms_users (userid, chatroomid, lastactivity, isbanned, created_date, created_user_id, modified_date, modified_user_id) FROM stdin;
\.


--
-- Data for Name: zzchat_status; Type: TABLE DATA; Schema: cloud_customer_uat; Owner: enterprisedb
--

COPY cloud_customer_uat.zzchat_status (id, user_id, status, is_active, created_date, modified_date) FROM stdin;
\.


--
-- Name: base_company base_company_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.base_company
    ADD CONSTRAINT base_company_pk PRIMARY KEY (company_id);


--
-- Name: base_person_finger base_person_finger_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.base_person_finger
    ADD CONSTRAINT base_person_finger_pk PRIMARY KEY (id);


--
-- Name: base_person base_person_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.base_person
    ADD CONSTRAINT base_person_pk PRIMARY KEY (person_id);


--
-- Name: config config_pk1; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.config
    ADD CONSTRAINT config_pk1 PRIMARY KEY (id);


--
-- Name: config_value config_value_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.config_value
    ADD CONSTRAINT config_value_pk PRIMARY KEY (id);


--
-- Name: crm_user_kyc crm_user_kyc_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_user_kyc
    ADD CONSTRAINT crm_user_kyc_pk PRIMARY KEY (id);


--
-- Name: customer_bp_detail_config customer_bp_detail_config_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.customer_bp_detail_config
    ADD CONSTRAINT customer_bp_detail_config_pk PRIMARY KEY (id);


--
-- Name: customer_dv_field customer_dv_field_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.customer_dv_field
    ADD CONSTRAINT customer_dv_field_pk PRIMARY KEY (id);


--
-- Name: customer_dv_filter customer_dv_filter_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.customer_dv_filter
    ADD CONSTRAINT customer_dv_filter_pk PRIMARY KEY (id);


--
-- Name: customer_meta_user_config customer_meta_config_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.customer_meta_user_config
    ADD CONSTRAINT customer_meta_config_pk PRIMARY KEY (id);


--
-- Name: customer_proxy_config customer_proxy_config_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.customer_proxy_config
    ADD CONSTRAINT customer_proxy_config_pkey PRIMARY KEY (id);


--
-- Name: customer_st_grouping_config customer_st_grouping_confi_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.customer_st_grouping_config
    ADD CONSTRAINT customer_st_grouping_confi_pk PRIMARY KEY (id);


--
-- Name: db_dashboard_user db_dashboard_user_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.db_dashboard_user
    ADD CONSTRAINT db_dashboard_user_pk PRIMARY KEY (id);


--
-- Name: db_data_mart_config db_data_mart_config_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.db_data_mart_config
    ADD CONSTRAINT db_data_mart_config_pk PRIMARY KEY (id);


--
-- Name: db_data_mart_queue db_data_mart_queue_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.db_data_mart_queue
    ADD CONSTRAINT db_data_mart_queue_pk PRIMARY KEY (id);


--
-- Name: db_data_mart_schedule db_data_mart_schedule_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.db_data_mart_schedule
    ADD CONSTRAINT db_data_mart_schedule_pk PRIMARY KEY (id);


--
-- Name: db_hcm_org_email db_hcm_org_email_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.db_hcm_org_email
    ADD CONSTRAINT db_hcm_org_email_pk PRIMARY KEY (id);


--
-- Name: ecm_content_clip ecm_content_clip_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_clip
    ADD CONSTRAINT ecm_content_clip_pk PRIMARY KEY (id);


--
-- Name: ecm_content_file_version ecm_content_file_version_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_file_version
    ADD CONSTRAINT ecm_content_file_version_pk PRIMARY KEY (id);


--
-- Name: ecm_content_log ecm_content_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_log
    ADD CONSTRAINT ecm_content_log_pk PRIMARY KEY (id);


--
-- Name: ecm_content_map ecm_content_map_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_map
    ADD CONSTRAINT ecm_content_map_pk PRIMARY KEY (id);


--
-- Name: ecm_content_process_map ecm_content_type_map_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_process_map
    ADD CONSTRAINT ecm_content_type_map_pk PRIMARY KEY (id);


--
-- Name: ecm_content_type ecm_content_type_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_type
    ADD CONSTRAINT ecm_content_type_pk PRIMARY KEY (id);


--
-- Name: ecm_content_visitor ecm_content_visitor_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_visitor
    ADD CONSTRAINT ecm_content_visitor_pkey PRIMARY KEY (id);


--
-- Name: eml_email_log eml_email_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.eml_email_log
    ADD CONSTRAINT eml_email_log_pk PRIMARY KEY (id);


--
-- Name: eml_email_queue eml_email_queue_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.eml_email_queue
    ADD CONSTRAINT eml_email_queue_pk PRIMARY KEY (id);


--
-- Name: eml_email_schedule eml_email_schedule_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.eml_email_schedule
    ADD CONSTRAINT eml_email_schedule_pk PRIMARY KEY (id);


--
-- Name: eml_sms_schedule eml_sms_schedule_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.eml_sms_schedule
    ADD CONSTRAINT eml_sms_schedule_pk PRIMARY KEY (id);


--
-- Name: eml_template eml_template_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.eml_template
    ADD CONSTRAINT eml_template_pk PRIMARY KEY (id);


--
-- Name: fin_fiscal_period_curr_object fin_fis_curr_object_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_curr_object
    ADD CONSTRAINT fin_fis_curr_object_pk PRIMARY KEY (id);


--
-- Name: fin_fiscal_period_user fin_fiscal_period_user_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_user
    ADD CONSTRAINT fin_fiscal_period_user_pk PRIMARY KEY (id);


--
-- Name: fin_fiscal_period_close_acc fin_fp_close_acc_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_close_acc
    ADD CONSTRAINT fin_fp_close_acc_pk PRIMARY KEY (id);


--
-- Name: fin_fiscal_period_close_dep fin_fp_close_dep_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_close_dep
    ADD CONSTRAINT fin_fp_close_dep_pk PRIMARY KEY (id);


--
-- Name: fin_fiscal_period_close_dep fin_fp_close_dep_uk_con; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_close_dep
    ADD CONSTRAINT fin_fp_close_dep_uk_con UNIQUE (fiscal_period_id, department_id);


--
-- Name: hrm_employee_key hrm_employee_key_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee_key
    ADD CONSTRAINT hrm_employee_key_pk PRIMARY KEY (employee_key_id);


--
-- Name: hrm_employee hrm_employee_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee
    ADD CONSTRAINT hrm_employee_pk PRIMARY KEY (employee_id);


--
-- Name: hrm_employee hrm_employee_uk1; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee
    ADD CONSTRAINT hrm_employee_uk1 UNIQUE (employee_code);


--
-- Name: hrm_position_key hrm_position_key_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_position_key
    ADD CONSTRAINT hrm_position_key_pk PRIMARY KEY (position_key_id);


--
-- Name: hrm_position hrm_position_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_position
    ADD CONSTRAINT hrm_position_pk PRIMARY KEY (position_id);


--
-- Name: im_item_cost_key_fifo im_item_cost_key_fifo_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.im_item_cost_key_fifo
    ADD CONSTRAINT im_item_cost_key_fifo_pk PRIMARY KEY (id);


--
-- Name: im_item_cost_key im_item_cost_key_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.im_item_cost_key
    ADD CONSTRAINT im_item_cost_key_pk PRIMARY KEY (id);


--
-- Name: im_item_cost_log im_item_cost_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.im_item_cost_log
    ADD CONSTRAINT im_item_cost_log_pk PRIMARY KEY (id);


--
-- Name: im_item_cost_method im_item_cost_method_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.im_item_cost_method
    ADD CONSTRAINT im_item_cost_method_pk PRIMARY KEY (id);


--
-- Name: im_item_key_cost_calc im_item_key_cost_calc_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.im_item_key_cost_calc
    ADD CONSTRAINT im_item_key_cost_calc_pk PRIMARY KEY (id);


--
-- Name: im_item_key_cost im_item_key_cost_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.im_item_key_cost
    ADD CONSTRAINT im_item_key_cost_pk PRIMARY KEY (id);


--
-- Name: im_item_key_cost im_item_key_cost_uk1_con; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.im_item_key_cost
    ADD CONSTRAINT im_item_key_cost_uk1_con UNIQUE (in_date, item_id, department_id);


--
-- Name: jira_template_param jira_template_param_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.jira_template_param
    ADD CONSTRAINT jira_template_param_pk PRIMARY KEY (id);


--
-- Name: jira_template_type jira_template_type_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.jira_template_type
    ADD CONSTRAINT jira_template_type_pkey PRIMARY KEY (id);


--
-- Name: knowledge_category knowledge_category_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.knowledge_category
    ADD CONSTRAINT knowledge_category_pkey PRIMARY KEY (id);


--
-- Name: knowledge_helpful knowledge_helpful_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.knowledge_helpful
    ADD CONSTRAINT knowledge_helpful_pkey PRIMARY KEY (id);


--
-- Name: knowledge_meta_data_map knowledge_meta_data_map_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.knowledge_meta_data_map
    ADD CONSTRAINT knowledge_meta_data_map_pk PRIMARY KEY (id);


--
-- Name: knowledge_type knowledge_type_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.knowledge_type
    ADD CONSTRAINT knowledge_type_pk PRIMARY KEY (id);


--
-- Name: um_user_session_value meta_field_session_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_session_value
    ADD CONSTRAINT meta_field_session_pk PRIMARY KEY (id);


--
-- Name: ntf_mention_config meta_process_mention_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_mention_config
    ADD CONSTRAINT meta_process_mention_pk PRIMARY KEY (id);


--
-- Name: nlt_newsletter_book nlt_newsletter_book_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_book
    ADD CONSTRAINT nlt_newsletter_book_pkey PRIMARY KEY (id);


--
-- Name: nlt_newsletter_dtl nlt_newsletter_dtl_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_dtl
    ADD CONSTRAINT nlt_newsletter_dtl_pkey PRIMARY KEY (id);


--
-- Name: nlt_newsletter_schedule nlt_newsletter_schedule_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_schedule
    ADD CONSTRAINT nlt_newsletter_schedule_pkey PRIMARY KEY (id);


--
-- Name: nlt_newsletter_template nlt_newsletter_template_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_template
    ADD CONSTRAINT nlt_newsletter_template_pkey PRIMARY KEY (id);


--
-- Name: nlt_notification_map nlt_notification_map_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_notification_map
    ADD CONSTRAINT nlt_notification_map_pkey PRIMARY KEY (id);


--
-- Name: ntf_dash_notification ntf_dash_notification_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_dash_notification
    ADD CONSTRAINT ntf_dash_notification_pk PRIMARY KEY (id);


--
-- Name: ntf_notification_template_map ntf_not_template_map_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_template_map
    ADD CONSTRAINT ntf_not_template_map_pk PRIMARY KEY (id);


--
-- Name: ntf_notification_follow ntf_notification_follow_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_follow
    ADD CONSTRAINT ntf_notification_follow_pkey PRIMARY KEY (id);


--
-- Name: ntf_notification_log ntf_notification_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_log
    ADD CONSTRAINT ntf_notification_log_pk PRIMARY KEY (id);


--
-- Name: ntf_notification_param ntf_notification_param_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_param
    ADD CONSTRAINT ntf_notification_param_pk PRIMARY KEY (param_id);


--
-- Name: ntf_notification ntf_notification_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification
    ADD CONSTRAINT ntf_notification_pk PRIMARY KEY (notification_id);


--
-- Name: ntf_notification_process_param ntf_notification_process_p_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_process_param
    ADD CONSTRAINT ntf_notification_process_p_pk PRIMARY KEY (notification_process_param_id);


--
-- Name: ntf_notification_process ntf_notification_process_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_process
    ADD CONSTRAINT ntf_notification_process_pk PRIMARY KEY (notification_process_id);


--
-- Name: ntf_notification_schedule_log ntf_notification_schedule_log_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_schedule_log
    ADD CONSTRAINT ntf_notification_schedule_log_pkey PRIMARY KEY (id);


--
-- Name: ntf_notification_system ntf_notification_system_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_system
    ADD CONSTRAINT ntf_notification_system_pk PRIMARY KEY (notification_id, system_id);


--
-- Name: ntf_notification_type ntf_notification_type_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_type
    ADD CONSTRAINT ntf_notification_type_pk PRIMARY KEY (notification_type_id);


--
-- Name: ntf_notification_user ntf_notification_user_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_user
    ADD CONSTRAINT ntf_notification_user_pk PRIMARY KEY (notification_user_id);


--
-- Name: ntf_notify_all_log ntf_notify_all_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notify_all_log
    ADD CONSTRAINT ntf_notify_all_log_pk PRIMARY KEY (id);


--
-- Name: ntf_notify_all ntf_notify_all_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notify_all
    ADD CONSTRAINT ntf_notify_all_pk PRIMARY KEY (id);


--
-- Name: ntf_notify ntf_notify_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notify
    ADD CONSTRAINT ntf_notify_pk PRIMARY KEY (id);


--
-- Name: ntf_template ntf_template_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template
    ADD CONSTRAINT ntf_template_pk PRIMARY KEY (template_id);


--
-- Name: ntf_template_system ntf_template_system_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_system
    ADD CONSTRAINT ntf_template_system_pk PRIMARY KEY (id);


--
-- Name: ntf_template_system ntf_template_system_uk_con; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_system
    ADD CONSTRAINT ntf_template_system_uk_con UNIQUE (template_id, system_id);


--
-- Name: ntf_template ntf_template_uk1_con; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template
    ADD CONSTRAINT ntf_template_uk1_con UNIQUE (globe_dictionary_code);


--
-- Name: ntf_template_user ntf_template_user_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_user
    ADD CONSTRAINT ntf_template_user_pk PRIMARY KEY (template_user_id);


--
-- Name: ntf_user_config ntf_user_config_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_user_config
    ADD CONSTRAINT ntf_user_config_pk PRIMARY KEY (id);


--
-- Name: org_department_language org_department_language_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: cloud_platform_uat
--

ALTER TABLE ONLY cloud_customer_uat.org_department_language
    ADD CONSTRAINT org_department_language_pk PRIMARY KEY (id);


--
-- Name: org_department_language org_department_language_uq1; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: cloud_platform_uat
--

ALTER TABLE ONLY cloud_customer_uat.org_department_language
    ADD CONSTRAINT org_department_language_uq1 UNIQUE (department_id, language_id);


--
-- Name: org_department org_department_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.org_department
    ADD CONSTRAINT org_department_pk PRIMARY KEY (department_id);


--
-- Name: crm_company pk_crm_company; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_company
    ADD CONSTRAINT pk_crm_company PRIMARY KEY (company_id);


--
-- Name: crm_user pk_crm_user; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_user
    ADD CONSTRAINT pk_crm_user PRIMARY KEY (cust_user_id);


--
-- Name: ecm_content pk_ecm_content; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content
    ADD CONSTRAINT pk_ecm_content PRIMARY KEY (content_id);


--
-- Name: ecm_content_directory pk_ecm_content_directory; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_directory
    ADD CONSTRAINT pk_ecm_content_directory PRIMARY KEY (id);


--
-- Name: ecm_content_meta pk_ecm_content_meta; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_meta
    ADD CONSTRAINT pk_ecm_content_meta PRIMARY KEY (id);


--
-- Name: file_attach pk_file_attach; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: cloud_platform_uat
--

ALTER TABLE ONLY cloud_customer_uat.file_attach
    ADD CONSTRAINT pk_file_attach PRIMARY KEY (attach_id);


--
-- Name: fin_fiscal_period_old pk_fin_fiscal_period; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_old
    ADD CONSTRAINT pk_fin_fiscal_period PRIMARY KEY (id);


--
-- Name: im_cost_method pk_im_cost_method; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.im_cost_method
    ADD CONSTRAINT pk_im_cost_method PRIMARY KEY (id);


--
-- Name: crm_customer pk_mdm_customer; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_customer
    ADD CONSTRAINT pk_mdm_customer PRIMARY KEY (customer_id);


--
-- Name: meta_wfm_log pk_meta_wfm_log; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.meta_wfm_log
    ADD CONSTRAINT pk_meta_wfm_log PRIMARY KEY (id);


--
-- Name: ntf_notification_action pk_ntf_notification_action; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_action
    ADD CONSTRAINT pk_ntf_notification_action PRIMARY KEY (id);


--
-- Name: ntf_notification_action_log pk_ntf_notification_action_log; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_action_log
    ADD CONSTRAINT pk_ntf_notification_action_log PRIMARY KEY (id);


--
-- Name: ntf_notification_user_param pk_ntf_notification_user_param; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_user_param
    ADD CONSTRAINT pk_ntf_notification_user_param PRIMARY KEY (id);


--
-- Name: prl_calc pk_prl_calc; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_calc
    ADD CONSTRAINT pk_prl_calc PRIMARY KEY (id);


--
-- Name: prl_calc_type pk_prl_calc_type; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_calc_type
    ADD CONSTRAINT pk_prl_calc_type PRIMARY KEY (id);


--
-- Name: prl_salary_book pk_prl_salary_book; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_salary_book
    ADD CONSTRAINT pk_prl_salary_book PRIMARY KEY (id);


--
-- Name: ref_bank pk_ref_bank; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ref_bank
    ADD CONSTRAINT pk_ref_bank PRIMARY KEY (bank_id);


--
-- Name: ref_language pk_ref_language; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ref_language
    ADD CONSTRAINT pk_ref_language PRIMARY KEY (language_id);


--
-- Name: sch_schedule pk_sch_schedule; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_schedule
    ADD CONSTRAINT pk_sch_schedule PRIMARY KEY (schedule_id);


--
-- Name: sch_schedule_book pk_sch_schedule_01; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_schedule_book
    ADD CONSTRAINT pk_sch_schedule_01 PRIMARY KEY (schedule_book_id);


--
-- Name: sch_schedule_type pk_sch_schedule_type; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_schedule_type
    ADD CONSTRAINT pk_sch_schedule_type PRIMARY KEY (schedule_type_id);


--
-- Name: um_system_user pk_system_user; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_system_user
    ADD CONSTRAINT pk_system_user PRIMARY KEY (user_id);


--
-- Name: um_criteria pk_um_criteria; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_criteria
    ADD CONSTRAINT pk_um_criteria PRIMARY KEY (id);


--
-- Name: um_user_finger pk_um_user_finger; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_finger
    ADD CONSTRAINT pk_um_user_finger PRIMARY KEY (user_finger_id);


--
-- Name: prl_calc_department prl_calc_department_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_calc_department
    ADD CONSTRAINT prl_calc_department_pkey PRIMARY KEY (id);


--
-- Name: prl_salary_sheet prl_salary_sheet_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_salary_sheet
    ADD CONSTRAINT prl_salary_sheet_pk PRIMARY KEY (id);


--
-- Name: ref_bank ref_bank_uk1; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ref_bank
    ADD CONSTRAINT ref_bank_uk1 UNIQUE (bank_code, company_department_id);


--
-- Name: sch_process sch_process_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_process
    ADD CONSTRAINT sch_process_pk PRIMARY KEY (id);


--
-- Name: sch_schedule_config sch_schedule_config_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_schedule_config
    ADD CONSTRAINT sch_schedule_config_pk PRIMARY KEY (id);


--
-- Name: sch_schedule_email sch_schedule_email_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_schedule_email
    ADD CONSTRAINT sch_schedule_email_pkey PRIMARY KEY (id);


--
-- Name: sch_schedule_log sch_schedule_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_schedule_log
    ADD CONSTRAINT sch_schedule_log_pk PRIMARY KEY (id);


--
-- Name: system_access_log ssystem_access_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.system_access_log
    ADD CONSTRAINT ssystem_access_log_pk PRIMARY KEY (id);


--
-- Name: crm_user_role sys_c00459721; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_user_role
    ADD CONSTRAINT sys_c00459721 PRIMARY KEY (id);


--
-- Name: sysint_service_method_log sysint_golomt_finacle_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sysint_service_method_log
    ADD CONSTRAINT sysint_golomt_finacle_log_pk PRIMARY KEY (id);


--
-- Name: sysint_service_method_log_dtl sysint_service_dtl_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sysint_service_method_log_dtl
    ADD CONSTRAINT sysint_service_dtl_pk PRIMARY KEY (id);


--
-- Name: system_access_config system_access_config_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.system_access_config
    ADD CONSTRAINT system_access_config_pk PRIMARY KEY (id);


--
-- Name: system_action_log system_action_log_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.system_action_log
    ADD CONSTRAINT system_action_log_pkey PRIMARY KEY (id);


--
-- Name: system_log_dtl system_log_dtl_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.system_log_dtl
    ADD CONSTRAINT system_log_dtl_pk PRIMARY KEY (id);


--
-- Name: system_log_php system_log_php_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.system_log_php
    ADD CONSTRAINT system_log_php_pk PRIMARY KEY (id);


--
-- Name: system_log system_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.system_log
    ADD CONSTRAINT system_log_pk PRIMARY KEY (id);


--
-- Name: um_config_value um_config_value_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_config_value
    ADD CONSTRAINT um_config_value_pk PRIMARY KEY (id);


--
-- Name: um_global_user um_global_user_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_global_user
    ADD CONSTRAINT um_global_user_pkey PRIMARY KEY (id);


--
-- Name: jira_template um_jira_template_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.jira_template
    ADD CONSTRAINT um_jira_template_pk PRIMARY KEY (id);


--
-- Name: um_login_attempts um_login_attempts_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_login_attempts
    ADD CONSTRAINT um_login_attempts_pk PRIMARY KEY (id);


--
-- Name: um_login_device um_login_device_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_login_device
    ADD CONSTRAINT um_login_device_pk PRIMARY KEY (id);


--
-- Name: um_login_failed um_login_failed_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_login_failed
    ADD CONSTRAINT um_login_failed_pk PRIMARY KEY (id);


--
-- Name: um_menu_config um_menu_config_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_menu_config
    ADD CONSTRAINT um_menu_config_pkey PRIMARY KEY (id);


--
-- Name: um_meta_block um_meta_block_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_meta_block
    ADD CONSTRAINT um_meta_block_pk PRIMARY KEY (id);


--
-- Name: um_meta_lock um_meta_lock_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_meta_lock
    ADD CONSTRAINT um_meta_lock_pkey PRIMARY KEY (id);


--
-- Name: um_meta_permission um_meta_permission3_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_meta_permission
    ADD CONSTRAINT um_meta_permission3_pk PRIMARY KEY (permission_id);


--
-- Name: um_meta_permission_cache um_meta_permission_cache_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_meta_permission_cache
    ADD CONSTRAINT um_meta_permission_cache_pk PRIMARY KEY (id);


--
-- Name: um_meta_permission_log um_meta_permission_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_meta_permission_log
    ADD CONSTRAINT um_meta_permission_log_pk PRIMARY KEY (log_id);


--
-- Name: um_quick_menu um_quick_menu_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_quick_menu
    ADD CONSTRAINT um_quick_menu_pk PRIMARY KEY (id);


--
-- Name: um_record_permission um_record_permission_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_record_permission
    ADD CONSTRAINT um_record_permission_pk PRIMARY KEY (id);


--
-- Name: um_role_customer um_role_customer_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_role_customer
    ADD CONSTRAINT um_role_customer_pkey PRIMARY KEY (id);


--
-- Name: um_system_user_info um_system_user_info_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_system_user_info
    ADD CONSTRAINT um_system_user_info_pkey PRIMARY KEY (id);


--
-- Name: um_system_user um_system_user_uk1_con; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_system_user
    ADD CONSTRAINT um_system_user_uk1_con UNIQUE (username);


--
-- Name: um_transaction_permission um_transaction_permission_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_transaction_permission
    ADD CONSTRAINT um_transaction_permission_pkey PRIMARY KEY (id);


--
-- Name: um_user_alias um_user_alias_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_alias
    ADD CONSTRAINT um_user_alias_pk PRIMARY KEY (id);


--
-- Name: um_user_email um_user_email_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_email
    ADD CONSTRAINT um_user_email_pk PRIMARY KEY (id);


--
-- Name: um_user_gps_log um_user_gps_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_gps_log
    ADD CONSTRAINT um_user_gps_log_pk PRIMARY KEY (id);


--
-- Name: um_user_monpass_map um_user_monpass_map_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_monpass_map
    ADD CONSTRAINT um_user_monpass_map_pk PRIMARY KEY (id);


--
-- Name: um_user_otp um_user_one_time_code_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_otp
    ADD CONSTRAINT um_user_one_time_code_pk PRIMARY KEY (id);


--
-- Name: um_user_permission_alias um_user_permission_alias_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_permission_alias
    ADD CONSTRAINT um_user_permission_alias_pk PRIMARY KEY (id);


--
-- Name: um_user um_user_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user
    ADD CONSTRAINT um_user_pk PRIMARY KEY (user_id);


--
-- Name: um_user_relation um_user_relation_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_relation
    ADD CONSTRAINT um_user_relation_pk PRIMARY KEY (user_relation_id);


--
-- Name: um_user_role um_user_role_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_role
    ADD CONSTRAINT um_user_role_pk PRIMARY KEY (id);


--
-- Name: um_user_send_email um_user_send_email_id_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_send_email
    ADD CONSTRAINT um_user_send_email_id_pk PRIMARY KEY (id);


--
-- Name: um_user_session um_user_session_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_session
    ADD CONSTRAINT um_user_session_pk PRIMARY KEY (session_id);


--
-- Name: um_user_set_from_email um_user_set_from_email_pkey; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_set_from_email
    ADD CONSTRAINT um_user_set_from_email_pkey PRIMARY KEY (id);


--
-- Name: base_company uq_crm_company_company_regist_con; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.base_company
    ADD CONSTRAINT uq_crm_company_company_regist_con UNIQUE (company_register_number);


--
-- Name: view_log view_log_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.view_log
    ADD CONSTRAINT view_log_pk PRIMARY KEY (id);


--
-- Name: zzchat_block zzchat_block_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.zzchat_block
    ADD CONSTRAINT zzchat_block_pk PRIMARY KEY (id);


--
-- Name: zzchat_chatrooms zzchat_chatrooms_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.zzchat_chatrooms
    ADD CONSTRAINT zzchat_chatrooms_pk PRIMARY KEY (id);


--
-- Name: zzchat zzchat_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.zzchat
    ADD CONSTRAINT zzchat_pk PRIMARY KEY (id);


--
-- Name: zzchat_status zzchat_status_pk; Type: CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.zzchat_status
    ADD CONSTRAINT zzchat_status_pk PRIMARY KEY (id);


--
-- Name: base_company_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX base_company_index1 ON cloud_customer_uat.base_company USING btree (country_id);


--
-- Name: base_company_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX base_company_index2 ON cloud_customer_uat.base_company USING btree (lower((company_register_number)::text));


--
-- Name: base_person_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX base_person_index1 ON cloud_customer_uat.base_person USING btree (substr((last_name)::text, (0)::numeric, (1)::numeric));


--
-- Name: base_person_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX base_person_index2 ON cloud_customer_uat.base_person USING btree (initcap((first_name)::text));


--
-- Name: base_person_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX base_person_index3 ON cloud_customer_uat.base_person USING btree (upper(substr((last_name)::text, (1)::numeric, (1)::numeric)));


--
-- Name: base_person_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX base_person_index4 ON cloud_customer_uat.base_person USING btree (country_id);


--
-- Name: base_person_index5; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX base_person_index5 ON cloud_customer_uat.base_person USING btree (origin_id);


--
-- Name: base_person_index6; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX base_person_index6 ON cloud_customer_uat.base_person USING btree (lower((state_reg_number)::text));


--
-- Name: base_person_index7; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX base_person_index7 ON cloud_customer_uat.base_person USING btree (upper((state_reg_number)::text));


--
-- Name: base_person_index8; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX base_person_index8 ON cloud_customer_uat.base_person USING btree (upper(substr((last_name)::text, (1)::numeric, (2)::numeric)));


--
-- Name: crm_customer_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX crm_customer_index1 ON cloud_customer_uat.crm_customer USING btree (customer_group_id);


--
-- Name: crm_customer_map_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX crm_customer_map_index1 ON cloud_customer_uat.crm_customer_map USING btree (customer_id);


--
-- Name: crm_customer_map_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX crm_customer_map_index2 ON cloud_customer_uat.crm_customer_map USING btree (department_id);


--
-- Name: crm_customer_map_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX crm_customer_map_index3 ON cloud_customer_uat.crm_customer_map USING btree (customer_id, employee_id);


--
-- Name: crm_customer_map_uk1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX crm_customer_map_uk1 ON cloud_customer_uat.crm_customer_map USING btree (employee_id);


--
-- Name: crm_user_kyc_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX crm_user_kyc_index1 ON cloud_customer_uat.crm_user_kyc USING btree (crm_user_id, upper((kyc_type)::text), upper((kyc_key)::text), upper((kyc_value)::text));


--
-- Name: customer_dv_field_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX customer_dv_field_index1 ON cloud_customer_uat.customer_dv_field USING btree (meta_data_id);


--
-- Name: customer_dv_field_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX customer_dv_field_index2 ON cloud_customer_uat.customer_dv_field USING btree (field_path);


--
-- Name: customer_dv_field_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX customer_dv_field_index3 ON cloud_customer_uat.customer_dv_field USING btree (lower((field_path)::text));


--
-- Name: customer_mt_u_cnfg_indx1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX customer_mt_u_cnfg_indx1 ON cloud_customer_uat.customer_meta_user_config USING btree (meta_data_id);


--
-- Name: customer_mt_u_cnfg_indx2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX customer_mt_u_cnfg_indx2 ON cloud_customer_uat.customer_meta_user_config USING btree (user_id);


--
-- Name: customer_st_group_cnfg_indx1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX customer_st_group_cnfg_indx1 ON cloud_customer_uat.customer_st_grouping_config USING btree (user_id, statement_meta_data_id);


--
-- Name: db_dashboard_user_ux1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX db_dashboard_user_ux1 ON cloud_customer_uat.db_dashboard_user USING btree (db_dashboard_id, user_id);


--
-- Name: db_data_mart_config_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX db_data_mart_config_index1 ON cloud_customer_uat.db_data_mart_config USING btree (src_table_name);


--
-- Name: db_data_mart_queue_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX db_data_mart_queue_index1 ON cloud_customer_uat.db_data_mart_queue USING btree (src_table_name, status);


--
-- Name: ecm_content_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ecm_content_index1 ON cloud_customer_uat.ecm_content USING btree (created_user_id);


--
-- Name: ecm_content_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ecm_content_index2 ON cloud_customer_uat.ecm_content USING btree (is_photo);


--
-- Name: ecm_content_map_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ecm_content_map_index1 ON cloud_customer_uat.ecm_content_map USING btree (ref_structure_id, record_id);


--
-- Name: ecm_content_map_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ecm_content_map_index2 ON cloud_customer_uat.ecm_content_map USING btree (main_record_id);


--
-- Name: ecm_content_uq97; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX ecm_content_uq97 ON cloud_customer_uat.ecm_content USING btree (content_id, wfm_status_id);


--
-- Name: eml_email_log_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX eml_email_log_index1 ON cloud_customer_uat.eml_email_log USING btree (user_id);


--
-- Name: eml_email_log_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX eml_email_log_index2 ON cloud_customer_uat.eml_email_log USING btree (record_id);


--
-- Name: eml_email_log_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX eml_email_log_index3 ON cloud_customer_uat.eml_email_log USING btree (ref_stucture_id);


--
-- Name: eml_email_log_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX eml_email_log_index4 ON cloud_customer_uat.eml_email_log USING btree (email_template_id);


--
-- Name: eml_email_log_index5; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX eml_email_log_index5 ON cloud_customer_uat.eml_email_log USING btree (notification_id);


--
-- Name: eml_template_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX eml_template_index1 ON cloud_customer_uat.eml_template USING btree (code);


--
-- Name: eml_template_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX eml_template_index2 ON cloud_customer_uat.eml_template USING btree (lower((code)::text));


--
-- Name: fin_fp_close_dep_uk; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX fin_fp_close_dep_uk ON cloud_customer_uat.fin_fiscal_period_close_dep USING btree (fiscal_period_id, department_id);


--
-- Name: hrm_employee_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_index1 ON cloud_customer_uat.hrm_employee USING btree (gender);


--
-- Name: hrm_employee_index10; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_index10 ON cloud_customer_uat.hrm_employee USING btree (work_start_date);


--
-- Name: hrm_employee_index11; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_index11 ON cloud_customer_uat.hrm_employee USING btree (position_field_id);


--
-- Name: hrm_employee_index12; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_index12 ON cloud_customer_uat.hrm_employee USING btree (date_of_birth);


--
-- Name: hrm_employee_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_index2 ON cloud_customer_uat.hrm_employee USING btree (employee_code);


--
-- Name: hrm_employee_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_index4 ON cloud_customer_uat.hrm_employee USING btree (is_active);


--
-- Name: hrm_employee_index5; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_index5 ON cloud_customer_uat.hrm_employee USING btree (first_name, last_name);


--
-- Name: hrm_employee_index6; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_index6 ON cloud_customer_uat.hrm_employee USING btree (first_name);


--
-- Name: hrm_employee_index7; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_index7 ON cloud_customer_uat.hrm_employee USING btree (last_name);


--
-- Name: hrm_employee_index8; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_index8 ON cloud_customer_uat.hrm_employee USING btree (current_status_id);


--
-- Name: hrm_employee_index9; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_index9 ON cloud_customer_uat.hrm_employee USING btree (contract_start_date);


--
-- Name: hrm_employee_key_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_key_index1 ON cloud_customer_uat.hrm_employee_key USING btree (employee_id);


--
-- Name: hrm_employee_key_index10; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_key_index10 ON cloud_customer_uat.hrm_employee_key USING btree (current_status_id);


--
-- Name: hrm_employee_key_index11; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_key_index11 ON cloud_customer_uat.hrm_employee_key USING btree (salary_sublevel_id);


--
-- Name: hrm_employee_key_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_key_index2 ON cloud_customer_uat.hrm_employee_key USING btree (position_key_id);


--
-- Name: hrm_employee_key_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_key_index3 ON cloud_customer_uat.hrm_employee_key USING btree (salary_key_id);


--
-- Name: hrm_employee_key_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_key_index4 ON cloud_customer_uat.hrm_employee_key USING btree (department_id);


--
-- Name: hrm_employee_key_index5; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_key_index5 ON cloud_customer_uat.hrm_employee_key USING btree (insured_type_id);


--
-- Name: hrm_employee_key_index6; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_key_index6 ON cloud_customer_uat.hrm_employee_key USING btree (status_id);


--
-- Name: hrm_employee_key_index7; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_key_index7 ON cloud_customer_uat.hrm_employee_key USING btree (is_active);


--
-- Name: hrm_employee_key_index8; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_key_index8 ON cloud_customer_uat.hrm_employee_key USING btree (work_start_date, work_end_date);


--
-- Name: hrm_employee_key_index9; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_employee_key_index9 ON cloud_customer_uat.hrm_employee_key USING btree (is_active, department_id);


--
-- Name: hrm_position_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_position_index1 ON cloud_customer_uat.hrm_position USING btree (classification_id);


--
-- Name: hrm_position_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_position_index2 ON cloud_customer_uat.hrm_position USING btree (prof_level_id);


--
-- Name: hrm_position_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_position_index3 ON cloud_customer_uat.hrm_position USING btree (vocation_group_id);


--
-- Name: hrm_position_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_position_index4 ON cloud_customer_uat.hrm_position USING btree (created_user_id);


--
-- Name: hrm_position_index5; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_position_index5 ON cloud_customer_uat.hrm_position USING btree (created_date DESC);


--
-- Name: hrm_position_key_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_position_key_index1 ON cloud_customer_uat.hrm_position_key USING btree (position_id);


--
-- Name: hrm_position_key_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_position_key_index2 ON cloud_customer_uat.hrm_position_key USING btree (department_id);


--
-- Name: hrm_position_key_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_position_key_index3 ON cloud_customer_uat.hrm_position_key USING btree (position_id, department_id);


--
-- Name: hrm_position_key_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_position_key_index4 ON cloud_customer_uat.hrm_position_key USING btree (is_active, department_id);


--
-- Name: hrm_position_key_index5; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_position_key_index5 ON cloud_customer_uat.hrm_position_key USING btree (is_active);


--
-- Name: hrm_position_key_index6; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX hrm_position_key_index6 ON cloud_customer_uat.hrm_position_key USING btree (position_id, is_active);


--
-- Name: idx$$_24e370001; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX "idx$$_24e370001" ON cloud_customer_uat.org_department USING btree (parent_id, department_id);


--
-- Name: idx$$_24e370002; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX "idx$$_24e370002" ON cloud_customer_uat.meta_dm_record_map USING btree (lower((src_table_name)::text), lower((trg_table_name)::text), trg_record_id, src_record_id);


--
-- Name: idx$$_24e370003; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX "idx$$_24e370003" ON cloud_customer_uat.meta_dm_record_map USING btree (lower((trg_table_name)::text), lower((src_table_name)::text), trg_record_id, src_record_id);


--
-- Name: idx$$_270b30001; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX "idx$$_270b30001" ON cloud_customer_uat.ecm_content_map USING btree (record_id, content_id);


--
-- Name: im_item_cost_key_fifo_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX im_item_cost_key_fifo_index1 ON cloud_customer_uat.im_item_cost_key_fifo USING btree (item_key_id, cost_order);


--
-- Name: im_item_cost_key_fifo_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX im_item_cost_key_fifo_index2 ON cloud_customer_uat.im_item_cost_key_fifo USING btree (department_id, book_date);


--
-- Name: im_item_cost_key_fifo_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX im_item_cost_key_fifo_index3 ON cloud_customer_uat.im_item_cost_key_fifo USING btree (store_keeper_key_id, book_date);


--
-- Name: im_item_cost_key_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX im_item_cost_key_index1 ON cloud_customer_uat.im_item_cost_key USING btree (book_date DESC, item_key_id);


--
-- Name: im_item_cost_proportion_in1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX im_item_cost_proportion_in1 ON cloud_customer_uat.im_item_cost_proportion USING btree (id);


--
-- Name: im_item_cost_tmp_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX im_item_cost_tmp_index1 ON cloud_customer_uat.im_item_cost_tmp USING btree (id);


--
-- Name: im_item_key_cost_uk1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX im_item_key_cost_uk1 ON cloud_customer_uat.im_item_key_cost USING btree (in_date, item_id, department_id);


--
-- Name: index_000059; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX index_000059 ON cloud_customer_uat.um_criteria USING btree (meta_data_id);


--
-- Name: index_000061; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX index_000061 ON cloud_customer_uat.ecm_content_map USING btree (ref_structure_id);


--
-- Name: index_000069; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX index_000069 ON cloud_customer_uat.jira_template_type USING btree (get_process_id);


--
-- Name: index_000073; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX index_000073 ON cloud_customer_uat.customer_proxy_config USING btree (proxy_meta_data_id);


--
-- Name: index_000074; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX index_000074 ON cloud_customer_uat.customer_proxy_config USING btree (action_meta_data_id);


--
-- Name: index_0056; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX index_0056 ON cloud_customer_uat.meta_wfm_status_permission USING btree (user_id);


--
-- Name: index_0162; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX index_0162 ON cloud_customer_uat.um_meta_permission USING btree (meta_data_id);


--
-- Name: index_0360; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX index_0360 ON cloud_customer_uat.meta_dm_record_map USING btree (src_table_name, src_record_id, trg_table_name, trg_record_id);


--
-- Name: index_0471; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX index_0471 ON cloud_customer_uat.um_meta_permission USING btree (modified_user_id);


--
-- Name: index_0502; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX index_0502 ON cloud_customer_uat.meta_wfm_status_permission USING btree (role_id);


--
-- Name: index_0537; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX index_0537 ON cloud_customer_uat.ecm_content_meta USING btree (meta_data_id);


--
-- Name: knowledge_meta_data_map_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX knowledge_meta_data_map_index1 ON cloud_customer_uat.knowledge_meta_data_map USING btree (meta_data_id);


--
-- Name: meta_dm_record_map_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX meta_dm_record_map_index1 ON cloud_customer_uat.meta_dm_record_map USING btree (trg_record_id);


--
-- Name: meta_dm_record_map_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX meta_dm_record_map_index2 ON cloud_customer_uat.meta_dm_record_map USING btree (src_record_id);


--
-- Name: meta_dm_record_map_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX meta_dm_record_map_index3 ON cloud_customer_uat.meta_dm_record_map USING btree (src_table_name, trg_table_name);


--
-- Name: meta_dm_record_map_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX meta_dm_record_map_index4 ON cloud_customer_uat.meta_dm_record_map USING btree (semantic_type_id);


--
-- Name: meta_wfm_log_in1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX meta_wfm_log_in1 ON cloud_customer_uat.meta_wfm_log USING btree (created_user_id, ref_structure_id);


--
-- Name: meta_wfm_log_in2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX meta_wfm_log_in2 ON cloud_customer_uat.meta_wfm_log USING btree (wfm_status_id, record_id, created_date);


--
-- Name: meta_wfm_log_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX meta_wfm_log_index1 ON cloud_customer_uat.meta_wfm_log USING btree (ref_structure_id DESC);


--
-- Name: meta_wfm_log_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX meta_wfm_log_index2 ON cloud_customer_uat.meta_wfm_log USING btree (created_date DESC, record_id DESC, created_user_id DESC);


--
-- Name: meta_wfm_log_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX meta_wfm_log_index3 ON cloud_customer_uat.meta_wfm_log USING btree (record_id DESC, wfm_status_id DESC);


--
-- Name: meta_wfm_status_perm_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX meta_wfm_status_perm_index1 ON cloud_customer_uat.meta_wfm_status_permission USING btree (wfm_status_id);


--
-- Name: meta_wfm_status_perm_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX meta_wfm_status_perm_index2 ON cloud_customer_uat.meta_wfm_status_permission USING btree (user_id, is_edit, role_id);


--
-- Name: meta_wfm_status_permissi_uq97; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX meta_wfm_status_permissi_uq97 ON cloud_customer_uat.meta_wfm_status_permission USING btree (id, wfm_status_id);


--
-- Name: metadmrecmapsrctable; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX metadmrecmapsrctable ON cloud_customer_uat.meta_dm_record_map USING btree (lower((src_table_name)::text));


--
-- Name: metadmrecmaptrgtable; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX metadmrecmaptrgtable ON cloud_customer_uat.meta_dm_record_map USING btree (lower((trg_table_name)::text));


--
-- Name: ntf_notif_template_map_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ntf_notif_template_map_index1 ON cloud_customer_uat.ntf_notification_template_map USING btree (meta_data_id);


--
-- Name: ntf_notif_template_map_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ntf_notif_template_map_index2 ON cloud_customer_uat.ntf_notification_template_map USING btree (notification_id);


--
-- Name: ntf_notif_user_param_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ntf_notif_user_param_index1 ON cloud_customer_uat.ntf_notification_user_param USING btree (notification_user_id);


--
-- Name: ntf_notification_action_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ntf_notification_action_index1 ON cloud_customer_uat.ntf_notification_action USING btree (notification_id);


--
-- Name: ntf_notification_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ntf_notification_index1 ON cloud_customer_uat.ntf_notification USING btree (notification_type_id);


--
-- Name: ntf_notification_user_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ntf_notification_user_index1 ON cloud_customer_uat.ntf_notification_user USING btree (notification_id);


--
-- Name: ntf_notification_user_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ntf_notification_user_index2 ON cloud_customer_uat.ntf_notification_user USING btree (user_id);


--
-- Name: ntf_notification_user_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX ntf_notification_user_index3 ON cloud_customer_uat.ntf_notification_user USING btree (user_id, read_date, notify_date);


--
-- Name: ntf_template_system_uk; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX ntf_template_system_uk ON cloud_customer_uat.ntf_template_system USING btree (template_id, system_id);


--
-- Name: ntf_template_uk1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX ntf_template_uk1 ON cloud_customer_uat.ntf_template USING btree (globe_dictionary_code);


--
-- Name: org_department_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX org_department_index1 ON cloud_customer_uat.org_department USING btree (is_active);


--
-- Name: org_department_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX org_department_index2 ON cloud_customer_uat.org_department USING btree (parent_id);


--
-- Name: org_department_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX org_department_index3 ON cloud_customer_uat.org_department USING btree (department_id, is_active);


--
-- Name: org_department_ix3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX org_department_ix3 ON cloud_customer_uat.org_department USING btree (dependency_department_id);


--
-- Name: prl_calc_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX prl_calc_index1 ON cloud_customer_uat.prl_calc USING btree (start_date DESC, end_date DESC);


--
-- Name: prl_calc_type_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX prl_calc_type_index1 ON cloud_customer_uat.prl_calc_type USING btree (calc_type_code);


--
-- Name: prl_calc_type_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX prl_calc_type_index2 ON cloud_customer_uat.prl_calc_type USING btree (id, calc_type_code);


--
-- Name: prl_salary_book_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX prl_salary_book_index1 ON cloud_customer_uat.prl_salary_book USING btree (calc_type_id, calc_id, department_id);


--
-- Name: prl_salary_book_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX prl_salary_book_index2 ON cloud_customer_uat.prl_salary_book USING btree (department_id);


--
-- Name: prl_salary_book_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX prl_salary_book_index3 ON cloud_customer_uat.prl_salary_book USING btree (calc_id);


--
-- Name: prl_salary_sheet_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX prl_salary_sheet_index1 ON cloud_customer_uat.prl_salary_sheet USING btree (general_ledger_book_id);


--
-- Name: prl_salary_sheet_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX prl_salary_sheet_index2 ON cloud_customer_uat.prl_salary_sheet USING btree (employee_key_id);


--
-- Name: prl_salary_sheet_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX prl_salary_sheet_index3 ON cloud_customer_uat.prl_salary_sheet USING btree (sal_book_id, employee_key_id);


--
-- Name: system_log_dtl_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX system_log_dtl_index1 ON cloud_customer_uat.system_log_dtl USING btree (system_log_id);


--
-- Name: system_log_dtl_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX system_log_dtl_index2 ON cloud_customer_uat.system_log_dtl USING btree (sub_id);


--
-- Name: system_log_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX system_log_index1 ON cloud_customer_uat.system_log USING btree (user_id);


--
-- Name: um_login_attempts_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_login_attempts_index1 ON cloud_customer_uat.um_login_attempts USING btree (created_date);


--
-- Name: um_login_attempts_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_login_attempts_index2 ON cloud_customer_uat.um_login_attempts USING btree (ip_address);


--
-- Name: um_login_attempts_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_login_attempts_index3 ON cloud_customer_uat.um_login_attempts USING btree (session_id);


--
-- Name: um_login_device_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_login_device_index1 ON cloud_customer_uat.um_login_device USING btree (system_user_id);


--
-- Name: um_login_device_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_login_device_index2 ON cloud_customer_uat.um_login_device USING btree (ip_address);


--
-- Name: um_login_device_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_login_device_index3 ON cloud_customer_uat.um_login_device USING btree (platform_name);


--
-- Name: um_login_failed_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_login_failed_index1 ON cloud_customer_uat.um_login_failed USING btree (ip_address);


--
-- Name: um_login_failed_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_login_failed_index2 ON cloud_customer_uat.um_login_failed USING btree (system_user_id);


--
-- Name: um_menu_config_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_menu_config_index1 ON cloud_customer_uat.um_menu_config USING btree (role_id);


--
-- Name: um_menu_config_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_menu_config_index2 ON cloud_customer_uat.um_menu_config USING btree (user_id);


--
-- Name: um_menu_config_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_menu_config_index3 ON cloud_customer_uat.um_menu_config USING btree (is_default_menu);


--
-- Name: um_meta_block_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_meta_block_index1 ON cloud_customer_uat.um_meta_block USING btree (user_id);


--
-- Name: um_meta_block_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_meta_block_index2 ON cloud_customer_uat.um_meta_block USING btree (menu_meta_data_id);


--
-- Name: um_meta_block_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_meta_block_index3 ON cloud_customer_uat.um_meta_block USING btree (action_meta_data_id);


--
-- Name: um_meta_block_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_meta_block_index4 ON cloud_customer_uat.um_meta_block USING btree (is_all_user);


--
-- Name: um_meta_per_cache_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_meta_per_cache_index1 ON cloud_customer_uat.um_meta_permission_cache USING btree (meta_data_id);


--
-- Name: um_meta_per_cache_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_meta_per_cache_index2 ON cloud_customer_uat.um_meta_permission_cache USING btree (parent_meta_data_id);


--
-- Name: um_meta_permission_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_meta_permission_index1 ON cloud_customer_uat.um_meta_permission USING btree (user_id);


--
-- Name: um_meta_permission_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_meta_permission_index2 ON cloud_customer_uat.um_meta_permission USING btree (role_id);


--
-- Name: um_meta_permission_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_meta_permission_index3 ON cloud_customer_uat.um_meta_permission USING btree (meta_data_id, is_denied, role_id, permission_id);


--
-- Name: um_meta_permission_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_meta_permission_index4 ON cloud_customer_uat.um_meta_permission USING btree (meta_data_id, user_id);


--
-- Name: um_quick_menu_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_quick_menu_index1 ON cloud_customer_uat.um_quick_menu USING btree (user_id);


--
-- Name: um_quick_menu_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_quick_menu_index2 ON cloud_customer_uat.um_quick_menu USING btree (system_id);


--
-- Name: um_quick_menu_uk; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX um_quick_menu_uk ON cloud_customer_uat.um_quick_menu USING btree (user_id, system_id, meta_data_id);


--
-- Name: um_system_user_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_system_user_index1 ON cloud_customer_uat.um_system_user USING btree (person_id);


--
-- Name: um_system_user_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_system_user_index2 ON cloud_customer_uat.um_system_user USING btree (lower((email)::text));


--
-- Name: um_system_user_uk1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX um_system_user_uk1 ON cloud_customer_uat.um_system_user USING btree (username);


--
-- Name: um_user_data_perm_cache_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_data_perm_cache_index1 ON ONLY cloud_customer_uat.um_user_data_permission_cache USING btree (user_id);


--
-- Name: um_user_data_permission_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_data_permission_index1 ON ONLY cloud_customer_uat.um_user_data_permission USING btree (user_id);


--
-- Name: um_user_data_permission_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_data_permission_index2 ON ONLY cloud_customer_uat.um_user_data_permission USING btree (role_id);


--
-- Name: um_user_data_permission_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_data_permission_index3 ON ONLY cloud_customer_uat.um_user_data_permission USING btree (record_id);


--
-- Name: um_user_data_permission_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_data_permission_index4 ON ONLY cloud_customer_uat.um_user_data_permission USING btree (db_structure_id, action_id, is_active, role_id, user_id);


--
-- Name: um_user_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_index1 ON cloud_customer_uat.um_user USING btree (is_active);


--
-- Name: um_user_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_index2 ON cloud_customer_uat.um_user USING btree (department_id);


--
-- Name: um_user_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_index3 ON cloud_customer_uat.um_user USING btree (system_user_id);


--
-- Name: um_user_monpass_map_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_monpass_map_index1 ON cloud_customer_uat.um_user_monpass_map USING btree (monpass_user_id);


--
-- Name: um_user_monpass_map_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_monpass_map_index2 ON cloud_customer_uat.um_user_monpass_map USING btree (user_id);


--
-- Name: um_user_otp_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_otp_index1 ON cloud_customer_uat.um_user_otp USING btree (user_id);


--
-- Name: um_user_role_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_role_index1 ON cloud_customer_uat.um_user_role USING btree (user_id, role_id, is_active);


--
-- Name: um_user_role_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_role_index2 ON cloud_customer_uat.um_user_role USING btree (role_id);


--
-- Name: um_user_role_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_role_index3 ON cloud_customer_uat.um_user_role USING btree (user_id, role_id, start_date DESC, end_date DESC, is_active);


--
-- Name: um_user_role_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_role_index4 ON cloud_customer_uat.um_user_role USING btree (user_id, is_active);


--
-- Name: um_user_role_index5; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_role_index5 ON cloud_customer_uat.um_user_role USING btree (user_id, role_id);


--
-- Name: um_user_send_email_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_send_email_index1 ON cloud_customer_uat.um_user_send_email USING btree (user_id, lower((email)::text));


--
-- Name: um_user_send_email_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_send_email_index2 ON cloud_customer_uat.um_user_send_email USING btree (user_id);


--
-- Name: um_user_session_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_session_index1 ON cloud_customer_uat.um_user_session USING btree (user_id);


--
-- Name: um_user_session_value_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX um_user_session_value_index1 ON cloud_customer_uat.um_user_session_value USING btree (field_path);


--
-- Name: um_user_set_from_email_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX um_user_set_from_email_index1 ON cloud_customer_uat.um_user_set_from_email USING btree (system_user_id);


--
-- Name: um_user_ux1_main_user_unique; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX um_user_ux1_main_user_unique ON cloud_customer_uat.um_user USING btree ((
CASE nvl(is_main, (0)::numeric)
    WHEN 1 THEN system_user_id
    ELSE NULL::numeric
END));


--
-- Name: uq_crm_company_company_regist; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX uq_crm_company_company_regist ON cloud_customer_uat.base_company USING btree (company_register_number);


--
-- Name: uq_mdm_customer_person_id; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX uq_mdm_customer_person_id ON cloud_customer_uat.crm_customer USING btree (person_id);


--
-- Name: zzchat_chatrooms_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_chatrooms_index1 ON cloud_customer_uat.zzchat_chatrooms USING btree (lastactivity DESC);


--
-- Name: zzchat_chatrooms_users_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE UNIQUE INDEX zzchat_chatrooms_users_index1 ON cloud_customer_uat.zzchat_chatrooms_users USING btree (userid, chatroomid);


--
-- Name: zzchat_chatrooms_users_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_chatrooms_users_index2 ON cloud_customer_uat.zzchat_chatrooms_users USING btree (chatroomid);


--
-- Name: zzchat_chatrooms_users_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_chatrooms_users_index3 ON cloud_customer_uat.zzchat_chatrooms_users USING btree (userid);


--
-- Name: zzchat_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_index1 ON cloud_customer_uat.zzchat USING btree (from_id, to_id);


--
-- Name: zzchat_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_index2 ON cloud_customer_uat.zzchat USING btree (from_id);


--
-- Name: zzchat_index3; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_index3 ON cloud_customer_uat.zzchat USING btree (to_id);


--
-- Name: zzchat_index4; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_index4 ON cloud_customer_uat.zzchat USING btree (chatroomid);


--
-- Name: zzchat_index5; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_index5 ON cloud_customer_uat.zzchat USING btree (from_id, to_id, read);


--
-- Name: zzchat_index6; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_index6 ON cloud_customer_uat.zzchat USING btree (header_id);


--
-- Name: zzchat_index7; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_index7 ON cloud_customer_uat.zzchat USING btree (parent_id);


--
-- Name: zzchat_index8; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_index8 ON cloud_customer_uat.zzchat USING btree (forward_id);


--
-- Name: zzchat_status_index1; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_status_index1 ON cloud_customer_uat.zzchat_status USING btree (user_id);


--
-- Name: zzchat_status_index2; Type: INDEX; Schema: cloud_customer_uat; Owner: enterprisedb
--

CREATE INDEX zzchat_status_index2 ON cloud_customer_uat.zzchat_status USING btree (user_id, is_active);


--
-- Name: tmp_in_criteria_table tmp_in_criteria_table_iud; Type: TRIGGER; Schema: cloud_customer_uat; Owner: cloud_customer_uat
--

CREATE TRIGGER tmp_in_criteria_table_iud INSTEAD OF INSERT OR DELETE OR UPDATE ON cloud_customer_uat.tmp_in_criteria_table FOR EACH ROW EXECUTE FUNCTION public.tmp_in_criteria_table_iud();


--
-- Name: base_company base_company_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.base_company
    ADD CONSTRAINT base_company_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: base_company base_company_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.base_company
    ADD CONSTRAINT base_company_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: base_person_finger base_person_finger_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.base_person_finger
    ADD CONSTRAINT base_person_finger_fk1 FOREIGN KEY (person_id) REFERENCES cloud_customer_uat.base_person(person_id);


--
-- Name: base_person base_person_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.base_person
    ADD CONSTRAINT base_person_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: base_person base_person_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.base_person
    ADD CONSTRAINT base_person_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: config_value config_value_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.config_value
    ADD CONSTRAINT config_value_fk1 FOREIGN KEY (config_id) REFERENCES cloud_customer_uat.config(id);


--
-- Name: crm_company crm_company_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_company
    ADD CONSTRAINT crm_company_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: crm_company crm_company_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_company
    ADD CONSTRAINT crm_company_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: crm_customer crm_customer_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_customer
    ADD CONSTRAINT crm_customer_fk1 FOREIGN KEY (person_id) REFERENCES cloud_customer_uat.base_person(person_id);


--
-- Name: crm_customer crm_customer_fk2; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_customer
    ADD CONSTRAINT crm_customer_fk2 FOREIGN KEY (company_id) REFERENCES cloud_customer_uat.base_company(company_id);


--
-- Name: crm_customer crm_customer_fk4; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_customer
    ADD CONSTRAINT crm_customer_fk4 FOREIGN KEY (parent_id) REFERENCES cloud_customer_uat.crm_customer(customer_id);


--
-- Name: crm_customer crm_customer_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_customer
    ADD CONSTRAINT crm_customer_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: crm_customer crm_customer_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_customer
    ADD CONSTRAINT crm_customer_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: crm_customer_map crm_customer_map_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_customer_map
    ADD CONSTRAINT crm_customer_map_fk1 FOREIGN KEY (customer_id) REFERENCES cloud_customer_uat.crm_customer(customer_id);


--
-- Name: crm_user crm_user_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_user
    ADD CONSTRAINT crm_user_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: crm_user crm_user_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_user
    ADD CONSTRAINT crm_user_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: crm_user_kyc crm_user_kyc_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_user_kyc
    ADD CONSTRAINT crm_user_kyc_fk1 FOREIGN KEY (crm_user_id) REFERENCES cloud_customer_uat.crm_user(cust_user_id);


--
-- Name: crm_user_role crm_user_role_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_user_role
    ADD CONSTRAINT crm_user_role_fk1 FOREIGN KEY (user_id) REFERENCES cloud_customer_uat.crm_user(cust_user_id);


--
-- Name: customer_proxy_config customer_p_created_us_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.customer_proxy_config
    ADD CONSTRAINT customer_p_created_us_fkey FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: customer_proxy_config customer_p_modified_u_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.customer_proxy_config
    ADD CONSTRAINT customer_p_modified_u_fkey FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: db_dashboard_user db_dashboard_user_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.db_dashboard_user
    ADD CONSTRAINT db_dashboard_user_fk1 FOREIGN KEY (db_dashboard_id) REFERENCES cloud_platform_uat.db_dashboard(id);


--
-- Name: db_dashboard_user db_dashboard_user_fk2; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.db_dashboard_user
    ADD CONSTRAINT db_dashboard_user_fk2 FOREIGN KEY (db_dashboard_dtl_id) REFERENCES cloud_platform_uat.db_dashboard_dtl(id);


--
-- Name: db_data_mart_schedule db_data_mart_schedule_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.db_data_mart_schedule
    ADD CONSTRAINT db_data_mart_schedule_fk1 FOREIGN KEY (schedule_id) REFERENCES cloud_customer_uat.sch_schedule(schedule_id);


--
-- Name: ecm_content_file_version ecm_content_file_version_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_file_version
    ADD CONSTRAINT ecm_content_file_version_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ecm_content ecm_content_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content
    ADD CONSTRAINT ecm_content_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ecm_content ecm_content_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content
    ADD CONSTRAINT ecm_content_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ecm_content_log ecm_content_log_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_log
    ADD CONSTRAINT ecm_content_log_fk1 FOREIGN KEY (content_id) REFERENCES cloud_customer_uat.ecm_content(content_id) ON DELETE CASCADE;


--
-- Name: ecm_content_log ecm_content_log_fk2; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_log
    ADD CONSTRAINT ecm_content_log_fk2 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id) ON DELETE CASCADE;


--
-- Name: ecm_content_map ecm_content_map_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_map
    ADD CONSTRAINT ecm_content_map_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ecm_content_map ecm_content_map_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ecm_content_map
    ADD CONSTRAINT ecm_content_map_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: eml_email_schedule eml_email_schedule_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.eml_email_schedule
    ADD CONSTRAINT eml_email_schedule_fk1 FOREIGN KEY (schedule_id) REFERENCES cloud_customer_uat.sch_schedule(schedule_id);


--
-- Name: eml_sms_schedule eml_sms_schedule_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.eml_sms_schedule
    ADD CONSTRAINT eml_sms_schedule_fk1 FOREIGN KEY (schedule_id) REFERENCES cloud_customer_uat.sch_schedule(schedule_id);


--
-- Name: fin_fiscal_period_close_dep fin_fiscal_period_clos_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_close_dep
    ADD CONSTRAINT fin_fiscal_period_clos_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: fin_fiscal_period_close_dep fin_fiscal_period_clos_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_close_dep
    ADD CONSTRAINT fin_fiscal_period_clos_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: fin_fiscal_period_close_acc fin_fiscal_period_close__fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_close_acc
    ADD CONSTRAINT fin_fiscal_period_close__fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: fin_fiscal_period_close_acc fin_fiscal_period_close__fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_close_acc
    ADD CONSTRAINT fin_fiscal_period_close__fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: fin_fiscal_period_old fin_fiscal_period_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_old
    ADD CONSTRAINT fin_fiscal_period_fk1 FOREIGN KEY (parent_id) REFERENCES cloud_customer_uat.fin_fiscal_period_old(id);


--
-- Name: fin_fiscal_period_user fin_fiscal_period_user_fk2; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_user
    ADD CONSTRAINT fin_fiscal_period_user_fk2 FOREIGN KEY (user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: fin_fiscal_period_close_dep fin_fp_close_dep_to_dep_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_close_dep
    ADD CONSTRAINT fin_fp_close_dep_to_dep_fk FOREIGN KEY (department_id) REFERENCES cloud_customer_uat.org_department(department_id);


--
-- Name: fin_fiscal_period_close_dep fin_fp_close_dep_to_fisc_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.fin_fiscal_period_close_dep
    ADD CONSTRAINT fin_fp_close_dep_to_fisc_fk FOREIGN KEY (fiscal_period_id) REFERENCES cloud_customer_uat.fin_fiscal_period_old(id);


--
-- Name: crm_customer_map fk_crm_customer_map_employee; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.crm_customer_map
    ADD CONSTRAINT fk_crm_customer_map_employee FOREIGN KEY (employee_id) REFERENCES cloud_customer_uat.hrm_employee(employee_id);


--
-- Name: ref_bank fk_ref_bank_ref_bank; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ref_bank
    ADD CONSTRAINT fk_ref_bank_ref_bank FOREIGN KEY (parent_id) REFERENCES cloud_customer_uat.ref_bank(bank_id);


--
-- Name: hrm_employee hrm_employee_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee
    ADD CONSTRAINT hrm_employee_fk1 FOREIGN KEY (person_id) REFERENCES cloud_customer_uat.base_person(person_id);


--
-- Name: hrm_employee hrm_employee_fk15; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee
    ADD CONSTRAINT hrm_employee_fk15 FOREIGN KEY (drive_start_year_id) REFERENCES cloud_platform_uat.ref_year(year_id);


--
-- Name: hrm_employee hrm_employee_fk8; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee
    ADD CONSTRAINT hrm_employee_fk8 FOREIGN KEY (zodiac_sign_id) REFERENCES cloud_platform_uat.ref_zodiac_sign(id);


--
-- Name: hrm_employee hrm_employee_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee
    ADD CONSTRAINT hrm_employee_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: hrm_employee hrm_employee_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee
    ADD CONSTRAINT hrm_employee_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: hrm_employee_key hrm_employee_key_fk2; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee_key
    ADD CONSTRAINT hrm_employee_key_fk2 FOREIGN KEY (department_id) REFERENCES cloud_customer_uat.org_department(department_id);


--
-- Name: hrm_employee_key hrm_employee_key_fk7; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee_key
    ADD CONSTRAINT hrm_employee_key_fk7 FOREIGN KEY (currency_id) REFERENCES cloud_platform_uat.ref_currency(currency_id);


--
-- Name: hrm_employee_key hrm_employee_key_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee_key
    ADD CONSTRAINT hrm_employee_key_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: hrm_employee_key hrm_employee_key_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_employee_key
    ADD CONSTRAINT hrm_employee_key_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: hrm_position hrm_position_fk95; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_position
    ADD CONSTRAINT hrm_position_fk95 FOREIGN KEY (department_id) REFERENCES cloud_customer_uat.org_department(department_id);


--
-- Name: hrm_position hrm_position_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_position
    ADD CONSTRAINT hrm_position_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: hrm_position hrm_position_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_position
    ADD CONSTRAINT hrm_position_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: hrm_position_key hrm_position_key_fin_depa_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_position_key
    ADD CONSTRAINT hrm_position_key_fin_depa_fk1 FOREIGN KEY (department_id) REFERENCES cloud_customer_uat.org_department(department_id);


--
-- Name: hrm_position_key hrm_position_key_fk4; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_position_key
    ADD CONSTRAINT hrm_position_key_fk4 FOREIGN KEY (position_id) REFERENCES cloud_customer_uat.hrm_position(position_id);


--
-- Name: hrm_position_key hrm_position_key_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_position_key
    ADD CONSTRAINT hrm_position_key_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: hrm_position_key hrm_position_key_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.hrm_position_key
    ADD CONSTRAINT hrm_position_key_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: im_cost_method im_cost_method_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.im_cost_method
    ADD CONSTRAINT im_cost_method_fk1 FOREIGN KEY (parent_id) REFERENCES cloud_customer_uat.im_cost_method(id);


--
-- Name: im_item_cost_method im_item_cost_method_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.im_item_cost_method
    ADD CONSTRAINT im_item_cost_method_fk1 FOREIGN KEY (cost_method_id) REFERENCES cloud_customer_uat.im_cost_method(id);


--
-- Name: jira_template jira_template_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.jira_template
    ADD CONSTRAINT jira_template_fk1 FOREIGN KEY (template_type_id) REFERENCES cloud_customer_uat.jira_template_type(id);


--
-- Name: nlt_newsletter_dtl nlt_newsle_created_us_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_dtl
    ADD CONSTRAINT nlt_newsle_created_us_fkey FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: nlt_newsletter_template nlt_newsle_created_us_fkey_con; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_template
    ADD CONSTRAINT nlt_newsle_created_us_fkey_con FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: nlt_newsletter_book nlt_newsle_created_us_fkey_con; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_book
    ADD CONSTRAINT nlt_newsle_created_us_fkey_con FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: nlt_newsletter_book nlt_newsle_modified_u_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_book
    ADD CONSTRAINT nlt_newsle_modified_u_fkey FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: nlt_newsletter_dtl nlt_newsle_modified_u_fkey_con; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_dtl
    ADD CONSTRAINT nlt_newsle_modified_u_fkey_con FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: nlt_newsletter_template nlt_newsle_modified_u_fkey_con; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_template
    ADD CONSTRAINT nlt_newsle_modified_u_fkey_con FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: nlt_newsletter_dtl nlt_newsle_newsletter_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_dtl
    ADD CONSTRAINT nlt_newsle_newsletter_fkey FOREIGN KEY (newsletter_book_id) REFERENCES cloud_customer_uat.nlt_newsletter_book(id);


--
-- Name: nlt_newsletter_book nlt_newsle_schedule_i_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_book
    ADD CONSTRAINT nlt_newsle_schedule_i_fkey FOREIGN KEY (schedule_id) REFERENCES cloud_customer_uat.sch_schedule(schedule_id);


--
-- Name: nlt_newsletter_book nlt_newsle_template_i_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.nlt_newsletter_book
    ADD CONSTRAINT nlt_newsle_template_i_fkey FOREIGN KEY (template_id) REFERENCES cloud_customer_uat.nlt_newsletter_template(id);


--
-- Name: ntf_notification ntf_notification_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification
    ADD CONSTRAINT ntf_notification_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification ntf_notification_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification
    ADD CONSTRAINT ntf_notification_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification_param ntf_notification_param_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_param
    ADD CONSTRAINT ntf_notification_param_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification_param ntf_notification_param_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_param
    ADD CONSTRAINT ntf_notification_param_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification_process_param ntf_notification_pro_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_process_param
    ADD CONSTRAINT ntf_notification_pro_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification_process ntf_notification_process_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_process
    ADD CONSTRAINT ntf_notification_process_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification_system ntf_notification_system_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_system
    ADD CONSTRAINT ntf_notification_system_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification_system ntf_notification_system_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_system
    ADD CONSTRAINT ntf_notification_system_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification ntf_notification_to_type_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification
    ADD CONSTRAINT ntf_notification_to_type_fk FOREIGN KEY (notification_type_id) REFERENCES cloud_customer_uat.ntf_notification_type(notification_type_id);


--
-- Name: ntf_notification_type ntf_notification_type_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_type
    ADD CONSTRAINT ntf_notification_type_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification_type ntf_notification_type_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_type
    ADD CONSTRAINT ntf_notification_type_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification_user ntf_notification_user_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_user
    ADD CONSTRAINT ntf_notification_user_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification_user ntf_notification_user_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_user
    ADD CONSTRAINT ntf_notification_user_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notification_user ntf_notification_user_to_us_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notification_user
    ADD CONSTRAINT ntf_notification_user_to_us_fk FOREIGN KEY (user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_notify_all_log ntf_notify_all_log_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_notify_all_log
    ADD CONSTRAINT ntf_notify_all_log_fk1 FOREIGN KEY (notify_all_id) REFERENCES cloud_customer_uat.ntf_notify_all(id);


--
-- Name: ntf_template ntf_template_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template
    ADD CONSTRAINT ntf_template_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_template ntf_template_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template
    ADD CONSTRAINT ntf_template_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_template_system ntf_template_system_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_system
    ADD CONSTRAINT ntf_template_system_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_template_system ntf_template_system_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_system
    ADD CONSTRAINT ntf_template_system_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_template_system ntf_template_system_to_sys_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_system
    ADD CONSTRAINT ntf_template_system_to_sys_fk FOREIGN KEY (system_id) REFERENCES cloud_platform_uat.um_system(system_id);


--
-- Name: ntf_template_system ntf_template_system_to_tmp_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_system
    ADD CONSTRAINT ntf_template_system_to_tmp_fk FOREIGN KEY (template_id) REFERENCES cloud_customer_uat.ntf_template(template_id);


--
-- Name: ntf_template_user ntf_template_user_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_user
    ADD CONSTRAINT ntf_template_user_fk1 FOREIGN KEY (template_code) REFERENCES cloud_customer_uat.ntf_template(globe_dictionary_code);


--
-- Name: ntf_template_user ntf_template_user_fk2; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_user
    ADD CONSTRAINT ntf_template_user_fk2 FOREIGN KEY (role_id) REFERENCES cloud_platform_uat.um_role(role_id);


--
-- Name: ntf_template_user ntf_template_user_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_user
    ADD CONSTRAINT ntf_template_user_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_template_user ntf_template_user_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_user
    ADD CONSTRAINT ntf_template_user_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_template_user ntf_template_user_to_user_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_template_user
    ADD CONSTRAINT ntf_template_user_to_user_fk FOREIGN KEY (user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_user_config ntf_user_config_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_user_config
    ADD CONSTRAINT ntf_user_config_fk1 FOREIGN KEY (user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ntf_user_config ntf_user_config_fk2; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_user_config
    ADD CONSTRAINT ntf_user_config_fk2 FOREIGN KEY (notification_id) REFERENCES cloud_customer_uat.ntf_notification(notification_id);


--
-- Name: ntf_user_config ntf_user_config_fk3; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ntf_user_config
    ADD CONSTRAINT ntf_user_config_fk3 FOREIGN KEY (schedule_id) REFERENCES cloud_customer_uat.sch_schedule(schedule_id);


--
-- Name: org_department org_department_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.org_department
    ADD CONSTRAINT org_department_fk1 FOREIGN KEY (parent_id) REFERENCES cloud_customer_uat.org_department(department_id);


--
-- Name: org_department org_department_fk3; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.org_department
    ADD CONSTRAINT org_department_fk3 FOREIGN KEY (dependency_department_id) REFERENCES cloud_customer_uat.org_department(department_id);


--
-- Name: org_department org_department_fk96; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.org_department
    ADD CONSTRAINT org_department_fk96 FOREIGN KEY (wfm_workflow_id) REFERENCES cloud_platform_uat.meta_wfm_workflow(id);


--
-- Name: org_department org_department_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.org_department
    ADD CONSTRAINT org_department_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: org_department org_department_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.org_department
    ADD CONSTRAINT org_department_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: org_department_language org_department_language_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: cloud_platform_uat
--

ALTER TABLE ONLY cloud_customer_uat.org_department_language
    ADD CONSTRAINT org_department_language_fk1 FOREIGN KEY (department_id) REFERENCES cloud_customer_uat.org_department(department_id);


--
-- Name: org_department_language org_department_language_fk2; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: cloud_platform_uat
--

ALTER TABLE ONLY cloud_customer_uat.org_department_language
    ADD CONSTRAINT org_department_language_fk2 FOREIGN KEY (language_id) REFERENCES cloud_customer_uat.ref_language(language_id);


--
-- Name: prl_calc prl_calc_department_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_calc
    ADD CONSTRAINT prl_calc_department_fkey FOREIGN KEY (department_id) REFERENCES cloud_customer_uat.org_department(department_id);


--
-- Name: prl_salary_book prl_salary_book_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_salary_book
    ADD CONSTRAINT prl_salary_book_fk1 FOREIGN KEY (department_id) REFERENCES cloud_customer_uat.org_department(department_id);


--
-- Name: prl_salary_book prl_salary_book_fk2; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_salary_book
    ADD CONSTRAINT prl_salary_book_fk2 FOREIGN KEY (calc_id) REFERENCES cloud_customer_uat.prl_calc(id);


--
-- Name: prl_salary_book prl_salary_book_fk3; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_salary_book
    ADD CONSTRAINT prl_salary_book_fk3 FOREIGN KEY (employee_id) REFERENCES cloud_customer_uat.hrm_employee(employee_id);


--
-- Name: prl_salary_book prl_salary_book_fk4; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_salary_book
    ADD CONSTRAINT prl_salary_book_fk4 FOREIGN KEY (employee_key_id) REFERENCES cloud_customer_uat.hrm_employee_key(employee_key_id);


--
-- Name: prl_salary_sheet prl_salary_sheet_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_salary_sheet
    ADD CONSTRAINT prl_salary_sheet_fk1 FOREIGN KEY (sal_book_id) REFERENCES cloud_customer_uat.prl_salary_book(id);


--
-- Name: prl_salary_sheet prl_salary_sheet_fk2; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_salary_sheet
    ADD CONSTRAINT prl_salary_sheet_fk2 FOREIGN KEY (calc_type_id) REFERENCES cloud_customer_uat.prl_calc_type(id);


--
-- Name: prl_salary_sheet prl_salary_sheet_fk3; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_salary_sheet
    ADD CONSTRAINT prl_salary_sheet_fk3 FOREIGN KEY (employee_key_id) REFERENCES cloud_customer_uat.hrm_employee_key(employee_key_id);


--
-- Name: prl_salary_sheet prl_salary_sheet_fk4; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_salary_sheet
    ADD CONSTRAINT prl_salary_sheet_fk4 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: prl_salary_sheet prl_salary_sheet_fk5; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.prl_salary_sheet
    ADD CONSTRAINT prl_salary_sheet_fk5 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ref_bank ref_bank_fk95; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ref_bank
    ADD CONSTRAINT ref_bank_fk95 FOREIGN KEY (department_id) REFERENCES cloud_customer_uat.org_department(department_id);


--
-- Name: ref_bank ref_bank_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ref_bank
    ADD CONSTRAINT ref_bank_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ref_bank ref_bank_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ref_bank
    ADD CONSTRAINT ref_bank_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ref_language ref_language_fk95; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ref_language
    ADD CONSTRAINT ref_language_fk95 FOREIGN KEY (department_id) REFERENCES cloud_customer_uat.org_department(department_id);


--
-- Name: ref_language ref_language_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ref_language
    ADD CONSTRAINT ref_language_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: ref_language ref_language_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.ref_language
    ADD CONSTRAINT ref_language_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: sch_process sch_process_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_process
    ADD CONSTRAINT sch_process_fk1 FOREIGN KEY (schedule_id) REFERENCES cloud_customer_uat.sch_schedule(schedule_id);


--
-- Name: sch_schedule_email sch_schedu_schedule_i_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_schedule_email
    ADD CONSTRAINT sch_schedu_schedule_i_fkey FOREIGN KEY (schedule_id) REFERENCES cloud_customer_uat.sch_schedule(schedule_id);


--
-- Name: sch_schedule sch_schedule_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_schedule
    ADD CONSTRAINT sch_schedule_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: sch_schedule sch_schedule_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_schedule
    ADD CONSTRAINT sch_schedule_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: sch_schedule_type sch_schedule_type_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_schedule_type
    ADD CONSTRAINT sch_schedule_type_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: sch_schedule_type sch_schedule_type_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sch_schedule_type
    ADD CONSTRAINT sch_schedule_type_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: sysint_service_method_log_dtl sysint_service_dtl_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.sysint_service_method_log_dtl
    ADD CONSTRAINT sysint_service_dtl_fk1 FOREIGN KEY (log_id) REFERENCES cloud_customer_uat.sysint_service_method_log(id);


--
-- Name: um_config_value um_config_value_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_config_value
    ADD CONSTRAINT um_config_value_fk1 FOREIGN KEY (config_group_id) REFERENCES cloud_platform_uat.um_config_group(id);


--
-- Name: jira_template_param um_jira_template_param_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.jira_template_param
    ADD CONSTRAINT um_jira_template_param_fk1 FOREIGN KEY (jira_template_id) REFERENCES cloud_customer_uat.jira_template(id);


--
-- Name: um_login_attempts um_login_attempts_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_login_attempts
    ADD CONSTRAINT um_login_attempts_fk1 FOREIGN KEY (system_user_id) REFERENCES cloud_customer_uat.um_system_user(user_id);


--
-- Name: um_meta_permission um_meta_permission_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_meta_permission
    ADD CONSTRAINT um_meta_permission_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_role_customer um_role_cu_created_us_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_role_customer
    ADD CONSTRAINT um_role_cu_created_us_fkey FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_role_customer um_role_cu_customer_i_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_role_customer
    ADD CONSTRAINT um_role_cu_customer_i_fkey FOREIGN KEY (customer_id) REFERENCES cloud_customer_uat.crm_customer(customer_id);


--
-- Name: um_role_customer um_role_cu_modified_u_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_role_customer
    ADD CONSTRAINT um_role_cu_modified_u_fkey FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_role_customer um_role_cu_role_id_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_role_customer
    ADD CONSTRAINT um_role_cu_role_id_fkey FOREIGN KEY (role_id) REFERENCES cloud_platform_uat.um_role(role_id);


--
-- Name: um_system_user um_system_user_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_system_user
    ADD CONSTRAINT um_system_user_fk1 FOREIGN KEY (person_id) REFERENCES cloud_customer_uat.base_person(person_id);


--
-- Name: um_system_user um_system_user_fk2; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_system_user
    ADD CONSTRAINT um_system_user_fk2 FOREIGN KEY (language_id) REFERENCES cloud_customer_uat.ref_language(language_id);


--
-- Name: um_system_user um_system_user_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_system_user
    ADD CONSTRAINT um_system_user_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_system_user um_system_user_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_system_user
    ADD CONSTRAINT um_system_user_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user_data_permission um_user_data_permission_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE cloud_customer_uat.um_user_data_permission
    ADD CONSTRAINT um_user_data_permission_fk1 FOREIGN KEY (role_id) REFERENCES cloud_platform_uat.um_role(role_id);


--
-- Name: um_user_email um_user_email_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_email
    ADD CONSTRAINT um_user_email_fk1 FOREIGN KEY (user_id) REFERENCES cloud_customer_uat.um_system_user(user_id);


--
-- Name: um_user_email um_user_email_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_email
    ADD CONSTRAINT um_user_email_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user_email um_user_email_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_email
    ADD CONSTRAINT um_user_email_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user um_user_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user
    ADD CONSTRAINT um_user_fk1 FOREIGN KEY (system_user_id) REFERENCES cloud_customer_uat.um_system_user(user_id);


--
-- Name: um_user_gps_log um_user_gps_log_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_gps_log
    ADD CONSTRAINT um_user_gps_log_fk1 FOREIGN KEY (user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user_monpass_map um_user_monpass_map_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_monpass_map
    ADD CONSTRAINT um_user_monpass_map_fk1 FOREIGN KEY (user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user_relation um_user_rel_to_role_src_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_relation
    ADD CONSTRAINT um_user_rel_to_role_src_fk FOREIGN KEY (src_role_id) REFERENCES cloud_platform_uat.um_role(role_id);


--
-- Name: um_user_relation um_user_rel_to_role_trg_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_relation
    ADD CONSTRAINT um_user_rel_to_role_trg_fk FOREIGN KEY (trg_role_id) REFERENCES cloud_platform_uat.um_role(role_id);


--
-- Name: um_user_relation um_user_rel_to_user_src_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_relation
    ADD CONSTRAINT um_user_rel_to_user_src_fk FOREIGN KEY (src_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user_relation um_user_rel_to_user_trg_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_relation
    ADD CONSTRAINT um_user_rel_to_user_trg_fk FOREIGN KEY (trg_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user_relation um_user_relation_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_relation
    ADD CONSTRAINT um_user_relation_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user_relation um_user_relation_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_relation
    ADD CONSTRAINT um_user_relation_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user_role um_user_role_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_role
    ADD CONSTRAINT um_user_role_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user_role um_user_role_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_role
    ADD CONSTRAINT um_user_role_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user_role um_user_role_to_role_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_role
    ADD CONSTRAINT um_user_role_to_role_fk FOREIGN KEY (role_id) REFERENCES cloud_platform_uat.um_role(role_id);


--
-- Name: um_user_role um_user_role_to_user_fk; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_role
    ADD CONSTRAINT um_user_role_to_user_fk FOREIGN KEY (user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: um_user_set_from_email um_user_se_system_use_fkey; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_set_from_email
    ADD CONSTRAINT um_user_se_system_use_fkey FOREIGN KEY (system_user_id) REFERENCES cloud_customer_uat.um_system_user(user_id);


--
-- Name: um_user_session um_user_session_fk1; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.um_user_session
    ADD CONSTRAINT um_user_session_fk1 FOREIGN KEY (user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: zzchat_block zzchat_block_fk98; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.zzchat_block
    ADD CONSTRAINT zzchat_block_fk98 FOREIGN KEY (created_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: zzchat_block zzchat_block_fk99; Type: FK CONSTRAINT; Schema: cloud_customer_uat; Owner: enterprisedb
--

ALTER TABLE ONLY cloud_customer_uat.zzchat_block
    ADD CONSTRAINT zzchat_block_fk99 FOREIGN KEY (modified_user_id) REFERENCES cloud_customer_uat.um_user(user_id);


--
-- Name: TABLE base_company; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.base_company TO cloud_platform_uat;


--
-- Name: TABLE base_person; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.base_person TO cloud_platform_uat;


--
-- Name: TABLE base_person_finger; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.base_person_finger TO cloud_platform_uat;


--
-- Name: TABLE config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.config TO cloud_platform_uat;


--
-- Name: TABLE config_value; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.config_value TO cloud_platform_uat;


--
-- Name: TABLE crm_company; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.crm_company TO cloud_platform_uat;


--
-- Name: TABLE crm_customer; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.crm_customer TO cloud_platform_uat;


--
-- Name: TABLE crm_customer_map; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.crm_customer_map TO cloud_platform_uat;


--
-- Name: TABLE crm_user; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.crm_user TO cloud_platform_uat;


--
-- Name: TABLE crm_user_kyc; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.crm_user_kyc TO cloud_platform_uat;


--
-- Name: TABLE crm_user_role; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.crm_user_role TO cloud_platform_uat;


--
-- Name: TABLE customer_bp_detail_config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.customer_bp_detail_config TO cloud_platform_uat;


--
-- Name: TABLE customer_dv_field; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.customer_dv_field TO cloud_platform_uat;


--
-- Name: TABLE customer_dv_filter; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.customer_dv_filter TO cloud_platform_uat;


--
-- Name: TABLE customer_meta_user_config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.customer_meta_user_config TO cloud_platform_uat;


--
-- Name: TABLE customer_proxy_config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.customer_proxy_config TO cloud_platform_uat;


--
-- Name: TABLE customer_st_grouping_config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.customer_st_grouping_config TO cloud_platform_uat;


--
-- Name: TABLE db_dashboard_user; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.db_dashboard_user TO cloud_platform_uat;


--
-- Name: TABLE db_data_mart_config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.db_data_mart_config TO cloud_platform_uat;


--
-- Name: TABLE db_data_mart_queue; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.db_data_mart_queue TO cloud_platform_uat;


--
-- Name: TABLE db_data_mart_schedule; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.db_data_mart_schedule TO cloud_platform_uat;


--
-- Name: TABLE db_fin_working_capital; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.db_fin_working_capital TO cloud_platform_uat;


--
-- Name: TABLE db_gl_analytic_pivot; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.db_gl_analytic_pivot TO cloud_platform_uat;


--
-- Name: TABLE db_hcm_org_email; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.db_hcm_org_email TO cloud_platform_uat;


--
-- Name: TABLE ecm_content; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ecm_content TO cloud_platform_uat;


--
-- Name: TABLE ecm_content_clip; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ecm_content_clip TO cloud_platform_uat;


--
-- Name: TABLE ecm_content_directory; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ecm_content_directory TO cloud_platform_uat;


--
-- Name: TABLE ecm_content_file_version; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ecm_content_file_version TO cloud_platform_uat;


--
-- Name: TABLE ecm_content_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ecm_content_log TO cloud_platform_uat;


--
-- Name: TABLE ecm_content_map; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ecm_content_map TO cloud_platform_uat;


--
-- Name: TABLE ecm_content_meta; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ecm_content_meta TO cloud_platform_uat;


--
-- Name: TABLE ecm_content_process_map; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ecm_content_process_map TO cloud_platform_uat;


--
-- Name: TABLE ecm_content_type; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ecm_content_type TO cloud_platform_uat;


--
-- Name: TABLE ecm_content_visitor; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ecm_content_visitor TO cloud_platform_uat;


--
-- Name: TABLE eml_email_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.eml_email_log TO cloud_platform_uat;


--
-- Name: TABLE eml_email_queue; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.eml_email_queue TO cloud_platform_uat;


--
-- Name: TABLE eml_email_schedule; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.eml_email_schedule TO cloud_platform_uat;


--
-- Name: TABLE eml_sms_schedule; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.eml_sms_schedule TO cloud_platform_uat;


--
-- Name: TABLE eml_template; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.eml_template TO cloud_platform_uat;


--
-- Name: TABLE fin_fiscal_period_close_acc; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.fin_fiscal_period_close_acc TO cloud_platform_uat;


--
-- Name: TABLE fin_fiscal_period_close_dep; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.fin_fiscal_period_close_dep TO cloud_platform_uat;


--
-- Name: TABLE fin_fiscal_period_curr_object; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.fin_fiscal_period_curr_object TO cloud_platform_uat;


--
-- Name: TABLE fin_fiscal_period_old; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.fin_fiscal_period_old TO cloud_platform_uat;


--
-- Name: TABLE fin_fiscal_period_user; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.fin_fiscal_period_user TO cloud_platform_uat;


--
-- Name: TABLE hrm_employee; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.hrm_employee TO cloud_platform_uat;


--
-- Name: TABLE hrm_employee_key; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.hrm_employee_key TO cloud_platform_uat;


--
-- Name: TABLE hrm_position; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.hrm_position TO cloud_platform_uat;


--
-- Name: TABLE hrm_position_key; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.hrm_position_key TO cloud_platform_uat;


--
-- Name: TABLE im_cost_method; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.im_cost_method TO cloud_platform_uat;


--
-- Name: TABLE im_item_cost_key; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.im_item_cost_key TO cloud_platform_uat;


--
-- Name: TABLE im_item_cost_key_fifo; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.im_item_cost_key_fifo TO cloud_platform_uat;


--
-- Name: TABLE im_item_cost_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.im_item_cost_log TO cloud_platform_uat;


--
-- Name: TABLE im_item_cost_method; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.im_item_cost_method TO cloud_platform_uat;


--
-- Name: TABLE im_item_cost_proportion; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.im_item_cost_proportion TO cloud_platform_uat;


--
-- Name: TABLE im_item_cost_tmp; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.im_item_cost_tmp TO cloud_platform_uat;


--
-- Name: TABLE im_item_key_cost; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.im_item_key_cost TO cloud_platform_uat;


--
-- Name: TABLE im_item_key_cost_calc; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.im_item_key_cost_calc TO cloud_platform_uat;


--
-- Name: TABLE jira_template; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.jira_template TO cloud_platform_uat;


--
-- Name: TABLE jira_template_param; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.jira_template_param TO cloud_platform_uat;


--
-- Name: TABLE jira_template_type; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.jira_template_type TO cloud_platform_uat;


--
-- Name: TABLE knowledge_category; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.knowledge_category TO cloud_platform_uat;


--
-- Name: TABLE knowledge_copy; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.knowledge_copy TO cloud_platform_uat;


--
-- Name: TABLE knowledge_helpful; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.knowledge_helpful TO cloud_platform_uat;


--
-- Name: TABLE knowledge_meta_data_map; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.knowledge_meta_data_map TO cloud_platform_uat;


--
-- Name: TABLE knowledge_type; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.knowledge_type TO cloud_platform_uat;


--
-- Name: TABLE meta_dm_record_map; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.meta_dm_record_map TO cloud_platform_uat;


--
-- Name: TABLE meta_wfm_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.meta_wfm_log TO cloud_platform_uat;


--
-- Name: TABLE meta_wfm_status_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.meta_wfm_status_log TO cloud_platform_uat;


--
-- Name: TABLE meta_wfm_status_permission; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.meta_wfm_status_permission TO cloud_platform_uat;


--
-- Name: TABLE meta_wfm_status_permission_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.meta_wfm_status_permission_log TO cloud_platform_uat;


--
-- Name: TABLE nlt_newsletter_book; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.nlt_newsletter_book TO cloud_platform_uat;


--
-- Name: TABLE nlt_newsletter_dtl; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.nlt_newsletter_dtl TO cloud_platform_uat;


--
-- Name: TABLE nlt_newsletter_schedule; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.nlt_newsletter_schedule TO cloud_platform_uat;


--
-- Name: TABLE nlt_newsletter_template; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.nlt_newsletter_template TO cloud_platform_uat;


--
-- Name: TABLE nlt_notification_map; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.nlt_notification_map TO cloud_platform_uat;


--
-- Name: TABLE ntf_dash_notification; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_dash_notification TO cloud_platform_uat;


--
-- Name: TABLE ntf_mention_config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_mention_config TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_action; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_action TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_action_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_action_log TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_follow; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_follow TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_log TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_param; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_param TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_process; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_process TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_process_param; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_process_param TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_schedule_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_schedule_log TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_system; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_system TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_template_map; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_template_map TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_type; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_type TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_user; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_user TO cloud_platform_uat;


--
-- Name: TABLE ntf_notification_user_param; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notification_user_param TO cloud_platform_uat;


--
-- Name: TABLE ntf_notify; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notify TO cloud_platform_uat;


--
-- Name: TABLE ntf_notify_all; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notify_all TO cloud_platform_uat;


--
-- Name: TABLE ntf_notify_all_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_notify_all_log TO cloud_platform_uat;


--
-- Name: TABLE ntf_template; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_template TO cloud_platform_uat;


--
-- Name: TABLE ntf_template_system; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_template_system TO cloud_platform_uat;


--
-- Name: TABLE ntf_template_user; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_template_user TO cloud_platform_uat;


--
-- Name: TABLE ntf_user_config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ntf_user_config TO cloud_platform_uat;


--
-- Name: TABLE org_department; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.org_department TO cloud_platform_uat;


--
-- Name: TABLE prl_calc; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.prl_calc TO cloud_platform_uat;


--
-- Name: TABLE prl_calc_department; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.prl_calc_department TO cloud_platform_uat;


--
-- Name: TABLE prl_calc_type; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.prl_calc_type TO cloud_platform_uat;


--
-- Name: TABLE prl_salary_book; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.prl_salary_book TO cloud_platform_uat;


--
-- Name: TABLE prl_salary_sheet; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.prl_salary_sheet TO cloud_platform_uat;


--
-- Name: TABLE process_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.process_log TO cloud_platform_uat;


--
-- Name: TABLE ref_bank; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ref_bank TO cloud_platform_uat;


--
-- Name: TABLE ref_language; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.ref_language TO cloud_platform_uat;


--
-- Name: TABLE sch_process; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.sch_process TO cloud_platform_uat;


--
-- Name: TABLE sch_schedule; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.sch_schedule TO cloud_platform_uat;


--
-- Name: TABLE sch_schedule_book; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.sch_schedule_book TO cloud_platform_uat;


--
-- Name: TABLE sch_schedule_config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.sch_schedule_config TO cloud_platform_uat;


--
-- Name: TABLE sch_schedule_email; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.sch_schedule_email TO cloud_platform_uat;


--
-- Name: TABLE sch_schedule_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.sch_schedule_log TO cloud_platform_uat;


--
-- Name: TABLE sch_schedule_type; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.sch_schedule_type TO cloud_platform_uat;


--
-- Name: TABLE session_refresh_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.session_refresh_log TO cloud_platform_uat;


--
-- Name: TABLE sysint_service_method_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.sysint_service_method_log TO cloud_platform_uat;


--
-- Name: TABLE sysint_service_method_log_dtl; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.sysint_service_method_log_dtl TO cloud_platform_uat;


--
-- Name: TABLE system_access_config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.system_access_config TO cloud_platform_uat;


--
-- Name: TABLE system_access_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.system_access_log TO cloud_platform_uat;


--
-- Name: TABLE system_action_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.system_action_log TO cloud_platform_uat;


--
-- Name: TABLE system_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.system_log TO cloud_platform_uat;


--
-- Name: TABLE system_log_dtl; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.system_log_dtl TO cloud_platform_uat;


--
-- Name: TABLE system_log_php; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.system_log_php TO cloud_platform_uat;


--
-- Name: TABLE system_write_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.system_write_log TO cloud_platform_uat;


--
-- Name: TABLE um_config_value; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_config_value TO cloud_platform_uat;


--
-- Name: TABLE um_criteria; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_criteria TO cloud_platform_uat;


--
-- Name: TABLE um_global_user; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_global_user TO cloud_platform_uat;


--
-- Name: TABLE um_login_attempts; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_login_attempts TO cloud_platform_uat;


--
-- Name: TABLE um_login_device; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_login_device TO cloud_platform_uat;


--
-- Name: TABLE um_login_failed; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_login_failed TO cloud_platform_uat;


--
-- Name: TABLE um_menu_config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_menu_config TO cloud_platform_uat;


--
-- Name: TABLE um_meta_block; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_meta_block TO cloud_platform_uat;


--
-- Name: TABLE um_meta_lock; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_meta_lock TO cloud_platform_uat;


--
-- Name: TABLE um_meta_permission; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_meta_permission TO cloud_platform_uat;


--
-- Name: TABLE um_meta_permission_cache; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_meta_permission_cache TO cloud_platform_uat;


--
-- Name: TABLE um_meta_permission_ignore; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_meta_permission_ignore TO cloud_platform_uat;


--
-- Name: TABLE um_meta_permission_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_meta_permission_log TO cloud_platform_uat;


--
-- Name: TABLE um_quick_menu; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_quick_menu TO cloud_platform_uat;


--
-- Name: TABLE um_record_permission; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_record_permission TO cloud_platform_uat;


--
-- Name: TABLE um_role_customer; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_role_customer TO cloud_platform_uat;


--
-- Name: TABLE um_system_user; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_system_user TO cloud_platform_uat;


--
-- Name: TABLE um_system_user_info; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_system_user_info TO cloud_platform_uat;


--
-- Name: TABLE um_transaction_permission; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_transaction_permission TO cloud_platform_uat;


--
-- Name: TABLE um_user; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user TO cloud_platform_uat;


--
-- Name: TABLE um_user_alias; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_alias TO cloud_platform_uat;


--
-- Name: TABLE um_user_data_permission; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_data_permission TO cloud_platform_uat;


--
-- Name: TABLE um_user_data_permission_cache; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_data_permission_cache TO cloud_platform_uat;


--
-- Name: TABLE um_user_data_permission_old; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_data_permission_old TO cloud_platform_uat;


--
-- Name: TABLE um_user_email; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_email TO cloud_platform_uat;


--
-- Name: TABLE um_user_finger; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_finger TO cloud_platform_uat;


--
-- Name: TABLE um_user_gps_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_gps_log TO cloud_platform_uat;


--
-- Name: TABLE um_user_monpass_map; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_monpass_map TO cloud_platform_uat;


--
-- Name: TABLE um_user_otp; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_otp TO cloud_platform_uat;


--
-- Name: TABLE um_user_permission_alias; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_permission_alias TO cloud_platform_uat;


--
-- Name: TABLE um_user_relation; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_relation TO cloud_platform_uat;


--
-- Name: TABLE um_user_role; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_role TO cloud_platform_uat;


--
-- Name: TABLE um_user_role_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_role_log TO cloud_platform_uat;


--
-- Name: TABLE um_user_send_email; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_send_email TO cloud_platform_uat;


--
-- Name: TABLE um_user_session; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_session TO cloud_platform_uat;


--
-- Name: TABLE um_user_session_value; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_session_value TO cloud_platform_uat;


--
-- Name: TABLE um_user_set_from_email; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.um_user_set_from_email TO cloud_platform_uat;


--
-- Name: TABLE user_authentication_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.user_authentication_log TO cloud_platform_uat;


--
-- Name: TABLE user_management_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.user_management_log TO cloud_platform_uat;


--
-- Name: TABLE view_log; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.view_log TO cloud_platform_uat;


--
-- Name: TABLE vw_customer_proxy_config; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.vw_customer_proxy_config TO cloud_platform_uat;


--
-- Name: TABLE vw_user; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.vw_user TO cloud_platform_uat;


--
-- Name: TABLE zzchat; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.zzchat TO cloud_platform_uat;


--
-- Name: TABLE zzchat_block; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.zzchat_block TO cloud_platform_uat;


--
-- Name: TABLE zzchat_chatrooms; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.zzchat_chatrooms TO cloud_platform_uat;


--
-- Name: TABLE zzchat_chatrooms_users; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.zzchat_chatrooms_users TO cloud_platform_uat;


--
-- Name: TABLE zzchat_status; Type: ACL; Schema: cloud_customer_uat; Owner: enterprisedb
--

GRANT SELECT ON TABLE cloud_customer_uat.zzchat_status TO cloud_platform_uat;


--
-- EnterpriseDB database dump complete
--

