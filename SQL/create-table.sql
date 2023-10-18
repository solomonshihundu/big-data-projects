--DROP TABLE IF EXISTS public.customer;

CREATE TABLE IF NOT EXISTS public.customer
(
    cust_code character varying(6) COLLATE pg_catalog."default" NOT NULL,
    cust_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    cust_city character varying(35) COLLATE pg_catalog."default",
    working_area character varying(35) COLLATE pg_catalog."default" NOT NULL,
    cust_country character varying(20) COLLATE pg_catalog."default" NOT NULL,
    grade numeric,
    opening_amt numeric(12,2) NOT NULL,
    receive_amt numeric(12,2) NOT NULL,
    payment_amt numeric(12,2) NOT NULL,
    outstanding_amt numeric(12,2) NOT NULL,
    phone_no character varying(17) COLLATE pg_catalog."default" NOT NULL,
    agent_code character varying(6) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT customer_pkey PRIMARY KEY (cust_code),
    CONSTRAINT customer_agent_code_fkey FOREIGN KEY (agent_code)
        REFERENCES public.agents (agent_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)