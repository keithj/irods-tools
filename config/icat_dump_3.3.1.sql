--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: irods
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO irods;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: r_coll_main; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_coll_main (
    coll_id bigint NOT NULL,
    parent_coll_name character varying(2700) NOT NULL,
    coll_name character varying(2700) NOT NULL,
    coll_owner_name character varying(250) NOT NULL,
    coll_owner_zone character varying(250) NOT NULL,
    coll_map_id bigint DEFAULT 0,
    coll_inheritance character varying(1000),
    coll_type character varying(250) DEFAULT '0'::character varying,
    coll_info1 character varying(2700) DEFAULT '0'::character varying,
    coll_info2 character varying(2700) DEFAULT '0'::character varying,
    coll_expiry_ts character varying(32),
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_coll_main OWNER TO irods;

--
-- Name: r_data_main; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_data_main (
    data_id bigint NOT NULL,
    coll_id bigint NOT NULL,
    data_name character varying(1000) NOT NULL,
    data_repl_num integer NOT NULL,
    data_version character varying(250) DEFAULT '0'::character varying,
    data_type_name character varying(250) NOT NULL,
    data_size bigint NOT NULL,
    resc_group_name character varying(250),
    resc_name character varying(250) NOT NULL,
    data_path character varying(2700) NOT NULL,
    data_owner_name character varying(250) NOT NULL,
    data_owner_zone character varying(250) NOT NULL,
    data_is_dirty integer DEFAULT 0,
    data_status character varying(250),
    data_checksum character varying(1000),
    data_expiry_ts character varying(32),
    data_map_id bigint DEFAULT 0,
    data_mode character varying(32),
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_data_main OWNER TO irods;

--
-- Name: r_meta_main; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_meta_main (
    meta_id bigint NOT NULL,
    meta_namespace character varying(250),
    meta_attr_name character varying(2700) NOT NULL,
    meta_attr_value character varying(2700) NOT NULL,
    meta_attr_unit character varying(250),
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_meta_main OWNER TO irods;

--
-- Name: r_microsrvc_main; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_microsrvc_main (
    msrvc_id bigint NOT NULL,
    msrvc_name character varying(250) NOT NULL,
    msrvc_module_name character varying(250) NOT NULL,
    msrvc_signature character varying(2700) NOT NULL,
    msrvc_doxygen character varying(2500) NOT NULL,
    msrvc_variations character varying(2500) NOT NULL,
    msrvc_owner_name character varying(250) NOT NULL,
    msrvc_owner_zone character varying(250) NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_microsrvc_main OWNER TO irods;

--
-- Name: r_microsrvc_ver; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_microsrvc_ver (
    msrvc_id bigint NOT NULL,
    msrvc_version character varying(250) DEFAULT '0'::character varying,
    msrvc_host character varying(250) DEFAULT 'ALL'::character varying,
    msrvc_location character varying(500),
    msrvc_language character varying(250) DEFAULT 'C'::character varying,
    msrvc_type_name character varying(250) DEFAULT 'IRODS COMPILED'::character varying,
    msrvc_status bigint DEFAULT 1,
    msrvc_owner_name character varying(250) NOT NULL,
    msrvc_owner_zone character varying(250) NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_microsrvc_ver OWNER TO irods;

--
-- Name: r_objectid; Type: SEQUENCE; Schema: public; Owner: irods
--

CREATE SEQUENCE r_objectid
    START WITH 10000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r_objectid OWNER TO irods;

--
-- Name: r_objectid; Type: SEQUENCE SET; Schema: public; Owner: irods
--

SELECT pg_catalog.setval('r_objectid', 10011, true);


--
-- Name: r_objt_access; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_objt_access (
    object_id bigint NOT NULL,
    user_id bigint NOT NULL,
    access_type_id bigint NOT NULL,
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_objt_access OWNER TO irods;

--
-- Name: r_objt_audit; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_objt_audit (
    object_id bigint NOT NULL,
    user_id bigint NOT NULL,
    action_id bigint NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_objt_audit OWNER TO irods;

--
-- Name: r_objt_deny_access; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_objt_deny_access (
    object_id bigint NOT NULL,
    user_id bigint NOT NULL,
    access_type_id bigint NOT NULL,
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_objt_deny_access OWNER TO irods;

--
-- Name: r_objt_filesystem_meta; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_objt_filesystem_meta (
    object_id bigint NOT NULL,
    file_uid character varying(32),
    file_gid character varying(32),
    file_owner character varying(250),
    file_group character varying(250),
    file_mode character varying(32),
    file_ctime character varying(32),
    file_mtime character varying(32),
    file_source_path character varying(2700),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_objt_filesystem_meta OWNER TO irods;

--
-- Name: r_objt_metamap; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_objt_metamap (
    object_id bigint NOT NULL,
    meta_id bigint NOT NULL,
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_objt_metamap OWNER TO irods;

--
-- Name: r_quota_main; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_quota_main (
    user_id bigint,
    resc_id bigint,
    quota_limit bigint,
    quota_over bigint,
    modify_ts character varying(32)
);


ALTER TABLE public.r_quota_main OWNER TO irods;

--
-- Name: r_quota_usage; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_quota_usage (
    user_id bigint,
    resc_id bigint,
    quota_usage bigint,
    modify_ts character varying(32)
);


ALTER TABLE public.r_quota_usage OWNER TO irods;

--
-- Name: r_resc_group; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_resc_group (
    resc_group_id bigint NOT NULL,
    resc_group_name character varying(250) NOT NULL,
    resc_id bigint NOT NULL,
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_resc_group OWNER TO irods;

--
-- Name: r_resc_main; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_resc_main (
    resc_id bigint NOT NULL,
    resc_name character varying(250) NOT NULL,
    zone_name character varying(250) NOT NULL,
    resc_type_name character varying(250) NOT NULL,
    resc_class_name character varying(250) NOT NULL,
    resc_net character varying(250) NOT NULL,
    resc_def_path character varying(1000) NOT NULL,
    free_space character varying(250),
    free_space_ts character varying(32),
    resc_info character varying(1000),
    r_comment character varying(1000),
    resc_status character varying(32),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_resc_main OWNER TO irods;

--
-- Name: r_rule_base_map; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_rule_base_map (
    map_version character varying(250) DEFAULT '0'::character varying,
    map_base_name character varying(250) NOT NULL,
    map_priority integer NOT NULL,
    rule_id bigint NOT NULL,
    map_owner_name character varying(250) NOT NULL,
    map_owner_zone character varying(250) NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_rule_base_map OWNER TO irods;

--
-- Name: r_rule_dvm; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_rule_dvm (
    dvm_id bigint NOT NULL,
    dvm_version character varying(250) DEFAULT '0'::character varying,
    dvm_base_name character varying(250) NOT NULL,
    dvm_ext_var_name character varying(250) NOT NULL,
    dvm_condition character varying(2700),
    dvm_int_map_path character varying(2700) NOT NULL,
    dvm_status integer DEFAULT 1,
    dvm_owner_name character varying(250) NOT NULL,
    dvm_owner_zone character varying(250) NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_rule_dvm OWNER TO irods;

--
-- Name: r_rule_dvm_map; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_rule_dvm_map (
    map_dvm_version character varying(250) DEFAULT '0'::character varying,
    map_dvm_base_name character varying(250) NOT NULL,
    dvm_id bigint NOT NULL,
    map_owner_name character varying(250) NOT NULL,
    map_owner_zone character varying(250) NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_rule_dvm_map OWNER TO irods;

--
-- Name: r_rule_exec; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_rule_exec (
    rule_exec_id bigint NOT NULL,
    rule_name character varying(2700) NOT NULL,
    rei_file_path character varying(2700),
    user_name character varying(250),
    exe_address character varying(250),
    exe_time character varying(32),
    exe_frequency character varying(250),
    priority character varying(32),
    estimated_exe_time character varying(32),
    notification_addr character varying(250),
    last_exe_time character varying(32),
    exe_status character varying(32),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_rule_exec OWNER TO irods;

--
-- Name: r_rule_fnm; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_rule_fnm (
    fnm_id bigint NOT NULL,
    fnm_version character varying(250) DEFAULT '0'::character varying,
    fnm_base_name character varying(250) NOT NULL,
    fnm_ext_func_name character varying(250) NOT NULL,
    fnm_int_func_name character varying(2700) NOT NULL,
    fnm_status integer DEFAULT 1,
    fnm_owner_name character varying(250) NOT NULL,
    fnm_owner_zone character varying(250) NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_rule_fnm OWNER TO irods;

--
-- Name: r_rule_fnm_map; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_rule_fnm_map (
    map_fnm_version character varying(250) DEFAULT '0'::character varying,
    map_fnm_base_name character varying(250) NOT NULL,
    fnm_id bigint NOT NULL,
    map_owner_name character varying(250) NOT NULL,
    map_owner_zone character varying(250) NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_rule_fnm_map OWNER TO irods;

--
-- Name: r_rule_main; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_rule_main (
    rule_id bigint NOT NULL,
    rule_version character varying(250) DEFAULT '0'::character varying,
    rule_base_name character varying(250) NOT NULL,
    rule_name character varying(2700) NOT NULL,
    rule_event character varying(2700) NOT NULL,
    rule_condition character varying(2700),
    rule_body character varying(2700) NOT NULL,
    rule_recovery character varying(2700) NOT NULL,
    rule_status bigint DEFAULT 1,
    rule_owner_name character varying(250) NOT NULL,
    rule_owner_zone character varying(250) NOT NULL,
    rule_descr_1 character varying(2700),
    rule_descr_2 character varying(2700),
    input_params character varying(2700),
    output_params character varying(2700),
    dollar_vars character varying(2700),
    icat_elements character varying(2700),
    sideeffects character varying(2700),
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_rule_main OWNER TO irods;

--
-- Name: r_server_load; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_server_load (
    host_name character varying(250) NOT NULL,
    resc_name character varying(250) NOT NULL,
    cpu_used integer,
    mem_used integer,
    swap_used integer,
    runq_load integer,
    disk_space integer,
    net_input integer,
    net_output integer,
    create_ts character varying(32)
);


ALTER TABLE public.r_server_load OWNER TO irods;

--
-- Name: r_server_load_digest; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_server_load_digest (
    resc_name character varying(250) NOT NULL,
    load_factor integer,
    create_ts character varying(32)
);


ALTER TABLE public.r_server_load_digest OWNER TO irods;

--
-- Name: r_specific_query; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_specific_query (
    alias character varying(1000),
    sqlstr character varying(2700),
    create_ts character varying(32)
);


ALTER TABLE public.r_specific_query OWNER TO irods;

--
-- Name: r_ticket_allowed_groups; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_ticket_allowed_groups (
    ticket_id bigint NOT NULL,
    group_name character varying(250) NOT NULL
);


ALTER TABLE public.r_ticket_allowed_groups OWNER TO irods;

--
-- Name: r_ticket_allowed_hosts; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_ticket_allowed_hosts (
    ticket_id bigint NOT NULL,
    host character varying(32)
);


ALTER TABLE public.r_ticket_allowed_hosts OWNER TO irods;

--
-- Name: r_ticket_allowed_users; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_ticket_allowed_users (
    ticket_id bigint NOT NULL,
    user_name character varying(250) NOT NULL
);


ALTER TABLE public.r_ticket_allowed_users OWNER TO irods;

--
-- Name: r_ticket_main; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_ticket_main (
    ticket_id bigint NOT NULL,
    ticket_string character varying(100),
    ticket_type character varying(20),
    user_id bigint NOT NULL,
    object_id bigint NOT NULL,
    object_type character varying(16),
    uses_limit integer DEFAULT 0,
    uses_count integer DEFAULT 0,
    write_file_limit integer DEFAULT 10,
    write_file_count integer DEFAULT 0,
    write_byte_limit integer DEFAULT 0,
    write_byte_count integer DEFAULT 0,
    ticket_expiry_ts character varying(32),
    restrictions character varying(16),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_ticket_main OWNER TO irods;

--
-- Name: r_tokn_main; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_tokn_main (
    token_namespace character varying(250) NOT NULL,
    token_id bigint NOT NULL,
    token_name character varying(250) NOT NULL,
    token_value character varying(250),
    token_value2 character varying(250),
    token_value3 character varying(250),
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_tokn_main OWNER TO irods;

--
-- Name: r_user_auth; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_user_auth (
    user_id bigint NOT NULL,
    user_auth_name character varying(1000),
    create_ts character varying(32)
);


ALTER TABLE public.r_user_auth OWNER TO irods;

--
-- Name: r_user_group; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_user_group (
    group_user_id bigint NOT NULL,
    user_id bigint NOT NULL,
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_user_group OWNER TO irods;

--
-- Name: r_user_main; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_user_main (
    user_id bigint NOT NULL,
    user_name character varying(250) NOT NULL,
    user_type_name character varying(250) NOT NULL,
    zone_name character varying(250) NOT NULL,
    user_info character varying(1000),
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_user_main OWNER TO irods;

--
-- Name: r_user_password; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_user_password (
    user_id bigint NOT NULL,
    rcat_password character varying(250) NOT NULL,
    pass_expiry_ts character varying(32) NOT NULL,
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_user_password OWNER TO irods;

--
-- Name: r_user_session_key; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_user_session_key (
    user_id bigint NOT NULL,
    session_key character varying(1000) NOT NULL,
    session_info character varying(1000),
    auth_scheme character varying(250) NOT NULL,
    session_expiry_ts character varying(32) NOT NULL,
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_user_session_key OWNER TO irods;

--
-- Name: r_zone_main; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE r_zone_main (
    zone_id bigint NOT NULL,
    zone_name character varying(250) NOT NULL,
    zone_type_name character varying(250) NOT NULL,
    zone_conn_string character varying(1000),
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.r_zone_main OWNER TO irods;

--
-- Name: rcore_attributes; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE rcore_attributes (
    attr_id bigint NOT NULL,
    table_id bigint NOT NULL,
    attr_name character varying(250) NOT NULL,
    attr_data_type character varying(250) NOT NULL,
    attr_iden_type character varying(10) NOT NULL,
    external_attr_name character varying(250) NOT NULL,
    default_value character varying(1000),
    attr_expose bigint NOT NULL,
    attr_presentation character varying(1000),
    attr_units character varying(250),
    maxsize integer,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.rcore_attributes OWNER TO irods;

--
-- Name: rcore_fk_relations; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE rcore_fk_relations (
    fk_relation character varying(1000),
    fk_owner bigint NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.rcore_fk_relations OWNER TO irods;

--
-- Name: rcore_schemas; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE rcore_schemas (
    schema_name character varying(250) NOT NULL,
    schema_subject character varying(250),
    schema_owner bigint NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.rcore_schemas OWNER TO irods;

--
-- Name: rcore_tables; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE rcore_tables (
    table_id bigint NOT NULL,
    table_name character varying(250) NOT NULL,
    database_name character varying(250) NOT NULL,
    schema_name character varying(250) NOT NULL,
    dbschema_name character varying(250),
    table_resc_id bigint NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.rcore_tables OWNER TO irods;

--
-- Name: rcore_uschema_attr; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE rcore_uschema_attr (
    user_schema_name character varying(250) NOT NULL,
    attr_id bigint NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.rcore_uschema_attr OWNER TO irods;

--
-- Name: rcore_user_schemas; Type: TABLE; Schema: public; Owner: irods; Tablespace:
--

CREATE TABLE rcore_user_schemas (
    user_schema_name character varying(250) NOT NULL,
    uschema_owner bigint NOT NULL,
    r_comment character varying(1000),
    create_ts character varying(32),
    modify_ts character varying(32)
);


ALTER TABLE public.rcore_user_schemas OWNER TO irods;

--
-- Data for Name: r_coll_main; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_coll_main (coll_id, parent_coll_name, coll_name, coll_owner_name, coll_owner_zone, coll_map_id, coll_inheritance, coll_type, coll_info1, coll_info2, coll_expiry_ts, r_comment, create_ts, modify_ts) FROM stdin;
9003	/	/	rods	tempZone	0							1170000000	1170000000
10000	/	/tempZone	rodsBoot	tempZone	0	\N				\N	\N	01403088595	01403088595
10001	/tempZone	/tempZone/home	rodsBoot	tempZone	0	\N				\N	\N	01403088596	01403088596
10002	/tempZone	/tempZone/trash	rodsBoot	tempZone	0	\N				\N	\N	01403088596	01403088596
10003	/tempZone/trash	/tempZone/trash/home	rodsBoot	tempZone	0	\N				\N	\N	01403088596	01403088596
10005	/tempZone/home	/tempZone/home/public	public	tempZone	0	\N				\N	\N	01403088596	01403088596
10006	/tempZone/trash/home	/tempZone/trash/home/public	public	tempZone	0	\N				\N	\N	01403088596	01403088596
10008	/tempZone/home	/tempZone/home/irods	irods	tempZone	0	\N				\N	\N	01403088596	01403088596
10009	/tempZone/trash/home	/tempZone/trash/home/irods	irods	tempZone	0	\N				\N	\N	01403088596	01403088596
\.


--
-- Data for Name: r_data_main; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_data_main (data_id, coll_id, data_name, data_repl_num, data_version, data_type_name, data_size, resc_group_name, resc_name, data_path, data_owner_name, data_owner_zone, data_is_dirty, data_status, data_checksum, data_expiry_ts, data_map_id, data_mode, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_meta_main; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_meta_main (meta_id, meta_namespace, meta_attr_name, meta_attr_value, meta_attr_unit, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_microsrvc_main; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_microsrvc_main (msrvc_id, msrvc_name, msrvc_module_name, msrvc_signature, msrvc_doxygen, msrvc_variations, msrvc_owner_name, msrvc_owner_zone, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_microsrvc_ver; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_microsrvc_ver (msrvc_id, msrvc_version, msrvc_host, msrvc_location, msrvc_language, msrvc_type_name, msrvc_status, msrvc_owner_name, msrvc_owner_zone, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_objt_access; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_objt_access (object_id, user_id, access_type_id, create_ts, modify_ts) FROM stdin;
9003	9001	1130	1170000000	1170000000
9003	9002	1200	1170000000	1170000000
10000	9002	1200	01403088595	01403088595
10001	9002	1200	01403088596	01403088596
10002	9002	1200	01403088596	01403088596
10003	9002	1200	01403088596	01403088596
10005	10004	1200	01403088596	01403088596
10006	10004	1200	01403088596	01403088596
10008	10007	1200	01403088596	01403088596
10009	10007	1200	01403088596	01403088596
9003	10007	1200	01403088596	01403088596
10000	10007	1200	01403088596	01403088596
10001	10007	1200	01403088596	01403088596
10002	10007	1200	01403088596	01403088596
10003	10007	1200	01403088597	01403088597
\.


--
-- Data for Name: r_objt_audit; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_objt_audit (object_id, user_id, action_id, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_objt_deny_access; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_objt_deny_access (object_id, user_id, access_type_id, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_objt_filesystem_meta; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_objt_filesystem_meta (object_id, file_uid, file_gid, file_owner, file_group, file_mode, file_ctime, file_mtime, file_source_path, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_objt_metamap; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_objt_metamap (object_id, meta_id, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_quota_main; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_quota_main (user_id, resc_id, quota_limit, quota_over, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_quota_usage; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_quota_usage (user_id, resc_id, quota_usage, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_resc_group; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_resc_group (resc_group_id, resc_group_name, resc_id, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_resc_main; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_resc_main (resc_id, resc_name, zone_name, resc_type_name, resc_class_name, resc_net, resc_def_path, free_space, free_space_ts, resc_info, r_comment, resc_status, create_ts, modify_ts) FROM stdin;
9100	bundleResc	tempZone	unix file system	bundle	localhost	/bundle						1250100000	1250100000
10010	tempResc	tempZone	unix file system	archive	localhost	/usr/local/var/lib/irods/Vault	\N	\N	\N	\N	\N	01403088603	01403088603
\.


--
-- Data for Name: r_rule_base_map; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_rule_base_map (map_version, map_base_name, map_priority, rule_id, map_owner_name, map_owner_zone, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_rule_dvm; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_rule_dvm (dvm_id, dvm_version, dvm_base_name, dvm_ext_var_name, dvm_condition, dvm_int_map_path, dvm_status, dvm_owner_name, dvm_owner_zone, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_rule_dvm_map; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_rule_dvm_map (map_dvm_version, map_dvm_base_name, dvm_id, map_owner_name, map_owner_zone, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_rule_exec; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_rule_exec (rule_exec_id, rule_name, rei_file_path, user_name, exe_address, exe_time, exe_frequency, priority, estimated_exe_time, notification_addr, last_exe_time, exe_status, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_rule_fnm; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_rule_fnm (fnm_id, fnm_version, fnm_base_name, fnm_ext_func_name, fnm_int_func_name, fnm_status, fnm_owner_name, fnm_owner_zone, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_rule_fnm_map; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_rule_fnm_map (map_fnm_version, map_fnm_base_name, fnm_id, map_owner_name, map_owner_zone, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_rule_main; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_rule_main (rule_id, rule_version, rule_base_name, rule_name, rule_event, rule_condition, rule_body, rule_recovery, rule_status, rule_owner_name, rule_owner_zone, rule_descr_1, rule_descr_2, input_params, output_params, dollar_vars, icat_elements, sideeffects, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_server_load; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_server_load (host_name, resc_name, cpu_used, mem_used, swap_used, runq_load, disk_space, net_input, net_output, create_ts) FROM stdin;
\.


--
-- Data for Name: r_server_load_digest; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_server_load_digest (resc_name, load_factor, create_ts) FROM stdin;
\.


--
-- Data for Name: r_specific_query; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_specific_query (alias, sqlstr, create_ts) FROM stdin;
ls	select alias,sqlStr from R_SPECIFIC_QUERY	01292940000
lsl	select alias,sqlStr from R_SPECIFIC_QUERY where sqlStr like ?	01292940000
ShowCollAcls	select distinct R_USER_MAIN.user_name ,R_USER_MAIN.zone_name, R_TOKN_MAIN.token_name, R_USER_MAIN.user_type_name from R_USER_MAIN , R_TOKN_MAIN, R_OBJT_ACCESS, R_COLL_MAIN where R_OBJT_ACCESS.object_id = R_COLL_MAIN.coll_id AND R_COLL_MAIN.coll_name = ? AND R_TOKN_MAIN.token_namespace = 'access_type' AND R_USER_MAIN.user_id = R_OBJT_ACCESS.user_id AND R_OBJT_ACCESS.access_type_id = R_TOKN_MAIN.token_id	01342019000
\.


--
-- Data for Name: r_ticket_allowed_groups; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_ticket_allowed_groups (ticket_id, group_name) FROM stdin;
\.


--
-- Data for Name: r_ticket_allowed_hosts; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_ticket_allowed_hosts (ticket_id, host) FROM stdin;
\.


--
-- Data for Name: r_ticket_allowed_users; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_ticket_allowed_users (ticket_id, user_name) FROM stdin;
\.


--
-- Data for Name: r_ticket_main; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_ticket_main (ticket_id, ticket_string, ticket_type, user_id, object_id, object_type, uses_limit, uses_count, write_file_limit, write_file_count, write_byte_limit, write_byte_count, ticket_expiry_ts, restrictions, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_tokn_main; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_tokn_main (token_namespace, token_id, token_name, token_value, token_value2, token_value3, r_comment, create_ts, modify_ts) FROM stdin;
token_namespace	0	zone_type					1170000000	1170000000
token_namespace	1	user_type					1170000000	1170000000
token_namespace	2	data_type					1170000000	1170000000
token_namespace	3	resc_type					1170000000	1170000000
token_namespace	4	action_type					1170000000	1170000000
token_namespace	5	rulexec_type					1170000000	1170000000
token_namespace	6	access_type					1170000000	1170000000
token_namespace	7	object_type					1170000000	1170000000
token_namespace	8	resc_class					1170000000	1170000000
token_namespace	9	coll_map					1170000000	1170000000
token_namespace	10	auth_scheme_type					1170000000	1170000000
zone_type	100	local		native zone of this RCAT			1170000000	1170000000
zone_type	101	remote		foreign zone			1170000000	1170000000
user_type	200	rodsgroup		rods group users			1170000000	1170000000
user_type	201	rodsadmin		rods administrators			1170000000	1170000000
user_type	202	rodsuser		normal rods user			1170000000	1170000000
user_type	203	domainadmin		user domain administrators			1170000000	1170000000
user_type	204	groupadmin		user group administrators			1170000000	1170000000
user_type	205	storageadmin		storage system administrators			1170000000	1170000000
user_type	206	rodscurators		data collection curators at RODS level			1170000000	1170000000
object_type	300	data					1170000000	1170000000
object_type	301	resource					1170000000	1170000000
object_type	302	user					1170000000	1170000000
object_type	303	rule					1170000000	1170000000
object_type	304	metadata					1170000000	1170000000
object_type	305	zone					1170000000	1170000000
object_type	306	collection					1170000000	1170000000
object_type	307	token					1170000000	1170000000
resc_type	400	unix file system					1170000000	1170000000
resc_type	401	hpss file system					1170000000	1170000000
resc_type	402	windows file system					1170000000	1170000000
resc_type	403	s3					1250100000	1250100000
resc_type	404	MSS universal driver					1250100000	1250100000
resc_type	405	database					1288631300	1288631300
resc_type	406	mso					1312910000	1312910000
resc_type	407	direct access file system					1311740184	1311740184
resc_type	408	ooici					1347482000	1347482000
resc_type	409	opendap					1347482000	1347482000
resc_type	410	pydap					1347482000	1347482000
resc_type	411	erddap					1347482000	1347482000
resc_type	412	tds					1347482000	1347482000
resc_class	500	cache					1170000000	1170000000
resc_class	501	archive					1170000000	1170000000
resc_class	502	compound					1170000000	1170000000
resc_class	503	bundle					1170000000	1170000000
resc_class	504	postgresql					1288631300	1288631300
resc_class	505	mysql					1288631300	1288631300
resc_class	506	oracle					1288631300	1288631300
rulexec_type	600	immediate					1170000000	1170000000
rulexec_type	601	delayed					1170000000	1170000000
rulexec_type	602	queued					1170000000	1170000000
rulexec_type	603	before					1170000000	1170000000
rulexec_type	604	after					1170000000	1170000000
rulexec_type	605	concurrent					1170000000	1170000000
access_type	1000	null					1170000000	1170000000
access_type	1010	execute					1170000000	1170000000
access_type	1020	read annotation					1170000000	1170000000
access_type	1030	read system metadata					1170000000	1170000000
access_type	1040	read metadata					1170000000	1170000000
access_type	1050	read object					1170000000	1170000000
access_type	1060	write annotation					1170000000	1170000000
access_type	1070	create metadata					1170000000	1170000000
access_type	1080	modify metadata					1170000000	1170000000
access_type	1090	delete metadata					1170000000	1170000000
access_type	1100	administer object					1170000000	1170000000
access_type	1110	create object					1170000000	1170000000
access_type	1120	modify object					1170000000	1170000000
access_type	1130	delete object					1170000000	1170000000
access_type	1140	create token					1170000000	1170000000
access_type	1150	delete token					1170000000	1170000000
access_type	1160	curate					1170000000	1170000000
access_type	1200	own					1170000000	1170000000
coll_map	1400	generic					1170000000	1170000000
coll_map	1401	direct					1170000000	1170000000
coll_map	1402	hard link					1170000000	1170000000
coll_map	1403	soft link					1170000000	1170000000
auth_scheme_type	1500	SPASSWORD					1170000000	1170000000
auth_scheme_type	1501	GSI					1170000000	1170000000
data_type	1600	generic					1170000000	1170000000
data_type	1601	text	text/text	|.txt|			1170000000	1170000000
data_type	1602	ascii text	text/text	|.txt|			1170000000	1170000000
data_type	1603	ascii compressed Lempel-Ziv		|.z|.zip|.gz|			1170000000	1170000000
data_type	1604	ascii compressed Huffman		|.z|.zip|.gz|			1170000000	1170000000
data_type	1605	ebcdic text	text/text	|.txt|			1170000000	1170000000
data_type	1606	ebcdic compressed Lempel-Ziv		|.z|.zip|.gz|			1170000000	1170000000
data_type	1607	ebcdic compressed Huffman		|.z|.zip|.gz|			1170000000	1170000000
data_type	1608	image					1170000000	1170000000
data_type	1609	tiff image	image/tiff	|.tif|.tiff|			1170000000	1170000000
data_type	1610	uuencoded tiff	text/text	|.uu|			1170000000	1170000000
data_type	1611	gif image	image/gif	|.gif|			1170000000	1170000000
data_type	1612	jpeg image	image/jpeg	|.jpeg|.jpg|			1170000000	1170000000
data_type	1613	pbm image	image/pbm	|.pbm|			1170000000	1170000000
data_type	1614	fig image	image/fig	|.fig|			1170000000	1170000000
data_type	1615	FITS image	application/x-fits	|.fits|.fit|			1170000000	1170000000
data_type	1616	DICOM image	application/dicom	|.IMA|.ima|			1170000000	1170000000
data_type	1617	print-format					1170000000	1170000000
data_type	1618	LaTeX format	text/text	|.tex|			1170000000	1170000000
data_type	1619	Troff format	text/text	|.trf|.trof|			1170000000	1170000000
data_type	1620	Postscript format	application/postscript	|.ps|			1170000000	1170000000
data_type	1621	DVI format	application/dvi	|.dvi|			1170000000	1170000000
data_type	1622	Word format	application/msword	|.doc|.rtf|			1170000000	1170000000
data_type	1623	program code	text/text				1170000000	1170000000
data_type	1624	SQL script	text/text	|.sql|			1170000000	1170000000
data_type	1625	C code	text/text	|.c|			1170000000	1170000000
data_type	1626	C include file	text/text	|.c|			1170000000	1170000000
data_type	1627	fortran code	text/text	|.f|			1170000000	1170000000
data_type	1628	object code		|.o|			1170000000	1170000000
data_type	1629	library code		|.a|			1170000000	1170000000
data_type	1630	data file		|.dat|			1170000000	1170000000
data_type	1631	html	text/html	|.htm|.html|			1170000000	1170000000
data_type	1632	SGML File	text/sgml	|.sgm|.sgml|			1170000000	1170000000
data_type	1633	Wave Audio	audio/x-wav	|.wav|			1170000000	1170000000
data_type	1634	tar file	text/text	|.tar|			1170000000	1170000000
data_type	1635	compressed tar file	|.tz|.tgz|.zip|				1170000000	1170000000
data_type	1636	java code	text/text	|.jav|.java|			1170000000	1170000000
data_type	1637	perl script	text/text	|.pl|			1170000000	1170000000
data_type	1638	tcl script	text/text	|.tcl|			1170000000	1170000000
data_type	1639	link code		|.o|			1170000000	1170000000
data_type	1640	shadow object					1170000000	1170000000
data_type	1641	database shadow object					1170000000	1170000000
data_type	1642	directory shadow object					1170000000	1170000000
data_type	1643	database					1170000000	1170000000
data_type	1644	streams					1170000000	1170000000
data_type	1645	audio streams					1170000000	1170000000
data_type	1646	realAudio	audio/x-pn-realaudio	|.ra|			1170000000	1170000000
data_type	1647	video streams					1170000000	1170000000
data_type	1648	realVideo	audio/x-pn-realaudio	|.rv|			1170000000	1170000000
data_type	1649	MPEG	video/mpeg	|.mpeg|.mpg|			1170000000	1170000000
data_type	1650	AVI	video/msvideo	|.avi|			1170000000	1170000000
data_type	1651	PNG-Portable Network Graphics	image/png	|.png|			1170000000	1170000000
data_type	1652	MP3 - MPEG Audio	audio/x-mpeg	|.mp3|.mpa|			1170000000	1170000000
data_type	1653	WMV-Windows Media Video	video/x-wmv	|.wmv|			1170000000	1170000000
data_type	1654	BMP -Bit Map	image/bmp	|.bmp|			1170000000	1170000000
data_type	1655	CSS-Cascading Style Sheet					1170000000	1170000000
data_type	1656	xml	text/xml	|.xml|			1170000000	1170000000
data_type	1657	Slide					1170000000	1170000000
data_type	1658	Power Point Slide	application/vnd.ms-powerpoint	|.ppt|			1170000000	1170000000
data_type	1659	Spread Sheet					1170000000	1170000000
data_type	1660	Excel Spread Sheet	application/x-msexcel	|.xls|			1170000000	1170000000
data_type	1661	Document					1170000000	1170000000
data_type	1622	MSWord Document	application/msword	|.doc|.rtf|			1170000000	1170000000
data_type	1663	PDF Document	application/pdf	|.pdf|			1170000000	1170000000
data_type	1664	Executable					1170000000	1170000000
data_type	1665	NT Executable					1170000000	1170000000
data_type	1666	Solaris Executable					1170000000	1170000000
data_type	1667	AIX Executable					1170000000	1170000000
data_type	1668	Mac Executable					1170000000	1170000000
data_type	1669	Mac OSX Executable					1170000000	1170000000
data_type	1670	Cray Executable					1170000000	1170000000
data_type	1671	SGI Executable					1170000000	1170000000
data_type	1672	DLL					1170000000	1170000000
data_type	1673	NT DLL					1170000000	1170000000
data_type	1674	Solaris DLL					1170000000	1170000000
data_type	1675	AIX DLL					1170000000	1170000000
data_type	1676	Mac DLL					1170000000	1170000000
data_type	1677	Cray DLL					1170000000	1170000000
data_type	1678	SGI DLL					1170000000	1170000000
data_type	1679	Movie					1170000000	1170000000
data_type	1680	MPEG Movie	video/mpeg	|.mpeg|.mpg|			1170000000	1170000000
data_type	1681	MPEG 3 Movie	video/mpeg	|.mpeg|.mpg|			1170000000	1170000000
data_type	1682	Quicktime Movie	video/quicktime	|.mov|			1170000000	1170000000
data_type	1683	compressed file					1170000000	1170000000
data_type	1684	compressed mmCIF file		|.cif|.mmcif|			1170000000	1170000000
data_type	1685	compressed PDB file		|.pdb|			1170000000	1170000000
data_type	1686	binary file					1170000000	1170000000
data_type	1687	URL	text/html	|.htm|.html|			1170000000	1170000000
data_type	1688	NSF Award Abstracts	text/text				1170000000	1170000000
data_type	1689	email	text/text				1170000000	1170000000
data_type	1690	orb data					1170000000	1170000000
data_type	1691	datascope data					1170000000	1170000000
data_type	1692	DICOM header					1170000000	1170000000
data_type	1693	XML Schema	text/xml	|.xsd|			1170000000	1170000000
data_type	1694	tar bundle					1250100000	1250100000
data_type	1695	database object	text				1288631300	1288631300
data_type	1696	mso					1312910000	1312910000
data_type	1697	gzipTar		|.tar.gz|			1324000000	1324000000
data_type	1698	bzip2Tar		|.tar.bz2|			1324000000	1324000000
data_type	1699	gzipFile		|.gz|			1324000000	1324000000
data_type	1700	bzip2File		|.bz2|			1324000000	1324000000
data_type	1701	zipFile		|.zip|			1324000000	1324000000
data_type	1702	gzipTar bundle					1324000000	1324000000
data_type	1703	bzip2Tar bundle					1324000000	1324000000
data_type	1704	zipFile bundle					1324000000	1324000000
data_type	1705	netcdf					1348000000	1348000000
data_type	1706	hdf5					1348000000	1348000000
data_type	1707	msso file		|.mss|			1324000000	1324000000
action_type	1800	generic					1170000000	1170000000
\.


--
-- Data for Name: r_user_auth; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_user_auth (user_id, user_auth_name, create_ts) FROM stdin;
\.


--
-- Data for Name: r_user_group; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_user_group (group_user_id, user_id, create_ts, modify_ts) FROM stdin;
9001	9002	1170000000	1170000000
9002	9002	1170000000	1170000000
10004	10004	01403088596	01403088596
10007	10007	01403088596	01403088596
10004	10007	01403088596	01403088596
\.


--
-- Data for Name: r_user_main; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_user_main (user_id, user_name, user_type_name, zone_name, user_info, r_comment, create_ts, modify_ts) FROM stdin;
9001	rodsadmin	rodsgroup	tempZone			1170000000	1170000000
9002	rodsBoot	rodsadmin	tempZone			1170000000	1170000000
10004	public	rodsgroup	tempZone	\N	\N	01403088596	01403088596
10007	irods	rodsadmin	tempZone	\N	\N	01403088596	01403088596
\.


--
-- Data for Name: r_user_password; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_user_password (user_id, rcat_password, pass_expiry_ts, create_ts, modify_ts) FROM stdin;
10007	.E_oq0s*	9999-12-31-23.59.01	01403088597	01403088597
9002	.E_oq0s*	9999-12-31-23.59.00	1170000000	01403088597
\.


--
-- Data for Name: r_user_session_key; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_user_session_key (user_id, session_key, session_info, auth_scheme, session_expiry_ts, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: r_zone_main; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY r_zone_main (zone_id, zone_name, zone_type_name, zone_conn_string, r_comment, create_ts, modify_ts) FROM stdin;
9000	tempZone	local			1170000000	1170000000
\.


--
-- Data for Name: rcore_attributes; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY rcore_attributes (attr_id, table_id, attr_name, attr_data_type, attr_iden_type, external_attr_name, default_value, attr_expose, attr_presentation, attr_units, maxsize, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: rcore_fk_relations; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY rcore_fk_relations (fk_relation, fk_owner, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: rcore_schemas; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY rcore_schemas (schema_name, schema_subject, schema_owner, r_comment, create_ts, modify_ts) FROM stdin;
rcat	RODS metadata catalog	0		1170000000	1170000000
\.


--
-- Data for Name: rcore_tables; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY rcore_tables (table_id, table_name, database_name, schema_name, dbschema_name, table_resc_id, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: rcore_uschema_attr; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY rcore_uschema_attr (user_schema_name, attr_id, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Data for Name: rcore_user_schemas; Type: TABLE DATA; Schema: public; Owner: irods
--

COPY rcore_user_schemas (user_schema_name, uschema_owner, r_comment, create_ts, modify_ts) FROM stdin;
\.


--
-- Name: idx_coll_main1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_coll_main1 ON r_coll_main USING btree (coll_id);


--
-- Name: idx_coll_main2; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_coll_main2 ON r_coll_main USING btree (parent_coll_name, coll_name);


--
-- Name: idx_coll_main3; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_coll_main3 ON r_coll_main USING btree (coll_name);


--
-- Name: idx_data_main1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_data_main1 ON r_data_main USING btree (data_id);


--
-- Name: idx_data_main2; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_data_main2 ON r_data_main USING btree (coll_id, data_name, data_repl_num, data_version);


--
-- Name: idx_data_main3; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_data_main3 ON r_data_main USING btree (coll_id);


--
-- Name: idx_data_main4; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_data_main4 ON r_data_main USING btree (data_name);


--
-- Name: idx_data_main5; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_data_main5 ON r_data_main USING btree (data_type_name);


--
-- Name: idx_data_main6; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_data_main6 ON r_data_main USING btree (data_path);


--
-- Name: idx_meta_main1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_meta_main1 ON r_meta_main USING btree (meta_id);


--
-- Name: idx_meta_main2; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_meta_main2 ON r_meta_main USING btree (meta_attr_name);


--
-- Name: idx_meta_main3; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_meta_main3 ON r_meta_main USING btree (meta_attr_value);


--
-- Name: idx_meta_main4; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_meta_main4 ON r_meta_main USING btree (meta_attr_unit);


--
-- Name: idx_obj_filesystem_meta1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_obj_filesystem_meta1 ON r_objt_filesystem_meta USING btree (object_id);


--
-- Name: idx_objt_access1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_objt_access1 ON r_objt_access USING btree (object_id, user_id);


--
-- Name: idx_objt_daccs1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_objt_daccs1 ON r_objt_deny_access USING btree (object_id, user_id);


--
-- Name: idx_objt_metamap1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_objt_metamap1 ON r_objt_metamap USING btree (object_id, meta_id);


--
-- Name: idx_objt_metamap2; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_objt_metamap2 ON r_objt_metamap USING btree (object_id);


--
-- Name: idx_objt_metamap3; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_objt_metamap3 ON r_objt_metamap USING btree (meta_id);


--
-- Name: idx_resc_logical1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_resc_logical1 ON r_resc_group USING btree (resc_group_name, resc_id);


--
-- Name: idx_resc_main1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_resc_main1 ON r_resc_main USING btree (resc_id);


--
-- Name: idx_resc_main2; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_resc_main2 ON r_resc_main USING btree (zone_name, resc_name);


--
-- Name: idx_rule_exec; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_rule_exec ON r_rule_exec USING btree (rule_exec_id);


--
-- Name: idx_rule_main1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_rule_main1 ON r_rule_main USING btree (rule_id);


--
-- Name: idx_specific_query1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_specific_query1 ON r_specific_query USING btree (sqlstr);


--
-- Name: idx_specific_query2; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_specific_query2 ON r_specific_query USING btree (alias);


--
-- Name: idx_ticket; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_ticket ON r_ticket_main USING btree (ticket_string);


--
-- Name: idx_ticket_group; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_ticket_group ON r_ticket_allowed_groups USING btree (ticket_id, group_name);


--
-- Name: idx_ticket_host; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_ticket_host ON r_ticket_allowed_hosts USING btree (ticket_id, host);


--
-- Name: idx_ticket_user; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_ticket_user ON r_ticket_allowed_users USING btree (ticket_id, user_name);


--
-- Name: idx_tokn_main1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_tokn_main1 ON r_tokn_main USING btree (token_id);


--
-- Name: idx_tokn_main2; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_tokn_main2 ON r_tokn_main USING btree (token_name);


--
-- Name: idx_tokn_main3; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_tokn_main3 ON r_tokn_main USING btree (token_value);


--
-- Name: idx_tokn_main4; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_tokn_main4 ON r_tokn_main USING btree (token_namespace);


--
-- Name: idx_user_group1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_user_group1 ON r_user_group USING btree (group_user_id, user_id);


--
-- Name: idx_user_main1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE INDEX idx_user_main1 ON r_user_main USING btree (user_id);


--
-- Name: idx_user_main2; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_user_main2 ON r_user_main USING btree (user_name, zone_name);


--
-- Name: idx_zone_main1; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_zone_main1 ON r_zone_main USING btree (zone_id);


--
-- Name: idx_zone_main2; Type: INDEX; Schema: public; Owner: irods; Tablespace:
--

CREATE UNIQUE INDEX idx_zone_main2 ON r_zone_main USING btree (zone_name);


--
-- PostgreSQL database dump complete
--
