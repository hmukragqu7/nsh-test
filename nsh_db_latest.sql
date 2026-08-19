--
-- PostgreSQL database dump
--

\restrict k0WSxhNln0peexOsjnEqypbSvU7OfeUmtmmdFYLyDH4gL3a43ZJbjnZkntpdEvD

-- Dumped from database version 18.4 (Debian 18.4-1.pgdg12+1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: nsh_db_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO nsh_db_user;

--
-- Name: enum__blogs_v_version_meta_meta_robots_following; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__blogs_v_version_meta_meta_robots_following AS ENUM (
    'follow',
    'nofollow'
);


ALTER TYPE public.enum__blogs_v_version_meta_meta_robots_following OWNER TO nsh_db_user;

--
-- Name: enum__blogs_v_version_meta_meta_robots_indexing; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__blogs_v_version_meta_meta_robots_indexing AS ENUM (
    'index',
    'noindex'
);


ALTER TYPE public.enum__blogs_v_version_meta_meta_robots_indexing OWNER TO nsh_db_user;

--
-- Name: enum__blogs_v_version_status; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__blogs_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__blogs_v_version_status OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


ALTER TYPE public.enum__pages_v_blocks_archive_populate_by OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_blocks_archive_relation_to AS ENUM (
    'posts'
);


ALTER TYPE public.enum__pages_v_blocks_archive_relation_to OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum__pages_v_blocks_content_columns_link_appearance OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__pages_v_blocks_content_columns_link_type OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


ALTER TYPE public.enum__pages_v_blocks_content_columns_size OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_blocks_cta_links_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum__pages_v_blocks_cta_links_link_appearance OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__pages_v_blocks_cta_links_link_type OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_version_hero_links_link_appearance; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_version_hero_links_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum__pages_v_version_hero_links_link_appearance OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_version_hero_links_link_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_version_hero_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__pages_v_version_hero_links_link_type OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_version_hero_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_version_hero_type AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact'
);


ALTER TYPE public.enum__pages_v_version_hero_type OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_version_meta_meta_robots_following; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_version_meta_meta_robots_following AS ENUM (
    'follow',
    'nofollow'
);


ALTER TYPE public.enum__pages_v_version_meta_meta_robots_following OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_version_meta_meta_robots_indexing; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_version_meta_meta_robots_indexing AS ENUM (
    'index',
    'noindex'
);


ALTER TYPE public.enum__pages_v_version_meta_meta_robots_indexing OWNER TO nsh_db_user;

--
-- Name: enum__pages_v_version_status; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__pages_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__pages_v_version_status OWNER TO nsh_db_user;

--
-- Name: enum__posts_v_version_meta_meta_robots_following; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__posts_v_version_meta_meta_robots_following AS ENUM (
    'follow',
    'nofollow'
);


ALTER TYPE public.enum__posts_v_version_meta_meta_robots_following OWNER TO nsh_db_user;

--
-- Name: enum__posts_v_version_meta_meta_robots_indexing; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__posts_v_version_meta_meta_robots_indexing AS ENUM (
    'index',
    'noindex'
);


ALTER TYPE public.enum__posts_v_version_meta_meta_robots_indexing OWNER TO nsh_db_user;

--
-- Name: enum__posts_v_version_status; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum__posts_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__posts_v_version_status OWNER TO nsh_db_user;

--
-- Name: enum_blogs_meta_meta_robots_following; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_blogs_meta_meta_robots_following AS ENUM (
    'follow',
    'nofollow'
);


ALTER TYPE public.enum_blogs_meta_meta_robots_following OWNER TO nsh_db_user;

--
-- Name: enum_blogs_meta_meta_robots_indexing; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_blogs_meta_meta_robots_indexing AS ENUM (
    'index',
    'noindex'
);


ALTER TYPE public.enum_blogs_meta_meta_robots_indexing OWNER TO nsh_db_user;

--
-- Name: enum_blogs_status; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_blogs_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_blogs_status OWNER TO nsh_db_user;

--
-- Name: enum_cf7_tracker_erp_status; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_cf7_tracker_erp_status AS ENUM (
    'pending',
    'success',
    'failed',
    'not_configured'
);


ALTER TYPE public.enum_cf7_tracker_erp_status OWNER TO nsh_db_user;

--
-- Name: enum_cf7_tracker_mail_status; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_cf7_tracker_mail_status AS ENUM (
    'pending',
    'sent',
    'failed'
);


ALTER TYPE public.enum_cf7_tracker_mail_status OWNER TO nsh_db_user;

--
-- Name: enum_footer_nav_items_link_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_footer_nav_items_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_footer_nav_items_link_type OWNER TO nsh_db_user;

--
-- Name: enum_form_submissions_erp_status; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_form_submissions_erp_status AS ENUM (
    'not_configured',
    'success',
    'failed'
);


ALTER TYPE public.enum_form_submissions_erp_status OWNER TO nsh_db_user;

--
-- Name: enum_forms_confirmation_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_forms_confirmation_type AS ENUM (
    'message',
    'redirect'
);


ALTER TYPE public.enum_forms_confirmation_type OWNER TO nsh_db_user;

--
-- Name: enum_header_nav_items_link_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_header_nav_items_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_header_nav_items_link_type OWNER TO nsh_db_user;

--
-- Name: enum_pages_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


ALTER TYPE public.enum_pages_blocks_archive_populate_by OWNER TO nsh_db_user;

--
-- Name: enum_pages_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_blocks_archive_relation_to AS ENUM (
    'posts'
);


ALTER TYPE public.enum_pages_blocks_archive_relation_to OWNER TO nsh_db_user;

--
-- Name: enum_pages_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum_pages_blocks_content_columns_link_appearance OWNER TO nsh_db_user;

--
-- Name: enum_pages_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_pages_blocks_content_columns_link_type OWNER TO nsh_db_user;

--
-- Name: enum_pages_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


ALTER TYPE public.enum_pages_blocks_content_columns_size OWNER TO nsh_db_user;

--
-- Name: enum_pages_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_blocks_cta_links_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum_pages_blocks_cta_links_link_appearance OWNER TO nsh_db_user;

--
-- Name: enum_pages_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_pages_blocks_cta_links_link_type OWNER TO nsh_db_user;

--
-- Name: enum_pages_hero_links_link_appearance; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_hero_links_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum_pages_hero_links_link_appearance OWNER TO nsh_db_user;

--
-- Name: enum_pages_hero_links_link_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_hero_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_pages_hero_links_link_type OWNER TO nsh_db_user;

--
-- Name: enum_pages_hero_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_hero_type AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact'
);


ALTER TYPE public.enum_pages_hero_type OWNER TO nsh_db_user;

--
-- Name: enum_pages_meta_meta_robots_following; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_meta_meta_robots_following AS ENUM (
    'follow',
    'nofollow'
);


ALTER TYPE public.enum_pages_meta_meta_robots_following OWNER TO nsh_db_user;

--
-- Name: enum_pages_meta_meta_robots_indexing; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_meta_meta_robots_indexing AS ENUM (
    'index',
    'noindex'
);


ALTER TYPE public.enum_pages_meta_meta_robots_indexing OWNER TO nsh_db_user;

--
-- Name: enum_pages_status; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_pages_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_pages_status OWNER TO nsh_db_user;

--
-- Name: enum_payload_folders_folder_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_payload_folders_folder_type AS ENUM (
    'media'
);


ALTER TYPE public.enum_payload_folders_folder_type OWNER TO nsh_db_user;

--
-- Name: enum_payload_jobs_log_state; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_payload_jobs_log_state AS ENUM (
    'failed',
    'succeeded'
);


ALTER TYPE public.enum_payload_jobs_log_state OWNER TO nsh_db_user;

--
-- Name: enum_payload_jobs_log_task_slug; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_payload_jobs_log_task_slug AS ENUM (
    'inline',
    'schedulePublish'
);


ALTER TYPE public.enum_payload_jobs_log_task_slug OWNER TO nsh_db_user;

--
-- Name: enum_payload_jobs_task_slug; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_payload_jobs_task_slug AS ENUM (
    'inline',
    'schedulePublish'
);


ALTER TYPE public.enum_payload_jobs_task_slug OWNER TO nsh_db_user;

--
-- Name: enum_posts_meta_meta_robots_following; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_posts_meta_meta_robots_following AS ENUM (
    'follow',
    'nofollow'
);


ALTER TYPE public.enum_posts_meta_meta_robots_following OWNER TO nsh_db_user;

--
-- Name: enum_posts_meta_meta_robots_indexing; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_posts_meta_meta_robots_indexing AS ENUM (
    'index',
    'noindex'
);


ALTER TYPE public.enum_posts_meta_meta_robots_indexing OWNER TO nsh_db_user;

--
-- Name: enum_posts_status; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_posts_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_posts_status OWNER TO nsh_db_user;

--
-- Name: enum_properties_meta_meta_robots_following; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_properties_meta_meta_robots_following AS ENUM (
    'follow',
    'nofollow'
);


ALTER TYPE public.enum_properties_meta_meta_robots_following OWNER TO nsh_db_user;

--
-- Name: enum_properties_meta_meta_robots_indexing; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_properties_meta_meta_robots_indexing AS ENUM (
    'index',
    'noindex'
);


ALTER TYPE public.enum_properties_meta_meta_robots_indexing OWNER TO nsh_db_user;

--
-- Name: enum_properties_status; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_properties_status AS ENUM (
    'for_sale',
    'sold',
    'under_contract'
);


ALTER TYPE public.enum_properties_status OWNER TO nsh_db_user;

--
-- Name: enum_properties_video_video_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_properties_video_video_type AS ENUM (
    'youtube',
    'file'
);


ALTER TYPE public.enum_properties_video_video_type OWNER TO nsh_db_user;

--
-- Name: enum_redirects_to_type; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_redirects_to_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_redirects_to_type OWNER TO nsh_db_user;

--
-- Name: enum_users_roles; Type: TYPE; Schema: public; Owner: nsh_db_user
--

CREATE TYPE public.enum_users_roles AS ENUM (
    'admin',
    'editor',
    'seo-editor'
);


ALTER TYPE public.enum_users_roles OWNER TO nsh_db_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _blogs_v; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._blogs_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_hero_image_id integer,
    version_excerpt character varying,
    version_content jsonb,
    version_meta_title character varying,
    version_meta_image_id integer,
    version_meta_description character varying,
    version_meta_focus_keyword character varying,
    version_meta_canonical_url character varying,
    version_meta_meta_robots_indexing public.enum__blogs_v_version_meta_meta_robots_indexing DEFAULT 'index'::public.enum__blogs_v_version_meta_meta_robots_indexing,
    version_meta_meta_robots_following public.enum__blogs_v_version_meta_meta_robots_following DEFAULT 'follow'::public.enum__blogs_v_version_meta_meta_robots_following,
    version_meta_meta_robots_noarchive boolean DEFAULT false,
    version_meta_meta_robots_nosnippet boolean DEFAULT false,
    version_reading_time numeric DEFAULT 0,
    version_published_at timestamp(3) with time zone,
    version_generate_slug boolean DEFAULT true,
    version_slug character varying,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__blogs_v_version_status DEFAULT 'draft'::public.enum__blogs_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    autosave boolean
);


ALTER TABLE public._blogs_v OWNER TO nsh_db_user;

--
-- Name: _blogs_v_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._blogs_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._blogs_v_id_seq OWNER TO nsh_db_user;

--
-- Name: _blogs_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._blogs_v_id_seq OWNED BY public._blogs_v.id;


--
-- Name: _blogs_v_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._blogs_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer,
    categories_id integer,
    blogs_id integer
);


ALTER TABLE public._blogs_v_rels OWNER TO nsh_db_user;

--
-- Name: _blogs_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._blogs_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._blogs_v_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: _blogs_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._blogs_v_rels_id_seq OWNED BY public._blogs_v_rels.id;


--
-- Name: _blogs_v_version_populated_authors; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._blogs_v_version_populated_authors (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    _uuid character varying,
    name character varying
);


ALTER TABLE public._blogs_v_version_populated_authors OWNER TO nsh_db_user;

--
-- Name: _blogs_v_version_populated_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._blogs_v_version_populated_authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._blogs_v_version_populated_authors_id_seq OWNER TO nsh_db_user;

--
-- Name: _blogs_v_version_populated_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._blogs_v_version_populated_authors_id_seq OWNED BY public._blogs_v_version_populated_authors.id;


--
-- Name: _pages_v; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_home_hero_title character varying DEFAULT 'Luxury Redefined'::character varying,
    version_home_hero_description character varying DEFAULT 'Experience unparalleled luxury living with our meticulously crafted high-end homes'::character varying,
    version_home_hero_video_url character varying DEFAULT '/media/WEBSITE-1.mov'::character varying,
    version_home_hero_button_text character varying DEFAULT 'View All Properties'::character varying,
    version_home_hero_button_link character varying DEFAULT '/properties'::character varying,
    version_timeless_comfort_title character varying DEFAULT 'Timeless Comfort In Every Detail'::character varying,
    version_timeless_comfort_description character varying DEFAULT 'We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.'::character varying,
    version_timeless_comfort_button_text character varying DEFAULT 'About Us'::character varying,
    version_timeless_comfort_button_link character varying DEFAULT '/about'::character varying,
    version_vr_tour_title character varying DEFAULT 'Experience Your Future Home'::character varying,
    version_vr_tour_description character varying DEFAULT 'Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it''s built.'::character varying,
    version_vr_tour_banner_image character varying DEFAULT '/media/3dtour.webp'::character varying,
    version_vr_tour_button_text character varying DEFAULT 'Take a Virtual Tour'::character varying,
    version_vr_tour_button_link character varying DEFAULT '/properties'::character varying,
    version_concierge_title character varying DEFAULT 'Our Concierge Services'::character varying,
    version_concierge_description character varying DEFAULT 'We''re here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.'::character varying,
    version_concierge_image character varying DEFAULT '/media/concierge-services.webp'::character varying,
    version_concierge_button_text character varying DEFAULT 'Learn More'::character varying,
    version_concierge_button_link character varying DEFAULT '/concierge'::character varying,
    version_newest_residences_title character varying DEFAULT 'Explore Our Newest Residences'::character varying,
    version_newest_residences_description character varying DEFAULT 'Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.'::character varying,
    version_newest_residences_youtube_url character varying DEFAULT 'https://www.youtube.com/embed/iDv2I89i8QY?rel=0'::character varying,
    version_newest_residences_subscribe_link character varying DEFAULT 'https://www.youtube.com/@NovelSignatureHomes/videos'::character varying,
    version_home_contact_heading character varying DEFAULT 'LET''S FIND YOUR DREAM HOME TOGETHER'::character varying,
    version_home_contact_selected_form_id integer,
    version_properties_page_header_title character varying DEFAULT 'Luxury Homes For Sale In Texas'::character varying,
    version_properties_page_header_description character varying DEFAULT 'Texas luxury living starts with Novel Signature Homes. Whether you''re seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.'::character varying,
    version_properties_page_header_section_heading character varying DEFAULT 'Our Properties'::character varying,
    version_concierge_page_hero_title character varying DEFAULT 'Concierge Service'::character varying,
    version_concierge_page_hero_description character varying DEFAULT 'At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.'::character varying,
    version_concierge_page_hero_banner_image character varying DEFAULT '/media/concierge/hero-banner.webp'::character varying,
    version_concierge_page_services_heading character varying DEFAULT 'Our Services'::character varying,
    version_concierge_page_how_it_works_heading character varying DEFAULT 'How it works'::character varying,
    version_concierge_page_how_it_works_image character varying DEFAULT '/media/concierge/howitwork.webp'::character varying,
    version_concierge_page_why_love_it_heading character varying DEFAULT 'Why Homeowners Love It'::character varying,
    version_concierge_page_contact_form_heading character varying DEFAULT 'Let''s Make Your Move Effortless'::character varying,
    version_concierge_page_contact_form_subheading character varying DEFAULT 'Move into your dream home without the stress of endless decisions or countless hours searching for the right services.'::character varying,
    version_concierge_page_contact_form_selected_form_id integer,
    version_about_page_story_title character varying DEFAULT 'Our Story'::character varying,
    version_about_page_banner_image character varying DEFAULT '/media/about/ourstorybanner.webp'::character varying,
    version_about_page_paragraph1 character varying DEFAULT 'At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.'::character varying,
    version_about_page_paragraph2 character varying DEFAULT 'Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.'::character varying,
    version_about_page_vision_title character varying DEFAULT 'Our Vision'::character varying,
    version_about_page_vision_text character varying DEFAULT 'To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.'::character varying,
    version_about_page_mission_title character varying DEFAULT 'Our Mission'::character varying,
    version_about_page_mission_text character varying DEFAULT 'Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.'::character varying,
    version_about_page_values_title character varying DEFAULT 'Our Values'::character varying,
    version_about_page_values_text character varying DEFAULT 'Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.'::character varying,
    version_about_page_why_heading_prefix character varying DEFAULT 'Why Choose'::character varying,
    version_about_page_why_heading_main character varying DEFAULT 'Novel Signature Homes ?'::character varying,
    version_about_page_why_subtitle character varying DEFAULT 'Everyday, we work hard to make our clients’ lives better and happier.'::character varying,
    version_about_page_why_image character varying DEFAULT '/media/about/whychoose.webp'::character varying,
    version_about_page_feature1 character varying DEFAULT 'Experience the finest materials and careful attention to detail with superior craftsmanship.'::character varying,
    version_about_page_feature2 character varying DEFAULT 'Live in Texas’s most desirable and well-connected neighborhoods with prime locations.'::character varying,
    version_about_page_feature3 character varying DEFAULT 'Enjoy living without compromising on elegance through luxury.'::character varying,
    version_about_page_feature4 character varying DEFAULT 'Enjoy exceptional customer care from start to finish, with our signature white-glove service.'::character varying,
    version_about_page_contact_heading character varying DEFAULT 'Let''s Find Your Dream Home Together'::character varying,
    version_hero_type public.enum__pages_v_version_hero_type DEFAULT 'lowImpact'::public.enum__pages_v_version_hero_type,
    version_hero_rich_text jsonb,
    version_hero_media_id integer,
    version_privacy_policy_page_title character varying DEFAULT 'Privacy Policy'::character varying,
    version_privacy_policy_page_effective_date character varying DEFAULT 'Effective as of April 5, 2025'::character varying,
    version_terms_and_conditions_page_title character varying DEFAULT 'Terms and Conditions'::character varying,
    version_terms_and_conditions_page_subheading character varying DEFAULT 'Terms and condition'::character varying,
    version_terms_and_conditions_page_effective_date character varying DEFAULT 'Effective as of April 5, 2025'::character varying,
    version_buy_a_home_page_title character varying DEFAULT 'Contact Us'::character varying,
    version_buy_a_home_page_subheading character varying DEFAULT 'Buy A Home'::character varying,
    version_buy_a_home_page_description character varying DEFAULT 'Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.'::character varying,
    version_buy_a_home_page_image_id integer,
    version_buy_a_home_page_image_url character varying DEFAULT '/media/buy-a-home-sales.webp'::character varying,
    version_buy_a_home_page_additional_content jsonb,
    version_buy_a_home_page_selected_form_id integer,
    version_buy_a_home_page_form_action character varying DEFAULT 'https://formspree.io/f/xbjnqkyv'::character varying,
    version_buy_a_home_page_button_text character varying DEFAULT 'Submit'::character varying,
    version_other_inquiries_page_title character varying DEFAULT 'Contact Us'::character varying,
    version_other_inquiries_page_subheading character varying DEFAULT 'Other Inquiries'::character varying,
    version_other_inquiries_page_description character varying DEFAULT 'Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!'::character varying,
    version_other_inquiries_page_image_id integer,
    version_other_inquiries_page_image_url character varying DEFAULT '/media/other-inquiries-hero.webp'::character varying,
    version_other_inquiries_page_additional_content jsonb,
    version_other_inquiries_page_selected_form_id integer,
    version_other_inquiries_page_form_action character varying DEFAULT 'https://formspree.io/f/xbjnqkyv'::character varying,
    version_other_inquiries_page_button_text character varying DEFAULT 'Submit'::character varying,
    version_trade_inquiry_page_title character varying DEFAULT 'Contact Us'::character varying,
    version_trade_inquiry_page_subheading character varying DEFAULT 'Trade Inquiry'::character varying,
    version_trade_inquiry_page_description character varying DEFAULT 'We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.'::character varying,
    version_trade_inquiry_page_image_id integer,
    version_trade_inquiry_page_image_url character varying DEFAULT '/media/trade-inquiry-hero.webp'::character varying,
    version_trade_inquiry_page_additional_content jsonb,
    version_trade_inquiry_page_selected_form_id integer,
    version_trade_inquiry_page_form_action character varying DEFAULT 'https://formspree.io/f/xbjnqkyv'::character varying,
    version_trade_inquiry_page_button_text character varying DEFAULT 'Submit'::character varying,
    version_thank_you_page_title character varying DEFAULT 'Thank You'::character varying,
    version_thank_you_page_subheading character varying DEFAULT 'Thank You for Reaching Out'::character varying,
    version_thank_you_page_message character varying DEFAULT 'We have received your message and will get back to you shortly.'::character varying,
    version_thank_you_page_additional_content jsonb,
    version_thank_you_page_button_text character varying DEFAULT 'Back to Home'::character varying,
    version_thank_you_page_button_link character varying DEFAULT '/'::character varying,
    version_meta_title character varying,
    version_meta_description character varying,
    version_meta_image_id integer,
    version_meta_focus_keyword character varying,
    version_meta_canonical_url character varying,
    version_meta_meta_robots_indexing public.enum__pages_v_version_meta_meta_robots_indexing DEFAULT 'index'::public.enum__pages_v_version_meta_meta_robots_indexing,
    version_meta_meta_robots_following public.enum__pages_v_version_meta_meta_robots_following DEFAULT 'follow'::public.enum__pages_v_version_meta_meta_robots_following,
    version_meta_meta_robots_noarchive boolean DEFAULT false,
    version_meta_meta_robots_nosnippet boolean DEFAULT false,
    version_published_at timestamp(3) with time zone,
    version_generate_slug boolean DEFAULT true,
    version_slug character varying,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__pages_v_version_status DEFAULT 'draft'::public.enum__pages_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    autosave boolean
);


ALTER TABLE public._pages_v OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_archive; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_blocks_archive (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    intro_content jsonb,
    populate_by public.enum__pages_v_blocks_archive_populate_by DEFAULT 'collection'::public.enum__pages_v_blocks_archive_populate_by,
    relation_to public.enum__pages_v_blocks_archive_relation_to DEFAULT 'posts'::public.enum__pages_v_blocks_archive_relation_to,
    "limit" numeric DEFAULT 10,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_archive OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_blocks_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_archive_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_blocks_archive_id_seq OWNED BY public._pages_v_blocks_archive.id;


--
-- Name: _pages_v_blocks_carousel; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_blocks_carousel (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    title character varying,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_carousel OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_carousel_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_blocks_carousel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_carousel_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_carousel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_blocks_carousel_id_seq OWNED BY public._pages_v_blocks_carousel.id;


--
-- Name: _pages_v_blocks_carousel_slides; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_blocks_carousel_slides (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    image_id integer,
    heading character varying,
    caption character varying,
    _uuid character varying
);


ALTER TABLE public._pages_v_blocks_carousel_slides OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_carousel_slides_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_blocks_carousel_slides_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_carousel_slides_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_carousel_slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_blocks_carousel_slides_id_seq OWNED BY public._pages_v_blocks_carousel_slides.id;


--
-- Name: _pages_v_blocks_content; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_content OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_content_columns; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_blocks_content_columns (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    size public.enum__pages_v_blocks_content_columns_size DEFAULT 'oneThird'::public.enum__pages_v_blocks_content_columns_size,
    rich_text jsonb,
    enable_link boolean,
    link_type public.enum__pages_v_blocks_content_columns_link_type DEFAULT 'reference'::public.enum__pages_v_blocks_content_columns_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_blocks_content_columns_link_appearance DEFAULT 'default'::public.enum__pages_v_blocks_content_columns_link_appearance,
    _uuid character varying
);


ALTER TABLE public._pages_v_blocks_content_columns OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_blocks_content_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_content_columns_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_blocks_content_columns_id_seq OWNED BY public._pages_v_blocks_content_columns.id;


--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_blocks_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_content_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_blocks_content_id_seq OWNED BY public._pages_v_blocks_content.id;


--
-- Name: _pages_v_blocks_cta; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_blocks_cta (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    rich_text jsonb,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_cta OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_blocks_cta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_cta_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_blocks_cta_id_seq OWNED BY public._pages_v_blocks_cta.id;


--
-- Name: _pages_v_blocks_cta_links; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_blocks_cta_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    link_type public.enum__pages_v_blocks_cta_links_link_type DEFAULT 'reference'::public.enum__pages_v_blocks_cta_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_blocks_cta_links_link_appearance DEFAULT 'default'::public.enum__pages_v_blocks_cta_links_link_appearance,
    _uuid character varying
);


ALTER TABLE public._pages_v_blocks_cta_links OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_blocks_cta_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_cta_links_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_blocks_cta_links_id_seq OWNED BY public._pages_v_blocks_cta_links.id;


--
-- Name: _pages_v_blocks_form_block; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_blocks_form_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    form_id integer,
    enable_intro boolean,
    intro_content jsonb,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_form_block OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_form_block_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_blocks_form_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_form_block_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_form_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_blocks_form_block_id_seq OWNED BY public._pages_v_blocks_form_block.id;


--
-- Name: _pages_v_blocks_inquiry_hero; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_blocks_inquiry_hero (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    title character varying DEFAULT 'Contact Us'::character varying,
    subheading character varying DEFAULT 'Inquiries'::character varying,
    description character varying,
    image_id integer,
    image_url character varying,
    selected_form_id integer,
    form_action character varying DEFAULT 'https://formspree.io/f/xbjnqkyv'::character varying,
    button_text character varying DEFAULT 'Submit'::character varying,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_inquiry_hero OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_inquiry_hero_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_blocks_inquiry_hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_inquiry_hero_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_inquiry_hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_blocks_inquiry_hero_id_seq OWNED BY public._pages_v_blocks_inquiry_hero.id;


--
-- Name: _pages_v_blocks_media_block; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_blocks_media_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    media_id integer,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_media_block OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_blocks_media_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_media_block_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_blocks_media_block_id_seq OWNED BY public._pages_v_blocks_media_block.id;


--
-- Name: _pages_v_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_id_seq OWNED BY public._pages_v.id;


--
-- Name: _pages_v_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer,
    categories_id integer
);


ALTER TABLE public._pages_v_rels OWNER TO nsh_db_user;

--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_rels_id_seq OWNED BY public._pages_v_rels.id;


--
-- Name: _pages_v_version_concierge_page_how_it_works_steps; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_version_concierge_page_how_it_works_steps (
    _order integer CONSTRAINT _pages_v_version_concierge_page_how_it_works_st__order_not_null NOT NULL,
    _parent_id integer CONSTRAINT _pages_v_version_concierge_page_how_it_work__parent_id_not_null NOT NULL,
    id integer NOT NULL,
    step_number character varying,
    title character varying,
    description character varying,
    icon character varying,
    _uuid character varying
);


ALTER TABLE public._pages_v_version_concierge_page_how_it_works_steps OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_concierge_page_how_it_works_steps_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_version_concierge_page_how_it_works_steps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_version_concierge_page_how_it_works_steps_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_concierge_page_how_it_works_steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_version_concierge_page_how_it_works_steps_id_seq OWNED BY public._pages_v_version_concierge_page_how_it_works_steps.id;


--
-- Name: _pages_v_version_concierge_page_services_items; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_version_concierge_page_services_items (
    _order integer NOT NULL,
    _parent_id integer CONSTRAINT _pages_v_version_concierge_page_services_it__parent_id_not_null NOT NULL,
    id integer NOT NULL,
    title character varying,
    icon character varying,
    _uuid character varying
);


ALTER TABLE public._pages_v_version_concierge_page_services_items OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_concierge_page_services_items_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_version_concierge_page_services_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_version_concierge_page_services_items_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_concierge_page_services_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_version_concierge_page_services_items_id_seq OWNED BY public._pages_v_version_concierge_page_services_items.id;


--
-- Name: _pages_v_version_concierge_page_why_love_it_cards; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_version_concierge_page_why_love_it_cards (
    _order integer CONSTRAINT _pages_v_version_concierge_page_why_love_it_car__order_not_null NOT NULL,
    _parent_id integer CONSTRAINT _pages_v_version_concierge_page_why_love_it__parent_id_not_null NOT NULL,
    id integer NOT NULL,
    tag character varying,
    description character varying,
    _uuid character varying
);


ALTER TABLE public._pages_v_version_concierge_page_why_love_it_cards OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_concierge_page_why_love_it_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_version_concierge_page_why_love_it_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_version_concierge_page_why_love_it_cards_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_concierge_page_why_love_it_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_version_concierge_page_why_love_it_cards_id_seq OWNED BY public._pages_v_version_concierge_page_why_love_it_cards.id;


--
-- Name: _pages_v_version_featured_properties_override; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_version_featured_properties_override (
    _order integer NOT NULL,
    _parent_id integer CONSTRAINT _pages_v_version_featured_properties_overri__parent_id_not_null NOT NULL,
    id integer NOT NULL,
    name character varying,
    details character varying,
    image character varying,
    href character varying,
    _uuid character varying
);


ALTER TABLE public._pages_v_version_featured_properties_override OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_featured_properties_override_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_version_featured_properties_override_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_version_featured_properties_override_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_featured_properties_override_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_version_featured_properties_override_id_seq OWNED BY public._pages_v_version_featured_properties_override.id;


--
-- Name: _pages_v_version_hero_links; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_version_hero_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    link_type public.enum__pages_v_version_hero_links_link_type DEFAULT 'reference'::public.enum__pages_v_version_hero_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_version_hero_links_link_appearance DEFAULT 'default'::public.enum__pages_v_version_hero_links_link_appearance,
    _uuid character varying
);


ALTER TABLE public._pages_v_version_hero_links OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_version_hero_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_version_hero_links_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_version_hero_links_id_seq OWNED BY public._pages_v_version_hero_links.id;


--
-- Name: _pages_v_version_privacy_policy_page_sections; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_version_privacy_policy_page_sections (
    _order integer NOT NULL,
    _parent_id integer CONSTRAINT _pages_v_version_privacy_policy_page_sectio__parent_id_not_null NOT NULL,
    id integer NOT NULL,
    heading character varying,
    content jsonb,
    _uuid character varying
);


ALTER TABLE public._pages_v_version_privacy_policy_page_sections OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_privacy_policy_page_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_version_privacy_policy_page_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_version_privacy_policy_page_sections_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_privacy_policy_page_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_version_privacy_policy_page_sections_id_seq OWNED BY public._pages_v_version_privacy_policy_page_sections.id;


--
-- Name: _pages_v_version_terms_and_conditions_page_sections; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_version_terms_and_conditions_page_sections (
    _order integer CONSTRAINT _pages_v_version_terms_and_conditions_page_sect__order_not_null NOT NULL,
    _parent_id integer CONSTRAINT _pages_v_version_terms_and_conditions_page___parent_id_not_null NOT NULL,
    id integer NOT NULL,
    heading character varying,
    content jsonb,
    _uuid character varying
);


ALTER TABLE public._pages_v_version_terms_and_conditions_page_sections OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_terms_and_conditions_page_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_version_terms_and_conditions_page_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_version_terms_and_conditions_page_sections_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_terms_and_conditions_page_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_version_terms_and_conditions_page_sections_id_seq OWNED BY public._pages_v_version_terms_and_conditions_page_sections.id;


--
-- Name: _pages_v_version_why_choose_us; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._pages_v_version_why_choose_us (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    label character varying,
    heading character varying,
    text character varying,
    _uuid character varying
);


ALTER TABLE public._pages_v_version_why_choose_us OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_why_choose_us_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._pages_v_version_why_choose_us_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_version_why_choose_us_id_seq OWNER TO nsh_db_user;

--
-- Name: _pages_v_version_why_choose_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._pages_v_version_why_choose_us_id_seq OWNED BY public._pages_v_version_why_choose_us.id;


--
-- Name: _posts_v; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._posts_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_hero_image_id integer,
    version_content jsonb,
    version_meta_title character varying,
    version_meta_image_id integer,
    version_meta_description character varying,
    version_published_at timestamp(3) with time zone,
    version_generate_slug boolean DEFAULT true,
    version_slug character varying,
    version_meta_focus_keyword character varying,
    version_meta_canonical_url character varying,
    version_meta_meta_robots_indexing public.enum__posts_v_version_meta_meta_robots_indexing DEFAULT 'index'::public.enum__posts_v_version_meta_meta_robots_indexing,
    version_meta_meta_robots_following public.enum__posts_v_version_meta_meta_robots_following DEFAULT 'follow'::public.enum__posts_v_version_meta_meta_robots_following,
    version_meta_meta_robots_noarchive boolean DEFAULT false,
    version_meta_meta_robots_nosnippet boolean DEFAULT false,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__posts_v_version_status DEFAULT 'draft'::public.enum__posts_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    autosave boolean
);


ALTER TABLE public._posts_v OWNER TO nsh_db_user;

--
-- Name: _posts_v_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._posts_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._posts_v_id_seq OWNER TO nsh_db_user;

--
-- Name: _posts_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._posts_v_id_seq OWNED BY public._posts_v.id;


--
-- Name: _posts_v_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._posts_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    posts_id integer,
    categories_id integer,
    users_id integer
);


ALTER TABLE public._posts_v_rels OWNER TO nsh_db_user;

--
-- Name: _posts_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._posts_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._posts_v_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: _posts_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._posts_v_rels_id_seq OWNED BY public._posts_v_rels.id;


--
-- Name: _posts_v_version_populated_authors; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public._posts_v_version_populated_authors (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    _uuid character varying,
    name character varying
);


ALTER TABLE public._posts_v_version_populated_authors OWNER TO nsh_db_user;

--
-- Name: _posts_v_version_populated_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public._posts_v_version_populated_authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._posts_v_version_populated_authors_id_seq OWNER TO nsh_db_user;

--
-- Name: _posts_v_version_populated_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public._posts_v_version_populated_authors_id_seq OWNED BY public._posts_v_version_populated_authors.id;


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.blogs (
    id integer NOT NULL,
    title character varying,
    hero_image_id integer,
    excerpt character varying,
    content jsonb,
    meta_title character varying,
    meta_image_id integer,
    meta_description character varying,
    meta_focus_keyword character varying,
    meta_canonical_url character varying,
    meta_meta_robots_indexing public.enum_blogs_meta_meta_robots_indexing DEFAULT 'index'::public.enum_blogs_meta_meta_robots_indexing,
    meta_meta_robots_following public.enum_blogs_meta_meta_robots_following DEFAULT 'follow'::public.enum_blogs_meta_meta_robots_following,
    meta_meta_robots_noarchive boolean DEFAULT false,
    meta_meta_robots_nosnippet boolean DEFAULT false,
    reading_time numeric DEFAULT 0,
    published_at timestamp(3) with time zone,
    generate_slug boolean DEFAULT true,
    slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_blogs_status DEFAULT 'draft'::public.enum_blogs_status
);


ALTER TABLE public.blogs OWNER TO nsh_db_user;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.blogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blogs_id_seq OWNER TO nsh_db_user;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: blogs_populated_authors; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.blogs_populated_authors (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    name character varying
);


ALTER TABLE public.blogs_populated_authors OWNER TO nsh_db_user;

--
-- Name: blogs_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.blogs_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer,
    categories_id integer,
    blogs_id integer
);


ALTER TABLE public.blogs_rels OWNER TO nsh_db_user;

--
-- Name: blogs_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.blogs_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blogs_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: blogs_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.blogs_rels_id_seq OWNED BY public.blogs_rels.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying NOT NULL,
    generate_slug boolean DEFAULT true,
    slug character varying NOT NULL,
    parent_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.categories OWNER TO nsh_db_user;

--
-- Name: categories_breadcrumbs; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.categories_breadcrumbs (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    doc_id integer,
    url character varying,
    label character varying
);


ALTER TABLE public.categories_breadcrumbs OWNER TO nsh_db_user;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO nsh_db_user;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: cf7_tracker; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.cf7_tracker (
    id integer NOT NULL,
    form_id numeric NOT NULL,
    form_name character varying NOT NULL,
    submitter_name character varying,
    submitter_email character varying,
    submitter_phone character varying,
    form_data jsonb,
    mail_status public.enum_cf7_tracker_mail_status DEFAULT 'pending'::public.enum_cf7_tracker_mail_status,
    mail_note character varying,
    erp_status public.enum_cf7_tracker_erp_status DEFAULT 'pending'::public.enum_cf7_tracker_erp_status,
    erp_lead_id character varying,
    erp_response character varying,
    retry_count numeric DEFAULT 0,
    last_retry_at timestamp(3) with time zone,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.cf7_tracker OWNER TO nsh_db_user;

--
-- Name: cf7_tracker_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.cf7_tracker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cf7_tracker_id_seq OWNER TO nsh_db_user;

--
-- Name: cf7_tracker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.cf7_tracker_id_seq OWNED BY public.cf7_tracker.id;


--
-- Name: footer; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.footer (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.footer OWNER TO nsh_db_user;

--
-- Name: footer_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.footer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footer_id_seq OWNER TO nsh_db_user;

--
-- Name: footer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.footer_id_seq OWNED BY public.footer.id;


--
-- Name: footer_nav_items; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.footer_nav_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_footer_nav_items_link_type DEFAULT 'reference'::public.enum_footer_nav_items_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying NOT NULL
);


ALTER TABLE public.footer_nav_items OWNER TO nsh_db_user;

--
-- Name: footer_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.footer_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer
);


ALTER TABLE public.footer_rels OWNER TO nsh_db_user;

--
-- Name: footer_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.footer_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footer_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: footer_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.footer_rels_id_seq OWNED BY public.footer_rels.id;


--
-- Name: form_submissions; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.form_submissions (
    id integer NOT NULL,
    form_id integer NOT NULL,
    erp_status public.enum_form_submissions_erp_status DEFAULT 'not_configured'::public.enum_form_submissions_erp_status,
    erp_lead_id character varying,
    erp_response character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.form_submissions OWNER TO nsh_db_user;

--
-- Name: form_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.form_submissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.form_submissions_id_seq OWNER TO nsh_db_user;

--
-- Name: form_submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.form_submissions_id_seq OWNED BY public.form_submissions.id;


--
-- Name: form_submissions_submission_data; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.form_submissions_submission_data (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    field character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.form_submissions_submission_data OWNER TO nsh_db_user;

--
-- Name: forms; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms (
    id integer NOT NULL,
    title character varying NOT NULL,
    submit_button_label character varying,
    confirmation_type public.enum_forms_confirmation_type DEFAULT 'message'::public.enum_forms_confirmation_type,
    confirmation_message jsonb,
    redirect_url character varying,
    enable_erp_push boolean DEFAULT false,
    frappe_url character varying,
    api_method character varying DEFAULT 'receive_website_lead'::character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.forms OWNER TO nsh_db_user;

--
-- Name: forms_blocks_checkbox; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_blocks_checkbox (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    required boolean,
    default_value boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_checkbox OWNER TO nsh_db_user;

--
-- Name: forms_blocks_country; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_blocks_country (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_country OWNER TO nsh_db_user;

--
-- Name: forms_blocks_email; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_blocks_email (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_email OWNER TO nsh_db_user;

--
-- Name: forms_blocks_message; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_blocks_message (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    message jsonb,
    block_name character varying
);


ALTER TABLE public.forms_blocks_message OWNER TO nsh_db_user;

--
-- Name: forms_blocks_number; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_blocks_number (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    default_value numeric,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_number OWNER TO nsh_db_user;

--
-- Name: forms_blocks_select; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_blocks_select (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    default_value character varying,
    placeholder character varying,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_select OWNER TO nsh_db_user;

--
-- Name: forms_blocks_select_options; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_blocks_select_options (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    label character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.forms_blocks_select_options OWNER TO nsh_db_user;

--
-- Name: forms_blocks_state; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_blocks_state (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_state OWNER TO nsh_db_user;

--
-- Name: forms_blocks_text; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_blocks_text (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    default_value character varying,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_text OWNER TO nsh_db_user;

--
-- Name: forms_blocks_textarea; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_blocks_textarea (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    default_value character varying,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_textarea OWNER TO nsh_db_user;

--
-- Name: forms_emails; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_emails (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    email_to character varying,
    cc character varying,
    bcc character varying,
    reply_to character varying,
    email_from character varying,
    subject character varying DEFAULT 'You''ve received a new message.'::character varying NOT NULL,
    message jsonb
);


ALTER TABLE public.forms_emails OWNER TO nsh_db_user;

--
-- Name: forms_field_mapping; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_field_mapping (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    form_field character varying,
    frappe_field character varying
);


ALTER TABLE public.forms_field_mapping OWNER TO nsh_db_user;

--
-- Name: forms_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forms_id_seq OWNER TO nsh_db_user;

--
-- Name: forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.forms_id_seq OWNED BY public.forms.id;


--
-- Name: forms_static_fields; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.forms_static_fields (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    frappe_field character varying,
    value character varying
);


ALTER TABLE public.forms_static_fields OWNER TO nsh_db_user;

--
-- Name: header; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.header (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.header OWNER TO nsh_db_user;

--
-- Name: header_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.header_id_seq OWNER TO nsh_db_user;

--
-- Name: header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.header_id_seq OWNED BY public.header.id;


--
-- Name: header_nav_items; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.header_nav_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_header_nav_items_link_type DEFAULT 'reference'::public.enum_header_nav_items_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying NOT NULL
);


ALTER TABLE public.header_nav_items OWNER TO nsh_db_user;

--
-- Name: header_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.header_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer
);


ALTER TABLE public.header_rels OWNER TO nsh_db_user;

--
-- Name: header_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.header_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.header_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: header_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.header_rels_id_seq OWNED BY public.header_rels.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.media (
    id integer NOT NULL,
    alt character varying,
    caption jsonb,
    folder_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    thumbnail_u_r_l character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric,
    focal_x numeric,
    focal_y numeric,
    sizes_thumbnail_url character varying,
    sizes_thumbnail_width numeric,
    sizes_thumbnail_height numeric,
    sizes_thumbnail_mime_type character varying,
    sizes_thumbnail_filesize numeric,
    sizes_thumbnail_filename character varying,
    sizes_square_url character varying,
    sizes_square_width numeric,
    sizes_square_height numeric,
    sizes_square_mime_type character varying,
    sizes_square_filesize numeric,
    sizes_square_filename character varying,
    sizes_small_url character varying,
    sizes_small_width numeric,
    sizes_small_height numeric,
    sizes_small_mime_type character varying,
    sizes_small_filesize numeric,
    sizes_small_filename character varying,
    sizes_medium_url character varying,
    sizes_medium_width numeric,
    sizes_medium_height numeric,
    sizes_medium_mime_type character varying,
    sizes_medium_filesize numeric,
    sizes_medium_filename character varying,
    sizes_large_url character varying,
    sizes_large_width numeric,
    sizes_large_height numeric,
    sizes_large_mime_type character varying,
    sizes_large_filesize numeric,
    sizes_large_filename character varying,
    sizes_xlarge_url character varying,
    sizes_xlarge_width numeric,
    sizes_xlarge_height numeric,
    sizes_xlarge_mime_type character varying,
    sizes_xlarge_filesize numeric,
    sizes_xlarge_filename character varying,
    sizes_og_url character varying,
    sizes_og_width numeric,
    sizes_og_height numeric,
    sizes_og_mime_type character varying,
    sizes_og_filesize numeric,
    sizes_og_filename character varying
);


ALTER TABLE public.media OWNER TO nsh_db_user;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_id_seq OWNER TO nsh_db_user;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    title character varying,
    home_hero_title character varying DEFAULT 'Luxury Redefined'::character varying,
    home_hero_description character varying DEFAULT 'Experience unparalleled luxury living with our meticulously crafted high-end homes'::character varying,
    home_hero_video_url character varying DEFAULT '/media/WEBSITE-1.mov'::character varying,
    home_hero_button_text character varying DEFAULT 'View All Properties'::character varying,
    home_hero_button_link character varying DEFAULT '/properties'::character varying,
    timeless_comfort_title character varying DEFAULT 'Timeless Comfort In Every Detail'::character varying,
    timeless_comfort_description character varying DEFAULT 'We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.'::character varying,
    timeless_comfort_button_text character varying DEFAULT 'About Us'::character varying,
    timeless_comfort_button_link character varying DEFAULT '/about'::character varying,
    vr_tour_title character varying DEFAULT 'Experience Your Future Home'::character varying,
    vr_tour_description character varying DEFAULT 'Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it''s built.'::character varying,
    vr_tour_banner_image character varying DEFAULT '/media/3dtour.webp'::character varying,
    vr_tour_button_text character varying DEFAULT 'Take a Virtual Tour'::character varying,
    vr_tour_button_link character varying DEFAULT '/properties'::character varying,
    concierge_title character varying DEFAULT 'Our Concierge Services'::character varying,
    concierge_description character varying DEFAULT 'We''re here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.'::character varying,
    concierge_image character varying DEFAULT '/media/concierge-services.webp'::character varying,
    concierge_button_text character varying DEFAULT 'Learn More'::character varying,
    concierge_button_link character varying DEFAULT '/concierge'::character varying,
    newest_residences_title character varying DEFAULT 'Explore Our Newest Residences'::character varying,
    newest_residences_description character varying DEFAULT 'Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.'::character varying,
    newest_residences_youtube_url character varying DEFAULT 'https://www.youtube.com/embed/iDv2I89i8QY?rel=0'::character varying,
    newest_residences_subscribe_link character varying DEFAULT 'https://www.youtube.com/@NovelSignatureHomes/videos'::character varying,
    home_contact_heading character varying DEFAULT 'LET''S FIND YOUR DREAM HOME TOGETHER'::character varying,
    home_contact_selected_form_id integer,
    properties_page_header_title character varying DEFAULT 'Luxury Homes For Sale In Texas'::character varying,
    properties_page_header_description character varying DEFAULT 'Texas luxury living starts with Novel Signature Homes. Whether you''re seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.'::character varying,
    properties_page_header_section_heading character varying DEFAULT 'Our Properties'::character varying,
    concierge_page_hero_title character varying DEFAULT 'Concierge Service'::character varying,
    concierge_page_hero_description character varying DEFAULT 'At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.'::character varying,
    concierge_page_hero_banner_image character varying DEFAULT '/media/concierge/hero-banner.webp'::character varying,
    concierge_page_services_heading character varying DEFAULT 'Our Services'::character varying,
    concierge_page_how_it_works_heading character varying DEFAULT 'How it works'::character varying,
    concierge_page_how_it_works_image character varying DEFAULT '/media/concierge/howitwork.webp'::character varying,
    concierge_page_why_love_it_heading character varying DEFAULT 'Why Homeowners Love It'::character varying,
    concierge_page_contact_form_heading character varying DEFAULT 'Let''s Make Your Move Effortless'::character varying,
    concierge_page_contact_form_subheading character varying DEFAULT 'Move into your dream home without the stress of endless decisions or countless hours searching for the right services.'::character varying,
    concierge_page_contact_form_selected_form_id integer,
    about_page_story_title character varying DEFAULT 'Our Story'::character varying,
    about_page_banner_image character varying DEFAULT '/media/about/ourstorybanner.webp'::character varying,
    about_page_paragraph1 character varying DEFAULT 'At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.'::character varying,
    about_page_paragraph2 character varying DEFAULT 'Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.'::character varying,
    about_page_vision_title character varying DEFAULT 'Our Vision'::character varying,
    about_page_vision_text character varying DEFAULT 'To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.'::character varying,
    about_page_mission_title character varying DEFAULT 'Our Mission'::character varying,
    about_page_mission_text character varying DEFAULT 'Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.'::character varying,
    about_page_values_title character varying DEFAULT 'Our Values'::character varying,
    about_page_values_text character varying DEFAULT 'Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.'::character varying,
    about_page_why_heading_prefix character varying DEFAULT 'Why Choose'::character varying,
    about_page_why_heading_main character varying DEFAULT 'Novel Signature Homes ?'::character varying,
    about_page_why_subtitle character varying DEFAULT 'Everyday, we work hard to make our clients’ lives better and happier.'::character varying,
    about_page_why_image character varying DEFAULT '/media/about/whychoose.webp'::character varying,
    about_page_feature1 character varying DEFAULT 'Experience the finest materials and careful attention to detail with superior craftsmanship.'::character varying,
    about_page_feature2 character varying DEFAULT 'Live in Texas’s most desirable and well-connected neighborhoods with prime locations.'::character varying,
    about_page_feature3 character varying DEFAULT 'Enjoy living without compromising on elegance through luxury.'::character varying,
    about_page_feature4 character varying DEFAULT 'Enjoy exceptional customer care from start to finish, with our signature white-glove service.'::character varying,
    about_page_contact_heading character varying DEFAULT 'Let''s Find Your Dream Home Together'::character varying,
    hero_type public.enum_pages_hero_type DEFAULT 'lowImpact'::public.enum_pages_hero_type,
    hero_rich_text jsonb,
    hero_media_id integer,
    privacy_policy_page_title character varying DEFAULT 'Privacy Policy'::character varying,
    privacy_policy_page_effective_date character varying DEFAULT 'Effective as of April 5, 2025'::character varying,
    terms_and_conditions_page_title character varying DEFAULT 'Terms and Conditions'::character varying,
    terms_and_conditions_page_subheading character varying DEFAULT 'Terms and condition'::character varying,
    terms_and_conditions_page_effective_date character varying DEFAULT 'Effective as of April 5, 2025'::character varying,
    buy_a_home_page_title character varying DEFAULT 'Contact Us'::character varying,
    buy_a_home_page_subheading character varying DEFAULT 'Buy A Home'::character varying,
    buy_a_home_page_description character varying DEFAULT 'Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.'::character varying,
    buy_a_home_page_image_id integer,
    buy_a_home_page_image_url character varying DEFAULT '/media/buy-a-home-sales.webp'::character varying,
    buy_a_home_page_additional_content jsonb,
    buy_a_home_page_selected_form_id integer,
    buy_a_home_page_form_action character varying DEFAULT 'https://formspree.io/f/xbjnqkyv'::character varying,
    buy_a_home_page_button_text character varying DEFAULT 'Submit'::character varying,
    other_inquiries_page_title character varying DEFAULT 'Contact Us'::character varying,
    other_inquiries_page_subheading character varying DEFAULT 'Other Inquiries'::character varying,
    other_inquiries_page_description character varying DEFAULT 'Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!'::character varying,
    other_inquiries_page_image_id integer,
    other_inquiries_page_image_url character varying DEFAULT '/media/other-inquiries-hero.webp'::character varying,
    other_inquiries_page_additional_content jsonb,
    other_inquiries_page_selected_form_id integer,
    other_inquiries_page_form_action character varying DEFAULT 'https://formspree.io/f/xbjnqkyv'::character varying,
    other_inquiries_page_button_text character varying DEFAULT 'Submit'::character varying,
    trade_inquiry_page_title character varying DEFAULT 'Contact Us'::character varying,
    trade_inquiry_page_subheading character varying DEFAULT 'Trade Inquiry'::character varying,
    trade_inquiry_page_description character varying DEFAULT 'We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.'::character varying,
    trade_inquiry_page_image_id integer,
    trade_inquiry_page_image_url character varying DEFAULT '/media/trade-inquiry-hero.webp'::character varying,
    trade_inquiry_page_additional_content jsonb,
    trade_inquiry_page_selected_form_id integer,
    trade_inquiry_page_form_action character varying DEFAULT 'https://formspree.io/f/xbjnqkyv'::character varying,
    trade_inquiry_page_button_text character varying DEFAULT 'Submit'::character varying,
    thank_you_page_title character varying DEFAULT 'Thank You'::character varying,
    thank_you_page_subheading character varying DEFAULT 'Thank You for Reaching Out'::character varying,
    thank_you_page_message character varying DEFAULT 'We have received your message and will get back to you shortly.'::character varying,
    thank_you_page_additional_content jsonb,
    thank_you_page_button_text character varying DEFAULT 'Back to Home'::character varying,
    thank_you_page_button_link character varying DEFAULT '/'::character varying,
    meta_title character varying,
    meta_description character varying,
    meta_image_id integer,
    meta_focus_keyword character varying,
    meta_canonical_url character varying,
    meta_meta_robots_indexing public.enum_pages_meta_meta_robots_indexing DEFAULT 'index'::public.enum_pages_meta_meta_robots_indexing,
    meta_meta_robots_following public.enum_pages_meta_meta_robots_following DEFAULT 'follow'::public.enum_pages_meta_meta_robots_following,
    meta_meta_robots_noarchive boolean DEFAULT false,
    meta_meta_robots_nosnippet boolean DEFAULT false,
    published_at timestamp(3) with time zone,
    generate_slug boolean DEFAULT true,
    slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_pages_status DEFAULT 'draft'::public.enum_pages_status
);


ALTER TABLE public.pages OWNER TO nsh_db_user;

--
-- Name: pages_blocks_archive; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_blocks_archive (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    intro_content jsonb,
    populate_by public.enum_pages_blocks_archive_populate_by DEFAULT 'collection'::public.enum_pages_blocks_archive_populate_by,
    relation_to public.enum_pages_blocks_archive_relation_to DEFAULT 'posts'::public.enum_pages_blocks_archive_relation_to,
    "limit" numeric DEFAULT 10,
    block_name character varying
);


ALTER TABLE public.pages_blocks_archive OWNER TO nsh_db_user;

--
-- Name: pages_blocks_carousel; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_blocks_carousel (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    title character varying,
    block_name character varying
);


ALTER TABLE public.pages_blocks_carousel OWNER TO nsh_db_user;

--
-- Name: pages_blocks_carousel_slides; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_blocks_carousel_slides (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    image_id integer,
    heading character varying,
    caption character varying
);


ALTER TABLE public.pages_blocks_carousel_slides OWNER TO nsh_db_user;

--
-- Name: pages_blocks_content; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    block_name character varying
);


ALTER TABLE public.pages_blocks_content OWNER TO nsh_db_user;

--
-- Name: pages_blocks_content_columns; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_blocks_content_columns (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    size public.enum_pages_blocks_content_columns_size DEFAULT 'oneThird'::public.enum_pages_blocks_content_columns_size,
    rich_text jsonb,
    enable_link boolean,
    link_type public.enum_pages_blocks_content_columns_link_type DEFAULT 'reference'::public.enum_pages_blocks_content_columns_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_blocks_content_columns_link_appearance DEFAULT 'default'::public.enum_pages_blocks_content_columns_link_appearance
);


ALTER TABLE public.pages_blocks_content_columns OWNER TO nsh_db_user;

--
-- Name: pages_blocks_cta; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_blocks_cta (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    rich_text jsonb,
    block_name character varying
);


ALTER TABLE public.pages_blocks_cta OWNER TO nsh_db_user;

--
-- Name: pages_blocks_cta_links; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_blocks_cta_links (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_pages_blocks_cta_links_link_type DEFAULT 'reference'::public.enum_pages_blocks_cta_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_blocks_cta_links_link_appearance DEFAULT 'default'::public.enum_pages_blocks_cta_links_link_appearance
);


ALTER TABLE public.pages_blocks_cta_links OWNER TO nsh_db_user;

--
-- Name: pages_blocks_form_block; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_blocks_form_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    form_id integer,
    enable_intro boolean,
    intro_content jsonb,
    block_name character varying
);


ALTER TABLE public.pages_blocks_form_block OWNER TO nsh_db_user;

--
-- Name: pages_blocks_inquiry_hero; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_blocks_inquiry_hero (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    title character varying DEFAULT 'Contact Us'::character varying,
    subheading character varying DEFAULT 'Inquiries'::character varying,
    description character varying,
    image_id integer,
    image_url character varying,
    selected_form_id integer,
    form_action character varying DEFAULT 'https://formspree.io/f/xbjnqkyv'::character varying,
    button_text character varying DEFAULT 'Submit'::character varying,
    block_name character varying
);


ALTER TABLE public.pages_blocks_inquiry_hero OWNER TO nsh_db_user;

--
-- Name: pages_blocks_media_block; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_blocks_media_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    media_id integer,
    block_name character varying
);


ALTER TABLE public.pages_blocks_media_block OWNER TO nsh_db_user;

--
-- Name: pages_concierge_page_how_it_works_steps; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_concierge_page_how_it_works_steps (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    step_number character varying,
    title character varying,
    description character varying,
    icon character varying
);


ALTER TABLE public.pages_concierge_page_how_it_works_steps OWNER TO nsh_db_user;

--
-- Name: pages_concierge_page_services_items; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_concierge_page_services_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    title character varying,
    icon character varying
);


ALTER TABLE public.pages_concierge_page_services_items OWNER TO nsh_db_user;

--
-- Name: pages_concierge_page_why_love_it_cards; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_concierge_page_why_love_it_cards (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    tag character varying,
    description character varying
);


ALTER TABLE public.pages_concierge_page_why_love_it_cards OWNER TO nsh_db_user;

--
-- Name: pages_featured_properties_override; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_featured_properties_override (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    name character varying,
    details character varying,
    image character varying,
    href character varying
);


ALTER TABLE public.pages_featured_properties_override OWNER TO nsh_db_user;

--
-- Name: pages_hero_links; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_hero_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_pages_hero_links_link_type DEFAULT 'reference'::public.enum_pages_hero_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_hero_links_link_appearance DEFAULT 'default'::public.enum_pages_hero_links_link_appearance
);


ALTER TABLE public.pages_hero_links OWNER TO nsh_db_user;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_id_seq OWNER TO nsh_db_user;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: pages_privacy_policy_page_sections; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_privacy_policy_page_sections (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    heading character varying,
    content jsonb
);


ALTER TABLE public.pages_privacy_policy_page_sections OWNER TO nsh_db_user;

--
-- Name: pages_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer,
    categories_id integer
);


ALTER TABLE public.pages_rels OWNER TO nsh_db_user;

--
-- Name: pages_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.pages_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: pages_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.pages_rels_id_seq OWNED BY public.pages_rels.id;


--
-- Name: pages_terms_and_conditions_page_sections; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_terms_and_conditions_page_sections (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    heading character varying,
    content jsonb
);


ALTER TABLE public.pages_terms_and_conditions_page_sections OWNER TO nsh_db_user;

--
-- Name: pages_why_choose_us; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.pages_why_choose_us (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    label character varying,
    heading character varying,
    text character varying
);


ALTER TABLE public.pages_why_choose_us OWNER TO nsh_db_user;

--
-- Name: payload_folders; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.payload_folders (
    id integer NOT NULL,
    name character varying NOT NULL,
    folder_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_folders OWNER TO nsh_db_user;

--
-- Name: payload_folders_folder_type; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.payload_folders_folder_type (
    "order" integer NOT NULL,
    parent_id integer NOT NULL,
    value public.enum_payload_folders_folder_type,
    id integer NOT NULL
);


ALTER TABLE public.payload_folders_folder_type OWNER TO nsh_db_user;

--
-- Name: payload_folders_folder_type_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.payload_folders_folder_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_folders_folder_type_id_seq OWNER TO nsh_db_user;

--
-- Name: payload_folders_folder_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.payload_folders_folder_type_id_seq OWNED BY public.payload_folders_folder_type.id;


--
-- Name: payload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.payload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_folders_id_seq OWNER TO nsh_db_user;

--
-- Name: payload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.payload_folders_id_seq OWNED BY public.payload_folders.id;


--
-- Name: payload_jobs; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.payload_jobs (
    id integer NOT NULL,
    input jsonb,
    completed_at timestamp(3) with time zone,
    total_tried numeric DEFAULT 0,
    has_error boolean DEFAULT false,
    error jsonb,
    task_slug public.enum_payload_jobs_task_slug,
    queue character varying DEFAULT 'default'::character varying,
    wait_until timestamp(3) with time zone,
    processing boolean DEFAULT false,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_jobs OWNER TO nsh_db_user;

--
-- Name: payload_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.payload_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_jobs_id_seq OWNER TO nsh_db_user;

--
-- Name: payload_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.payload_jobs_id_seq OWNED BY public.payload_jobs.id;


--
-- Name: payload_jobs_log; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.payload_jobs_log (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    executed_at timestamp(3) with time zone NOT NULL,
    completed_at timestamp(3) with time zone NOT NULL,
    task_slug public.enum_payload_jobs_log_task_slug NOT NULL,
    task_i_d character varying NOT NULL,
    input jsonb,
    output jsonb,
    state public.enum_payload_jobs_log_state NOT NULL,
    error jsonb
);


ALTER TABLE public.payload_jobs_log OWNER TO nsh_db_user;

--
-- Name: payload_kv; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.payload_kv (
    id integer NOT NULL,
    key character varying NOT NULL,
    data jsonb NOT NULL
);


ALTER TABLE public.payload_kv OWNER TO nsh_db_user;

--
-- Name: payload_kv_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.payload_kv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_kv_id_seq OWNER TO nsh_db_user;

--
-- Name: payload_kv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.payload_kv_id_seq OWNED BY public.payload_kv.id;


--
-- Name: payload_locked_documents; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.payload_locked_documents (
    id integer NOT NULL,
    global_slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_locked_documents OWNER TO nsh_db_user;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.payload_locked_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_locked_documents_id_seq OWNER TO nsh_db_user;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.payload_locked_documents_id_seq OWNED BY public.payload_locked_documents.id;


--
-- Name: payload_locked_documents_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.payload_locked_documents_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    properties_id integer,
    blogs_id integer,
    posts_id integer,
    media_id integer,
    categories_id integer,
    users_id integer,
    cf7_tracker_id integer,
    redirects_id integer,
    forms_id integer,
    form_submissions_id integer,
    search_id integer,
    payload_folders_id integer
);


ALTER TABLE public.payload_locked_documents_rels OWNER TO nsh_db_user;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.payload_locked_documents_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_locked_documents_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.payload_locked_documents_rels_id_seq OWNED BY public.payload_locked_documents_rels.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_migrations OWNER TO nsh_db_user;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_migrations_id_seq OWNER TO nsh_db_user;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.payload_migrations_id_seq OWNED BY public.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_preferences OWNER TO nsh_db_user;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_preferences_id_seq OWNER TO nsh_db_user;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.payload_preferences_id_seq OWNED BY public.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


ALTER TABLE public.payload_preferences_rels OWNER TO nsh_db_user;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNED BY public.payload_preferences_rels.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying,
    hero_image_id integer,
    content jsonb,
    meta_title character varying,
    meta_image_id integer,
    meta_description character varying,
    published_at timestamp(3) with time zone,
    generate_slug boolean DEFAULT true,
    slug character varying,
    meta_focus_keyword character varying,
    meta_canonical_url character varying,
    meta_meta_robots_indexing public.enum_posts_meta_meta_robots_indexing DEFAULT 'index'::public.enum_posts_meta_meta_robots_indexing,
    meta_meta_robots_following public.enum_posts_meta_meta_robots_following DEFAULT 'follow'::public.enum_posts_meta_meta_robots_following,
    meta_meta_robots_noarchive boolean DEFAULT false,
    meta_meta_robots_nosnippet boolean DEFAULT false,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_posts_status DEFAULT 'draft'::public.enum_posts_status
);


ALTER TABLE public.posts OWNER TO nsh_db_user;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO nsh_db_user;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: posts_populated_authors; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.posts_populated_authors (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    name character varying
);


ALTER TABLE public.posts_populated_authors OWNER TO nsh_db_user;

--
-- Name: posts_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.posts_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    posts_id integer,
    categories_id integer,
    users_id integer
);


ALTER TABLE public.posts_rels OWNER TO nsh_db_user;

--
-- Name: posts_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.posts_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: posts_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.posts_rels_id_seq OWNED BY public.posts_rels.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.properties (
    id integer NOT NULL,
    status public.enum_properties_status DEFAULT 'for_sale'::public.enum_properties_status,
    featured boolean DEFAULT false,
    is_group_parent boolean DEFAULT false,
    parent_property_id integer,
    published_at timestamp(3) with time zone,
    name character varying NOT NULL,
    address character varying,
    price character varying,
    description character varying,
    contact_form_id integer,
    property_summary_number_of_beds character varying,
    property_summary_number_of_baths character varying,
    property_summary_ac_area character varying,
    property_summary_design_theme character varying,
    broker_information_broker_name character varying,
    broker_information_company_name character varying,
    broker_information_broker_image_id integer,
    builder_name character varying,
    architect_name character varying,
    interior_design_name character varying,
    features_and_amenities_property_details_property_type character varying,
    features_and_amenities_property_details_year_built character varying,
    features_and_amenities_property_details_total_interior_livable_ character varying,
    features_and_amenities_property_details_lot_size character varying,
    features_and_amenities_beds_and_baths_beds character varying,
    features_and_amenities_beds_and_baths_baths character varying,
    features_and_amenities_beds_and_baths_number_of_floors character varying,
    features_and_amenities_interior_features_first_floor character varying,
    features_and_amenities_interior_features_second_floor character varying,
    features_and_amenities_interior_features_third_floor character varying,
    features_and_amenities_interior_features_additional_features character varying,
    features_and_amenities_exterior_features_garage character varying,
    features_and_amenities_exterior_features_yard character varying,
    features_and_amenities_exterior_features_siding character varying,
    features_and_amenities_exterior_features_pool character varying,
    features_and_amenities_exterior_features_driveway character varying,
    features_and_amenities_exterior_features_roof character varying,
    features_and_amenities_exterior_features_deck_patio character varying,
    video_video_type public.enum_properties_video_video_type DEFAULT 'youtube'::public.enum_properties_video_video_type,
    video_youtube_url character varying,
    video_video_file_id integer,
    project_team_broker_name character varying DEFAULT 'Ed Wolff'::character varying,
    project_team_builder_name character varying DEFAULT 'Novel Signature Homes'::character varying,
    project_team_architect_name character varying DEFAULT 'Todd Rice'::character varying,
    project_team_interior_designer_name character varying DEFAULT 'Steve Clifton'::character varying,
    about_section_about_title character varying DEFAULT 'About Woodland Heights'::character varying,
    about_section_about_intro character varying,
    about_section_about_background_image_id integer,
    about_section_history_text character varying,
    about_section_lifestyle_text character varying,
    about_section_neighborhood_text character varying,
    elegance_banner_title character varying DEFAULT 'Experience Elegance In Every Detail'::character varying,
    elegance_banner_description character varying,
    meta_title character varying,
    meta_description character varying,
    meta_image_id integer,
    meta_focus_keyword character varying,
    meta_canonical_url character varying,
    meta_meta_robots_indexing public.enum_properties_meta_meta_robots_indexing DEFAULT 'index'::public.enum_properties_meta_meta_robots_indexing,
    meta_meta_robots_following public.enum_properties_meta_meta_robots_following DEFAULT 'follow'::public.enum_properties_meta_meta_robots_following,
    meta_meta_robots_noarchive boolean DEFAULT false,
    meta_meta_robots_nosnippet boolean DEFAULT false,
    generate_slug boolean DEFAULT true,
    slug character varying NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.properties OWNER TO nsh_db_user;

--
-- Name: properties_floor_plans; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.properties_floor_plans (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    floor_name character varying NOT NULL,
    area_size character varying,
    image_id integer NOT NULL
);


ALTER TABLE public.properties_floor_plans OWNER TO nsh_db_user;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.properties_id_seq OWNER TO nsh_db_user;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- Name: properties_neighborhood_accordion; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.properties_neighborhood_accordion (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    title character varying,
    distance character varying,
    image_id integer
);


ALTER TABLE public.properties_neighborhood_accordion OWNER TO nsh_db_user;

--
-- Name: properties_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.properties_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    media_id integer
);


ALTER TABLE public.properties_rels OWNER TO nsh_db_user;

--
-- Name: properties_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.properties_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.properties_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: properties_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.properties_rels_id_seq OWNED BY public.properties_rels.id;


--
-- Name: redirects; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.redirects (
    id integer NOT NULL,
    "from" character varying NOT NULL,
    to_type public.enum_redirects_to_type DEFAULT 'reference'::public.enum_redirects_to_type,
    to_url character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.redirects OWNER TO nsh_db_user;

--
-- Name: redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.redirects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.redirects_id_seq OWNER TO nsh_db_user;

--
-- Name: redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.redirects_id_seq OWNED BY public.redirects.id;


--
-- Name: redirects_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.redirects_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer
);


ALTER TABLE public.redirects_rels OWNER TO nsh_db_user;

--
-- Name: redirects_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.redirects_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.redirects_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: redirects_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.redirects_rels_id_seq OWNED BY public.redirects_rels.id;


--
-- Name: search; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.search (
    id integer NOT NULL,
    title character varying,
    priority numeric,
    slug character varying,
    meta_title character varying,
    meta_description character varying,
    meta_image_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.search OWNER TO nsh_db_user;

--
-- Name: search_categories; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.search_categories (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    relation_to character varying,
    category_i_d character varying,
    title character varying
);


ALTER TABLE public.search_categories OWNER TO nsh_db_user;

--
-- Name: search_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.search_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_id_seq OWNER TO nsh_db_user;

--
-- Name: search_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.search_id_seq OWNED BY public.search.id;


--
-- Name: search_rels; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.search_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    posts_id integer
);


ALTER TABLE public.search_rels OWNER TO nsh_db_user;

--
-- Name: search_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.search_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_rels_id_seq OWNER TO nsh_db_user;

--
-- Name: search_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.search_rels_id_seq OWNED BY public.search_rels.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    site_icon_id integer,
    header_logo_id integer,
    site_url character varying,
    frappe_url character varying,
    frappe_api_key character varying,
    frappe_api_secret character varying,
    frappe_api_method character varying DEFAULT 'receive_website_lead'::character varying,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.settings OWNER TO nsh_db_user;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.settings_id_seq OWNER TO nsh_db_user;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    email character varying NOT NULL,
    reset_password_token character varying,
    reset_password_expiration timestamp(3) with time zone,
    salt character varying,
    hash character varying,
    login_attempts numeric DEFAULT 0,
    lock_until timestamp(3) with time zone
);


ALTER TABLE public.users OWNER TO nsh_db_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO nsh_db_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.users_roles (
    "order" integer NOT NULL,
    parent_id integer NOT NULL,
    value public.enum_users_roles,
    id integer NOT NULL
);


ALTER TABLE public.users_roles OWNER TO nsh_db_user;

--
-- Name: users_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: nsh_db_user
--

CREATE SEQUENCE public.users_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_roles_id_seq OWNER TO nsh_db_user;

--
-- Name: users_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsh_db_user
--

ALTER SEQUENCE public.users_roles_id_seq OWNED BY public.users_roles.id;


--
-- Name: users_sessions; Type: TABLE; Schema: public; Owner: nsh_db_user
--

CREATE TABLE public.users_sessions (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    created_at timestamp(3) with time zone,
    expires_at timestamp(3) with time zone NOT NULL
);


ALTER TABLE public.users_sessions OWNER TO nsh_db_user;

--
-- Name: _blogs_v id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v ALTER COLUMN id SET DEFAULT nextval('public._blogs_v_id_seq'::regclass);


--
-- Name: _blogs_v_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v_rels ALTER COLUMN id SET DEFAULT nextval('public._blogs_v_rels_id_seq'::regclass);


--
-- Name: _blogs_v_version_populated_authors id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v_version_populated_authors ALTER COLUMN id SET DEFAULT nextval('public._blogs_v_version_populated_authors_id_seq'::regclass);


--
-- Name: _pages_v id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v ALTER COLUMN id SET DEFAULT nextval('public._pages_v_id_seq'::regclass);


--
-- Name: _pages_v_blocks_archive id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_archive ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_archive_id_seq'::regclass);


--
-- Name: _pages_v_blocks_carousel id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_carousel ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_carousel_id_seq'::regclass);


--
-- Name: _pages_v_blocks_carousel_slides id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_carousel_slides ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_carousel_slides_id_seq'::regclass);


--
-- Name: _pages_v_blocks_content id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_content ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_content_id_seq'::regclass);


--
-- Name: _pages_v_blocks_content_columns id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_content_columns_id_seq'::regclass);


--
-- Name: _pages_v_blocks_cta id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_cta ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_cta_id_seq'::regclass);


--
-- Name: _pages_v_blocks_cta_links id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_cta_links_id_seq'::regclass);


--
-- Name: _pages_v_blocks_form_block id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_form_block ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_form_block_id_seq'::regclass);


--
-- Name: _pages_v_blocks_inquiry_hero id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_inquiry_hero ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_inquiry_hero_id_seq'::regclass);


--
-- Name: _pages_v_blocks_media_block id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_media_block ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_media_block_id_seq'::regclass);


--
-- Name: _pages_v_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_rels ALTER COLUMN id SET DEFAULT nextval('public._pages_v_rels_id_seq'::regclass);


--
-- Name: _pages_v_version_concierge_page_how_it_works_steps id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_concierge_page_how_it_works_steps ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_concierge_page_how_it_works_steps_id_seq'::regclass);


--
-- Name: _pages_v_version_concierge_page_services_items id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_concierge_page_services_items ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_concierge_page_services_items_id_seq'::regclass);


--
-- Name: _pages_v_version_concierge_page_why_love_it_cards id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_concierge_page_why_love_it_cards ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_concierge_page_why_love_it_cards_id_seq'::regclass);


--
-- Name: _pages_v_version_featured_properties_override id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_featured_properties_override ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_featured_properties_override_id_seq'::regclass);


--
-- Name: _pages_v_version_hero_links id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_hero_links ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_hero_links_id_seq'::regclass);


--
-- Name: _pages_v_version_privacy_policy_page_sections id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_privacy_policy_page_sections ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_privacy_policy_page_sections_id_seq'::regclass);


--
-- Name: _pages_v_version_terms_and_conditions_page_sections id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_terms_and_conditions_page_sections ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_terms_and_conditions_page_sections_id_seq'::regclass);


--
-- Name: _pages_v_version_why_choose_us id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_why_choose_us ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_why_choose_us_id_seq'::regclass);


--
-- Name: _posts_v id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v ALTER COLUMN id SET DEFAULT nextval('public._posts_v_id_seq'::regclass);


--
-- Name: _posts_v_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v_rels ALTER COLUMN id SET DEFAULT nextval('public._posts_v_rels_id_seq'::regclass);


--
-- Name: _posts_v_version_populated_authors id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v_version_populated_authors ALTER COLUMN id SET DEFAULT nextval('public._posts_v_version_populated_authors_id_seq'::regclass);


--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: blogs_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs_rels ALTER COLUMN id SET DEFAULT nextval('public.blogs_rels_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: cf7_tracker id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.cf7_tracker ALTER COLUMN id SET DEFAULT nextval('public.cf7_tracker_id_seq'::regclass);


--
-- Name: footer id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.footer ALTER COLUMN id SET DEFAULT nextval('public.footer_id_seq'::regclass);


--
-- Name: footer_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.footer_rels ALTER COLUMN id SET DEFAULT nextval('public.footer_rels_id_seq'::regclass);


--
-- Name: form_submissions id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.form_submissions ALTER COLUMN id SET DEFAULT nextval('public.form_submissions_id_seq'::regclass);


--
-- Name: forms id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms ALTER COLUMN id SET DEFAULT nextval('public.forms_id_seq'::regclass);


--
-- Name: header id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.header ALTER COLUMN id SET DEFAULT nextval('public.header_id_seq'::regclass);


--
-- Name: header_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.header_rels ALTER COLUMN id SET DEFAULT nextval('public.header_rels_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: pages_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_rels ALTER COLUMN id SET DEFAULT nextval('public.pages_rels_id_seq'::regclass);


--
-- Name: payload_folders id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_folders ALTER COLUMN id SET DEFAULT nextval('public.payload_folders_id_seq'::regclass);


--
-- Name: payload_folders_folder_type id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_folders_folder_type ALTER COLUMN id SET DEFAULT nextval('public.payload_folders_folder_type_id_seq'::regclass);


--
-- Name: payload_jobs id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_jobs ALTER COLUMN id SET DEFAULT nextval('public.payload_jobs_id_seq'::regclass);


--
-- Name: payload_kv id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_kv ALTER COLUMN id SET DEFAULT nextval('public.payload_kv_id_seq'::regclass);


--
-- Name: payload_locked_documents id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_id_seq'::regclass);


--
-- Name: payload_locked_documents_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_rels_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_migrations ALTER COLUMN id SET DEFAULT nextval('public.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_preferences ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_rels_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts_rels ALTER COLUMN id SET DEFAULT nextval('public.posts_rels_id_seq'::regclass);


--
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- Name: properties_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties_rels ALTER COLUMN id SET DEFAULT nextval('public.properties_rels_id_seq'::regclass);


--
-- Name: redirects id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.redirects ALTER COLUMN id SET DEFAULT nextval('public.redirects_id_seq'::regclass);


--
-- Name: redirects_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.redirects_rels ALTER COLUMN id SET DEFAULT nextval('public.redirects_rels_id_seq'::regclass);


--
-- Name: search id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.search ALTER COLUMN id SET DEFAULT nextval('public.search_id_seq'::regclass);


--
-- Name: search_rels id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.search_rels ALTER COLUMN id SET DEFAULT nextval('public.search_rels_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_roles id; Type: DEFAULT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.users_roles ALTER COLUMN id SET DEFAULT nextval('public.users_roles_id_seq'::regclass);


--
-- Data for Name: _blogs_v; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._blogs_v (id, parent_id, version_title, version_hero_image_id, version_excerpt, version_content, version_meta_title, version_meta_image_id, version_meta_description, version_meta_focus_keyword, version_meta_canonical_url, version_meta_meta_robots_indexing, version_meta_meta_robots_following, version_meta_meta_robots_noarchive, version_meta_meta_robots_nosnippet, version_reading_time, version_published_at, version_generate_slug, version_slug, version_updated_at, version_created_at, version__status, created_at, updated_at, latest, autosave) FROM stdin;
6	6	Real Estate vs. the Stock Market in 2025	\N	Explore the advantages of real estate vs stocks for long-term wealth. Discover why real estate can provide stability and value.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "version": 1, "children": [{"text": "Real Estate vs. the Stock Market in 2025", "type": "text", "version": 1}]}, {"type": "paragraph", "version": 1, "children": [{"text": "Explore the advantages of real estate vs stocks for long-term wealth. Discover why real estate can provide stability and value.", "type": "text", "version": 1}]}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-12-05 12:01:23+00	f	real-estate-vs-the-stock-market-in-2025	2026-08-18 08:32:16.33+00	2026-08-18 08:32:16.33+00	published	2026-08-18 08:32:16.793+00	2026-08-18 08:32:16.793+00	f	f
5	5	The Digital Frontier: Houston's $5.7 Billion Luxury Real Estate Evolution	\N	Explore how The Digital Frontier is transforming Houston's luxury real estate market with innovative technology and new buyer behaviors.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "version": 1, "children": [{"text": "The Digital Frontier: Houston's $5.7 Billion Luxury Real Estate Evolution", "type": "text", "version": 1}]}, {"type": "paragraph", "version": 1, "children": [{"text": "Explore how The Digital Frontier is transforming Houston's luxury real estate market with innovative technology and new buyer behaviors.", "type": "text", "version": 1}]}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2026-01-05 10:06:10+00	f	the-digital-frontier-houstons-5-7-billion-luxury-real-estate-evolution	2026-08-18 08:32:14.249+00	2026-08-18 08:32:14.249+00	published	2026-08-18 08:32:14.713+00	2026-08-18 08:32:14.713+00	f	f
8	8	Westhaven Estates: Houston’s Hidden Gem of Urban Luxury	\N	Explore Westhaven Estates Houston: a hidden gem offering urban luxury with privacy and access to vibrant city life.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "version": 1, "children": [{"text": "Westhaven Estates: Houston’s Hidden Gem of Urban Luxury", "type": "text", "version": 1}]}, {"type": "paragraph", "version": 1, "children": [{"text": "Explore Westhaven Estates Houston: a hidden gem offering urban luxury with privacy and access to vibrant city life.", "type": "text", "version": 1}]}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2026-02-12 00:00:00+00	f	westhaven-estates-houstons-hidden-gem-of-urban-luxury	2026-08-18 08:32:20.518+00	2026-08-18 08:32:20.518+00	published	2026-08-18 08:32:20.98+00	2026-08-18 08:32:20.98+00	f	f
11	11	The Rise of Luxury Living in Texas: Why Everyone’s Moving South?	\N	Discover why Texas is becoming the new capital of luxury living. Explore the reasons behind the move, what defines luxury in Texas, and the top hotspots for high-end homes in the Lone Star State.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "version": 1, "children": [{"text": "The Rise of Luxury Living in Texas: Why Everyone’s Moving South?", "type": "text", "version": 1}]}, {"type": "paragraph", "version": 1, "children": [{"text": "Discover why Texas is becoming the new capital of luxury living. Explore the reasons behind the move, what defines luxury in Texas, and the top hotspots for high-end homes in the Lone Star State.", "type": "text", "version": 1}]}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-08-18 00:00:00+00	f	the-rise-of-luxury-living-in-texas-why-everyones-moving-south	2026-08-18 08:32:26.746+00	2026-08-18 08:32:26.746+00	published	2026-08-18 08:32:27.207+00	2026-08-18 08:32:27.207+00	f	f
10	10	The Must-Have List for Houston’s Luxury Home Buyers	\N	Explore The Must-Have List for Houston&#039;s Luxury Home Buyers and discover what defines true luxury in the modern market.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "version": 1, "children": [{"text": "The Must-Have List for Houston’s Luxury Home Buyers", "type": "text", "version": 1}]}, {"type": "paragraph", "version": 1, "children": [{"text": "Explore The Must-Have List for Houston&#039;s Luxury Home Buyers and discover what defines true luxury in the modern market.", "type": "text", "version": 1}]}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-10-20 00:00:00+00	f	the-must-have-list-for-houstons-luxury-home-buyers	2026-08-18 08:32:24.669+00	2026-08-18 08:32:24.669+00	published	2026-08-18 08:32:25.131+00	2026-08-18 08:32:25.131+00	f	f
14	6	Real Estate vs. the Stock Market in 2025	77	Explore the advantages of real estate vs stocks for long-term wealth. Discover why real estate can provide stability and value.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Both stocks and real estate have a place in a well-balanced portfolio. But if your goal is long-term stability, inflation protection, and an asset you can experience, real estate often stands out. Here is why, supported by recent market trends.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": {"id": 61}, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A Real Asset With Real Scarcity", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home offers something stocks never will. It is tangible, limited, and supported by everyday demand.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston home values have seen meaningful growth over the past decade. One report notes that median prices in key Houston neighborhoods rose up to 86 percent between 2014 and 2023 (CultureMap Houston). Even in a rate-driven market, prices have held steady rather than falling.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Across the Houston MSA, the repeat-sales home price index rose from 404.13 to 408.65 between Q2 and Q3 of 2025 (Federal Reserve Bank of St. Louis), reflecting steady, measured growth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate often strengthens during inflation because construction costs rise, land remains limited, and buyers continue to prioritize well-located homes. Even when stocks fluctuate, properties in strong neighborhoods tend to hold their value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "An Asset That Can Earn While It Appreciates", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate carries an advantage that stocks cannot match. It can earn income while it grows.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In Houston:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Short-term rentals average roughly 59 percent occupancy based on 2024–2025 data from Airbtics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Furnished rentals perform well near major employment centers and medical districts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Corporate and executive housing maintains consistent demand driven by workforce mobility", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This rental stability continues regardless of daily market performance, because it is tied to lifestyle, relocation, and quality-of-life needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": {"id": 62}, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real Tax Advantages That Support Long-Term Planning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate offers meaningful tax advantages that traditional equities do not. Depending on your situation, you may benefit from depreciation, mortgage interest deductions, operational expense deductions, or 1031 exchange deferrals.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "While tax benefits vary for each person, property ownership generally provides more flexibility and long-term planning opportunities than stock investments.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Less Liquidity, More Stability", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate cannot be sold instantly, and that can be an advantage.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Stocks can move sharply in a single trading session. Home values shift gradually over time. This slower pace helps investors stay grounded and prevents reactive decision-making during volatile periods.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For many, real estate creates a natural path to patient, long-term wealth building.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": {"id": 63}, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A Lifestyle Asset With Legacy Value", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home offers financial value, but it also offers something deeply personal. It can be lived in, shared, and passed down.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Neighborhoods such as Woodland Heights, Heatherglen, The Heights, and Near Northside continue to attract long-term buyers because they combine character, walkable communities, thoughtful design, and everyday convenience. These are qualities financial markets cannot replicate.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A property becomes a place for gathering, unwinding, and creating memories. When an asset blends emotional and financial value, it naturally becomes part of a stable wealth-building strategy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Value That Stays With You", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home grows with you. It adapts to different seasons of life and holds its purpose across time. With its steady performance, lifestyle comfort, and proven resilience, real estate remains one of the most trusted avenues for building long-term wealth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Exploring Homes in Houston", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If real estate is part of your plans for 2025, we can help you explore neighborhoods and homes that align with your lifestyle and long-term goals.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	3	2025-12-05 12:01:23+00	f	real-estate-vs-the-stock-market-in-2025	2026-08-18 08:39:18.279+00	2026-08-18 08:32:16.33+00	published	2026-08-18 08:39:19.211+00	2026-08-18 08:39:19.211+00	f	f
13	5	The Digital Frontier: Houston's $5.7 Billion Luxury Real Estate Evolution	69	Explore how The Digital Frontier is transforming Houston's luxury real estate market with innovative technology and new buyer behaviors.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston's luxury real estate market now generates an estimated $5.7 billion in economic activity. Sales of homes priced above $1 million have jumped 65 percent year over year. However, this growth goes beyond oil wealth or corporate relocations. Instead, technology is reshaping how high-end homes are discovered, evaluated, and purchased.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": {"id": 57}, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Houston Leads the Innovation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston stands out because of who its buyers are. The city attracts energy executives, medical professionals, and aerospace engineers. These buyers already work with simulations, data modeling, and AI every day. For them, touring a $3 million home through VR feels intuitive, not experimental.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At the same time, mortgage rates averaged around 6.4 percent in late 2025. Because of this, buyers have become more selective. They rely on technology to filter out homes that do not meet their exact needs. Rather than spending weekends on unnecessary showings, they use digital tools to focus only on properties that truly fit.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Economics of Virtual Precision", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In luxury real estate, the real cost often lies in wasted time and costly mistakes. Technology directly addresses both.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time Savings:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Traditional home searches can consume over 60 hours for high-earning professionals. Virtual tours eliminate unnecessary visits and accelerate decision-making.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preventing Change Orders:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Construction change orders in luxury homes typically add 15 to 20 percent to contract values. VR allows buyers to test layouts, finishes, and even kitchen island configurations before construction begins. This foresight can save hundreds of thousands of dollars.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Market Performance:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Listings with virtual tours sell for about 9 percent more and close 31 percent faster. Meanwhile, augmented reality applications now deliver ROI figures exceeding 400 percent.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": {"id": 58}, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "High-Tech Tools Moving the Market", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Today's VR tools extend far beyond static images or basic walkthroughs. Instead, they deliver immersive, decision-driven experiences.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Buyers can now:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Test light and sound", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", seeing how sunlight moves across rooms or how acoustics perform in a home theater", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Customize instantly", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", swapping flooring, fixtures, or furniture in real time using AR", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Evaluate future value", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", as predictive analytics estimate resale appeal and long-term climate impact over decades", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Neighborhood-Specific Tech Approaches", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Luxury neighborhoods across Houston use technology differently, depending on lifestyle priorities.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Established Neighborhoods:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " In River Oaks and Tanglewood, VR highlights soaring ceilings, craftsmanship, and architectural depth that traditional photography often flattens.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Family-Centric Communities: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "In Memorial and West University Place, technology simulates daily routines. Parents test school traffic patterns, backyard visibility, and overall flow for busy schedules.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional Proximity zones:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Near the Medical Center and Museum District, agents emphasize efficiency. Virtual tools showcase optimized layouts, seamless work-from-home setups, and short commute advantages.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Renovation & Heritage Opportunities:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " In neighborhoods like the Heights, VR helps buyers visualize modern updates inside historic homes. This removes uncertainty and preserves emotional connection to original architecture.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": {"id": 59}, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The New Standard of Trust", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Technology does not remove the human element from luxury transactions. Instead, it strengthens trust and clarity. Today's top agents act as technology-enabled advisors. They guide buyers who already understand a home before stepping inside.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "After multiple virtual walkthroughs and scenario testing, buyers enter the closing phase confident and informed. That confidence reduces friction and accelerates decisions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Meanwhile, the global AR real estate market is approaching $2.6 billion by 2025. Houston continues to capture a disproportionate share of that growth. Buying a luxury home now mirrors the process of commissioning a custom jet. Every detail is evaluated, refined, and confirmed before construction begins.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ultimately, the standard has changed. A beautiful home is no longer enough. Buyers now expect the ability to step inside their vision instantly.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Your next home is not just a physical space. It is a digital experience, shaped and perfected before the foundation is poured. Through VR, every corner aligns with your expectations. When construction begins, the result feels less like a surprise and more like a promise fulfilled.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	4	2026-01-05 10:06:10+00	f	the-digital-frontier-houstons-5-7-billion-luxury-real-estate-evolution	2026-08-18 08:39:14.584+00	2026-08-18 08:32:14.249+00	published	2026-08-18 08:39:15.516+00	2026-08-18 08:39:15.516+00	f	f
12	4	Woodland Heights, Houston: The Neighborhood That Rewards the Right Buyer	67	Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d768f", "type": "upload", "value": 51, "fields": {"alt": "Oak Bayou in Woodland Heights Houston", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Woodland Heights Attracts a Specific Kind of Buyer", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The buyers who come to Woodland Heights are not looking for scale. They are not drawn by amenities lists or resort-style features. What they want is a neighbourhood with character that has already been established, where the architecture has a consistent grammar and the streets feel like they belong to the people who live on them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights was developed in the early twentieth century as a streetcar suburb, and the bones of that era are still visible. The Craftsman bungalows, the Prairie-style homes, the generous front porches — these are original, not recreations. The neighbourhood has been maintained rather than reinvented, which is increasingly rare in a city that tends to move fast.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Access Without Sacrifice", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "One of the consistent draws of Woodland Heights is how much the location offers without requiring the buyer to compromise on what surrounds them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The neighbourhood sits between ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/Heights+Mercantile", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Heights Mercantile", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " and the Buffalo Bayou trail system. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/Donovan+Park+Houston", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Donovan Park", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " is walkable from most of the neighbourhood. The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/White+Oak+Music+Hall", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "White Oak Music Hall", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " is close enough to walk to on a weekend evening. The energy of Montrose is reachable in minutes. But inside Woodland Heights itself, the streets are quiet.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d7693", "type": "upload", "value": 52, "fields": {"alt": "Houston skyline view from Woodland Heights", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Culture of the Neighbourhood", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights has an active civic association and a consistent street-level culture that is not manufactured. The neighbourhood holds a annual home tour each spring, which draws visitors who want to see the interiors of houses that rarely come to market. On weekend mornings, the park and bayou trails fill with residents who seem to actually know each other.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "There is a farmers market nearby on Saturday mornings, and the commercial strips along ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/White+Oak+Drive+Houston", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " have the kind of independent restaurants and shops that attract a particular kind of afternoon. Every December, Lights in the Heights brings visitors in from across the city, which is a reliable indicator of how deeply the neighbourhood has established its identity beyond its own residents.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Building Within a Historic Framework", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "New construction in Woodland Heights is possible, and it happens. What changed in June 2011, when the City of Houston granted the neighbourhood Historic District status, is that every exterior change now requires a Certificate of Appropriateness before work can begin. The designation did not stop construction. It shaped what construction could look like.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What the Historic District Rules Actually Mean", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.houstontx.gov/planning/HistoricPres/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Historic District designation from the City of Houston", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " brought enforceable standards covering setbacks, eave heights, scale, and how a building meets the street. New construction must align with the prevailing front setback of the block, originally established at 20 feet from the street. On a predominantly single-storey blockface, a two-storey home is expected to step back further to avoid overwhelming the scale of what surrounds it. Front porches, roof pitch, and material choices must be compatible in character with the existing homes, even where the design is clearly contemporary. The guidelines are not suggestions. A building that does not meet them does not receive approval.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Novel Signature Homes in Woodland Heights", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The residences at ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/luxury-homes-in-woodland-height/woodland-height-2/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "2434 White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " and ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/luxury-homes-in-woodland-height/woodland-height-1/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "2436 White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " were designed with the district standards as a starting point, not a constraint. From the street, each home reads as part of the block. The exterior forms take from the neighbourhood without copying it. Inside, the layouts open into spaces built around how people live today, with room to gather and room to step away from it.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d7698", "type": "upload", "value": 53, "fields": {"alt": "Luxury new construction home at 2434 White Oak Drive in Woodland Heights Houston by Novel Signature Homes", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/1001-e-7th-1-2st-houston/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "1001 E 7th 1/2 Street", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " residence, recently contracted, follows the same approach. Buyers who choose Woodland Heights are rarely looking for spectacle. They are looking for craft, proportion, and a home that feels settled from the moment they arrive.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Woodland Heights Holds Its Value", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The historic protections preserve what took a century to build. Inventory stays limited because the neighbourhood is bounded on all sides and the district rules make speculative teardowns less viable. The tree canopy along the streets is the kind of thing that cannot be accelerated. It simply took time, and time cannot be replicated in a new development.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d769a", "type": "upload", "value": 54, "fields": {"alt": "Modern luxury interior of new construction home at 1001 E 7th Street Woodland Heights Houston", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What holds the neighbourhood together beyond the physical is the people who live in it. Residents here maintain their facades, attend civic association meetings, and push back when something changes the character of a block without consideration for what surrounds it. That kind of collective investment is not something a developer can manufacture or a marketing brochure can simulate.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights has held its identity for over a century. The homes built within it carry that history forward, whether they were built in 1920 or last year.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Browse all Novel Signature Homes listings in Houston → ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "View All Properties", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	5	2026-05-05 12:45:53+00	f	woodland-heights-houston-the-neighborhood-that-rewards-the-right-buyer	2026-08-18 08:39:10.602+00	2026-08-18 08:32:12.148+00	published	2026-08-18 08:39:11.784+00	2026-08-18 08:39:11.784+00	f	f
18	10	The Must-Have List for Houston’s Luxury Home Buyers	49	Explore The Must-Have List for Houston&#039;s Luxury Home Buyers and discover what defines true luxury in the modern market.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore The Must-Have List for Houston&#039;s Luxury Home Buyers and discover what defines true luxury in the modern market.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-10-20 00:00:00+00	f	the-must-have-list-for-houstons-luxury-home-buyers	2026-08-18 08:39:32.877+00	2026-08-18 08:32:24.669+00	published	2026-08-18 08:39:33.786+00	2026-08-18 08:39:33.786+00	f	f
17	9	How Thoughtful Design and Craftsmanship Define Modern Luxury Living	48	Discover how thoughtful design and craftsmanship redefine modern luxury interiors, blending innovation, comfort, and timeless beauty.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Discover how thoughtful design and craftsmanship redefine modern luxury interiors, blending innovation, comfort, and timeless beauty.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-11-14 00:00:00+00	f	timeless-luxury-how-thoughtful-design-and-craftsmanship-are-shaping-modern-interiors	2026-08-18 08:39:29.243+00	2026-08-18 08:32:22.593+00	published	2026-08-18 08:39:30.15+00	2026-08-18 08:39:30.15+00	f	f
16	8	Westhaven Estates: Houston’s Hidden Gem of Urban Luxury	47	Explore Westhaven Estates Houston: a hidden gem offering urban luxury with privacy and access to vibrant city life.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore Westhaven Estates Houston: a hidden gem offering urban luxury with privacy and access to vibrant city life.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2026-02-12 00:00:00+00	f	westhaven-estates-houstons-hidden-gem-of-urban-luxury	2026-08-18 08:39:25.609+00	2026-08-18 08:32:20.518+00	published	2026-08-18 08:39:26.517+00	2026-08-18 08:39:26.517+00	f	f
22	6	Real Estate vs. the Stock Market in 2025	77	Explore the advantages of real estate vs stocks for long-term wealth. Discover why real estate can provide stability and value.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Both stocks and real estate have a place in a well-balanced portfolio. But if your goal is long-term stability, inflation protection, and an asset you can experience, real estate often stands out. Here is why, supported by recent market trends.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 79, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A Real Asset With Real Scarcity", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home offers something stocks never will. It is tangible, limited, and supported by everyday demand.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston home values have seen meaningful growth over the past decade. One report notes that median prices in key Houston neighborhoods rose up to 86 percent between 2014 and 2023 (CultureMap Houston). Even in a rate-driven market, prices have held steady rather than falling.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Across the Houston MSA, the repeat-sales home price index rose from 404.13 to 408.65 between Q2 and Q3 of 2025 (Federal Reserve Bank of St. Louis), reflecting steady, measured growth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate often strengthens during inflation because construction costs rise, land remains limited, and buyers continue to prioritize well-located homes. Even when stocks fluctuate, properties in strong neighborhoods tend to hold their value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "An Asset That Can Earn While It Appreciates", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate carries an advantage that stocks cannot match. It can earn income while it grows.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In Houston:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Short-term rentals average roughly 59 percent occupancy based on 2024–2025 data from Airbtics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Furnished rentals perform well near major employment centers and medical districts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Corporate and executive housing maintains consistent demand driven by workforce mobility", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This rental stability continues regardless of daily market performance, because it is tied to lifestyle, relocation, and quality-of-life needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 81, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real Tax Advantages That Support Long-Term Planning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate offers meaningful tax advantages that traditional equities do not. Depending on your situation, you may benefit from depreciation, mortgage interest deductions, operational expense deductions, or 1031 exchange deferrals.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "While tax benefits vary for each person, property ownership generally provides more flexibility and long-term planning opportunities than stock investments.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Less Liquidity, More Stability", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate cannot be sold instantly, and that can be an advantage.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Stocks can move sharply in a single trading session. Home values shift gradually over time. This slower pace helps investors stay grounded and prevents reactive decision-making during volatile periods.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For many, real estate creates a natural path to patient, long-term wealth building.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 83, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A Lifestyle Asset With Legacy Value", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home offers financial value, but it also offers something deeply personal. It can be lived in, shared, and passed down.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Neighborhoods such as Woodland Heights, Heatherglen, The Heights, and Near Northside continue to attract long-term buyers because they combine character, walkable communities, thoughtful design, and everyday convenience. These are qualities financial markets cannot replicate.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A property becomes a place for gathering, unwinding, and creating memories. When an asset blends emotional and financial value, it naturally becomes part of a stable wealth-building strategy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Value That Stays With You", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home grows with you. It adapts to different seasons of life and holds its purpose across time. With its steady performance, lifestyle comfort, and proven resilience, real estate remains one of the most trusted avenues for building long-term wealth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Exploring Homes in Houston", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If real estate is part of your plans for 2025, we can help you explore neighborhoods and homes that align with your lifestyle and long-term goals.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	3	2025-12-05 12:01:23+00	f	real-estate-vs-the-stock-market-in-2025	2026-08-18 09:12:32.735+00	2026-08-18 08:32:16.33+00	published	2026-08-18 09:12:33.665+00	2026-08-18 09:12:33.665+00	f	f
21	5	The Digital Frontier: Houston's $5.7 Billion Luxury Real Estate Evolution	69	Explore how The Digital Frontier is transforming Houston's luxury real estate market with innovative technology and new buyer behaviors.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston's luxury real estate market now generates an estimated $5.7 billion in economic activity. Sales of homes priced above $1 million have jumped 65 percent year over year. However, this growth goes beyond oil wealth or corporate relocations. Instead, technology is reshaping how high-end homes are discovered, evaluated, and purchased.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 71, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Houston Leads the Innovation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston stands out because of who its buyers are. The city attracts energy executives, medical professionals, and aerospace engineers. These buyers already work with simulations, data modeling, and AI every day. For them, touring a $3 million home through VR feels intuitive, not experimental.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At the same time, mortgage rates averaged around 6.4 percent in late 2025. Because of this, buyers have become more selective. They rely on technology to filter out homes that do not meet their exact needs. Rather than spending weekends on unnecessary showings, they use digital tools to focus only on properties that truly fit.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Economics of Virtual Precision", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In luxury real estate, the real cost often lies in wasted time and costly mistakes. Technology directly addresses both.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time Savings:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Traditional home searches can consume over 60 hours for high-earning professionals. Virtual tours eliminate unnecessary visits and accelerate decision-making.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preventing Change Orders:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Construction change orders in luxury homes typically add 15 to 20 percent to contract values. VR allows buyers to test layouts, finishes, and even kitchen island configurations before construction begins. This foresight can save hundreds of thousands of dollars.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Market Performance:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Listings with virtual tours sell for about 9 percent more and close 31 percent faster. Meanwhile, augmented reality applications now deliver ROI figures exceeding 400 percent.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": 73, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "High-Tech Tools Moving the Market", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Today's VR tools extend far beyond static images or basic walkthroughs. Instead, they deliver immersive, decision-driven experiences.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Buyers can now:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Test light and sound", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", seeing how sunlight moves across rooms or how acoustics perform in a home theater", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Customize instantly", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", swapping flooring, fixtures, or furniture in real time using AR", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Evaluate future value", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", as predictive analytics estimate resale appeal and long-term climate impact over decades", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Neighborhood-Specific Tech Approaches", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Luxury neighborhoods across Houston use technology differently, depending on lifestyle priorities.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Established Neighborhoods:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " In River Oaks and Tanglewood, VR highlights soaring ceilings, craftsmanship, and architectural depth that traditional photography often flattens.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Family-Centric Communities: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "In Memorial and West University Place, technology simulates daily routines. Parents test school traffic patterns, backyard visibility, and overall flow for busy schedules.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional Proximity zones:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Near the Medical Center and Museum District, agents emphasize efficiency. Virtual tools showcase optimized layouts, seamless work-from-home setups, and short commute advantages.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Renovation & Heritage Opportunities:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " In neighborhoods like the Heights, VR helps buyers visualize modern updates inside historic homes. This removes uncertainty and preserves emotional connection to original architecture.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": 75, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The New Standard of Trust", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Technology does not remove the human element from luxury transactions. Instead, it strengthens trust and clarity. Today's top agents act as technology-enabled advisors. They guide buyers who already understand a home before stepping inside.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "After multiple virtual walkthroughs and scenario testing, buyers enter the closing phase confident and informed. That confidence reduces friction and accelerates decisions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Meanwhile, the global AR real estate market is approaching $2.6 billion by 2025. Houston continues to capture a disproportionate share of that growth. Buying a luxury home now mirrors the process of commissioning a custom jet. Every detail is evaluated, refined, and confirmed before construction begins.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ultimately, the standard has changed. A beautiful home is no longer enough. Buyers now expect the ability to step inside their vision instantly.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Your next home is not just a physical space. It is a digital experience, shaped and perfected before the foundation is poured. Through VR, every corner aligns with your expectations. When construction begins, the result feels less like a surprise and more like a promise fulfilled.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	4	2026-01-05 10:06:10+00	f	the-digital-frontier-houstons-5-7-billion-luxury-real-estate-evolution	2026-08-18 09:12:28.836+00	2026-08-18 08:32:14.249+00	published	2026-08-18 09:12:29.766+00	2026-08-18 09:12:29.766+00	f	f
20	4	Woodland Heights, Houston: The Neighborhood That Rewards the Right Buyer	67	Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d768f", "type": "upload", "value": 59, "fields": {"alt": "Oak Bayou in Woodland Heights Houston", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Woodland Heights Attracts a Specific Kind of Buyer", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The buyers who come to Woodland Heights are not looking for scale. They are not drawn by amenities lists or resort-style features. What they want is a neighbourhood with character that has already been established, where the architecture has a consistent grammar and the streets feel like they belong to the people who live on them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights was developed in the early twentieth century as a streetcar suburb, and the bones of that era are still visible. The Craftsman bungalows, the Prairie-style homes, the generous front porches — these are original, not recreations. The neighbourhood has been maintained rather than reinvented, which is increasingly rare in a city that tends to move fast.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Access Without Sacrifice", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "One of the consistent draws of Woodland Heights is how much the location offers without requiring the buyer to compromise on what surrounds them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The neighbourhood sits between ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/Heights+Mercantile", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Heights Mercantile", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " and the Buffalo Bayou trail system. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/Donovan+Park+Houston", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Donovan Park", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " is walkable from most of the neighbourhood. The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/White+Oak+Music+Hall", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "White Oak Music Hall", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " is close enough to walk to on a weekend evening. The energy of Montrose is reachable in minutes. But inside Woodland Heights itself, the streets are quiet.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d7693", "type": "upload", "value": 61, "fields": {"alt": "Houston skyline view from Woodland Heights", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Culture of the Neighbourhood", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights has an active civic association and a consistent street-level culture that is not manufactured. The neighbourhood holds a annual home tour each spring, which draws visitors who want to see the interiors of houses that rarely come to market. On weekend mornings, the park and bayou trails fill with residents who seem to actually know each other.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "There is a farmers market nearby on Saturday mornings, and the commercial strips along ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/White+Oak+Drive+Houston", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " have the kind of independent restaurants and shops that attract a particular kind of afternoon. Every December, Lights in the Heights brings visitors in from across the city, which is a reliable indicator of how deeply the neighbourhood has established its identity beyond its own residents.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Building Within a Historic Framework", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "New construction in Woodland Heights is possible, and it happens. What changed in June 2011, when the City of Houston granted the neighbourhood Historic District status, is that every exterior change now requires a Certificate of Appropriateness before work can begin. The designation did not stop construction. It shaped what construction could look like.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What the Historic District Rules Actually Mean", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.houstontx.gov/planning/HistoricPres/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Historic District designation from the City of Houston", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " brought enforceable standards covering setbacks, eave heights, scale, and how a building meets the street. New construction must align with the prevailing front setback of the block, originally established at 20 feet from the street. On a predominantly single-storey blockface, a two-storey home is expected to step back further to avoid overwhelming the scale of what surrounds it. Front porches, roof pitch, and material choices must be compatible in character with the existing homes, even where the design is clearly contemporary. The guidelines are not suggestions. A building that does not meet them does not receive approval.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Novel Signature Homes in Woodland Heights", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The residences at ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/luxury-homes-in-woodland-height/woodland-height-2/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "2434 White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " and ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/luxury-homes-in-woodland-height/woodland-height-1/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "2436 White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " were designed with the district standards as a starting point, not a constraint. From the street, each home reads as part of the block. The exterior forms take from the neighbourhood without copying it. Inside, the layouts open into spaces built around how people live today, with room to gather and room to step away from it.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d7698", "type": "upload", "value": 63, "fields": {"alt": "Luxury new construction home at 2434 White Oak Drive in Woodland Heights Houston by Novel Signature Homes", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/1001-e-7th-1-2st-houston/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "1001 E 7th 1/2 Street", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " residence, recently contracted, follows the same approach. Buyers who choose Woodland Heights are rarely looking for spectacle. They are looking for craft, proportion, and a home that feels settled from the moment they arrive.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Woodland Heights Holds Its Value", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The historic protections preserve what took a century to build. Inventory stays limited because the neighbourhood is bounded on all sides and the district rules make speculative teardowns less viable. The tree canopy along the streets is the kind of thing that cannot be accelerated. It simply took time, and time cannot be replicated in a new development.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d769a", "type": "upload", "value": 65, "fields": {"alt": "Modern luxury interior of new construction home at 1001 E 7th Street Woodland Heights Houston", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What holds the neighbourhood together beyond the physical is the people who live in it. Residents here maintain their facades, attend civic association meetings, and push back when something changes the character of a block without consideration for what surrounds it. That kind of collective investment is not something a developer can manufacture or a marketing brochure can simulate.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights has held its identity for over a century. The homes built within it carry that history forward, whether they were built in 1920 or last year.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Browse all Novel Signature Homes listings in Houston → ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "View All Properties", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	5	2026-05-05 12:45:53+00	f	woodland-heights-houston-the-neighborhood-that-rewards-the-right-buyer	2026-08-18 09:12:24.612+00	2026-08-18 08:32:12.148+00	published	2026-08-18 09:12:25.792+00	2026-08-18 09:12:25.792+00	f	f
4	4	Woodland Heights, Houston: The Neighborhood That Rewards the Right Buyer	\N	Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "version": 1, "children": [{"text": "Woodland Heights, Houston: The Neighborhood That Rewards the Right Buyer", "type": "text", "version": 1}]}, {"type": "paragraph", "version": 1, "children": [{"text": "Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.", "type": "text", "version": 1}]}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2026-05-05 12:45:53+00	f	woodland-heights-houston-the-neighborhood-that-rewards-the-right-buyer	2026-08-18 08:32:12.15+00	2026-08-18 08:32:12.148+00	published	2026-08-18 08:32:12.616+00	2026-08-18 08:32:12.616+00	f	f
28	11	The Rise of Luxury Living in Texas: Why Everyone’s Moving South?	50	Discover why Texas is becoming the new capital of luxury living. Explore the reasons behind the move, what defines luxury in Texas, and the top hotspots for high-end homes in the Lone Star State.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Discover why Texas is becoming the new capital of luxury living. Explore the reasons behind the move, what defines luxury in Texas, and the top hotspots for high-end homes in the Lone Star State.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-08-18 00:00:00+00	f	the-rise-of-luxury-living-in-texas-why-everyones-moving-south	2026-08-18 09:21:03.441+00	2026-08-18 08:32:26.746+00	published	2026-08-18 09:21:04.579+00	2026-08-18 09:21:04.579+00	t	f
26	10	The Must-Have List for Houston’s Luxury Home Buyers	49	Explore The Must-Have List for Houston&#039;s Luxury Home Buyers and discover what defines true luxury in the modern market.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore The Must-Have List for Houston&#039;s Luxury Home Buyers and discover what defines true luxury in the modern market.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-10-20 00:00:00+00	f	the-must-have-list-for-houstons-luxury-home-buyers	2026-08-18 09:12:48.476+00	2026-08-18 08:32:24.669+00	published	2026-08-18 09:12:49.378+00	2026-08-18 09:12:49.378+00	f	f
25	9	How Thoughtful Design and Craftsmanship Define Modern Luxury Living	48	Discover how thoughtful design and craftsmanship redefine modern luxury interiors, blending innovation, comfort, and timeless beauty.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Discover how thoughtful design and craftsmanship redefine modern luxury interiors, blending innovation, comfort, and timeless beauty.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-11-14 00:00:00+00	f	timeless-luxury-how-thoughtful-design-and-craftsmanship-are-shaping-modern-interiors	2026-08-18 09:12:44.561+00	2026-08-18 08:32:22.593+00	published	2026-08-18 09:12:45.464+00	2026-08-18 09:12:45.464+00	f	f
24	8	Westhaven Estates: Houston’s Hidden Gem of Urban Luxury	47	Explore Westhaven Estates Houston: a hidden gem offering urban luxury with privacy and access to vibrant city life.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore Westhaven Estates Houston: a hidden gem offering urban luxury with privacy and access to vibrant city life.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2026-02-12 00:00:00+00	f	westhaven-estates-houstons-hidden-gem-of-urban-luxury	2026-08-18 09:12:40.711+00	2026-08-18 08:32:20.518+00	published	2026-08-18 09:12:41.612+00	2026-08-18 09:12:41.612+00	f	f
23	7	Why Does 2025 Feel Like the Right Time to Buy Luxury Real Estate in Texas	85	Why Texas Real Estate Remains a Smart Investment in 2025 — explore the growth, lifestyle, and opportunity driving luxury home sales across Houston, Austin, and Dallas.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "upload", "value": 87, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I'll be honest, if you'd asked me a few years ago where the strongest luxury real estate markets would be in 2025, I probably wouldn't have predicted Texas would be this hot. But here we are. Not only has the market held up, it's thriving in ways that are catching a lot of people's attention.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you've been paying any attention to housing trends lately, you've probably noticed luxury homes around here aren't just keeping their value – they're steadily going up, even when other parts of the country are starting to cool off. And there are some pretty good reasons for it.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It's Not Just a Trend, It's a Shift", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Texas has always marched to the beat of its own drum. No state income tax, plenty of space, growing job markets, and a lifestyle people from both coasts secretly envy. But what's happening right now isn't just a momentary boom. It feels like a long-term shift in where wealth and opportunity are moving.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Big names like Tesla and Oracle made headlines when they moved operations here, but what's more interesting is the ripple effect it's created. Smaller companies, investors, and families are following. And they're not looking for fixer-uppers – they want beautiful homes, large lots, walkable neighborhoods, and access to good schools and city amenities. Texas delivers that in spades.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 89, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "So, Why Now? Why 2025?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Good question. It's not like Texas is a secret anymore. People have been relocating here for years. But a few things are happening right now that make this year feel different.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For one, prices in other big luxury markets like California and New York have either plateaued or dipped, while Texas is still seeing healthy appreciation. Not crazy, unsustainable jumps – just steady, reliable growth. And honestly, that's exactly what most buyers and investors are looking for these days.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Then there's the work-from-anywhere culture that, despite a few companies trying to reverse it, isn't going away. More people have the freedom to live where they want, and when you can pick between a cramped $4 million house in LA or a gorgeous, brand-new $2.5 million home on an acre lot in Austin… the choice gets pretty easy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "And yes – the no state income tax thing still matters, probably more than ever as other states raise taxes to cover budget gaps.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Where People Are Buying", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The usual suspects are still leading the way:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston is more than just an energy town now. Healthcare, aerospace, and tech are booming too. Neighborhoods like River Oaks, Memorial Villages, and West Haven Estates are packed with big, beautiful homes and plenty of character.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Austin remains one of the fastest-growing cities in the country, especially for younger, high-earning buyers. Places like Westlake Hills, Tarrytown, and Barton Creek are loaded with new builds and remodeled classics, and homes there rarely sit on the market long.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dallas is attracting both longtime locals upgrading and out-of-state buyers moving in. Preston Hollow, Highland Park, and University Park have always been prime spots, and that hasn't changed.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": 91, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Investment Angle", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you're reading this purely from an investment perspective, here's the simple version: luxury homes in Texas have held up extremely well compared to other markets. Prices are up, inventory is tight, and demand hasn't cooled. Even when the broader market gets shaky, high-end homes in growth markets like these tend to weather the storm better than most.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "And unlike crypto or stocks, you can live in this investment, host a dinner party in it, or rent it out as a second home. Not a bad deal.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore Texas Luxury Living Today", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I'm not here to pitch you on a specific property. I just think if you've been on the fence about making a move — whether for yourself, your family, or your portfolio — 2025 is a good time to take a serious look at Texas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The market's strong, the lifestyle's unbeatable, and opportunities like this don't stay on the table forever.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you're curious what's out there or just want to bounce around some ideas, drop me a message. Always happy to chat about houses, neighborhoods, or what's really happening behind the headlines.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	4	2025-09-05 03:12:03+00	f	texas-real-estate-investment-2025	2026-08-18 09:12:36.775+00	2026-08-18 08:32:18.408+00	published	2026-08-18 09:12:37.703+00	2026-08-18 09:12:37.703+00	f	f
15	7	Why Does 2025 Feel Like the Right Time to Buy Luxury Real Estate in Texas	85	Why Texas Real Estate Remains a Smart Investment in 2025 — explore the growth, lifestyle, and opportunity driving luxury home sales across Houston, Austin, and Dallas.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "upload", "value": {"id": 65}, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I'll be honest, if you'd asked me a few years ago where the strongest luxury real estate markets would be in 2025, I probably wouldn't have predicted Texas would be this hot. But here we are. Not only has the market held up, it's thriving in ways that are catching a lot of people's attention.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you've been paying any attention to housing trends lately, you've probably noticed luxury homes around here aren't just keeping their value – they're steadily going up, even when other parts of the country are starting to cool off. And there are some pretty good reasons for it.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It's Not Just a Trend, It's a Shift", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Texas has always marched to the beat of its own drum. No state income tax, plenty of space, growing job markets, and a lifestyle people from both coasts secretly envy. But what's happening right now isn't just a momentary boom. It feels like a long-term shift in where wealth and opportunity are moving.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Big names like Tesla and Oracle made headlines when they moved operations here, but what's more interesting is the ripple effect it's created. Smaller companies, investors, and families are following. And they're not looking for fixer-uppers – they want beautiful homes, large lots, walkable neighborhoods, and access to good schools and city amenities. Texas delivers that in spades.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": {"id": 66}, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "So, Why Now? Why 2025?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Good question. It's not like Texas is a secret anymore. People have been relocating here for years. But a few things are happening right now that make this year feel different.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For one, prices in other big luxury markets like California and New York have either plateaued or dipped, while Texas is still seeing healthy appreciation. Not crazy, unsustainable jumps – just steady, reliable growth. And honestly, that's exactly what most buyers and investors are looking for these days.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Then there's the work-from-anywhere culture that, despite a few companies trying to reverse it, isn't going away. More people have the freedom to live where they want, and when you can pick between a cramped $4 million house in LA or a gorgeous, brand-new $2.5 million home on an acre lot in Austin… the choice gets pretty easy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "And yes – the no state income tax thing still matters, probably more than ever as other states raise taxes to cover budget gaps.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Where People Are Buying", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The usual suspects are still leading the way:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston is more than just an energy town now. Healthcare, aerospace, and tech are booming too. Neighborhoods like River Oaks, Memorial Villages, and West Haven Estates are packed with big, beautiful homes and plenty of character.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Austin remains one of the fastest-growing cities in the country, especially for younger, high-earning buyers. Places like Westlake Hills, Tarrytown, and Barton Creek are loaded with new builds and remodeled classics, and homes there rarely sit on the market long.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dallas is attracting both longtime locals upgrading and out-of-state buyers moving in. Preston Hollow, Highland Park, and University Park have always been prime spots, and that hasn't changed.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": {"id": 67}, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Investment Angle", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you're reading this purely from an investment perspective, here's the simple version: luxury homes in Texas have held up extremely well compared to other markets. Prices are up, inventory is tight, and demand hasn't cooled. Even when the broader market gets shaky, high-end homes in growth markets like these tend to weather the storm better than most.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "And unlike crypto or stocks, you can live in this investment, host a dinner party in it, or rent it out as a second home. Not a bad deal.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore Texas Luxury Living Today", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I'm not here to pitch you on a specific property. I just think if you've been on the fence about making a move — whether for yourself, your family, or your portfolio — 2025 is a good time to take a serious look at Texas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The market's strong, the lifestyle's unbeatable, and opportunities like this don't stay on the table forever.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you're curious what's out there or just want to bounce around some ideas, drop me a message. Always happy to chat about houses, neighborhoods, or what's really happening behind the headlines.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	4	2025-09-05 03:12:03+00	f	texas-real-estate-investment-2025	2026-08-18 08:39:21.946+00	2026-08-18 08:32:18.408+00	published	2026-08-18 08:39:22.879+00	2026-08-18 08:39:22.879+00	f	f
35	4	Woodland Heights, Houston: The Neighborhood That Rewards the Right Buyer	67	Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d768f", "type": "upload", "value": 59, "fields": {"alt": "Oak Bayou in Woodland Heights Houston", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Woodland Heights Attracts a Specific Kind of Buyer", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The buyers who come to Woodland Heights are not looking for scale. They are not drawn by amenities lists or resort-style features. What they want is a neighbourhood with character that has already been established, where the architecture has a consistent grammar and the streets feel like they belong to the people who live on them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights was developed in the early twentieth century as a streetcar suburb, and the bones of that era are still visible. The Craftsman bungalows, the Prairie-style homes, the generous front porches — these are original, not recreations. The neighbourhood has been maintained rather than reinvented, which is increasingly rare in a city that tends to move fast.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Access Without Sacrifice", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "One of the consistent draws of Woodland Heights is how much the location offers without requiring the buyer to compromise on what surrounds them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The neighbourhood sits between ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/Heights+Mercantile", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Heights Mercantile", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " and the Buffalo Bayou trail system. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/Donovan+Park+Houston", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Donovan Park", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " is walkable from most of the neighbourhood. The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/White+Oak+Music+Hall", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "White Oak Music Hall", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " is close enough to walk to on a weekend evening. The energy of Montrose is reachable in minutes. But inside Woodland Heights itself, the streets are quiet.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d7693", "type": "upload", "value": 61, "fields": {"alt": "Houston skyline view from Woodland Heights", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Culture of the Neighbourhood", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights has an active civic association and a consistent street-level culture that is not manufactured. The neighbourhood holds a annual home tour each spring, which draws visitors who want to see the interiors of houses that rarely come to market. On weekend mornings, the park and bayou trails fill with residents who seem to actually know each other.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "There is a farmers market nearby on Saturday mornings, and the commercial strips along ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/White+Oak+Drive+Houston", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " have the kind of independent restaurants and shops that attract a particular kind of afternoon. Every December, Lights in the Heights brings visitors in from across the city, which is a reliable indicator of how deeply the neighbourhood has established its identity beyond its own residents.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Building Within a Historic Framework", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "New construction in Woodland Heights is possible, and it happens. What changed in June 2011, when the City of Houston granted the neighbourhood Historic District status, is that every exterior change now requires a Certificate of Appropriateness before work can begin. The designation did not stop construction. It shaped what construction could look like.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What the Historic District Rules Actually Mean", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.houstontx.gov/planning/HistoricPres/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Historic District designation from the City of Houston", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " brought enforceable standards covering setbacks, eave heights, scale, and how a building meets the street. New construction must align with the prevailing front setback of the block, originally established at 20 feet from the street. On a predominantly single-storey blockface, a two-storey home is expected to step back further to avoid overwhelming the scale of what surrounds it. Front porches, roof pitch, and material choices must be compatible in character with the existing homes, even where the design is clearly contemporary. The guidelines are not suggestions. A building that does not meet them does not receive approval.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Novel Signature Homes in Woodland Heights", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The residences at ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/luxury-homes-in-woodland-height/woodland-height-2/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "2434 White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " and ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/luxury-homes-in-woodland-height/woodland-height-1/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "2436 White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " were designed with the district standards as a starting point, not a constraint. From the street, each home reads as part of the block. The exterior forms take from the neighbourhood without copying it. Inside, the layouts open into spaces built around how people live today, with room to gather and room to step away from it.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d7698", "type": "upload", "value": 63, "fields": {"alt": "Luxury new construction home at 2434 White Oak Drive in Woodland Heights Houston by Novel Signature Homes", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/1001-e-7th-1-2st-houston/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "1001 E 7th 1/2 Street", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " residence, recently contracted, follows the same approach. Buyers who choose Woodland Heights are rarely looking for spectacle. They are looking for craft, proportion, and a home that feels settled from the moment they arrive.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Woodland Heights Holds Its Value", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The historic protections preserve what took a century to build. Inventory stays limited because the neighbourhood is bounded on all sides and the district rules make speculative teardowns less viable. The tree canopy along the streets is the kind of thing that cannot be accelerated. It simply took time, and time cannot be replicated in a new development.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d769a", "type": "upload", "value": 65, "fields": {"alt": "Modern luxury interior of new construction home at 1001 E 7th Street Woodland Heights Houston", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What holds the neighbourhood together beyond the physical is the people who live in it. Residents here maintain their facades, attend civic association meetings, and push back when something changes the character of a block without consideration for what surrounds it. That kind of collective investment is not something a developer can manufacture or a marketing brochure can simulate.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights has held its identity for over a century. The homes built within it carry that history forward, whether they were built in 1920 or last year.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Browse all Novel Signature Homes listings in Houston → ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "View All Properties", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	5	2026-05-05 12:45:53+00	f	woodland-heights-houston-the-neighborhood-that-rewards-the-right-buyer	2026-08-18 09:21:30.816+00	2026-08-18 08:32:12.148+00	published	2026-08-18 09:21:32.022+00	2026-08-18 09:21:32.022+00	t	f
19	11	The Rise of Luxury Living in Texas: Why Everyone’s Moving South?	50	Discover why Texas is becoming the new capital of luxury living. Explore the reasons behind the move, what defines luxury in Texas, and the top hotspots for high-end homes in the Lone Star State.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Discover why Texas is becoming the new capital of luxury living. Explore the reasons behind the move, what defines luxury in Texas, and the top hotspots for high-end homes in the Lone Star State.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-08-18 00:00:00+00	f	the-rise-of-luxury-living-in-texas-why-everyones-moving-south	2026-08-18 08:39:36.605+00	2026-08-18 08:32:26.746+00	published	2026-08-18 08:39:37.511+00	2026-08-18 08:39:37.511+00	f	f
27	11	The Rise of Luxury Living in Texas: Why Everyone’s Moving South?	50	Discover why Texas is becoming the new capital of luxury living. Explore the reasons behind the move, what defines luxury in Texas, and the top hotspots for high-end homes in the Lone Star State.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Discover why Texas is becoming the new capital of luxury living. Explore the reasons behind the move, what defines luxury in Texas, and the top hotspots for high-end homes in the Lone Star State.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-08-18 00:00:00+00	f	the-rise-of-luxury-living-in-texas-why-everyones-moving-south	2026-08-18 09:12:52.324+00	2026-08-18 08:32:26.746+00	published	2026-08-18 09:12:53.23+00	2026-08-18 09:12:53.23+00	f	f
29	10	The Must-Have List for Houston’s Luxury Home Buyers	49	Explore The Must-Have List for Houston&#039;s Luxury Home Buyers and discover what defines true luxury in the modern market.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore The Must-Have List for Houston&#039;s Luxury Home Buyers and discover what defines true luxury in the modern market.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-10-20 00:00:00+00	f	the-must-have-list-for-houstons-luxury-home-buyers	2026-08-18 09:21:07.304+00	2026-08-18 08:32:24.669+00	published	2026-08-18 09:21:08.434+00	2026-08-18 09:21:08.434+00	t	f
30	9	How Thoughtful Design and Craftsmanship Define Modern Luxury Living	48	Discover how thoughtful design and craftsmanship redefine modern luxury interiors, blending innovation, comfort, and timeless beauty.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Discover how thoughtful design and craftsmanship redefine modern luxury interiors, blending innovation, comfort, and timeless beauty.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-11-14 00:00:00+00	f	timeless-luxury-how-thoughtful-design-and-craftsmanship-are-shaping-modern-interiors	2026-08-18 09:21:11.15+00	2026-08-18 08:32:22.593+00	published	2026-08-18 09:21:12.28+00	2026-08-18 09:21:12.28+00	t	f
9	9	How Thoughtful Design and Craftsmanship Define Modern Luxury Living	\N	Discover how thoughtful design and craftsmanship redefine modern luxury interiors, blending innovation, comfort, and timeless beauty.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "version": 1, "children": [{"text": "How Thoughtful Design and Craftsmanship Define Modern Luxury Living", "type": "text", "version": 1}]}, {"type": "paragraph", "version": 1, "children": [{"text": "Discover how thoughtful design and craftsmanship redefine modern luxury interiors, blending innovation, comfort, and timeless beauty.", "type": "text", "version": 1}]}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-11-14 00:00:00+00	f	timeless-luxury-how-thoughtful-design-and-craftsmanship-are-shaping-modern-interiors	2026-08-18 08:32:22.593+00	2026-08-18 08:32:22.593+00	published	2026-08-18 08:32:23.054+00	2026-08-18 08:32:23.054+00	f	f
31	8	Westhaven Estates: Houston’s Hidden Gem of Urban Luxury	47	Explore Westhaven Estates Houston: a hidden gem offering urban luxury with privacy and access to vibrant city life.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore Westhaven Estates Houston: a hidden gem offering urban luxury with privacy and access to vibrant city life.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2026-02-12 00:00:00+00	f	westhaven-estates-houstons-hidden-gem-of-urban-luxury	2026-08-18 09:21:15.003+00	2026-08-18 08:32:20.518+00	published	2026-08-18 09:21:16.133+00	2026-08-18 09:21:16.133+00	t	f
32	7	Why Does 2025 Feel Like the Right Time to Buy Luxury Real Estate in Texas	85	Why Texas Real Estate Remains a Smart Investment in 2025 — explore the growth, lifestyle, and opportunity driving luxury home sales across Houston, Austin, and Dallas.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "upload", "value": 87, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I'll be honest, if you'd asked me a few years ago where the strongest luxury real estate markets would be in 2025, I probably wouldn't have predicted Texas would be this hot. But here we are. Not only has the market held up, it's thriving in ways that are catching a lot of people's attention.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you've been paying any attention to housing trends lately, you've probably noticed luxury homes around here aren't just keeping their value – they're steadily going up, even when other parts of the country are starting to cool off. And there are some pretty good reasons for it.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It's Not Just a Trend, It's a Shift", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Texas has always marched to the beat of its own drum. No state income tax, plenty of space, growing job markets, and a lifestyle people from both coasts secretly envy. But what's happening right now isn't just a momentary boom. It feels like a long-term shift in where wealth and opportunity are moving.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Big names like Tesla and Oracle made headlines when they moved operations here, but what's more interesting is the ripple effect it's created. Smaller companies, investors, and families are following. And they're not looking for fixer-uppers – they want beautiful homes, large lots, walkable neighborhoods, and access to good schools and city amenities. Texas delivers that in spades.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 89, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "So, Why Now? Why 2025?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Good question. It's not like Texas is a secret anymore. People have been relocating here for years. But a few things are happening right now that make this year feel different.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For one, prices in other big luxury markets like California and New York have either plateaued or dipped, while Texas is still seeing healthy appreciation. Not crazy, unsustainable jumps – just steady, reliable growth. And honestly, that's exactly what most buyers and investors are looking for these days.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Then there's the work-from-anywhere culture that, despite a few companies trying to reverse it, isn't going away. More people have the freedom to live where they want, and when you can pick between a cramped $4 million house in LA or a gorgeous, brand-new $2.5 million home on an acre lot in Austin… the choice gets pretty easy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "And yes – the no state income tax thing still matters, probably more than ever as other states raise taxes to cover budget gaps.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Where People Are Buying", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The usual suspects are still leading the way:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston is more than just an energy town now. Healthcare, aerospace, and tech are booming too. Neighborhoods like River Oaks, Memorial Villages, and West Haven Estates are packed with big, beautiful homes and plenty of character.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Austin remains one of the fastest-growing cities in the country, especially for younger, high-earning buyers. Places like Westlake Hills, Tarrytown, and Barton Creek are loaded with new builds and remodeled classics, and homes there rarely sit on the market long.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dallas is attracting both longtime locals upgrading and out-of-state buyers moving in. Preston Hollow, Highland Park, and University Park have always been prime spots, and that hasn't changed.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": 91, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Investment Angle", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you're reading this purely from an investment perspective, here's the simple version: luxury homes in Texas have held up extremely well compared to other markets. Prices are up, inventory is tight, and demand hasn't cooled. Even when the broader market gets shaky, high-end homes in growth markets like these tend to weather the storm better than most.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "And unlike crypto or stocks, you can live in this investment, host a dinner party in it, or rent it out as a second home. Not a bad deal.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore Texas Luxury Living Today", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I'm not here to pitch you on a specific property. I just think if you've been on the fence about making a move — whether for yourself, your family, or your portfolio — 2025 is a good time to take a serious look at Texas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The market's strong, the lifestyle's unbeatable, and opportunities like this don't stay on the table forever.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you're curious what's out there or just want to bounce around some ideas, drop me a message. Always happy to chat about houses, neighborhoods, or what's really happening behind the headlines.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	4	2025-09-05 03:12:03+00	f	texas-real-estate-investment-2025	2026-08-18 09:21:18.902+00	2026-08-18 08:32:18.408+00	published	2026-08-18 09:21:20.259+00	2026-08-18 09:21:20.259+00	t	f
7	7	Why Does 2025 Feel Like the Right Time to Buy Luxury Real Estate in Texas	\N	Why Texas Real Estate Remains a Smart Investment in 2025 — explore the growth, lifestyle, and opportunity driving luxury home sales across Houston, Austin, and Dallas.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "version": 1, "children": [{"text": "Why Does 2025 Feel Like the Right Time to Buy Luxury Real Estate in Texas", "type": "text", "version": 1}]}, {"type": "paragraph", "version": 1, "children": [{"text": "Why Texas Real Estate Remains a Smart Investment in 2025 — explore the growth, lifestyle, and opportunity driving luxury home sales across Houston, Austin, and Dallas.", "type": "text", "version": 1}]}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-09-05 03:12:03+00	f	texas-real-estate-investment-2025	2026-08-18 08:32:18.408+00	2026-08-18 08:32:18.408+00	published	2026-08-18 08:32:18.902+00	2026-08-18 08:32:18.902+00	f	f
33	6	Real Estate vs. the Stock Market in 2025	77	Explore the advantages of real estate vs stocks for long-term wealth. Discover why real estate can provide stability and value.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Both stocks and real estate have a place in a well-balanced portfolio. But if your goal is long-term stability, inflation protection, and an asset you can experience, real estate often stands out. Here is why, supported by recent market trends.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 79, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A Real Asset With Real Scarcity", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home offers something stocks never will. It is tangible, limited, and supported by everyday demand.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston home values have seen meaningful growth over the past decade. One report notes that median prices in key Houston neighborhoods rose up to 86 percent between 2014 and 2023 (CultureMap Houston). Even in a rate-driven market, prices have held steady rather than falling.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Across the Houston MSA, the repeat-sales home price index rose from 404.13 to 408.65 between Q2 and Q3 of 2025 (Federal Reserve Bank of St. Louis), reflecting steady, measured growth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate often strengthens during inflation because construction costs rise, land remains limited, and buyers continue to prioritize well-located homes. Even when stocks fluctuate, properties in strong neighborhoods tend to hold their value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "An Asset That Can Earn While It Appreciates", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate carries an advantage that stocks cannot match. It can earn income while it grows.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In Houston:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Short-term rentals average roughly 59 percent occupancy based on 2024–2025 data from Airbtics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Furnished rentals perform well near major employment centers and medical districts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Corporate and executive housing maintains consistent demand driven by workforce mobility", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This rental stability continues regardless of daily market performance, because it is tied to lifestyle, relocation, and quality-of-life needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 81, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real Tax Advantages That Support Long-Term Planning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate offers meaningful tax advantages that traditional equities do not. Depending on your situation, you may benefit from depreciation, mortgage interest deductions, operational expense deductions, or 1031 exchange deferrals.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "While tax benefits vary for each person, property ownership generally provides more flexibility and long-term planning opportunities than stock investments.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Less Liquidity, More Stability", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate cannot be sold instantly, and that can be an advantage.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Stocks can move sharply in a single trading session. Home values shift gradually over time. This slower pace helps investors stay grounded and prevents reactive decision-making during volatile periods.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For many, real estate creates a natural path to patient, long-term wealth building.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 83, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A Lifestyle Asset With Legacy Value", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home offers financial value, but it also offers something deeply personal. It can be lived in, shared, and passed down.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Neighborhoods such as Woodland Heights, Heatherglen, The Heights, and Near Northside continue to attract long-term buyers because they combine character, walkable communities, thoughtful design, and everyday convenience. These are qualities financial markets cannot replicate.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A property becomes a place for gathering, unwinding, and creating memories. When an asset blends emotional and financial value, it naturally becomes part of a stable wealth-building strategy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Value That Stays With You", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home grows with you. It adapts to different seasons of life and holds its purpose across time. With its steady performance, lifestyle comfort, and proven resilience, real estate remains one of the most trusted avenues for building long-term wealth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Exploring Homes in Houston", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If real estate is part of your plans for 2025, we can help you explore neighborhoods and homes that align with your lifestyle and long-term goals.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	3	2025-12-05 12:01:23+00	f	real-estate-vs-the-stock-market-in-2025	2026-08-18 09:21:22.979+00	2026-08-18 08:32:16.33+00	published	2026-08-18 09:21:24.134+00	2026-08-18 09:21:24.134+00	t	f
34	5	The Digital Frontier: Houston's $5.7 Billion Luxury Real Estate Evolution	69	Explore how The Digital Frontier is transforming Houston's luxury real estate market with innovative technology and new buyer behaviors.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston's luxury real estate market now generates an estimated $5.7 billion in economic activity. Sales of homes priced above $1 million have jumped 65 percent year over year. However, this growth goes beyond oil wealth or corporate relocations. Instead, technology is reshaping how high-end homes are discovered, evaluated, and purchased.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 71, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Houston Leads the Innovation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston stands out because of who its buyers are. The city attracts energy executives, medical professionals, and aerospace engineers. These buyers already work with simulations, data modeling, and AI every day. For them, touring a $3 million home through VR feels intuitive, not experimental.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At the same time, mortgage rates averaged around 6.4 percent in late 2025. Because of this, buyers have become more selective. They rely on technology to filter out homes that do not meet their exact needs. Rather than spending weekends on unnecessary showings, they use digital tools to focus only on properties that truly fit.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Economics of Virtual Precision", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In luxury real estate, the real cost often lies in wasted time and costly mistakes. Technology directly addresses both.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time Savings:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Traditional home searches can consume over 60 hours for high-earning professionals. Virtual tours eliminate unnecessary visits and accelerate decision-making.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preventing Change Orders:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Construction change orders in luxury homes typically add 15 to 20 percent to contract values. VR allows buyers to test layouts, finishes, and even kitchen island configurations before construction begins. This foresight can save hundreds of thousands of dollars.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Market Performance:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Listings with virtual tours sell for about 9 percent more and close 31 percent faster. Meanwhile, augmented reality applications now deliver ROI figures exceeding 400 percent.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": 73, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "High-Tech Tools Moving the Market", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Today's VR tools extend far beyond static images or basic walkthroughs. Instead, they deliver immersive, decision-driven experiences.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Buyers can now:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Test light and sound", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", seeing how sunlight moves across rooms or how acoustics perform in a home theater", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Customize instantly", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", swapping flooring, fixtures, or furniture in real time using AR", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Evaluate future value", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", as predictive analytics estimate resale appeal and long-term climate impact over decades", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Neighborhood-Specific Tech Approaches", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Luxury neighborhoods across Houston use technology differently, depending on lifestyle priorities.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Established Neighborhoods:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " In River Oaks and Tanglewood, VR highlights soaring ceilings, craftsmanship, and architectural depth that traditional photography often flattens.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Family-Centric Communities: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "In Memorial and West University Place, technology simulates daily routines. Parents test school traffic patterns, backyard visibility, and overall flow for busy schedules.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional Proximity zones:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Near the Medical Center and Museum District, agents emphasize efficiency. Virtual tools showcase optimized layouts, seamless work-from-home setups, and short commute advantages.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Renovation & Heritage Opportunities:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " In neighborhoods like the Heights, VR helps buyers visualize modern updates inside historic homes. This removes uncertainty and preserves emotional connection to original architecture.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": 75, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The New Standard of Trust", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Technology does not remove the human element from luxury transactions. Instead, it strengthens trust and clarity. Today's top agents act as technology-enabled advisors. They guide buyers who already understand a home before stepping inside.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "After multiple virtual walkthroughs and scenario testing, buyers enter the closing phase confident and informed. That confidence reduces friction and accelerates decisions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Meanwhile, the global AR real estate market is approaching $2.6 billion by 2025. Houston continues to capture a disproportionate share of that growth. Buying a luxury home now mirrors the process of commissioning a custom jet. Every detail is evaluated, refined, and confirmed before construction begins.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ultimately, the standard has changed. A beautiful home is no longer enough. Buyers now expect the ability to step inside their vision instantly.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Your next home is not just a physical space. It is a digital experience, shaped and perfected before the foundation is poured. Through VR, every corner aligns with your expectations. When construction begins, the result feels less like a surprise and more like a promise fulfilled.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	4	2026-01-05 10:06:10+00	f	the-digital-frontier-houstons-5-7-billion-luxury-real-estate-evolution	2026-08-18 09:21:26.879+00	2026-08-18 08:32:14.249+00	published	2026-08-18 09:21:28.038+00	2026-08-18 09:21:28.038+00	t	f
\.


--
-- Data for Name: _blogs_v_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._blogs_v_rels (id, "order", parent_id, path, users_id, categories_id, blogs_id) FROM stdin;
7	1	28	version.categories	\N	16	\N
8	1	29	version.categories	\N	16	\N
9	1	30	version.categories	\N	15	\N
10	1	31	version.categories	\N	14	\N
11	1	32	version.categories	\N	13	\N
12	1	33	version.categories	\N	13	\N
13	1	34	version.categories	\N	13	\N
14	1	35	version.categories	\N	17	\N
\.


--
-- Data for Name: _blogs_v_version_populated_authors; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._blogs_v_version_populated_authors (_order, _parent_id, id, _uuid, name) FROM stdin;
\.


--
-- Data for Name: _pages_v; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v (id, parent_id, version_title, version_home_hero_title, version_home_hero_description, version_home_hero_video_url, version_home_hero_button_text, version_home_hero_button_link, version_timeless_comfort_title, version_timeless_comfort_description, version_timeless_comfort_button_text, version_timeless_comfort_button_link, version_vr_tour_title, version_vr_tour_description, version_vr_tour_banner_image, version_vr_tour_button_text, version_vr_tour_button_link, version_concierge_title, version_concierge_description, version_concierge_image, version_concierge_button_text, version_concierge_button_link, version_newest_residences_title, version_newest_residences_description, version_newest_residences_youtube_url, version_newest_residences_subscribe_link, version_home_contact_heading, version_home_contact_selected_form_id, version_properties_page_header_title, version_properties_page_header_description, version_properties_page_header_section_heading, version_concierge_page_hero_title, version_concierge_page_hero_description, version_concierge_page_hero_banner_image, version_concierge_page_services_heading, version_concierge_page_how_it_works_heading, version_concierge_page_how_it_works_image, version_concierge_page_why_love_it_heading, version_concierge_page_contact_form_heading, version_concierge_page_contact_form_subheading, version_concierge_page_contact_form_selected_form_id, version_about_page_story_title, version_about_page_banner_image, version_about_page_paragraph1, version_about_page_paragraph2, version_about_page_vision_title, version_about_page_vision_text, version_about_page_mission_title, version_about_page_mission_text, version_about_page_values_title, version_about_page_values_text, version_about_page_why_heading_prefix, version_about_page_why_heading_main, version_about_page_why_subtitle, version_about_page_why_image, version_about_page_feature1, version_about_page_feature2, version_about_page_feature3, version_about_page_feature4, version_about_page_contact_heading, version_hero_type, version_hero_rich_text, version_hero_media_id, version_privacy_policy_page_title, version_privacy_policy_page_effective_date, version_terms_and_conditions_page_title, version_terms_and_conditions_page_subheading, version_terms_and_conditions_page_effective_date, version_buy_a_home_page_title, version_buy_a_home_page_subheading, version_buy_a_home_page_description, version_buy_a_home_page_image_id, version_buy_a_home_page_image_url, version_buy_a_home_page_additional_content, version_buy_a_home_page_selected_form_id, version_buy_a_home_page_form_action, version_buy_a_home_page_button_text, version_other_inquiries_page_title, version_other_inquiries_page_subheading, version_other_inquiries_page_description, version_other_inquiries_page_image_id, version_other_inquiries_page_image_url, version_other_inquiries_page_additional_content, version_other_inquiries_page_selected_form_id, version_other_inquiries_page_form_action, version_other_inquiries_page_button_text, version_trade_inquiry_page_title, version_trade_inquiry_page_subheading, version_trade_inquiry_page_description, version_trade_inquiry_page_image_id, version_trade_inquiry_page_image_url, version_trade_inquiry_page_additional_content, version_trade_inquiry_page_selected_form_id, version_trade_inquiry_page_form_action, version_trade_inquiry_page_button_text, version_thank_you_page_title, version_thank_you_page_subheading, version_thank_you_page_message, version_thank_you_page_additional_content, version_thank_you_page_button_text, version_thank_you_page_button_link, version_meta_title, version_meta_description, version_meta_image_id, version_meta_focus_keyword, version_meta_canonical_url, version_meta_meta_robots_indexing, version_meta_meta_robots_following, version_meta_meta_robots_noarchive, version_meta_meta_robots_nosnippet, version_published_at, version_generate_slug, version_slug, version_updated_at, version_created_at, version__status, created_at, updated_at, latest, autosave) FROM stdin;
1	1	Contact	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	none	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	contact	2026-08-18 07:53:59.397+00	2026-08-18 07:53:59.397+00	published	2026-08-18 07:54:00.623+00	2026-08-18 07:54:00.623+00	f	f
3	2	Home	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Payload Website Template", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Visit the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " to begin managing this site's content. The code for this template is completely open-source and can be found ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://github.com/payloadcms/payload/tree/3.x/templates/website", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "on our Github", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ". ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	8	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	Payload Website Template	An open-source website built with Payload and Next.js.	8	\N	\N	index	follow	f	f	\N	f	home	2026-08-18 07:54:10.291+00	2026-08-18 07:53:59.39+00	published	2026-08-18 07:54:17.316+00	2026-08-18 07:54:17.316+00	f	f
5	1	Contact	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	none	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	contact	2026-08-18 08:24:57.147+00	2026-08-18 07:53:59.397+00	published	2026-08-18 08:25:01.748+00	2026-08-18 08:25:01.748+00	t	f
6	2	Home	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Payload Website Template", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Visit the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " to begin managing this site's content. The code for this template is completely open-source and can be found ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://github.com/payloadcms/payload/tree/3.x/templates/website", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "on our Github", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ". ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	8	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	Payload Website Template	An open-source website built with Payload and Next.js.	8	\N	\N	index	follow	f	f	\N	f	home	2026-08-18 08:25:05.702+00	2026-08-18 07:53:59.39+00	published	2026-08-18 08:25:12.379+00	2026-08-18 08:25:12.379+00	t	f
2	2	Home	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Payload Website Template", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Visit the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " to begin managing this site's content. The code for this template is completely open-source and can be found ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://github.com/payloadcms/payload/tree/3.x/templates/website", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "on our Github", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ". ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	8	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	Payload Website Template	An open-source website built with Payload and Next.js.	8	\N	\N	index	follow	f	f	\N	f	home	2026-08-18 07:53:59.391+00	2026-08-18 07:53:59.39+00	published	2026-08-18 07:54:02.16+00	2026-08-18 07:54:02.16+00	f	f
7	3	The Story Behind Our Homes | Novel Signature Homes	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	about	2026-08-18 08:25:17.087+00	2026-08-18 08:25:17.087+00	published	2026-08-18 08:25:18.029+00	2026-08-18 08:25:18.029+00	t	f
9	5	Properties	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	properties	2026-08-18 08:25:23.255+00	2026-08-18 08:25:23.254+00	published	2026-08-18 08:25:24.197+00	2026-08-18 08:25:24.197+00	t	f
10	6	Privacy Policy	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	privacy-policy	2026-08-18 08:25:26.339+00	2026-08-18 08:25:26.338+00	published	2026-08-18 08:25:27.284+00	2026-08-18 08:25:27.284+00	t	f
11	7	Thank You	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	thank-you	2026-08-18 08:25:29.434+00	2026-08-18 08:25:29.434+00	published	2026-08-18 08:25:30.375+00	2026-08-18 08:25:30.375+00	t	f
12	8	Trade Inquiry	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	trade-inquiry	2026-08-18 08:25:32.511+00	2026-08-18 08:25:32.511+00	published	2026-08-18 08:25:33.456+00	2026-08-18 08:25:33.456+00	t	f
13	9	Other Inquiries	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	other-inquiries	2026-08-18 08:25:35.607+00	2026-08-18 08:25:35.607+00	published	2026-08-18 08:25:36.704+00	2026-08-18 08:25:36.704+00	t	f
14	10	Buy A Home	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	buy-a-home	2026-08-18 08:25:38.844+00	2026-08-18 08:25:38.843+00	published	2026-08-18 08:25:39.786+00	2026-08-18 08:25:39.786+00	t	f
15	11	Terms and Conditions	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	terms-and-conditions	2026-08-18 08:25:41.925+00	2026-08-18 08:25:41.925+00	published	2026-08-18 08:25:42.867+00	2026-08-18 08:25:42.867+00	t	f
16	4	Concierge Service	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	concierge-service	2026-08-18 10:49:54.787+00	2026-08-18 08:25:20.165+00	published	2026-08-18 10:49:59.818+00	2026-08-18 10:49:59.818+00	t	f
8	4	Concierge Service	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	concierge-service	2026-08-18 08:25:20.165+00	2026-08-18 08:25:20.165+00	published	2026-08-18 08:25:21.109+00	2026-08-18 08:25:21.109+00	f	f
\.


--
-- Data for Name: _pages_v_blocks_archive; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_blocks_archive (_order, _parent_id, _path, id, intro_content, populate_by, relation_to, "limit", _uuid, block_name) FROM stdin;
3	2	version.layout	1	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Recent posts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The posts below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or posts can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	collection	posts	10	6a840f9738da0e893663eb06	Archive Block
4	3	version.layout	2	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Recent posts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The posts below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or posts can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	collection	posts	10	6a840f9738da0e893663eb06	Archive Block
4	6	version.layout	3	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Recent posts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The posts below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or posts can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	collection	posts	10	6a840f9738da0e893663eb06	Archive Block
\.


--
-- Data for Name: _pages_v_blocks_carousel; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_blocks_carousel (_order, _parent_id, _path, id, title, _uuid, block_name) FROM stdin;
1	3	version.layout	1	Featured Highlights & Product Showcase	6a840fa238da0e893663eb1b	Featured Highlights Carousel
1	6	version.layout	2	Featured Highlights & Product Showcase	6a840fa238da0e893663eb1b	Featured Highlights Carousel
\.


--
-- Data for Name: _pages_v_blocks_carousel_slides; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_blocks_carousel_slides (_order, _parent_id, id, image_id, heading, caption, _uuid) FROM stdin;
1	1	1	8	Welcome to Payload CMS 3.0	Discover the power of Next.js App Router integrated natively with Payload CMS.	6a840fa238da0e893663eb19
2	1	2	7	Dynamic Layout Block Builder	Easily reorder, add, and customize blocks on any page directly from the Admin Panel.	6a840fa238da0e893663eb1a
1	2	3	8	Welcome to Payload CMS 3.0	Discover the power of Next.js App Router integrated natively with Payload CMS.	6a840fa238da0e893663eb19
2	2	4	7	Dynamic Layout Block Builder	Easily reorder, add, and customize blocks on any page directly from the Admin Panel.	6a840fa238da0e893663eb1a
\.


--
-- Data for Name: _pages_v_blocks_content; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_blocks_content (_order, _parent_id, _path, id, _uuid, block_name) FROM stdin;
1	2	version.layout	1	6a840f9738da0e893663eb04	Content Block
2	3	version.layout	2	6a840f9738da0e893663eb04	Content Block
2	6	version.layout	3	6a840f9738da0e893663eb04	Content Block
\.


--
-- Data for Name: _pages_v_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	1	1	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	6a840f9738da0e893663eafe
2	1	2	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Admin Dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Manage this site's pages and posts from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eaff
3	1	3	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Using versions, drafts, and preview, editors can review and share their changes before publishing them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb00
4	1	4	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Page Builder", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom page builder allows you to create unique page, post, and project layouts for any type of content.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb01
5	1	5	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SEO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Editors have complete control over SEO data and site content directly from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb02
6	1	6	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dark Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Users will experience this site in their preferred color scheme and each block can be inverted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb03
1	2	7	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	6a840f9738da0e893663eafe
2	2	8	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Admin Dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Manage this site's pages and posts from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eaff
3	2	9	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Using versions, drafts, and preview, editors can review and share their changes before publishing them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb00
4	2	10	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Page Builder", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom page builder allows you to create unique page, post, and project layouts for any type of content.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb01
5	2	11	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SEO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Editors have complete control over SEO data and site content directly from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb02
6	2	12	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dark Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Users will experience this site in their preferred color scheme and each block can be inverted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb03
1	3	13	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	6a840f9738da0e893663eafe
2	3	14	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Admin Dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Manage this site's pages and posts from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eaff
3	3	15	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Using versions, drafts, and preview, editors can review and share their changes before publishing them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb00
4	3	16	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Page Builder", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom page builder allows you to create unique page, post, and project layouts for any type of content.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb01
5	3	17	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SEO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Editors have complete control over SEO data and site content directly from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb02
6	3	18	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dark Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Users will experience this site in their preferred color scheme and each block can be inverted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	6a840f9738da0e893663eb03
\.


--
-- Data for Name: _pages_v_blocks_cta; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_blocks_cta (_order, _parent_id, _path, id, rich_text, _uuid, block_name) FROM stdin;
4	2	version.layout	1	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a call to action", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a custom layout building block ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "configured in the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	6a840f9738da0e893663eb08	CTA
5	3	version.layout	2	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a call to action", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a custom layout building block ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "configured in the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	6a840f9738da0e893663eb08	CTA
5	6	version.layout	3	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a call to action", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a custom layout building block ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "configured in the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	6a840f9738da0e893663eb08	CTA
\.


--
-- Data for Name: _pages_v_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	1	1	custom	\N	/posts	All posts	default	6a840f9738da0e893663eb07
1	2	2	custom	\N	/posts	All posts	default	6a840f9738da0e893663eb07
1	3	3	custom	\N	/posts	All posts	default	6a840f9738da0e893663eb07
\.


--
-- Data for Name: _pages_v_blocks_form_block; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_blocks_form_block (_order, _parent_id, _path, id, form_id, enable_intro, intro_content, _uuid, block_name) FROM stdin;
1	1	version.layout	1	1	t	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Example contact form:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	6a840f9738da0e893663eb0e	\N
1	5	version.layout	3	1	t	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Example contact form:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	6a840f9738da0e893663eb0e	\N
\.


--
-- Data for Name: _pages_v_blocks_inquiry_hero; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_blocks_inquiry_hero (_order, _parent_id, _path, id, title, subheading, description, image_id, image_url, selected_form_id, form_action, button_text, _uuid, block_name) FROM stdin;
\.


--
-- Data for Name: _pages_v_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_blocks_media_block (_order, _parent_id, _path, id, media_id, _uuid, block_name) FROM stdin;
2	2	version.layout	1	5	6a840f9738da0e893663eb05	Media Block
3	3	version.layout	2	5	6a840f9738da0e893663eb05	Media Block
3	6	version.layout	3	5	6a840f9738da0e893663eb05	Media Block
\.


--
-- Data for Name: _pages_v_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_rels (id, "order", parent_id, path, pages_id, posts_id, categories_id) FROM stdin;
\.


--
-- Data for Name: _pages_v_version_concierge_page_how_it_works_steps; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_version_concierge_page_how_it_works_steps (_order, _parent_id, id, step_number, title, description, icon, _uuid) FROM stdin;
\.


--
-- Data for Name: _pages_v_version_concierge_page_services_items; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_version_concierge_page_services_items (_order, _parent_id, id, title, icon, _uuid) FROM stdin;
1	16	1	Mortgage assistance	28	6a8438d2783e40c491efd4d3
2	16	2	Move In / Move out Services	29	6a8438d2783e40c491efd4d4
3	16	3	Utility transfer	30	6a8438d2783e40c491efd4d5
4	16	4	Design consultation	31	6a8438d2783e40c491efd4d6
5	16	5	Furnitures & Décor selection	32	6a8438d2783e40c491efd4d7
6	16	6	Blinds and Window Treatments	33	6a8438d2783e40c491efd4d8
7	16	7	Landscaping Services	34	6a8438d2783e40c491efd4d9
8	16	8	Plumbing and Mechanical Maintenance	35	6a8438d2783e40c491efd4da
9	16	9	Handyman Service	36	6a8438d2783e40c491efd4db
10	16	10	Project manager Support	37	6a8438d2783e40c491efd4dc
\.


--
-- Data for Name: _pages_v_version_concierge_page_why_love_it_cards; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_version_concierge_page_why_love_it_cards (_order, _parent_id, id, tag, description, _uuid) FROM stdin;
\.


--
-- Data for Name: _pages_v_version_featured_properties_override; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_version_featured_properties_override (_order, _parent_id, id, name, details, image, href, _uuid) FROM stdin;
1	1	1	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a840f9738da0e893663eb0f
2	1	2	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a840f9738da0e893663eb10
1	2	3	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a840f9738da0e893663eb09
2	2	4	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a840f9738da0e893663eb0a
1	3	5	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a840f9738da0e893663eb09
2	3	6	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a840f9738da0e893663eb0a
1	5	9	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a840f9738da0e893663eb0f
2	5	10	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a840f9738da0e893663eb10
1	6	11	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a840f9738da0e893663eb09
2	6	12	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a840f9738da0e893663eb0a
1	7	13	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a8416edb1090c92d0e25c06
2	7	14	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a8416edb1090c92d0e25c07
1	8	15	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a8416f0b1090c92d0e25c0b
2	8	16	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a8416f0b1090c92d0e25c0c
1	9	17	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a8416f3b1090c92d0e25c10
2	9	18	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a8416f3b1090c92d0e25c11
1	10	19	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a8416f6b1090c92d0e25c15
2	10	20	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a8416f6b1090c92d0e25c16
1	11	21	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a8416f9b1090c92d0e25c1a
2	11	22	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a8416f9b1090c92d0e25c1b
1	12	23	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a8416fcb1090c92d0e25c1f
2	12	24	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a8416fcb1090c92d0e25c20
1	13	25	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a8416ffb1090c92d0e25c24
2	13	26	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a8416ffb1090c92d0e25c25
1	14	27	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a841702b1090c92d0e25c29
2	14	28	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a841702b1090c92d0e25c2a
1	15	29	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a841705b1090c92d0e25c2e
2	15	30	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a841705b1090c92d0e25c2f
1	16	31	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac	6a8416f0b1090c92d0e25c0b
2	16	32	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096	6a8416f0b1090c92d0e25c0c
\.


--
-- Data for Name: _pages_v_version_hero_links; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_version_hero_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	2	1	custom	\N	/posts	All posts	default	6a840f9738da0e893663eafc
2	2	2	custom	\N	/contact	Contact	outline	6a840f9738da0e893663eafd
1	3	3	custom	\N	/posts	All posts	default	6a840f9738da0e893663eafc
2	3	4	custom	\N	/contact	Contact	outline	6a840f9738da0e893663eafd
1	6	5	custom	\N	/posts	All posts	default	6a840f9738da0e893663eafc
2	6	6	custom	\N	/contact	Contact	outline	6a840f9738da0e893663eafd
\.


--
-- Data for Name: _pages_v_version_privacy_policy_page_sections; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_version_privacy_policy_page_sections (_order, _parent_id, id, heading, content, _uuid) FROM stdin;
\.


--
-- Data for Name: _pages_v_version_terms_and_conditions_page_sections; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_version_terms_and_conditions_page_sections (_order, _parent_id, id, heading, content, _uuid) FROM stdin;
\.


--
-- Data for Name: _pages_v_version_why_choose_us; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._pages_v_version_why_choose_us (_order, _parent_id, id, label, heading, text, _uuid) FROM stdin;
1	1	1	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a840f9738da0e893663eb11
2	1	2	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a840f9738da0e893663eb12
3	1	3	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a840f9738da0e893663eb13
1	2	4	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a840f9738da0e893663eb0b
2	2	5	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a840f9738da0e893663eb0c
3	2	6	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a840f9738da0e893663eb0d
1	3	7	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a840f9738da0e893663eb0b
2	3	8	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a840f9738da0e893663eb0c
3	3	9	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a840f9738da0e893663eb0d
1	5	13	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a840f9738da0e893663eb11
2	5	14	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a840f9738da0e893663eb12
3	5	15	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a840f9738da0e893663eb13
1	6	16	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a840f9738da0e893663eb0b
2	6	17	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a840f9738da0e893663eb0c
3	6	18	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a840f9738da0e893663eb0d
1	7	19	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a8416edb1090c92d0e25c08
2	7	20	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a8416edb1090c92d0e25c09
3	7	21	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a8416edb1090c92d0e25c0a
1	8	22	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a8416f0b1090c92d0e25c0d
2	8	23	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a8416f0b1090c92d0e25c0e
3	8	24	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a8416f0b1090c92d0e25c0f
1	9	25	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a8416f3b1090c92d0e25c12
2	9	26	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a8416f3b1090c92d0e25c13
3	9	27	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a8416f3b1090c92d0e25c14
1	10	28	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a8416f6b1090c92d0e25c17
2	10	29	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a8416f6b1090c92d0e25c18
3	10	30	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a8416f6b1090c92d0e25c19
1	11	31	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a8416f9b1090c92d0e25c1c
2	11	32	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a8416f9b1090c92d0e25c1d
3	11	33	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a8416f9b1090c92d0e25c1e
1	12	34	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a8416fcb1090c92d0e25c21
2	12	35	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a8416fcb1090c92d0e25c22
3	12	36	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a8416fcb1090c92d0e25c23
1	13	37	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a8416ffb1090c92d0e25c26
2	13	38	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a8416ffb1090c92d0e25c27
3	13	39	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a8416ffb1090c92d0e25c28
1	14	40	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a841702b1090c92d0e25c2b
2	14	41	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a841702b1090c92d0e25c2c
3	14	42	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a841702b1090c92d0e25c2d
1	15	43	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a841705b1090c92d0e25c30
2	15	44	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a841705b1090c92d0e25c31
3	15	45	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a841705b1090c92d0e25c32
1	16	46	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.	6a8416f0b1090c92d0e25c0d
2	16	47	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.	6a8416f0b1090c92d0e25c0e
3	16	48	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.	6a8416f0b1090c92d0e25c0f
\.


--
-- Data for Name: _posts_v; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._posts_v (id, parent_id, version_title, version_hero_image_id, version_content, version_meta_title, version_meta_image_id, version_meta_description, version_published_at, version_generate_slug, version_slug, version_meta_focus_keyword, version_meta_canonical_url, version_meta_meta_robots_indexing, version_meta_meta_robots_following, version_meta_meta_robots_noarchive, version_meta_meta_robots_nosnippet, version_updated_at, version_created_at, version__status, created_at, updated_at, latest, autosave) FROM stdin;
8	4	Digital Horizons: A Glimpse into Tomorrow	6	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "6a840f7d38da0e893663eae4", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Rise of AI and Machine Learning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We find ourselves in a transformative era where artificial intelligence (AI) stands at the forefront of technological evolution. The ripple effects of its advancements are reshaping industries at an unprecedented pace. No longer are businesses bound by the limitations of tedious, manual processes. Instead, sophisticated machines, fueled by vast amounts of historical data, are now capable of making decisions previously left to human intuition. These intelligent systems are not only optimizing operations but also pioneering innovative approaches, heralding a new age of business transformation worldwide. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "To demonstrate basic AI functionality, here is a javascript snippet that makes a POST request to a generic AI API in order to generate text based on a prompt. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "6a840f7d38da0e893663eae5", "code": "async function generateText(prompt) {\\n    const apiKey = 'your-api-key';\\n    const apiUrl = 'https://api.example.com/generate-text';\\n\\n    const response = await fetch(apiUrl, {\\n        method: 'POST',\\n        headers: {\\n            'Content-Type': 'application/json',\\n            'Authorization': `Bearer ${apiKey}`\\n        },\\n        body: JSON.stringify({\\n            model: 'text-generation-model',\\n            prompt: prompt,\\n            max_tokens: 50\\n        })\\n    });\\n\\n    const data = await response.json();\\n    console.log(data.choices[0].text.trim());\\n}\\n\\n// Example usage\\ngenerateText(\\"Once upon a time in a faraway land,\\");\\n", "language": "javascript", "blockName": "Generate Text", "blockType": "code"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IoT: Connecting the World Around Us", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today's rapidly evolving technological landscape, the Internet of Things (IoT) stands out as a revolutionary force. From transforming our residences with smart home systems to redefining transportation through connected cars, IoT's influence is palpable in nearly every facet of our daily lives.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This technology hinges on the seamless integration of devices and systems, allowing them to communicate and collaborate effortlessly. With each connected device, we move a step closer to a world where convenience and efficiency are embedded in the very fabric of our existence. As a result, we're transitioning into an era where our surroundings intuitively respond to our needs, heralding a smarter and more interconnected global community.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "6a840f7d38da0e893663eae6", "media": 5, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "block", "fields": {"id": "6a840f7d38da0e893663eae7", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic Components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Digital Horizons: A Glimpse into Tomorrow	6	Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.	2026-08-18 07:53:24.048+00	f	digital-horizons	\N	\N	index	follow	f	f	2026-08-18 07:53:35.531+00	2026-08-18 07:53:24.049+00	published	2026-08-18 07:53:36.671+00	2026-08-18 07:53:36.671+00	t	f
5	4	Digital Horizons: A Glimpse into Tomorrow	6	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Rise of AI and Machine Learning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We find ourselves in a transformative era where artificial intelligence (AI) stands at the forefront of technological evolution. The ripple effects of its advancements are reshaping industries at an unprecedented pace. No longer are businesses bound by the limitations of tedious, manual processes. Instead, sophisticated machines, fueled by vast amounts of historical data, are now capable of making decisions previously left to human intuition. These intelligent systems are not only optimizing operations but also pioneering innovative approaches, heralding a new age of business transformation worldwide. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "To demonstrate basic AI functionality, here is a javascript snippet that makes a POST request to a generic AI API in order to generate text based on a prompt. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"code": "async function generateText(prompt) {\\n    const apiKey = 'your-api-key';\\n    const apiUrl = 'https://api.example.com/generate-text';\\n\\n    const response = await fetch(apiUrl, {\\n        method: 'POST',\\n        headers: {\\n            'Content-Type': 'application/json',\\n            'Authorization': `Bearer ${apiKey}`\\n        },\\n        body: JSON.stringify({\\n            model: 'text-generation-model',\\n            prompt: prompt,\\n            max_tokens: 50\\n        })\\n    });\\n\\n    const data = await response.json();\\n    console.log(data.choices[0].text.trim());\\n}\\n\\n// Example usage\\ngenerateText(\\"Once upon a time in a faraway land,\\");\\n", "language": "javascript", "blockName": "Generate Text", "blockType": "code"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IoT: Connecting the World Around Us", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today's rapidly evolving technological landscape, the Internet of Things (IoT) stands out as a revolutionary force. From transforming our residences with smart home systems to redefining transportation through connected cars, IoT's influence is palpable in nearly every facet of our daily lives.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This technology hinges on the seamless integration of devices and systems, allowing them to communicate and collaborate effortlessly. With each connected device, we move a step closer to a world where convenience and efficiency are embedded in the very fabric of our existence. As a result, we're transitioning into an era where our surroundings intuitively respond to our needs, heralding a smarter and more interconnected global community.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"media": 5, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic Components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Digital Horizons: A Glimpse into Tomorrow	6	Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.	2026-08-18 07:53:24.048+00	f	digital-horizons	\N	\N	index	follow	f	f	2026-08-18 07:53:24.05+00	2026-08-18 07:53:24.049+00	published	2026-08-18 07:53:24.735+00	2026-08-18 07:53:24.735+00	f	f
9	5	Global Gaze: Beyond the Headlines	5	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "6a840f8638da0e893663eaee", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Power of Resilience: Stories of Recovery and Hope", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Throughout history, regions across the globe have faced the devastating impact of natural disasters, the turbulence of political unrest, and the challenging ripples of economic downturns. In these moments of profound crisis, an often-underestimated force emerges: the indomitable resilience of the human spirit. These aren't just tales of mere survival, but stories of communities forging bonds, uniting with a collective purpose, and demonstrating an innate ability to overcome.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "6a840f8638da0e893663eaef", "media": 7, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From neighbors forming makeshift rescue teams during floods to entire cities rallying to rebuild after economic collapse, the essence of humanity is most evident in these acts of solidarity. As we delve into these narratives, we witness the transformative power of community spirit, where adversity becomes a catalyst for growth, unity, and a brighter, rebuilt future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "6a840f8638da0e893663eaf0", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Global Gaze: Beyond the Headlines	5	Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.	2026-08-18 07:53:27.017+00	f	global-gaze	\N	\N	index	follow	f	f	2026-08-18 07:53:43.255+00	2026-08-18 07:53:27.018+00	published	2026-08-18 07:53:44.392+00	2026-08-18 07:53:44.392+00	t	f
6	5	Global Gaze: Beyond the Headlines	5	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Power of Resilience: Stories of Recovery and Hope", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Throughout history, regions across the globe have faced the devastating impact of natural disasters, the turbulence of political unrest, and the challenging ripples of economic downturns. In these moments of profound crisis, an often-underestimated force emerges: the indomitable resilience of the human spirit. These aren't just tales of mere survival, but stories of communities forging bonds, uniting with a collective purpose, and demonstrating an innate ability to overcome.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"media": 7, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From neighbors forming makeshift rescue teams during floods to entire cities rallying to rebuild after economic collapse, the essence of humanity is most evident in these acts of solidarity. As we delve into these narratives, we witness the transformative power of community spirit, where adversity becomes a catalyst for growth, unity, and a brighter, rebuilt future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Global Gaze: Beyond the Headlines	5	Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.	2026-08-18 07:53:27.017+00	f	global-gaze	\N	\N	index	follow	f	f	2026-08-18 07:53:27.018+00	2026-08-18 07:53:27.018+00	published	2026-08-18 07:53:27.7+00	2026-08-18 07:53:27.7+00	f	f
10	6	Dollar and Sense: The Financial Forecast	7	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "block", "fields": {"id": "6a840f8e38da0e893663eaf4", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money isn't just currency; ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "it's a language. ", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}, {"mode": "normal", "text": "Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money, in its essence, transcends the mere concept of coins and paper notes; it becomes a profound language that speaks of value, trust, and societal structures. Like any language, it possesses intricate nuances and subtleties that require a discerning understanding. It's in these depths where the calculated world of financial strategy collides with the raw, instinctive nature of human intuition. Just as a seasoned linguist might dissect the syntax and semantics of a sentence, a financial expert navigates the vast and tumultuous ocean of finance, guided not only by logic and data but also by gut feelings and foresight. Every transaction, investment, and financial decision becomes a dialogue in this expansive lexicon of commerce and value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "6a840f8e38da0e893663eaf5", "media": 6, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Stock Market Dynamics: Bulls, Bears, and the Uncertain Middle", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market is a realm of vast opportunity but also poses risks. Discover the forces that drive market trends and the strategies employed by top traders to navigate this complex ecosystem. From market analysis to understanding investor psychology, get a comprehensive insight into the world of stocks.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market, often visualized as a bustling arena of numbers and ticker tapes, is as much about human behavior as it is about economics. It's a place where optimism, represented by the bullish rally, meets the caution of bearish downturns, with each vying to dictate the market's direction. But between these two extremes lies an uncertain middle ground, a zone populated by traders and investors who constantly weigh hope against fear. Successful navigation requires more than just financial acumen; it demands an understanding of collective sentiments and the ability to predict not just market movements, but also the reactions of other market participants. In this intricate dance of numbers and nerves, the most astute players are those who master both the hard data and the soft nuances of human behavior.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "6a840f8e38da0e893663eaf6", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Dollar and Sense: The Financial Forecast	7	Money isn't just currency; it's a language. Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.	2026-08-18 07:53:29.984+00	f	dollar-and-sense-the-financial-forecast	\N	\N	index	follow	f	f	2026-08-18 07:53:50.888+00	2026-08-18 07:53:29.985+00	published	2026-08-18 07:53:52.025+00	2026-08-18 07:53:52.025+00	t	f
7	6	Dollar and Sense: The Financial Forecast	7	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money isn't just currency; ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "it's a language. ", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}, {"mode": "normal", "text": "Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money, in its essence, transcends the mere concept of coins and paper notes; it becomes a profound language that speaks of value, trust, and societal structures. Like any language, it possesses intricate nuances and subtleties that require a discerning understanding. It's in these depths where the calculated world of financial strategy collides with the raw, instinctive nature of human intuition. Just as a seasoned linguist might dissect the syntax and semantics of a sentence, a financial expert navigates the vast and tumultuous ocean of finance, guided not only by logic and data but also by gut feelings and foresight. Every transaction, investment, and financial decision becomes a dialogue in this expansive lexicon of commerce and value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"media": 6, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Stock Market Dynamics: Bulls, Bears, and the Uncertain Middle", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market is a realm of vast opportunity but also poses risks. Discover the forces that drive market trends and the strategies employed by top traders to navigate this complex ecosystem. From market analysis to understanding investor psychology, get a comprehensive insight into the world of stocks.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market, often visualized as a bustling arena of numbers and ticker tapes, is as much about human behavior as it is about economics. It's a place where optimism, represented by the bullish rally, meets the caution of bearish downturns, with each vying to dictate the market's direction. But between these two extremes lies an uncertain middle ground, a zone populated by traders and investors who constantly weigh hope against fear. Successful navigation requires more than just financial acumen; it demands an understanding of collective sentiments and the ability to predict not just market movements, but also the reactions of other market participants. In this intricate dance of numbers and nerves, the most astute players are those who master both the hard data and the soft nuances of human behavior.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Dollar and Sense: The Financial Forecast	7	Money isn't just currency; it's a language. Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.	2026-08-18 07:53:29.984+00	f	dollar-and-sense-the-financial-forecast	\N	\N	index	follow	f	f	2026-08-18 07:53:29.985+00	2026-08-18 07:53:29.985+00	published	2026-08-18 07:53:30.667+00	2026-08-18 07:53:30.667+00	f	f
\.


--
-- Data for Name: _posts_v_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._posts_v_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) FROM stdin;
7	1	5	version.authors	\N	\N	5
8	1	6	version.authors	\N	\N	5
9	1	7	version.authors	\N	\N	5
10	1	8	version.relatedPosts	5	\N	\N
11	2	8	version.relatedPosts	6	\N	\N
12	1	8	version.authors	\N	\N	5
13	1	9	version.relatedPosts	4	\N	\N
14	2	9	version.relatedPosts	6	\N	\N
15	1	9	version.authors	\N	\N	5
16	1	10	version.relatedPosts	4	\N	\N
17	2	10	version.relatedPosts	5	\N	\N
18	1	10	version.authors	\N	\N	5
\.


--
-- Data for Name: _posts_v_version_populated_authors; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public._posts_v_version_populated_authors (_order, _parent_id, id, _uuid, name) FROM stdin;
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.blogs (id, title, hero_image_id, excerpt, content, meta_title, meta_image_id, meta_description, meta_focus_keyword, meta_canonical_url, meta_meta_robots_indexing, meta_meta_robots_following, meta_meta_robots_noarchive, meta_meta_robots_nosnippet, reading_time, published_at, generate_slug, slug, updated_at, created_at, _status) FROM stdin;
6	Real Estate vs. the Stock Market in 2025	77	Explore the advantages of real estate vs stocks for long-term wealth. Discover why real estate can provide stability and value.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Both stocks and real estate have a place in a well-balanced portfolio. But if your goal is long-term stability, inflation protection, and an asset you can experience, real estate often stands out. Here is why, supported by recent market trends.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 79, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A Real Asset With Real Scarcity", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home offers something stocks never will. It is tangible, limited, and supported by everyday demand.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston home values have seen meaningful growth over the past decade. One report notes that median prices in key Houston neighborhoods rose up to 86 percent between 2014 and 2023 (CultureMap Houston). Even in a rate-driven market, prices have held steady rather than falling.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Across the Houston MSA, the repeat-sales home price index rose from 404.13 to 408.65 between Q2 and Q3 of 2025 (Federal Reserve Bank of St. Louis), reflecting steady, measured growth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate often strengthens during inflation because construction costs rise, land remains limited, and buyers continue to prioritize well-located homes. Even when stocks fluctuate, properties in strong neighborhoods tend to hold their value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "An Asset That Can Earn While It Appreciates", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate carries an advantage that stocks cannot match. It can earn income while it grows.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In Houston:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Short-term rentals average roughly 59 percent occupancy based on 2024–2025 data from Airbtics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Furnished rentals perform well near major employment centers and medical districts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Corporate and executive housing maintains consistent demand driven by workforce mobility", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This rental stability continues regardless of daily market performance, because it is tied to lifestyle, relocation, and quality-of-life needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 81, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real Tax Advantages That Support Long-Term Planning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate offers meaningful tax advantages that traditional equities do not. Depending on your situation, you may benefit from depreciation, mortgage interest deductions, operational expense deductions, or 1031 exchange deferrals.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "While tax benefits vary for each person, property ownership generally provides more flexibility and long-term planning opportunities than stock investments.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Less Liquidity, More Stability", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real estate cannot be sold instantly, and that can be an advantage.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Stocks can move sharply in a single trading session. Home values shift gradually over time. This slower pace helps investors stay grounded and prevents reactive decision-making during volatile periods.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For many, real estate creates a natural path to patient, long-term wealth building.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 83, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A Lifestyle Asset With Legacy Value", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home offers financial value, but it also offers something deeply personal. It can be lived in, shared, and passed down.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Neighborhoods such as Woodland Heights, Heatherglen, The Heights, and Near Northside continue to attract long-term buyers because they combine character, walkable communities, thoughtful design, and everyday convenience. These are qualities financial markets cannot replicate.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A property becomes a place for gathering, unwinding, and creating memories. When an asset blends emotional and financial value, it naturally becomes part of a stable wealth-building strategy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Value That Stays With You", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A home grows with you. It adapts to different seasons of life and holds its purpose across time. With its steady performance, lifestyle comfort, and proven resilience, real estate remains one of the most trusted avenues for building long-term wealth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Exploring Homes in Houston", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If real estate is part of your plans for 2025, we can help you explore neighborhoods and homes that align with your lifestyle and long-term goals.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	3	2025-12-05 12:01:23+00	f	real-estate-vs-the-stock-market-in-2025	2026-08-18 09:21:22.979+00	2026-08-18 08:32:16.33+00	published
5	The Digital Frontier: Houston's $5.7 Billion Luxury Real Estate Evolution	69	Explore how The Digital Frontier is transforming Houston's luxury real estate market with innovative technology and new buyer behaviors.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston's luxury real estate market now generates an estimated $5.7 billion in economic activity. Sales of homes priced above $1 million have jumped 65 percent year over year. However, this growth goes beyond oil wealth or corporate relocations. Instead, technology is reshaping how high-end homes are discovered, evaluated, and purchased.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 71, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Houston Leads the Innovation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston stands out because of who its buyers are. The city attracts energy executives, medical professionals, and aerospace engineers. These buyers already work with simulations, data modeling, and AI every day. For them, touring a $3 million home through VR feels intuitive, not experimental.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At the same time, mortgage rates averaged around 6.4 percent in late 2025. Because of this, buyers have become more selective. They rely on technology to filter out homes that do not meet their exact needs. Rather than spending weekends on unnecessary showings, they use digital tools to focus only on properties that truly fit.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Economics of Virtual Precision", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In luxury real estate, the real cost often lies in wasted time and costly mistakes. Technology directly addresses both.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time Savings:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Traditional home searches can consume over 60 hours for high-earning professionals. Virtual tours eliminate unnecessary visits and accelerate decision-making.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preventing Change Orders:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Construction change orders in luxury homes typically add 15 to 20 percent to contract values. VR allows buyers to test layouts, finishes, and even kitchen island configurations before construction begins. This foresight can save hundreds of thousands of dollars.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Market Performance:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Listings with virtual tours sell for about 9 percent more and close 31 percent faster. Meanwhile, augmented reality applications now deliver ROI figures exceeding 400 percent.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": 73, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "High-Tech Tools Moving the Market", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Today's VR tools extend far beyond static images or basic walkthroughs. Instead, they deliver immersive, decision-driven experiences.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Buyers can now:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Test light and sound", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", seeing how sunlight moves across rooms or how acoustics perform in a home theater", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Customize instantly", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", swapping flooring, fixtures, or furniture in real time using AR", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Evaluate future value", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", as predictive analytics estimate resale appeal and long-term climate impact over decades", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Neighborhood-Specific Tech Approaches", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Luxury neighborhoods across Houston use technology differently, depending on lifestyle priorities.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Established Neighborhoods:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " In River Oaks and Tanglewood, VR highlights soaring ceilings, craftsmanship, and architectural depth that traditional photography often flattens.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Family-Centric Communities: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "In Memorial and West University Place, technology simulates daily routines. Parents test school traffic patterns, backyard visibility, and overall flow for busy schedules.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional Proximity zones:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Near the Medical Center and Museum District, agents emphasize efficiency. Virtual tools showcase optimized layouts, seamless work-from-home setups, and short commute advantages.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Renovation & Heritage Opportunities:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " In neighborhoods like the Heights, VR helps buyers visualize modern updates inside historic homes. This removes uncertainty and preserves emotional connection to original architecture.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": 75, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The New Standard of Trust", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Technology does not remove the human element from luxury transactions. Instead, it strengthens trust and clarity. Today's top agents act as technology-enabled advisors. They guide buyers who already understand a home before stepping inside.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "After multiple virtual walkthroughs and scenario testing, buyers enter the closing phase confident and informed. That confidence reduces friction and accelerates decisions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Meanwhile, the global AR real estate market is approaching $2.6 billion by 2025. Houston continues to capture a disproportionate share of that growth. Buying a luxury home now mirrors the process of commissioning a custom jet. Every detail is evaluated, refined, and confirmed before construction begins.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ultimately, the standard has changed. A beautiful home is no longer enough. Buyers now expect the ability to step inside their vision instantly.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Your next home is not just a physical space. It is a digital experience, shaped and perfected before the foundation is poured. Through VR, every corner aligns with your expectations. When construction begins, the result feels less like a surprise and more like a promise fulfilled.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	4	2026-01-05 10:06:10+00	f	the-digital-frontier-houstons-5-7-billion-luxury-real-estate-evolution	2026-08-18 09:21:26.879+00	2026-08-18 08:32:14.249+00	published
11	The Rise of Luxury Living in Texas: Why Everyone’s Moving South?	50	Discover why Texas is becoming the new capital of luxury living. Explore the reasons behind the move, what defines luxury in Texas, and the top hotspots for high-end homes in the Lone Star State.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Discover why Texas is becoming the new capital of luxury living. Explore the reasons behind the move, what defines luxury in Texas, and the top hotspots for high-end homes in the Lone Star State.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-08-18 00:00:00+00	f	the-rise-of-luxury-living-in-texas-why-everyones-moving-south	2026-08-18 09:21:03.441+00	2026-08-18 08:32:26.746+00	published
10	The Must-Have List for Houston’s Luxury Home Buyers	49	Explore The Must-Have List for Houston&#039;s Luxury Home Buyers and discover what defines true luxury in the modern market.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore The Must-Have List for Houston&#039;s Luxury Home Buyers and discover what defines true luxury in the modern market.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-10-20 00:00:00+00	f	the-must-have-list-for-houstons-luxury-home-buyers	2026-08-18 09:21:07.304+00	2026-08-18 08:32:24.669+00	published
8	Westhaven Estates: Houston’s Hidden Gem of Urban Luxury	47	Explore Westhaven Estates Houston: a hidden gem offering urban luxury with privacy and access to vibrant city life.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore Westhaven Estates Houston: a hidden gem offering urban luxury with privacy and access to vibrant city life.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2026-02-12 00:00:00+00	f	westhaven-estates-houstons-hidden-gem-of-urban-luxury	2026-08-18 09:21:15.003+00	2026-08-18 08:32:20.518+00	published
7	Why Does 2025 Feel Like the Right Time to Buy Luxury Real Estate in Texas	85	Why Texas Real Estate Remains a Smart Investment in 2025 — explore the growth, lifestyle, and opportunity driving luxury home sales across Houston, Austin, and Dallas.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "upload", "value": 87, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I'll be honest, if you'd asked me a few years ago where the strongest luxury real estate markets would be in 2025, I probably wouldn't have predicted Texas would be this hot. But here we are. Not only has the market held up, it's thriving in ways that are catching a lot of people's attention.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you've been paying any attention to housing trends lately, you've probably noticed luxury homes around here aren't just keeping their value – they're steadily going up, even when other parts of the country are starting to cool off. And there are some pretty good reasons for it.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It's Not Just a Trend, It's a Shift", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Texas has always marched to the beat of its own drum. No state income tax, plenty of space, growing job markets, and a lifestyle people from both coasts secretly envy. But what's happening right now isn't just a momentary boom. It feels like a long-term shift in where wealth and opportunity are moving.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Big names like Tesla and Oracle made headlines when they moved operations here, but what's more interesting is the ripple effect it's created. Smaller companies, investors, and families are following. And they're not looking for fixer-uppers – they want beautiful homes, large lots, walkable neighborhoods, and access to good schools and city amenities. Texas delivers that in spades.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "upload", "value": 89, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "So, Why Now? Why 2025?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Good question. It's not like Texas is a secret anymore. People have been relocating here for years. But a few things are happening right now that make this year feel different.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For one, prices in other big luxury markets like California and New York have either plateaued or dipped, while Texas is still seeing healthy appreciation. Not crazy, unsustainable jumps – just steady, reliable growth. And honestly, that's exactly what most buyers and investors are looking for these days.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Then there's the work-from-anywhere culture that, despite a few companies trying to reverse it, isn't going away. More people have the freedom to live where they want, and when you can pick between a cramped $4 million house in LA or a gorgeous, brand-new $2.5 million home on an acre lot in Austin… the choice gets pretty easy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "And yes – the no state income tax thing still matters, probably more than ever as other states raise taxes to cover budget gaps.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Where People Are Buying", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The usual suspects are still leading the way:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Houston is more than just an energy town now. Healthcare, aerospace, and tech are booming too. Neighborhoods like River Oaks, Memorial Villages, and West Haven Estates are packed with big, beautiful homes and plenty of character.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Austin remains one of the fastest-growing cities in the country, especially for younger, high-earning buyers. Places like Westlake Hills, Tarrytown, and Barton Creek are loaded with new builds and remodeled classics, and homes there rarely sit on the market long.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dallas is attracting both longtime locals upgrading and out-of-state buyers moving in. Preston Hollow, Highland Park, and University Park have always been prime spots, and that hasn't changed.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "upload", "value": 91, "fields": {}, "format": "", "version": 1, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Investment Angle", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you're reading this purely from an investment perspective, here's the simple version: luxury homes in Texas have held up extremely well compared to other markets. Prices are up, inventory is tight, and demand hasn't cooled. Even when the broader market gets shaky, high-end homes in growth markets like these tend to weather the storm better than most.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "And unlike crypto or stocks, you can live in this investment, host a dinner party in it, or rent it out as a second home. Not a bad deal.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore Texas Luxury Living Today", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I'm not here to pitch you on a specific property. I just think if you've been on the fence about making a move — whether for yourself, your family, or your portfolio — 2025 is a good time to take a serious look at Texas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The market's strong, the lifestyle's unbeatable, and opportunities like this don't stay on the table forever.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you're curious what's out there or just want to bounce around some ideas, drop me a message. Always happy to chat about houses, neighborhoods, or what's really happening behind the headlines.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	4	2025-09-05 03:12:03+00	f	texas-real-estate-investment-2025	2026-08-18 09:21:18.902+00	2026-08-18 08:32:18.408+00	published
4	Woodland Heights, Houston: The Neighborhood That Rewards the Right Buyer	67	Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d768f", "type": "upload", "value": 59, "fields": {"alt": "Oak Bayou in Woodland Heights Houston", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Woodland Heights Attracts a Specific Kind of Buyer", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The buyers who come to Woodland Heights are not looking for scale. They are not drawn by amenities lists or resort-style features. What they want is a neighbourhood with character that has already been established, where the architecture has a consistent grammar and the streets feel like they belong to the people who live on them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights was developed in the early twentieth century as a streetcar suburb, and the bones of that era are still visible. The Craftsman bungalows, the Prairie-style homes, the generous front porches — these are original, not recreations. The neighbourhood has been maintained rather than reinvented, which is increasingly rare in a city that tends to move fast.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Access Without Sacrifice", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "One of the consistent draws of Woodland Heights is how much the location offers without requiring the buyer to compromise on what surrounds them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The neighbourhood sits between ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/Heights+Mercantile", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Heights Mercantile", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " and the Buffalo Bayou trail system. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/Donovan+Park+Houston", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Donovan Park", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " is walkable from most of the neighbourhood. The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/White+Oak+Music+Hall", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "White Oak Music Hall", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " is close enough to walk to on a weekend evening. The energy of Montrose is reachable in minutes. But inside Woodland Heights itself, the streets are quiet.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d7693", "type": "upload", "value": 61, "fields": {"alt": "Houston skyline view from Woodland Heights", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Culture of the Neighbourhood", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights has an active civic association and a consistent street-level culture that is not manufactured. The neighbourhood holds a annual home tour each spring, which draws visitors who want to see the interiors of houses that rarely come to market. On weekend mornings, the park and bayou trails fill with residents who seem to actually know each other.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "There is a farmers market nearby on Saturday mornings, and the commercial strips along ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.google.com/maps/place/White+Oak+Drive+Houston", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " have the kind of independent restaurants and shops that attract a particular kind of afternoon. Every December, Lights in the Heights brings visitors in from across the city, which is a reliable indicator of how deeply the neighbourhood has established its identity beyond its own residents.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Building Within a Historic Framework", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "New construction in Woodland Heights is possible, and it happens. What changed in June 2011, when the City of Houston granted the neighbourhood Historic District status, is that every exterior change now requires a Certificate of Appropriateness before work can begin. The designation did not stop construction. It shaped what construction could look like.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What the Historic District Rules Actually Mean", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.houstontx.gov/planning/HistoricPres/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Historic District designation from the City of Houston", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " brought enforceable standards covering setbacks, eave heights, scale, and how a building meets the street. New construction must align with the prevailing front setback of the block, originally established at 20 feet from the street. On a predominantly single-storey blockface, a two-storey home is expected to step back further to avoid overwhelming the scale of what surrounds it. Front porches, roof pitch, and material choices must be compatible in character with the existing homes, even where the design is clearly contemporary. The guidelines are not suggestions. A building that does not meet them does not receive approval.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Novel Signature Homes in Woodland Heights", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The residences at ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/luxury-homes-in-woodland-height/woodland-height-2/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "2434 White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " and ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/luxury-homes-in-woodland-height/woodland-height-1/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "2436 White Oak Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " were designed with the district standards as a starting point, not a constraint. From the street, each home reads as part of the block. The exterior forms take from the neighbourhood without copying it. Inside, the layouts open into spaces built around how people live today, with room to gather and room to step away from it.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d7698", "type": "upload", "value": 63, "fields": {"alt": "Luxury new construction home at 2434 White Oak Drive in Woodland Heights Houston by Novel Signature Homes", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/1001-e-7th-1-2st-houston/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "1001 E 7th 1/2 Street", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " residence, recently contracted, follows the same approach. Buyers who choose Woodland Heights are rarely looking for spectacle. They are looking for craft, proportion, and a home that feels settled from the moment they arrive.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Woodland Heights Holds Its Value", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The historic protections preserve what took a century to build. Inventory stays limited because the neighbourhood is bounded on all sides and the district rules make speculative teardowns less viable. The tree canopy along the streets is the kind of thing that cannot be accelerated. It simply took time, and time cannot be replicated in a new development.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6a7c6959688089fa770d769a", "type": "upload", "value": 65, "fields": {"alt": "Modern luxury interior of new construction home at 1001 E 7th Street Woodland Heights Houston", "caption": null}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What holds the neighbourhood together beyond the physical is the people who live in it. Residents here maintain their facades, attend civic association meetings, and push back when something changes the character of a block without consideration for what surrounds it. That kind of collective investment is not something a developer can manufacture or a marketing brochure can simulate.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Woodland Heights has held its identity for over a century. The homes built within it carry that history forward, whether they were built in 1920 or last year.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Browse all Novel Signature Homes listings in Houston → ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://novelsignaturehomes.com/properties/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "View All Properties", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	index	follow	f	f	5	2026-05-05 12:45:53+00	f	woodland-heights-houston-the-neighborhood-that-rewards-the-right-buyer	2026-08-18 09:21:30.816+00	2026-08-18 08:32:12.148+00	published
9	How Thoughtful Design and Craftsmanship Define Modern Luxury Living	48	Discover how thoughtful design and craftsmanship redefine modern luxury interiors, blending innovation, comfort, and timeless beauty.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Discover how thoughtful design and craftsmanship redefine modern luxury interiors, blending innovation, comfort, and timeless beauty.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}]}]}}	\N	\N	\N	\N	\N	index	follow	f	f	1	2025-11-14 00:00:00+00	f	timeless-luxury-how-thoughtful-design-and-craftsmanship-are-shaping-modern-interiors	2026-08-18 09:21:11.15+00	2026-08-18 08:32:22.593+00	published
\.


--
-- Data for Name: blogs_populated_authors; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.blogs_populated_authors (_order, _parent_id, id, name) FROM stdin;
\.


--
-- Data for Name: blogs_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.blogs_rels (id, "order", parent_id, path, users_id, categories_id, blogs_id) FROM stdin;
7	1	11	categories	\N	16	\N
8	1	10	categories	\N	16	\N
9	1	9	categories	\N	15	\N
10	1	8	categories	\N	14	\N
11	1	7	categories	\N	13	\N
12	1	6	categories	\N	13	\N
13	1	5	categories	\N	13	\N
14	1	4	categories	\N	17	\N
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.categories (id, title, generate_slug, slug, parent_id, updated_at, created_at) FROM stdin;
13	Luxury market & investment	f	luxury-market--investment	\N	2026-08-18 08:23:32.94+00	2026-08-18 08:23:31.144+00
14	Neighborhood & Lifestyle	f	neighborhood--lifestyle	\N	2026-08-18 08:23:37.109+00	2026-08-18 08:23:35.176+00
15	Design & Craftsmanships	f	design--craftsmanships	\N	2026-08-18 08:23:41.135+00	2026-08-18 08:23:39.343+00
16	Luxury Buyer Insights	f	luxury-buyer-insights	\N	2026-08-18 08:23:45.16+00	2026-08-18 08:23:43.37+00
17	Featured / Latest	f	featured--latest	\N	2026-08-18 08:23:49.196+00	2026-08-18 08:23:47.406+00
\.


--
-- Data for Name: categories_breadcrumbs; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.categories_breadcrumbs (_order, _parent_id, id, doc_id, url, label) FROM stdin;
1	13	6a841683b2ab49925c376b9a	13	/luxury-market--investment	Luxury market & investment
1	14	6a841687b2ab49925c376b9b	14	/neighborhood--lifestyle	Neighborhood & Lifestyle
1	15	6a84168bb2ab49925c376b9c	15	/design--craftsmanships	Design & Craftsmanships
1	16	6a84168fb2ab49925c376b9d	16	/luxury-buyer-insights	Luxury Buyer Insights
1	17	6a841693b2ab49925c376b9e	17	/featured--latest	Featured / Latest
\.


--
-- Data for Name: cf7_tracker; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.cf7_tracker (id, form_id, form_name, submitter_name, submitter_email, submitter_phone, form_data, mail_status, mail_note, erp_status, erp_lead_id, erp_response, retry_count, last_retry_at, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: footer; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.footer (id, updated_at, created_at) FROM stdin;
1	2026-08-18 07:50:23.216+00	2026-08-18 07:50:23.216+00
\.


--
-- Data for Name: footer_nav_items; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.footer_nav_items (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label) FROM stdin;
1	1	6a840f9d38da0e893663eb16	custom	\N	/admin	Admin
2	1	6a840f9d38da0e893663eb17	custom	t	https://github.com/payloadcms/payload/tree/3.x/templates/website	Source Code
3	1	6a840f9d38da0e893663eb18	custom	t	https://payloadcms.com/	Payload
\.


--
-- Data for Name: footer_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.footer_rels (id, "order", parent_id, path, pages_id, posts_id) FROM stdin;
\.


--
-- Data for Name: form_submissions; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.form_submissions (id, form_id, erp_status, erp_lead_id, erp_response, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: form_submissions_submission_data; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.form_submissions_submission_data (_order, _parent_id, id, field, value) FROM stdin;
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms (id, title, submit_button_label, confirmation_type, confirmation_message, redirect_url, enable_erp_push, frappe_url, api_method, updated_at, created_at) FROM stdin;
1	Contact Form	Submit	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The contact form has been submitted successfully.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	f	\N	receive_website_lead	2023-01-12 21:47:41.374+00	2023-01-12 21:47:41.374+00
\.


--
-- Data for Name: forms_blocks_checkbox; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_blocks_checkbox (_order, _parent_id, _path, id, name, label, width, required, default_value, block_name) FROM stdin;
\.


--
-- Data for Name: forms_blocks_country; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_blocks_country (_order, _parent_id, _path, id, name, label, width, required, block_name) FROM stdin;
\.


--
-- Data for Name: forms_blocks_email; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_blocks_email (_order, _parent_id, _path, id, name, label, width, required, block_name) FROM stdin;
2	1	fields	6a840f9538da0e893663eaf8	email	Email	100	t	email
\.


--
-- Data for Name: forms_blocks_message; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_blocks_message (_order, _parent_id, _path, id, message, block_name) FROM stdin;
\.


--
-- Data for Name: forms_blocks_number; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_blocks_number (_order, _parent_id, _path, id, name, label, width, default_value, required, block_name) FROM stdin;
3	1	fields	6a840f9538da0e893663eaf9	phone	Phone	100	\N	f	phone
\.


--
-- Data for Name: forms_blocks_select; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_blocks_select (_order, _parent_id, _path, id, name, label, width, default_value, placeholder, required, block_name) FROM stdin;
\.


--
-- Data for Name: forms_blocks_select_options; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_blocks_select_options (_order, _parent_id, id, label, value) FROM stdin;
\.


--
-- Data for Name: forms_blocks_state; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_blocks_state (_order, _parent_id, _path, id, name, label, width, required, block_name) FROM stdin;
\.


--
-- Data for Name: forms_blocks_text; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_blocks_text (_order, _parent_id, _path, id, name, label, width, default_value, required, block_name) FROM stdin;
1	1	fields	6a840f9538da0e893663eaf7	full-name	Full Name	100	\N	t	full-name
\.


--
-- Data for Name: forms_blocks_textarea; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_blocks_textarea (_order, _parent_id, _path, id, name, label, width, default_value, required, block_name) FROM stdin;
4	1	fields	6a840f9538da0e893663eafa	message	Message	100	\N	t	message
\.


--
-- Data for Name: forms_emails; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_emails (_order, _parent_id, id, email_to, cc, bcc, reply_to, email_from, subject, message) FROM stdin;
1	1	6a840f9538da0e893663eafb	{{email}}	\N	\N	\N	"Payload" <demo@payloadcms.com>	You've received a new message.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Your contact form submission was successfully received.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}
\.


--
-- Data for Name: forms_field_mapping; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_field_mapping (_order, _parent_id, id, form_field, frappe_field) FROM stdin;
\.


--
-- Data for Name: forms_static_fields; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.forms_static_fields (_order, _parent_id, id, frappe_field, value) FROM stdin;
\.


--
-- Data for Name: header; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.header (id, updated_at, created_at) FROM stdin;
1	2026-08-18 07:50:23.215+00	2026-08-18 07:50:23.215+00
\.


--
-- Data for Name: header_nav_items; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.header_nav_items (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label) FROM stdin;
1	1	6a84189eb6c78f9ba0732ee1	custom	\N	/	Home
2	1	6a84189eb6c78f9ba0732ee2	custom	\N	/properties	Properties
3	1	6a84189eb6c78f9ba0732ee3	reference	\N	\N	Concierge
4	1	6a84189eb6c78f9ba0732ee4	custom	\N	/blogs	Blogs
5	1	6a84189eb6c78f9ba0732ee5	reference	\N	\N	About
6	1	6a84189eb6c78f9ba0732ee6	reference	\N	\N	Contact
\.


--
-- Data for Name: header_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.header_rels (id, "order", parent_id, path, pages_id, posts_id) FROM stdin;
1	\N	1	navItems.1.link.reference	1	\N
8	\N	1	navItems.2.link.reference	4	\N
9	\N	1	navItems.4.link.reference	3	\N
10	\N	1	navItems.5.link.reference	1	\N
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) FROM stdin;
10	Curving abstract shapes with an orange and blue gradient	\N	\N	2026-08-18 08:29:10.363+00	2026-08-18 08:29:10.363+00	/api/media/file/image-post2-5.webp	\N	image-post2-5.webp	image/webp	21388	1920	1080	50	50	/api/media/file/image-post2-5-300x169.webp	300	169	image/webp	2246	image-post2-5-300x169.webp	/api/media/file/image-post2-5-700x500.webp	700	500	image/webp	7440	image-post2-5-700x500.webp	/api/media/file/image-post2-5-1600x900.webp	1600	900	image/webp	16516	image-post2-5-1600x900.webp	/api/media/file/image-post2-5-900x506.webp	900	506	image/webp	7998	image-post2-5-900x506.webp	/api/media/file/image-post2-5-1400x788.webp	1400	788	image/webp	13860	image-post2-5-1400x788.webp	/api/media/file/image-post2-5-1920x1080.webp	1920	1080	image/webp	21388	image-post2-5-1920x1080.webp	/api/media/file/image-post2-5-1200x630.webp	1200	630	image/webp	10856	image-post2-5-1200x630.webp
11	Curving abstract shapes with an orange and blue gradient	\N	\N	2026-08-18 08:29:12.328+00	2026-08-18 08:29:12.328+00	/api/media/file/image-post3-5.webp	\N	image-post3-5.webp	image/webp	14006	1920	1080	50	50	/api/media/file/image-post3-5-300x169.webp	300	169	image/webp	1228	image-post3-5-300x169.webp	/api/media/file/image-post3-5-700x500.webp	700	500	image/webp	4438	image-post3-5-700x500.webp	/api/media/file/image-post3-5-1600x900.webp	1600	900	image/webp	10600	image-post3-5-1600x900.webp	/api/media/file/image-post3-5-900x506.webp	900	506	image/webp	4900	image-post3-5-900x506.webp	/api/media/file/image-post3-5-1400x788.webp	1400	788	image/webp	8860	image-post3-5-1400x788.webp	/api/media/file/image-post3-5-1920x1080.webp	1920	1080	image/webp	14006	image-post3-5-1920x1080.webp	/api/media/file/image-post3-5-1200x630.webp	1200	630	image/webp	6830	image-post3-5-1200x630.webp
12	Straight metallic shapes with a blue gradient	\N	\N	2026-08-18 08:29:14.962+00	2026-08-18 08:29:14.962+00	/api/media/file/image-hero1-5.webp	\N	image-hero1-5.webp	image/webp	47068	3200	1800	50	50	/api/media/file/image-hero1-5-300x169.webp	300	169	image/webp	2538	image-hero1-5-300x169.webp	/api/media/file/image-hero1-5-700x500.webp	700	500	image/webp	6836	image-hero1-5-700x500.webp	/api/media/file/image-hero1-5-1600x900.webp	1600	900	image/webp	19442	image-hero1-5-1600x900.webp	/api/media/file/image-hero1-5-900x506.webp	900	506	image/webp	9314	image-hero1-5-900x506.webp	/api/media/file/image-hero1-5-1400x788.webp	1400	788	image/webp	16012	image-hero1-5-1400x788.webp	/api/media/file/image-hero1-5-1920x1080.webp	1920	1080	image/webp	24024	image-hero1-5-1920x1080.webp	/api/media/file/image-hero1-5-1200x630.webp	1200	630	image/webp	12664	image-hero1-5-1200x630.webp
13	Screenshot From 2026-06-17 16-54-24.png	\N	\N	2026-08-18 08:29:16.602+00	2026-08-18 08:29:16.602+00	/api/media/file/Screenshot%20From%202026-06-17%2016-54-24.png	\N	Screenshot From 2026-06-17 16-54-24.png	image/png	340328	1920	1080	50	50	/api/media/file/Screenshot%20From%202026-06-17%2016-54-24-300x169.png	300	169	image/png	31969	Screenshot From 2026-06-17 16-54-24-300x169.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-24-700x500.png	700	500	image/png	140260	Screenshot From 2026-06-17 16-54-24-700x500.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-24-1600x900.png	1600	900	image/png	401021	Screenshot From 2026-06-17 16-54-24-1600x900.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-24-900x506.png	900	506	image/png	171099	Screenshot From 2026-06-17 16-54-24-900x506.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-24-1400x788.png	1400	788	image/png	335047	Screenshot From 2026-06-17 16-54-24-1400x788.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-24-1920x1080.png	1920	1080	image/png	433956	Screenshot From 2026-06-17 16-54-24-1920x1080.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-24-1200x630.png	1200	630	image/png	256711	Screenshot From 2026-06-17 16-54-24-1200x630.png
14	Potomac Exterior Updated	\N	\N	2026-08-18 08:29:18.789+00	2026-08-18 08:29:18.789+00	/api/media/file/Potomac_Exterior_Updated-1.webp	\N	Potomac_Exterior_Updated-1.webp	image/webp	114920	1920	1080	50	50	/api/media/file/Potomac_Exterior_Updated-1-300x169.webp	300	169	image/webp	6262	Potomac_Exterior_Updated-1-300x169.webp	/api/media/file/Potomac_Exterior_Updated-1-700x500.webp	700	500	image/webp	31518	Potomac_Exterior_Updated-1-700x500.webp	/api/media/file/Potomac_Exterior_Updated-1-1600x900.webp	1600	900	image/webp	89662	Potomac_Exterior_Updated-1-1600x900.webp	/api/media/file/Potomac_Exterior_Updated-1-900x506.webp	900	506	image/webp	35488	Potomac_Exterior_Updated-1-900x506.webp	/api/media/file/Potomac_Exterior_Updated-1-1400x788.webp	1400	788	image/webp	72702	Potomac_Exterior_Updated-1-1400x788.webp	/api/media/file/Potomac_Exterior_Updated-1-1920x1080.webp	1920	1080	image/webp	114920	Potomac_Exterior_Updated-1-1920x1080.webp	/api/media/file/Potomac_Exterior_Updated-1-1200x630.webp	1200	630	image/webp	52682	Potomac_Exterior_Updated-1-1200x630.webp
15	034	\N	\N	2026-08-18 08:29:20.383+00	2026-08-18 08:29:20.383+00	/api/media/file/034-1.webp	\N	034-1.webp	image/webp	66138	770	514	50	50	/api/media/file/034-1-300x200.webp	300	200	image/webp	15614	034-1-300x200.webp	/api/media/file/034-1-700x500.webp	700	500	image/webp	61886	034-1-700x500.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	amh banner1 ezgif	\N	\N	2026-08-18 08:29:22.03+00	2026-08-18 08:29:22.029+00	/api/media/file/amh-banner1-ezgif.com-resize-1024x577-1.webp	\N	amh-banner1-ezgif.com-resize-1024x577-1.webp	image/webp	152886	1024	577	50	50	/api/media/file/amh-banner1-ezgif.com-resize-1024x577-1-300x169.webp	300	169	image/webp	16178	amh-banner1-ezgif.com-resize-1024x577-1-300x169.webp	/api/media/file/amh-banner1-ezgif.com-resize-1024x577-1-700x500.webp	700	500	image/webp	83192	amh-banner1-ezgif.com-resize-1024x577-1-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/amh-banner1-ezgif.com-resize-1024x577-1-900x507.webp	900	507	image/webp	116150	amh-banner1-ezgif.com-resize-1024x577-1-900x507.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	PineChase 1024x577	\N	\N	2026-08-18 08:29:23.68+00	2026-08-18 08:29:23.68+00	/api/media/file/PineChase-1024x577-1.webp	\N	PineChase-1024x577-1.webp	image/webp	82180	1024	577	50	50	/api/media/file/PineChase-1024x577-1-300x169.webp	300	169	image/webp	10972	PineChase-1024x577-1-300x169.webp	/api/media/file/PineChase-1024x577-1-700x500.webp	700	500	image/webp	47570	PineChase-1024x577-1-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/PineChase-1024x577-1-900x507.webp	900	507	image/webp	65310	PineChase-1024x577-1-900x507.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	1001Efront	\N	\N	2026-08-18 08:29:25.704+00	2026-08-18 08:29:25.704+00	/api/media/file/1001Efront-1.webp	\N	1001Efront-1.webp	image/webp	169090	1816	1024	50	50	/api/media/file/1001Efront-1-300x169.webp	300	169	image/webp	9706	1001Efront-1-300x169.webp	/api/media/file/1001Efront-1-700x500.webp	700	500	image/webp	44496	1001Efront-1-700x500.webp	/api/media/file/1001Efront-1-1600x902.webp	1600	902	image/webp	138782	1001Efront-1-1600x902.webp	/api/media/file/1001Efront-1-900x507.webp	900	507	image/webp	56578	1001Efront-1-900x507.webp	/api/media/file/1001Efront-1-1400x789.webp	1400	789	image/webp	114786	1001Efront-1-1400x789.webp	\N	\N	\N	\N	\N	\N	/api/media/file/1001Efront-1-1200x630.webp	1200	630	image/webp	83840	1001Efront-1-1200x630.webp
53	Other Inquiries Hero Image	\N	\N	2026-08-18 08:30:28.839+00	2026-08-18 08:30:28.839+00	/api/media/file/other-inquiries-hero-1.webp	\N	other-inquiries-hero-1.webp	image/webp	64066	701	1117	50	50	/api/media/file/other-inquiries-hero-1-300x478.webp	300	478	image/webp	17650	other-inquiries-hero-1-300x478.webp	/api/media/file/other-inquiries-hero-1-700x500.webp	700	500	image/webp	37418	other-inquiries-hero-1-700x500.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/other-inquiries-hero-1-1200x630.webp	1200	630	image/webp	47658	other-inquiries-hero-1-1200x630.webp
5	Curving abstract shapes with an orange and blue gradient	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Photo by ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://unsplash.com/@kirp", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "Andrew Kliatskyi", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " on Unsplash.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	\N	2026-08-18 07:53:22.641+00	2026-08-18 07:53:22.641+00	/api/media/file/image-post2-6.webp	\N	image-post2-6.webp	image/webp	22332	1920	1080	50	50	/api/media/file/image-post2-6-300x169.webp	300	169	image/webp	2248	image-post2-6-300x169.webp	/api/media/file/image-post2-6-700x500.webp	700	500	image/webp	7480	image-post2-6-700x500.webp	/api/media/file/image-post2-6-1600x900.webp	1600	900	image/webp	16760	image-post2-6-1600x900.webp	/api/media/file/image-post2-6-900x506.webp	900	506	image/webp	8036	image-post2-6-900x506.webp	/api/media/file/image-post2-6-1400x788.webp	1400	788	image/webp	13880	image-post2-6-1400x788.webp	/api/media/file/image-post2-6-1920x1080.webp	1920	1080	image/webp	22332	image-post2-6-1920x1080.webp	/api/media/file/image-post2-6-1200x630.webp	1200	630	image/webp	11010	image-post2-6-1200x630.webp
6	Curving abstract shapes with an orange and blue gradient	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Photo by ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://unsplash.com/@kirp", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "Andrew Kliatskyi", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " on Unsplash.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	\N	2026-08-18 07:53:22.643+00	2026-08-18 07:53:22.643+00	/api/media/file/image-post1-6.webp	\N	image-post1-6.webp	image/webp	15924	1920	1080	50	50	/api/media/file/image-post1-6-300x169.webp	300	169	image/webp	1524	image-post1-6-300x169.webp	/api/media/file/image-post1-6-700x500.webp	700	500	image/webp	4768	image-post1-6-700x500.webp	/api/media/file/image-post1-6-1600x900.webp	1600	900	image/webp	12010	image-post1-6-1600x900.webp	/api/media/file/image-post1-6-900x506.webp	900	506	image/webp	5936	image-post1-6-900x506.webp	/api/media/file/image-post1-6-1400x788.webp	1400	788	image/webp	10210	image-post1-6-1400x788.webp	/api/media/file/image-post1-6-1920x1080.webp	1920	1080	image/webp	15924	image-post1-6-1920x1080.webp	/api/media/file/image-post1-6-1200x630.webp	1200	630	image/webp	8114	image-post1-6-1200x630.webp
7	Curving abstract shapes with an orange and blue gradient	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Photo by ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://unsplash.com/@kirp", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "Andrew Kliatskyi", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " on Unsplash.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	\N	2026-08-18 07:53:22.902+00	2026-08-18 07:53:22.902+00	/api/media/file/image-post3-6.webp	\N	image-post3-6.webp	image/webp	14662	1920	1080	50	50	/api/media/file/image-post3-6-300x169.webp	300	169	image/webp	1240	image-post3-6-300x169.webp	/api/media/file/image-post3-6-700x500.webp	700	500	image/webp	4556	image-post3-6-700x500.webp	/api/media/file/image-post3-6-1600x900.webp	1600	900	image/webp	10840	image-post3-6-1600x900.webp	/api/media/file/image-post3-6-900x506.webp	900	506	image/webp	5010	image-post3-6-900x506.webp	/api/media/file/image-post3-6-1400x788.webp	1400	788	image/webp	9070	image-post3-6-1400x788.webp	/api/media/file/image-post3-6-1920x1080.webp	1920	1080	image/webp	14662	image-post3-6-1920x1080.webp	/api/media/file/image-post3-6-1200x630.webp	1200	630	image/webp	6950	image-post3-6-1200x630.webp
8	Straight metallic shapes with a blue gradient	\N	\N	2026-08-18 07:53:23.135+00	2026-08-18 07:53:23.135+00	/api/media/file/image-hero1-6.webp	\N	image-hero1-6.webp	image/webp	49432	3200	1800	50	50	/api/media/file/image-hero1-6-300x169.webp	300	169	image/webp	2544	image-hero1-6-300x169.webp	/api/media/file/image-hero1-6-700x500.webp	700	500	image/webp	7078	image-hero1-6-700x500.webp	/api/media/file/image-hero1-6-1600x900.webp	1600	900	image/webp	19486	image-hero1-6-1600x900.webp	/api/media/file/image-hero1-6-900x506.webp	900	506	image/webp	9402	image-hero1-6-900x506.webp	/api/media/file/image-hero1-6-1400x788.webp	1400	788	image/webp	16492	image-hero1-6-1400x788.webp	/api/media/file/image-hero1-6-1920x1080.webp	1920	1080	image/webp	24346	image-hero1-6-1920x1080.webp	/api/media/file/image-hero1-6-1200x630.webp	1200	630	image/webp	12846	image-hero1-6-1200x630.webp
9	Curving abstract shapes with an orange and blue gradient	\N	\N	2026-08-18 08:29:08.349+00	2026-08-18 08:29:08.348+00	/api/media/file/image-post1-5.webp	\N	image-post1-5.webp	image/webp	15432	1920	1080	50	50	/api/media/file/image-post1-5-300x169.webp	300	169	image/webp	1536	image-post1-5-300x169.webp	/api/media/file/image-post1-5-700x500.webp	700	500	image/webp	4682	image-post1-5-700x500.webp	/api/media/file/image-post1-5-1600x900.webp	1600	900	image/webp	11828	image-post1-5-1600x900.webp	/api/media/file/image-post1-5-900x506.webp	900	506	image/webp	5832	image-post1-5-900x506.webp	/api/media/file/image-post1-5-1400x788.webp	1400	788	image/webp	9962	image-post1-5-1400x788.webp	/api/media/file/image-post1-5-1920x1080.webp	1920	1080	image/webp	15432	image-post1-5-1920x1080.webp	/api/media/file/image-post1-5-1200x630.webp	1200	630	image/webp	7908	image-post1-5-1200x630.webp
52	Trade Inquiry Hero Image	\N	\N	2026-08-18 08:30:26.687+00	2026-08-18 08:30:26.687+00	/api/media/file/trade-inquiry-hero-1.webp	\N	trade-inquiry-hero-1.webp	image/webp	137172	701	1196	50	50	/api/media/file/trade-inquiry-hero-1-300x512.webp	300	512	image/webp	30792	trade-inquiry-hero-1-300x512.webp	/api/media/file/trade-inquiry-hero-1-700x500.webp	700	500	image/webp	69418	trade-inquiry-hero-1-700x500.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/trade-inquiry-hero-1-1200x630.webp	1200	630	image/webp	89492	trade-inquiry-hero-1-1200x630.webp
19	Potomac Exterior Updated	\N	\N	2026-08-18 08:29:27.817+00	2026-08-18 08:29:27.817+00	/api/media/file/Potomac_Exterior_Updated-2.webp	\N	Potomac_Exterior_Updated-2.webp	image/webp	114920	1920	1080	50	50	/api/media/file/Potomac_Exterior_Updated-2-300x169.webp	300	169	image/webp	6262	Potomac_Exterior_Updated-2-300x169.webp	/api/media/file/Potomac_Exterior_Updated-2-700x500.webp	700	500	image/webp	31518	Potomac_Exterior_Updated-2-700x500.webp	/api/media/file/Potomac_Exterior_Updated-2-1600x900.webp	1600	900	image/webp	89662	Potomac_Exterior_Updated-2-1600x900.webp	/api/media/file/Potomac_Exterior_Updated-2-900x506.webp	900	506	image/webp	35488	Potomac_Exterior_Updated-2-900x506.webp	/api/media/file/Potomac_Exterior_Updated-2-1400x788.webp	1400	788	image/webp	72702	Potomac_Exterior_Updated-2-1400x788.webp	/api/media/file/Potomac_Exterior_Updated-2-1920x1080.webp	1920	1080	image/webp	114920	Potomac_Exterior_Updated-2-1920x1080.webp	/api/media/file/Potomac_Exterior_Updated-2-1200x630.webp	1200	630	image/webp	52682	Potomac_Exterior_Updated-2-1200x630.webp
20	034	\N	\N	2026-08-18 08:29:29.401+00	2026-08-18 08:29:29.401+00	/api/media/file/034-2.webp	\N	034-2.webp	image/webp	66138	770	514	50	50	/api/media/file/034-2-300x200.webp	300	200	image/webp	15614	034-2-300x200.webp	/api/media/file/034-2-700x500.webp	700	500	image/webp	61886	034-2-700x500.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	amh banner1 ezgif	\N	\N	2026-08-18 08:29:31.077+00	2026-08-18 08:29:31.077+00	/api/media/file/amh-banner1-ezgif.com-resize-1024x577-2.webp	\N	amh-banner1-ezgif.com-resize-1024x577-2.webp	image/webp	152886	1024	577	50	50	/api/media/file/amh-banner1-ezgif.com-resize-1024x577-2-300x169.webp	300	169	image/webp	16178	amh-banner1-ezgif.com-resize-1024x577-2-300x169.webp	/api/media/file/amh-banner1-ezgif.com-resize-1024x577-2-700x500.webp	700	500	image/webp	83192	amh-banner1-ezgif.com-resize-1024x577-2-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/amh-banner1-ezgif.com-resize-1024x577-2-900x507.webp	900	507	image/webp	116150	amh-banner1-ezgif.com-resize-1024x577-2-900x507.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	PineChase 1024x577	\N	\N	2026-08-18 08:29:32.707+00	2026-08-18 08:29:32.707+00	/api/media/file/PineChase-1024x577-2.webp	\N	PineChase-1024x577-2.webp	image/webp	82180	1024	577	50	50	/api/media/file/PineChase-1024x577-2-300x169.webp	300	169	image/webp	10972	PineChase-1024x577-2-300x169.webp	/api/media/file/PineChase-1024x577-2-700x500.webp	700	500	image/webp	47570	PineChase-1024x577-2-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/PineChase-1024x577-2-900x507.webp	900	507	image/webp	65310	PineChase-1024x577-2-900x507.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	1001Efront	\N	\N	2026-08-18 08:29:35.255+00	2026-08-18 08:29:35.255+00	/api/media/file/1001Efront-2.webp	\N	1001Efront-2.webp	image/webp	169090	1816	1024	50	50	/api/media/file/1001Efront-2-300x169.webp	300	169	image/webp	9706	1001Efront-2-300x169.webp	/api/media/file/1001Efront-2-700x500.webp	700	500	image/webp	44496	1001Efront-2-700x500.webp	/api/media/file/1001Efront-2-1600x902.webp	1600	902	image/webp	138782	1001Efront-2-1600x902.webp	/api/media/file/1001Efront-2-900x507.webp	900	507	image/webp	56578	1001Efront-2-900x507.webp	/api/media/file/1001Efront-2-1400x789.webp	1400	789	image/webp	114786	1001Efront-2-1400x789.webp	\N	\N	\N	\N	\N	\N	/api/media/file/1001Efront-2-1200x630.webp	1200	630	image/webp	83840	1001Efront-2-1200x630.webp
24	3dtour	\N	\N	2026-08-18 08:29:38.557+00	2026-08-18 08:29:38.557+00	/api/media/file/3dtour-1.webp	\N	3dtour-1.webp	image/webp	50854	1289	522	50	50	/api/media/file/3dtour-1-300x121.webp	300	121	image/webp	8028	3dtour-1-300x121.webp	/api/media/file/3dtour-1-700x500.webp	700	500	image/webp	55916	3dtour-1-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/3dtour-1-900x364.webp	900	364	image/webp	68584	3dtour-1-900x364.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/3dtour-1-1200x630.webp	1200	630	image/webp	105076	3dtour-1-1200x630.webp
25	concierge services	\N	\N	2026-08-18 08:29:40.399+00	2026-08-18 08:29:40.399+00	/api/media/file/concierge-services-1.webp	\N	concierge-services-1.webp	image/webp	141230	1269	1268	50	50	/api/media/file/concierge-services-1-300x300.webp	300	300	image/webp	9618	concierge-services-1-300x300.webp	/api/media/file/concierge-services-1-700x500.webp	700	500	image/webp	33118	concierge-services-1-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/concierge-services-1-900x899.webp	900	899	image/webp	74522	concierge-services-1-900x899.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/concierge-services-1-1200x630.webp	1200	630	image/webp	67550	concierge-services-1-1200x630.webp
26	WEBSITE 1	\N	\N	2026-08-18 08:29:41.783+00	2026-08-18 08:29:41.783+00	/api/media/file/WEBSITE-2.mov	\N	WEBSITE-2.mov	video/quicktime	7151535	1200	800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	Concierge Hero Banner	\N	\N	2026-08-18 08:29:43.333+00	2026-08-18 08:29:43.333+00	/api/media/file/hero-banner.webp	\N	hero-banner.webp	image/webp	23726	1024	408	50	50	/api/media/file/hero-banner-300x120.webp	300	120	image/webp	6126	hero-banner-300x120.webp	/api/media/file/hero-banner-700x500.webp	700	500	image/webp	20282	hero-banner-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/hero-banner-900x359.webp	900	359	image/webp	21022	hero-banner-900x359.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	How it works illustration	\N	\N	2026-08-18 08:29:59.022+00	2026-08-18 08:29:59.022+00	/api/media/file/howitwork.webp	\N	howitwork.webp	image/webp	41036	629	808	50	50	/api/media/file/howitwork-300x385.webp	300	385	image/webp	17682	howitwork-300x385.webp	/api/media/file/howitwork-700x500.webp	700	500	image/webp	30486	howitwork-700x500.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/howitwork-1200x630.webp	1200	630	image/webp	41548	howitwork-1200x630.webp
39	Our Story Banner	\N	\N	2026-08-18 08:30:00.622+00	2026-08-18 08:30:00.622+00	/api/media/file/ourstorybanner.webp	\N	ourstorybanner.webp	image/webp	32300	1024	385	50	50	/api/media/file/ourstorybanner-300x113.webp	300	113	image/webp	6934	ourstorybanner-300x113.webp	/api/media/file/ourstorybanner-700x500.webp	700	500	image/webp	26996	ourstorybanner-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/ourstorybanner-900x338.webp	900	338	image/webp	27894	ourstorybanner-900x338.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	Why Choose Novel Signature Homes	\N	\N	2026-08-18 08:30:02.628+00	2026-08-18 08:30:02.628+00	/api/media/file/whychoose.webp	\N	whychoose.webp	image/webp	20820	351	716	50	50	/api/media/file/whychoose-300x612.webp	300	612	image/webp	17356	whychoose-300x612.webp	/api/media/file/whychoose-700x500.webp	700	500	image/webp	17420	whychoose-700x500.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/whychoose-1200x630.webp	1200	630	image/webp	23800	whychoose-1200x630.webp
29	Move In / Move out Services	\N	\N	2026-08-18 10:49:37.98+00	2026-08-18 08:29:46.061+00	/api/media/file/delivery.webp	\N	delivery.webp	image/webp	3310	94	95	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	Utility transfer	\N	\N	2026-08-18 10:49:39.809+00	2026-08-18 08:29:47.581+00	/api/media/file/documents.webp	\N	documents.webp	image/webp	636	96	95	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	Design consultation	\N	\N	2026-08-18 10:49:41.625+00	2026-08-18 08:29:48.943+00	/api/media/file/human-resources.webp	\N	human-resources.webp	image/webp	3830	94	95	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	Furnitures & Décor selection	\N	\N	2026-08-18 10:49:43.438+00	2026-08-18 08:29:50.302+00	/api/media/file/couch.webp	\N	couch.webp	image/webp	2082	96	95	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	Blinds and Window Treatments	\N	\N	2026-08-18 10:49:45.261+00	2026-08-18 08:29:51.653+00	/api/media/file/curtain.webp	\N	curtain.webp	image/webp	576	96	95	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	Landscaping Services	\N	\N	2026-08-18 10:49:47.144+00	2026-08-18 08:29:53.033+00	/api/media/file/gardening.webp	\N	gardening.webp	image/webp	4016	96	95	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	Plumbing and Mechanical Maintenance	\N	\N	2026-08-18 10:49:48.955+00	2026-08-18 08:29:54.398+00	/api/media/file/tap.webp	\N	tap.webp	image/webp	866	94	95	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	Handyman Service	\N	\N	2026-08-18 10:49:50.772+00	2026-08-18 08:29:55.761+00	/api/media/file/wrench.webp	\N	wrench.webp	image/webp	954	94	94	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	Project manager Support	\N	\N	2026-08-18 10:49:52.589+00	2026-08-18 08:29:57.124+00	/api/media/file/employee.webp	\N	employee.webp	image/webp	2904	94	95	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	Luxury House Exterior	\N	\N	2026-08-18 08:30:04.758+00	2026-08-18 08:30:04.758+00	/api/media/file/house-exterior.webp	\N	house-exterior.webp	image/webp	114920	1920	1080	50	50	/api/media/file/house-exterior-300x169.webp	300	169	image/webp	6262	house-exterior-300x169.webp	/api/media/file/house-exterior-700x500.webp	700	500	image/webp	31518	house-exterior-700x500.webp	/api/media/file/house-exterior-1600x900.webp	1600	900	image/webp	89662	house-exterior-1600x900.webp	/api/media/file/house-exterior-900x506.webp	900	506	image/webp	35488	house-exterior-900x506.webp	/api/media/file/house-exterior-1400x788.webp	1400	788	image/webp	72702	house-exterior-1400x788.webp	/api/media/file/house-exterior-1920x1080.webp	1920	1080	image/webp	114920	house-exterior-1920x1080.webp	/api/media/file/house-exterior-1200x630.webp	1200	630	image/webp	52682	house-exterior-1200x630.webp
42	Luxury Living Room Interior	\N	\N	2026-08-18 08:30:06.341+00	2026-08-18 08:30:06.341+00	/api/media/file/living-room.webp	\N	living-room.webp	image/webp	66138	770	514	50	50	/api/media/file/living-room-300x200.webp	300	200	image/webp	15614	living-room-300x200.webp	/api/media/file/living-room-700x500.webp	700	500	image/webp	61886	living-room-700x500.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	Woodland Heights, Houston: The Neighborhood That Rewards the Right Buyer	\N	\N	2026-08-18 08:30:07.972+00	2026-08-18 08:30:07.971+00	/api/media/file/blog_hero_1.jpg	\N	blog_hero_1.jpg	image/jpeg	1276375	2560	1920	50	50	/api/media/file/blog_hero_1-300x225.jpg	300	225	image/jpeg	23297	blog_hero_1-300x225.jpg	/api/media/file/blog_hero_1-700x500.jpg	700	500	image/jpeg	108115	blog_hero_1-700x500.jpg	/api/media/file/blog_hero_1-1600x1200.jpg	1600	1200	image/jpeg	524311	blog_hero_1-1600x1200.jpg	/api/media/file/blog_hero_1-900x675.jpg	900	675	image/jpeg	182186	blog_hero_1-900x675.jpg	/api/media/file/blog_hero_1-1400x1050.jpg	1400	1050	image/jpeg	413206	blog_hero_1-1400x1050.jpg	/api/media/file/blog_hero_1-1920x1440.jpg	1920	1440	image/jpeg	724867	blog_hero_1-1920x1440.jpg	/api/media/file/blog_hero_1-1200x630.jpg	1200	630	image/jpeg	229625	blog_hero_1-1200x630.jpg
44	The Digital Frontier: Houston’s .7 Billion Luxury Real Estate Evolution	\N	\N	2026-08-18 08:30:10.712+00	2026-08-18 08:30:10.712+00	/api/media/file/blog_hero_2.webp	\N	blog_hero_2.webp	image/webp	557054	1920	1080	50	50	/api/media/file/blog_hero_2-300x169.webp	300	169	image/webp	17648	blog_hero_2-300x169.webp	/api/media/file/blog_hero_2-700x500.webp	700	500	image/webp	109640	blog_hero_2-700x500.webp	/api/media/file/blog_hero_2-1600x900.webp	1600	900	image/webp	395728	blog_hero_2-1600x900.webp	/api/media/file/blog_hero_2-900x506.webp	900	506	image/webp	139280	blog_hero_2-900x506.webp	/api/media/file/blog_hero_2-1400x788.webp	1400	788	image/webp	311846	blog_hero_2-1400x788.webp	/api/media/file/blog_hero_2-1920x1080.webp	1920	1080	image/webp	557054	blog_hero_2-1920x1080.webp	/api/media/file/blog_hero_2-1200x630.webp	1200	630	image/webp	228016	blog_hero_2-1200x630.webp
45	Real Estate vs. the Stock Market in 2025	\N	\N	2026-08-18 08:30:12.395+00	2026-08-18 08:30:12.395+00	/api/media/file/blog_hero_3.png	\N	blog_hero_3.png	image/png	1942136	1024	940	50	50	/api/media/file/blog_hero_3-300x275.png	300	275	image/png	223836	blog_hero_3-300x275.png	/api/media/file/blog_hero_3-700x500.png	700	500	image/png	941638	blog_hero_3-700x500.png	\N	\N	\N	\N	\N	\N	/api/media/file/blog_hero_3-900x826.png	900	826	image/png	1950149	blog_hero_3-900x826.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/blog_hero_3-1200x630.png	1200	630	image/png	1953027	blog_hero_3-1200x630.png
46	Why Does 2025 Feel Like the Right Time to Buy Luxury Real Estate in Texas	\N	\N	2026-08-18 08:30:13.867+00	2026-08-18 08:30:13.867+00	/api/media/file/blog_hero_4.jpg	\N	blog_hero_4.jpg	image/jpeg	510815	2560	1118	50	50	/api/media/file/blog_hero_4-300x131.jpg	300	131	image/jpeg	8881	blog_hero_4-300x131.jpg	/api/media/file/blog_hero_4-700x500.jpg	700	500	image/jpeg	70280	blog_hero_4-700x500.jpg	/api/media/file/blog_hero_4-1600x699.jpg	1600	699	image/jpeg	203581	blog_hero_4-1600x699.jpg	/api/media/file/blog_hero_4-900x393.jpg	900	393	image/jpeg	68069	blog_hero_4-900x393.jpg	/api/media/file/blog_hero_4-1400x611.jpg	1400	611	image/jpeg	159026	blog_hero_4-1400x611.jpg	/api/media/file/blog_hero_4-1920x839.jpg	1920	839	image/jpeg	283563	blog_hero_4-1920x839.jpg	/api/media/file/blog_hero_4-1200x630.jpg	1200	630	image/jpeg	141291	blog_hero_4-1200x630.jpg
47	Westhaven Estates: Houston’s Hidden Gem of Urban Luxury	\N	\N	2026-08-18 08:30:16.012+00	2026-08-18 08:30:16.012+00	/api/media/file/blog_hero_5.webp	\N	blog_hero_5.webp	image/webp	106242	2560	1135	50	50	/api/media/file/blog_hero_5-300x133.webp	300	133	image/webp	6096	blog_hero_5-300x133.webp	/api/media/file/blog_hero_5-700x500.webp	700	500	image/webp	21756	blog_hero_5-700x500.webp	/api/media/file/blog_hero_5-1600x709.webp	1600	709	image/webp	54658	blog_hero_5-1600x709.webp	/api/media/file/blog_hero_5-900x399.webp	900	399	image/webp	25190	blog_hero_5-900x399.webp	/api/media/file/blog_hero_5-1400x621.webp	1400	621	image/webp	46728	blog_hero_5-1400x621.webp	/api/media/file/blog_hero_5-1920x851.webp	1920	851	image/webp	69564	blog_hero_5-1920x851.webp	/api/media/file/blog_hero_5-1200x630.webp	1200	630	image/webp	39790	blog_hero_5-1200x630.webp
48	How Thoughtful Design and Craftsmanship Define Modern Luxury Living	\N	\N	2026-08-18 08:30:17.757+00	2026-08-18 08:30:17.756+00	/api/media/file/blog_hero_6.webp	\N	blog_hero_6.webp	image/webp	64998	1024	803	50	50	/api/media/file/blog_hero_6-300x235.webp	300	235	image/webp	9438	blog_hero_6-300x235.webp	/api/media/file/blog_hero_6-700x500.webp	700	500	image/webp	32982	blog_hero_6-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/blog_hero_6-900x706.webp	900	706	image/webp	51002	blog_hero_6-900x706.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/blog_hero_6-1200x630.webp	1200	630	image/webp	60006	blog_hero_6-1200x630.webp
49	The Must-Have List for Houston’s Luxury Home Buyers	\N	\N	2026-08-18 08:30:19.252+00	2026-08-18 08:30:19.252+00	/api/media/file/blog_hero_7.png	\N	blog_hero_7.png	image/png	1355897	1024	613	50	50	/api/media/file/blog_hero_7-300x180.png	300	180	image/png	144872	blog_hero_7-300x180.png	/api/media/file/blog_hero_7-700x500.png	700	500	image/png	912114	blog_hero_7-700x500.png	\N	\N	\N	\N	\N	\N	/api/media/file/blog_hero_7-900x539.png	900	539	image/png	1283631	blog_hero_7-900x539.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	The Rise of Luxury Living in Texas: Why Everyone’s Moving South?	\N	\N	2026-08-18 08:30:22.442+00	2026-08-18 08:30:22.442+00	/api/media/file/blog_hero_8.webp	\N	blog_hero_8.webp	image/webp	729418	2560	1440	50	50	/api/media/file/blog_hero_8-300x169.webp	300	169	image/webp	16896	blog_hero_8-300x169.webp	/api/media/file/blog_hero_8-700x500.webp	700	500	image/webp	95118	blog_hero_8-700x500.webp	/api/media/file/blog_hero_8-1600x900.webp	1600	900	image/webp	334776	blog_hero_8-1600x900.webp	/api/media/file/blog_hero_8-900x506.webp	900	506	image/webp	123766	blog_hero_8-900x506.webp	/api/media/file/blog_hero_8-1400x788.webp	1400	788	image/webp	270682	blog_hero_8-1400x788.webp	/api/media/file/blog_hero_8-1920x1080.webp	1920	1080	image/webp	458782	blog_hero_8-1920x1080.webp	/api/media/file/blog_hero_8-1200x630.webp	1200	630	image/webp	198160	blog_hero_8-1200x630.webp
51	Buy A Home Hero Image	\N	\N	2026-08-18 08:30:24.465+00	2026-08-18 08:30:24.465+00	/api/media/file/buy-a-home-sales-1.webp	\N	buy-a-home-sales-1.webp	image/webp	75214	700	1128	50	50	/api/media/file/buy-a-home-sales-1-300x483.webp	300	483	image/webp	23080	buy-a-home-sales-1-300x483.webp	/api/media/file/buy-a-home-sales-1-700x500.webp	700	500	image/webp	40508	buy-a-home-sales-1-700x500.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/buy-a-home-sales-1-1200x630.webp	1200	630	image/webp	48446	buy-a-home-sales-1-1200x630.webp
54	Screenshot From 2026-06-17 16-54-25.png	\N	\N	2026-08-18 08:30:30.461+00	2026-08-18 08:30:30.46+00	/api/media/file/Screenshot%20From%202026-06-17%2016-54-25.png	\N	Screenshot From 2026-06-17 16-54-25.png	image/png	340328	1920	1080	50	50	/api/media/file/Screenshot%20From%202026-06-17%2016-54-25-300x169.png	300	169	image/png	31969	Screenshot From 2026-06-17 16-54-25-300x169.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-25-700x500.png	700	500	image/png	140260	Screenshot From 2026-06-17 16-54-25-700x500.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-25-1600x900.png	1600	900	image/png	401021	Screenshot From 2026-06-17 16-54-25-1600x900.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-25-900x506.png	900	506	image/png	171099	Screenshot From 2026-06-17 16-54-25-900x506.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-25-1400x788.png	1400	788	image/png	335047	Screenshot From 2026-06-17 16-54-25-1400x788.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-25-1920x1080.png	1920	1080	image/png	433956	Screenshot From 2026-06-17 16-54-25-1920x1080.png	/api/media/file/Screenshot%20From%202026-06-17%2016-54-25-1200x630.png	1200	630	image/png	256711	Screenshot From 2026-06-17 16-54-25-1200x630.png
55	Screenshot From 2026-06-17 17-05-56.png	\N	\N	2026-08-18 08:30:32.217+00	2026-08-18 08:30:32.217+00	/api/media/file/Screenshot%20From%202026-06-17%2017-05-56.png	\N	Screenshot From 2026-06-17 17-05-56.png	image/png	420293	2745	1080	50	50	/api/media/file/Screenshot%20From%202026-06-17%2017-05-56-300x118.png	300	118	image/png	28400	Screenshot From 2026-06-17 17-05-56-300x118.png	/api/media/file/Screenshot%20From%202026-06-17%2017-05-56-700x500.png	700	500	image/png	114391	Screenshot From 2026-06-17 17-05-56-700x500.png	/api/media/file/Screenshot%20From%202026-06-17%2017-05-56-1600x630.png	1600	630	image/png	363693	Screenshot From 2026-06-17 17-05-56-1600x630.png	/api/media/file/Screenshot%20From%202026-06-17%2017-05-56-900x354.png	900	354	image/png	153712	Screenshot From 2026-06-17 17-05-56-900x354.png	/api/media/file/Screenshot%20From%202026-06-17%2017-05-56-1400x551.png	1400	551	image/png	300587	Screenshot From 2026-06-17 17-05-56-1400x551.png	/api/media/file/Screenshot%20From%202026-06-17%2017-05-56-1920x755.png	1920	755	image/png	476905	Screenshot From 2026-06-17 17-05-56-1920x755.png	/api/media/file/Screenshot%20From%202026-06-17%2017-05-56-1200x630.png	1200	630	image/png	286098	Screenshot From 2026-06-17 17-05-56-1200x630.png
56	Screenshot From 2026-06-18 13-25-31.png	\N	\N	2026-08-18 08:30:33.712+00	2026-08-18 08:30:33.712+00	/api/media/file/Screenshot%20From%202026-06-18%2013-25-31.png	\N	Screenshot From 2026-06-18 13-25-31.png	image/png	311369	1440	900	50	50	/api/media/file/Screenshot%20From%202026-06-18%2013-25-31-300x188.png	300	188	image/png	46975	Screenshot From 2026-06-18 13-25-31-300x188.png	/api/media/file/Screenshot%20From%202026-06-18%2013-25-31-700x500.png	700	500	image/png	196818	Screenshot From 2026-06-18 13-25-31-700x500.png	\N	\N	\N	\N	\N	\N	/api/media/file/Screenshot%20From%202026-06-18%2013-25-31-900x563.png	900	563	image/png	251847	Screenshot From 2026-06-18 13-25-31-900x563.png	/api/media/file/Screenshot%20From%202026-06-18%2013-25-31-1400x875.png	1400	875	image/png	484614	Screenshot From 2026-06-18 13-25-31-1400x875.png	\N	\N	\N	\N	\N	\N	/api/media/file/Screenshot%20From%202026-06-18%2013-25-31-1200x630.png	1200	630	image/png	347457	Screenshot From 2026-06-18 13-25-31-1200x630.png
57	Screenshot From 2026-06-18 13-52-2.png	\N	\N	2026-08-18 08:30:35.309+00	2026-08-18 08:30:35.309+00	/api/media/file/Screenshot%20From%202026-06-18%2013-52-2.png	\N	Screenshot From 2026-06-18 13-52-2.png	image/png	399369	1920	1080	50	50	/api/media/file/Screenshot%20From%202026-06-18%2013-52-2-300x169.png	300	169	image/png	45101	Screenshot From 2026-06-18 13-52-2-300x169.png	/api/media/file/Screenshot%20From%202026-06-18%2013-52-2-700x500.png	700	500	image/png	176393	Screenshot From 2026-06-18 13-52-2-700x500.png	/api/media/file/Screenshot%20From%202026-06-18%2013-52-2-1600x900.png	1600	900	image/png	531206	Screenshot From 2026-06-18 13-52-2-1600x900.png	/api/media/file/Screenshot%20From%202026-06-18%2013-52-2-900x506.png	900	506	image/png	231602	Screenshot From 2026-06-18 13-52-2-900x506.png	/api/media/file/Screenshot%20From%202026-06-18%2013-52-2-1400x788.png	1400	788	image/png	446569	Screenshot From 2026-06-18 13-52-2-1400x788.png	/api/media/file/Screenshot%20From%202026-06-18%2013-52-2-1920x1080.png	1920	1080	image/png	340208	Screenshot From 2026-06-18 13-52-2-1920x1080.png	/api/media/file/Screenshot%20From%202026-06-18%2013-52-2-1200x630.png	1200	630	image/png	332536	Screenshot From 2026-06-18 13-52-2-1200x630.png
59	oak bayou 1	\N	\N	2026-08-18 08:30:36.686+00	2026-08-18 08:30:36.686+00	/api/media/file/oak-bayou-1.jpg	\N	oak-bayou-1.jpg	image/jpeg	114817	900	500	50	50	/api/media/file/oak-bayou-1-300x167.jpg	300	167	image/jpeg	12671	oak-bayou-1-300x167.jpg	/api/media/file/oak-bayou-1-700x500.jpg	700	500	image/jpeg	65508	oak-bayou-1-700x500.jpg	\N	\N	\N	\N	\N	\N	/api/media/file/oak-bayou-1-900x500.jpg	900	500	image/jpeg	91242	oak-bayou-1-900x500.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	magnific_houston skyline_2923689128 1024x701	\N	\N	2026-08-18 08:30:38.26+00	2026-08-18 08:30:38.26+00	/api/media/file/magnific_houston-skyline_2923689128-1024x701.png	\N	magnific_houston-skyline_2923689128-1024x701.png	image/png	1124939	1024	701	50	50	/api/media/file/magnific_houston-skyline_2923689128-1024x701-300x205.png	300	205	image/png	164851	magnific_houston-skyline_2923689128-1024x701-300x205.png	/api/media/file/magnific_houston-skyline_2923689128-1024x701-700x500.png	700	500	image/png	874178	magnific_houston-skyline_2923689128-1024x701-700x500.png	\N	\N	\N	\N	\N	\N	/api/media/file/magnific_houston-skyline_2923689128-1024x701-900x616.png	900	616	image/png	1353318	magnific_houston-skyline_2923689128-1024x701-900x616.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/magnific_houston-skyline_2923689128-1024x701-1200x630.png	1200	630	image/png	1823078	magnific_houston-skyline_2923689128-1024x701-1200x630.png
63	2434 White Oak 3 1024x576	\N	\N	2026-08-18 08:30:39.726+00	2026-08-18 08:30:39.726+00	/api/media/file/2434-White-Oak-3-1024x576.png	\N	2434-White-Oak-3-1024x576.png	image/png	1066835	1024	576	50	50	/api/media/file/2434-White-Oak-3-1024x576-300x169.png	300	169	image/png	142751	2434-White-Oak-3-1024x576-300x169.png	/api/media/file/2434-White-Oak-3-1024x576-700x500.png	700	500	image/png	882102	2434-White-Oak-3-1024x576-700x500.png	\N	\N	\N	\N	\N	\N	/api/media/file/2434-White-Oak-3-1024x576-900x506.png	900	506	image/png	1158878	2434-White-Oak-3-1024x576-900x506.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
65	01 1024x682	\N	\N	2026-08-18 08:30:41.169+00	2026-08-18 08:30:41.169+00	/api/media/file/01-1024x682.jpg	\N	01-1024x682.jpg	image/jpeg	173955	1024	682	50	50	/api/media/file/01-1024x682-300x200.jpg	300	200	image/jpeg	15749	01-1024x682-300x200.jpg	/api/media/file/01-1024x682-700x500.jpg	700	500	image/jpeg	80669	01-1024x682-700x500.jpg	\N	\N	\N	\N	\N	\N	/api/media/file/01-1024x682-900x599.jpg	900	599	image/jpeg	123072	01-1024x682-900x599.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/01-1024x682-1200x630.jpg	1200	630	image/jpeg	156185	01-1024x682-1200x630.jpg
67	Woodland Heights Hero Image	\N	\N	2026-08-18 08:30:42.738+00	2026-08-18 08:30:42.738+00	/api/media/file/50-scaled.jpg	\N	50-scaled.jpg	image/jpeg	1276375	2560	1920	50	50	/api/media/file/50-scaled-300x225.jpg	300	225	image/jpeg	23297	50-scaled-300x225.jpg	/api/media/file/50-scaled-700x500.jpg	700	500	image/jpeg	108115	50-scaled-700x500.jpg	/api/media/file/50-scaled-1600x1200.jpg	1600	1200	image/jpeg	524311	50-scaled-1600x1200.jpg	/api/media/file/50-scaled-900x675.jpg	900	675	image/jpeg	182186	50-scaled-900x675.jpg	/api/media/file/50-scaled-1400x1050.jpg	1400	1050	image/jpeg	413206	50-scaled-1400x1050.jpg	/api/media/file/50-scaled-1920x1440.jpg	1920	1440	image/jpeg	724867	50-scaled-1920x1440.jpg	/api/media/file/50-scaled-1200x630.jpg	1200	630	image/jpeg	229625	50-scaled-1200x630.jpg
69	digital-frontier-hero-1.webp	\N	\N	2026-08-18 08:30:44.402+00	2026-08-18 08:30:44.402+00	/api/media/file/digital-frontier-hero-1.webp	\N	digital-frontier-hero-1.webp	image/webp	165420	1024	576	50	50	/api/media/file/digital-frontier-hero-1-300x169.webp	300	169	image/webp	17652	digital-frontier-hero-1-300x169.webp	/api/media/file/digital-frontier-hero-1-700x500.webp	700	500	image/webp	99518	digital-frontier-hero-1-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/digital-frontier-hero-1-900x506.webp	900	506	image/webp	126818	digital-frontier-hero-1-900x506.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	digital-frontier-img1-1.webp	\N	\N	2026-08-18 08:30:46.063+00	2026-08-18 08:30:46.063+00	/api/media/file/digital-frontier-img1-1.webp	\N	digital-frontier-img1-1.webp	image/webp	165420	1024	576	50	50	/api/media/file/digital-frontier-img1-1-300x169.webp	300	169	image/webp	17652	digital-frontier-img1-1-300x169.webp	/api/media/file/digital-frontier-img1-1-700x500.webp	700	500	image/webp	99518	digital-frontier-img1-1-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/digital-frontier-img1-1-900x506.webp	900	506	image/webp	126818	digital-frontier-img1-1-900x506.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	digital-frontier-img2-1.webp	\N	\N	2026-08-18 08:30:47.885+00	2026-08-18 08:30:47.885+00	/api/media/file/digital-frontier-img2-1.webp	\N	digital-frontier-img2-1.webp	image/webp	68688	1024	800	50	50	/api/media/file/digital-frontier-img2-1-300x234.webp	300	234	image/webp	10762	digital-frontier-img2-1-300x234.webp	/api/media/file/digital-frontier-img2-1-700x500.webp	700	500	image/webp	34674	digital-frontier-img2-1-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/digital-frontier-img2-1-900x703.webp	900	703	image/webp	55208	digital-frontier-img2-1-900x703.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/digital-frontier-img2-1-1200x630.webp	1200	630	image/webp	50414	digital-frontier-img2-1-1200x630.webp
75	digital-frontier-img3-1.webp	\N	\N	2026-08-18 08:30:49.643+00	2026-08-18 08:30:49.642+00	/api/media/file/digital-frontier-img3-1.webp	\N	digital-frontier-img3-1.webp	image/webp	36210	1024	1024	50	50	/api/media/file/digital-frontier-img3-1-300x300.webp	300	300	image/webp	5952	digital-frontier-img3-1-300x300.webp	/api/media/file/digital-frontier-img3-1-700x500.webp	700	500	image/webp	16804	digital-frontier-img3-1-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/digital-frontier-img3-1-900x900.webp	900	900	image/webp	28044	digital-frontier-img3-1-900x900.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/digital-frontier-img3-1-1200x630.webp	1200	630	image/webp	24232	digital-frontier-img3-1-1200x630.webp
77	restock-hero-1.png	\N	\N	2026-08-18 08:30:51.339+00	2026-08-18 08:30:51.339+00	/api/media/file/restock-hero-1.png	\N	restock-hero-1.png	image/png	1942136	1024	940	50	50	/api/media/file/restock-hero-1-300x275.png	300	275	image/png	223836	restock-hero-1-300x275.png	/api/media/file/restock-hero-1-700x500.png	700	500	image/png	941638	restock-hero-1-700x500.png	\N	\N	\N	\N	\N	\N	/api/media/file/restock-hero-1-900x826.png	900	826	image/png	1950149	restock-hero-1-900x826.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/restock-hero-1-1200x630.png	1200	630	image/png	1953027	restock-hero-1-1200x630.png
79	restock-img1-1.webp	\N	\N	2026-08-18 08:30:53.226+00	2026-08-18 08:30:53.226+00	/api/media/file/restock-img1-1.webp	\N	restock-img1-1.webp	image/webp	148988	1021	934	50	50	/api/media/file/restock-img1-1-300x274.webp	300	274	image/webp	18478	restock-img1-1-300x274.webp	/api/media/file/restock-img1-1-700x500.webp	700	500	image/webp	61016	restock-img1-1-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/restock-img1-1-900x823.webp	900	823	image/webp	118228	restock-img1-1-900x823.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/restock-img1-1-1200x630.webp	1200	630	image/webp	86122	restock-img1-1-1200x630.webp
81	restock-img2-1.webp	\N	\N	2026-08-18 08:30:55.049+00	2026-08-18 08:30:55.049+00	/api/media/file/restock-img2-1.webp	\N	restock-img2-1.webp	image/webp	87092	1024	936	50	50	/api/media/file/restock-img2-1-300x274.webp	300	274	image/webp	11566	restock-img2-1-300x274.webp	/api/media/file/restock-img2-1-700x500.webp	700	500	image/webp	36820	restock-img2-1-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/restock-img2-1-900x823.webp	900	823	image/webp	67124	restock-img2-1-900x823.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/restock-img2-1-1200x630.webp	1200	630	image/webp	54708	restock-img2-1-1200x630.webp
83	restock-img3-1.webp	\N	\N	2026-08-18 08:30:56.816+00	2026-08-18 08:30:56.816+00	/api/media/file/restock-img3-1.webp	\N	restock-img3-1.webp	image/webp	22932	1024	934	50	50	/api/media/file/restock-img3-1-300x274.webp	300	274	image/webp	6154	restock-img3-1-300x274.webp	/api/media/file/restock-img3-1-700x500.webp	700	500	image/webp	13248	restock-img3-1-700x500.webp	\N	\N	\N	\N	\N	\N	/api/media/file/restock-img3-1-900x821.webp	900	821	image/webp	20324	restock-img3-1-900x821.webp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	/api/media/file/restock-img3-1-1200x630.webp	1200	630	image/webp	19370	restock-img3-1-1200x630.webp
85	texas-re-hero-1.jpg	\N	\N	2026-08-18 08:30:58.35+00	2026-08-18 08:30:58.35+00	/api/media/file/texas-re-hero-1.jpg	\N	texas-re-hero-1.jpg	image/jpeg	510815	2560	1118	50	50	/api/media/file/texas-re-hero-1-300x131.jpg	300	131	image/jpeg	8881	texas-re-hero-1-300x131.jpg	/api/media/file/texas-re-hero-1-700x500.jpg	700	500	image/jpeg	70280	texas-re-hero-1-700x500.jpg	/api/media/file/texas-re-hero-1-1600x699.jpg	1600	699	image/jpeg	203581	texas-re-hero-1-1600x699.jpg	/api/media/file/texas-re-hero-1-900x393.jpg	900	393	image/jpeg	68069	texas-re-hero-1-900x393.jpg	/api/media/file/texas-re-hero-1-1400x611.jpg	1400	611	image/jpeg	159026	texas-re-hero-1-1400x611.jpg	/api/media/file/texas-re-hero-1-1920x839.jpg	1920	839	image/jpeg	283563	texas-re-hero-1-1920x839.jpg	/api/media/file/texas-re-hero-1-1200x630.jpg	1200	630	image/jpeg	141291	texas-re-hero-1-1200x630.jpg
89	texas-re-img2-1.webp	\N	\N	2026-08-18 08:31:03.661+00	2026-08-18 08:31:03.661+00	/api/media/file/texas-re-img2-1.webp	\N	texas-re-img2-1.webp	image/webp	88818	1816	1024	50	50	/api/media/file/texas-re-img2-1-300x169.webp	300	169	image/webp	4926	texas-re-img2-1-300x169.webp	/api/media/file/texas-re-img2-1-700x500.webp	700	500	image/webp	25002	texas-re-img2-1-700x500.webp	/api/media/file/texas-re-img2-1-1600x902.webp	1600	902	image/webp	69556	texas-re-img2-1-1600x902.webp	/api/media/file/texas-re-img2-1-900x507.webp	900	507	image/webp	27148	texas-re-img2-1-900x507.webp	/api/media/file/texas-re-img2-1-1400x789.webp	1400	789	image/webp	55888	texas-re-img2-1-1400x789.webp	\N	\N	\N	\N	\N	\N	/api/media/file/texas-re-img2-1-1200x630.webp	1200	630	image/webp	39824	texas-re-img2-1-1200x630.webp
87	texas-re-img1-1.webp	\N	\N	2026-08-18 08:31:01.261+00	2026-08-18 08:31:01.261+00	/api/media/file/texas-re-img1-1.webp	\N	texas-re-img1-1.webp	image/webp	207142	1816	1024	50	50	/api/media/file/texas-re-img1-1-300x169.webp	300	169	image/webp	9250	texas-re-img1-1-300x169.webp	/api/media/file/texas-re-img1-1-700x500.webp	700	500	image/webp	53806	texas-re-img1-1-700x500.webp	/api/media/file/texas-re-img1-1-1600x902.webp	1600	902	image/webp	177824	texas-re-img1-1-1600x902.webp	/api/media/file/texas-re-img1-1-900x507.webp	900	507	image/webp	67042	texas-re-img1-1-900x507.webp	/api/media/file/texas-re-img1-1-1400x789.webp	1400	789	image/webp	143636	texas-re-img1-1-1400x789.webp	\N	\N	\N	\N	\N	\N	/api/media/file/texas-re-img1-1-1200x630.webp	1200	630	image/webp	110406	texas-re-img1-1-1200x630.webp
91	texas-re-img3-1.webp	\N	\N	2026-08-18 08:31:05.689+00	2026-08-18 08:31:05.689+00	/api/media/file/texas-re-img3-1.webp	\N	texas-re-img3-1.webp	image/webp	70556	1816	1024	50	50	/api/media/file/texas-re-img3-1-300x169.webp	300	169	image/webp	4046	texas-re-img3-1-300x169.webp	/api/media/file/texas-re-img3-1-700x500.webp	700	500	image/webp	16512	texas-re-img3-1-700x500.webp	/api/media/file/texas-re-img3-1-1600x902.webp	1600	902	image/webp	59926	texas-re-img3-1-1600x902.webp	/api/media/file/texas-re-img3-1-900x507.webp	900	507	image/webp	22374	texas-re-img3-1-900x507.webp	/api/media/file/texas-re-img3-1-1400x789.webp	1400	789	image/webp	47742	texas-re-img3-1-1400x789.webp	\N	\N	\N	\N	\N	\N	/api/media/file/texas-re-img3-1-1200x630.webp	1200	630	image/webp	36584	texas-re-img3-1-1200x630.webp
28	Mortgage assistance	\N	\N	2026-08-18 10:49:36.023+00	2026-08-18 08:29:44.697+00	/api/media/file/loan.webp	\N	loan.webp	image/webp	1972	96	95	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages (id, title, home_hero_title, home_hero_description, home_hero_video_url, home_hero_button_text, home_hero_button_link, timeless_comfort_title, timeless_comfort_description, timeless_comfort_button_text, timeless_comfort_button_link, vr_tour_title, vr_tour_description, vr_tour_banner_image, vr_tour_button_text, vr_tour_button_link, concierge_title, concierge_description, concierge_image, concierge_button_text, concierge_button_link, newest_residences_title, newest_residences_description, newest_residences_youtube_url, newest_residences_subscribe_link, home_contact_heading, home_contact_selected_form_id, properties_page_header_title, properties_page_header_description, properties_page_header_section_heading, concierge_page_hero_title, concierge_page_hero_description, concierge_page_hero_banner_image, concierge_page_services_heading, concierge_page_how_it_works_heading, concierge_page_how_it_works_image, concierge_page_why_love_it_heading, concierge_page_contact_form_heading, concierge_page_contact_form_subheading, concierge_page_contact_form_selected_form_id, about_page_story_title, about_page_banner_image, about_page_paragraph1, about_page_paragraph2, about_page_vision_title, about_page_vision_text, about_page_mission_title, about_page_mission_text, about_page_values_title, about_page_values_text, about_page_why_heading_prefix, about_page_why_heading_main, about_page_why_subtitle, about_page_why_image, about_page_feature1, about_page_feature2, about_page_feature3, about_page_feature4, about_page_contact_heading, hero_type, hero_rich_text, hero_media_id, privacy_policy_page_title, privacy_policy_page_effective_date, terms_and_conditions_page_title, terms_and_conditions_page_subheading, terms_and_conditions_page_effective_date, buy_a_home_page_title, buy_a_home_page_subheading, buy_a_home_page_description, buy_a_home_page_image_id, buy_a_home_page_image_url, buy_a_home_page_additional_content, buy_a_home_page_selected_form_id, buy_a_home_page_form_action, buy_a_home_page_button_text, other_inquiries_page_title, other_inquiries_page_subheading, other_inquiries_page_description, other_inquiries_page_image_id, other_inquiries_page_image_url, other_inquiries_page_additional_content, other_inquiries_page_selected_form_id, other_inquiries_page_form_action, other_inquiries_page_button_text, trade_inquiry_page_title, trade_inquiry_page_subheading, trade_inquiry_page_description, trade_inquiry_page_image_id, trade_inquiry_page_image_url, trade_inquiry_page_additional_content, trade_inquiry_page_selected_form_id, trade_inquiry_page_form_action, trade_inquiry_page_button_text, thank_you_page_title, thank_you_page_subheading, thank_you_page_message, thank_you_page_additional_content, thank_you_page_button_text, thank_you_page_button_link, meta_title, meta_description, meta_image_id, meta_focus_keyword, meta_canonical_url, meta_meta_robots_indexing, meta_meta_robots_following, meta_meta_robots_noarchive, meta_meta_robots_nosnippet, published_at, generate_slug, slug, updated_at, created_at, _status) FROM stdin;
1	Contact	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	none	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	contact	2026-08-18 08:24:57.147+00	2026-08-18 07:53:59.397+00	published
2	Home	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Payload Website Template", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Visit the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " to begin managing this site's content. The code for this template is completely open-source and can be found ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://github.com/payloadcms/payload/tree/3.x/templates/website", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "on our Github", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ". ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	8	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	Payload Website Template	An open-source website built with Payload and Next.js.	8	\N	\N	index	follow	f	f	\N	f	home	2026-08-18 08:25:05.702+00	2026-08-18 07:53:59.39+00	published
3	The Story Behind Our Homes | Novel Signature Homes	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	about	2026-08-18 08:25:17.087+00	2026-08-18 08:25:17.087+00	published
5	Properties	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	properties	2026-08-18 08:25:23.255+00	2026-08-18 08:25:23.254+00	published
6	Privacy Policy	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	privacy-policy	2026-08-18 08:25:26.339+00	2026-08-18 08:25:26.338+00	published
7	Thank You	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	thank-you	2026-08-18 08:25:29.434+00	2026-08-18 08:25:29.434+00	published
8	Trade Inquiry	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	trade-inquiry	2026-08-18 08:25:32.511+00	2026-08-18 08:25:32.511+00	published
9	Other Inquiries	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	other-inquiries	2026-08-18 08:25:35.607+00	2026-08-18 08:25:35.607+00	published
10	Buy A Home	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	buy-a-home	2026-08-18 08:25:38.844+00	2026-08-18 08:25:38.843+00	published
11	Terms and Conditions	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	terms-and-conditions	2026-08-18 08:25:41.925+00	2026-08-18 08:25:41.925+00	published
4	Concierge Service	Luxury Redefined	Experience unparalleled luxury living with our meticulously crafted high-end homes	/media/WEBSITE-1.mov	View All Properties	/properties	Timeless Comfort In Every Detail	We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.	About Us	/about	Experience Your Future Home	Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.	/media/3dtour.webp	Take a Virtual Tour	/properties	Our Concierge Services	We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.	/media/concierge-services.webp	Learn More	/concierge	Explore Our Newest Residences	Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.	https://www.youtube.com/embed/iDv2I89i8QY?rel=0	https://www.youtube.com/@NovelSignatureHomes/videos	LET'S FIND YOUR DREAM HOME TOGETHER	\N	Luxury Homes For Sale In Texas	Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.	Our Properties	Concierge Service	At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.	/media/concierge/hero-banner.webp	Our Services	How it works	/media/concierge/howitwork.webp	Why Homeowners Love It	Let's Make Your Move Effortless	Move into your dream home without the stress of endless decisions or countless hours searching for the right services.	\N	Our Story	/media/about/ourstorybanner.webp	At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.	Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.	Our Vision	To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.	Our Mission	Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.	Our Values	Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.	Why Choose	Novel Signature Homes ?	Everyday, we work hard to make our clients’ lives better and happier.	/media/about/whychoose.webp	Experience the finest materials and careful attention to detail with superior craftsmanship.	Live in Texas’s most desirable and well-connected neighborhoods with prime locations.	Enjoy living without compromising on elegance through luxury.	Enjoy exceptional customer care from start to finish, with our signature white-glove service.	Let's Find Your Dream Home Together	lowImpact	\N	\N	Privacy Policy	Effective as of April 5, 2025	Terms and Conditions	Terms and condition	Effective as of April 5, 2025	Contact Us	Buy A Home	Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.	\N	/media/buy-a-home-sales.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Other Inquiries	Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!	\N	/media/other-inquiries-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Contact Us	Trade Inquiry	We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.	\N	/media/trade-inquiry-hero.webp	\N	\N	https://formspree.io/f/xbjnqkyv	Submit	Thank You	Thank You for Reaching Out	We have received your message and will get back to you shortly.	\N	Back to Home	/	\N	\N	\N	\N	\N	index	follow	f	f	\N	f	concierge-service	2026-08-18 10:49:54.787+00	2026-08-18 08:25:20.165+00	published
\.


--
-- Data for Name: pages_blocks_archive; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_blocks_archive (_order, _parent_id, _path, id, intro_content, populate_by, relation_to, "limit", block_name) FROM stdin;
4	2	layout	6a840f9738da0e893663eb06	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Recent posts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The posts below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or posts can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	collection	posts	10	Archive Block
\.


--
-- Data for Name: pages_blocks_carousel; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_blocks_carousel (_order, _parent_id, _path, id, title, block_name) FROM stdin;
1	2	layout	6a840fa238da0e893663eb1b	Featured Highlights & Product Showcase	Featured Highlights Carousel
\.


--
-- Data for Name: pages_blocks_carousel_slides; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_blocks_carousel_slides (_order, _parent_id, id, image_id, heading, caption) FROM stdin;
1	6a840fa238da0e893663eb1b	6a840fa238da0e893663eb19	8	Welcome to Payload CMS 3.0	Discover the power of Next.js App Router integrated natively with Payload CMS.
2	6a840fa238da0e893663eb1b	6a840fa238da0e893663eb1a	7	Dynamic Layout Block Builder	Easily reorder, add, and customize blocks on any page directly from the Admin Panel.
\.


--
-- Data for Name: pages_blocks_content; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_blocks_content (_order, _parent_id, _path, id, block_name) FROM stdin;
2	2	layout	6a840f9738da0e893663eb04	Content Block
\.


--
-- Data for Name: pages_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	6a840f9738da0e893663eb04	6a840f9738da0e893663eafe	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default
2	6a840f9738da0e893663eb04	6a840f9738da0e893663eaff	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Admin Dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Manage this site's pages and posts from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default
3	6a840f9738da0e893663eb04	6a840f9738da0e893663eb00	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Using versions, drafts, and preview, editors can review and share their changes before publishing them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default
4	6a840f9738da0e893663eb04	6a840f9738da0e893663eb01	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Page Builder", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom page builder allows you to create unique page, post, and project layouts for any type of content.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default
5	6a840f9738da0e893663eb04	6a840f9738da0e893663eb02	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SEO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Editors have complete control over SEO data and site content directly from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default
6	6a840f9738da0e893663eb04	6a840f9738da0e893663eb03	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dark Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Users will experience this site in their preferred color scheme and each block can be inverted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default
\.


--
-- Data for Name: pages_blocks_cta; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_blocks_cta (_order, _parent_id, _path, id, rich_text, block_name) FROM stdin;
5	2	layout	6a840f9738da0e893663eb08	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a call to action", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a custom layout building block ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "configured in the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	CTA
\.


--
-- Data for Name: pages_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	6a840f9738da0e893663eb08	6a840f9738da0e893663eb07	custom	\N	/posts	All posts	default
\.


--
-- Data for Name: pages_blocks_form_block; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_blocks_form_block (_order, _parent_id, _path, id, form_id, enable_intro, intro_content, block_name) FROM stdin;
1	1	layout	6a840f9738da0e893663eb0e	1	t	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Example contact form:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N
\.


--
-- Data for Name: pages_blocks_inquiry_hero; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_blocks_inquiry_hero (_order, _parent_id, _path, id, title, subheading, description, image_id, image_url, selected_form_id, form_action, button_text, block_name) FROM stdin;
\.


--
-- Data for Name: pages_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_blocks_media_block (_order, _parent_id, _path, id, media_id, block_name) FROM stdin;
3	2	layout	6a840f9738da0e893663eb05	5	Media Block
\.


--
-- Data for Name: pages_concierge_page_how_it_works_steps; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_concierge_page_how_it_works_steps (_order, _parent_id, id, step_number, title, description, icon) FROM stdin;
\.


--
-- Data for Name: pages_concierge_page_services_items; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_concierge_page_services_items (_order, _parent_id, id, title, icon) FROM stdin;
1	4	6a8438d2783e40c491efd4d3	Mortgage assistance	28
2	4	6a8438d2783e40c491efd4d4	Move In / Move out Services	29
3	4	6a8438d2783e40c491efd4d5	Utility transfer	30
4	4	6a8438d2783e40c491efd4d6	Design consultation	31
5	4	6a8438d2783e40c491efd4d7	Furnitures & Décor selection	32
6	4	6a8438d2783e40c491efd4d8	Blinds and Window Treatments	33
7	4	6a8438d2783e40c491efd4d9	Landscaping Services	34
8	4	6a8438d2783e40c491efd4da	Plumbing and Mechanical Maintenance	35
9	4	6a8438d2783e40c491efd4db	Handyman Service	36
10	4	6a8438d2783e40c491efd4dc	Project manager Support	37
\.


--
-- Data for Name: pages_concierge_page_why_love_it_cards; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_concierge_page_why_love_it_cards (_order, _parent_id, id, tag, description) FROM stdin;
\.


--
-- Data for Name: pages_featured_properties_override; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_featured_properties_override (_order, _parent_id, id, name, details, image, href) FROM stdin;
1	1	6a840f9738da0e893663eb0f	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac
2	1	6a840f9738da0e893663eb10	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096
1	2	6a840f9738da0e893663eb09	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac
2	2	6a840f9738da0e893663eb0a	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096
1	3	6a8416edb1090c92d0e25c06	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac
2	3	6a8416edb1090c92d0e25c07	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096
1	5	6a8416f3b1090c92d0e25c10	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac
2	5	6a8416f3b1090c92d0e25c11	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096
1	6	6a8416f6b1090c92d0e25c15	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac
2	6	6a8416f6b1090c92d0e25c16	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096
1	7	6a8416f9b1090c92d0e25c1a	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac
2	7	6a8416f9b1090c92d0e25c1b	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096
1	8	6a8416fcb1090c92d0e25c1f	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac
2	8	6a8416fcb1090c92d0e25c20	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096
1	9	6a8416ffb1090c92d0e25c24	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac
2	9	6a8416ffb1090c92d0e25c25	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096
1	10	6a841702b1090c92d0e25c29	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac
2	10	6a841702b1090c92d0e25c2a	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096
1	11	6a841705b1090c92d0e25c2e	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac
2	11	6a841705b1090c92d0e25c2f	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096
1	4	6a8416f0b1090c92d0e25c0b	The Potomac	4 BD | AC Area: 4,500 – 5,500 Sqft	/media/Potomac_Exterior_Updated.webp	/properties/potomac
2	4	6a8416f0b1090c92d0e25c0c	Heatherglen	4 BD | AC Area: 5,366 Sqft	/media/034.webp	/properties/4927-heatherglen-drive-houston-texas-77096
\.


--
-- Data for Name: pages_hero_links; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_hero_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	2	6a840f9738da0e893663eafc	custom	\N	/posts	All posts	default
2	2	6a840f9738da0e893663eafd	custom	\N	/contact	Contact	outline
\.


--
-- Data for Name: pages_privacy_policy_page_sections; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_privacy_policy_page_sections (_order, _parent_id, id, heading, content) FROM stdin;
\.


--
-- Data for Name: pages_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_rels (id, "order", parent_id, path, pages_id, posts_id, categories_id) FROM stdin;
\.


--
-- Data for Name: pages_terms_and_conditions_page_sections; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_terms_and_conditions_page_sections (_order, _parent_id, id, heading, content) FROM stdin;
\.


--
-- Data for Name: pages_why_choose_us; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.pages_why_choose_us (_order, _parent_id, id, label, heading, text) FROM stdin;
1	1	6a840f9738da0e893663eb11	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.
2	1	6a840f9738da0e893663eb12	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.
3	1	6a840f9738da0e893663eb13	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.
1	2	6a840f9738da0e893663eb0b	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.
2	2	6a840f9738da0e893663eb0c	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.
3	2	6a840f9738da0e893663eb0d	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.
1	3	6a8416edb1090c92d0e25c08	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.
2	3	6a8416edb1090c92d0e25c09	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.
3	3	6a8416edb1090c92d0e25c0a	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.
1	5	6a8416f3b1090c92d0e25c12	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.
2	5	6a8416f3b1090c92d0e25c13	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.
3	5	6a8416f3b1090c92d0e25c14	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.
1	6	6a8416f6b1090c92d0e25c17	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.
2	6	6a8416f6b1090c92d0e25c18	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.
3	6	6a8416f6b1090c92d0e25c19	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.
1	7	6a8416f9b1090c92d0e25c1c	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.
2	7	6a8416f9b1090c92d0e25c1d	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.
3	7	6a8416f9b1090c92d0e25c1e	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.
1	8	6a8416fcb1090c92d0e25c21	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.
2	8	6a8416fcb1090c92d0e25c22	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.
3	8	6a8416fcb1090c92d0e25c23	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.
1	9	6a8416ffb1090c92d0e25c26	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.
2	9	6a8416ffb1090c92d0e25c27	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.
3	9	6a8416ffb1090c92d0e25c28	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.
1	10	6a841702b1090c92d0e25c2b	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.
2	10	6a841702b1090c92d0e25c2c	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.
3	10	6a841702b1090c92d0e25c2d	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.
1	11	6a841705b1090c92d0e25c30	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.
2	11	6a841705b1090c92d0e25c31	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.
3	11	6a841705b1090c92d0e25c32	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.
1	4	6a8416f0b1090c92d0e25c0d	INDULGE	In Ultimate Luxury	Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.
2	4	6a8416f0b1090c92d0e25c0e	IMAGINE	Your Future Home Today	Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.
3	4	6a8416f0b1090c92d0e25c0f	DISCOVER	Your Perfect Oasis	We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.
\.


--
-- Data for Name: payload_folders; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.payload_folders (id, name, folder_id, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: payload_folders_folder_type; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.payload_folders_folder_type ("order", parent_id, value, id) FROM stdin;
\.


--
-- Data for Name: payload_jobs; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.payload_jobs (id, input, completed_at, total_tried, has_error, error, task_slug, queue, wait_until, processing, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: payload_jobs_log; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.payload_jobs_log (_order, _parent_id, id, executed_at, completed_at, task_slug, task_i_d, input, output, state, error) FROM stdin;
\.


--
-- Data for Name: payload_kv; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.payload_kv (id, key, data) FROM stdin;
\.


--
-- Data for Name: payload_locked_documents; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.payload_locked_documents (id, global_slug, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: payload_locked_documents_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.payload_locked_documents_rels (id, "order", parent_id, path, pages_id, properties_id, blogs_id, posts_id, media_id, categories_id, users_id, cf7_tracker_id, redirects_id, forms_id, form_submissions_id, search_id, payload_folders_id) FROM stdin;
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	dev	-1	2026-08-18 05:49:19.812+00	2026-08-18 05:49:19.812+00
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.payload_preferences (id, key, value, updated_at, created_at) FROM stdin;
2	collection-properties	{}	2026-08-18 08:21:49.103+00	2026-08-18 08:21:49.103+00
1	collection-blogs	{"limit": 10}	2026-08-18 08:25:40.798+00	2026-08-18 08:21:40.038+00
3	collection-media	{"limit": 10}	2026-08-18 08:33:28.35+00	2026-08-18 08:28:48.4+00
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
2	\N	2	user	1
3	\N	1	user	1
5	\N	3	user	1
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, meta_focus_keyword, meta_canonical_url, meta_meta_robots_indexing, meta_meta_robots_following, meta_meta_robots_noarchive, meta_meta_robots_nosnippet, updated_at, created_at, _status) FROM stdin;
4	Digital Horizons: A Glimpse into Tomorrow	6	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "6a840f7d38da0e893663eae4", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Rise of AI and Machine Learning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We find ourselves in a transformative era where artificial intelligence (AI) stands at the forefront of technological evolution. The ripple effects of its advancements are reshaping industries at an unprecedented pace. No longer are businesses bound by the limitations of tedious, manual processes. Instead, sophisticated machines, fueled by vast amounts of historical data, are now capable of making decisions previously left to human intuition. These intelligent systems are not only optimizing operations but also pioneering innovative approaches, heralding a new age of business transformation worldwide. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "To demonstrate basic AI functionality, here is a javascript snippet that makes a POST request to a generic AI API in order to generate text based on a prompt. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "6a840f7d38da0e893663eae5", "code": "async function generateText(prompt) {\\n    const apiKey = 'your-api-key';\\n    const apiUrl = 'https://api.example.com/generate-text';\\n\\n    const response = await fetch(apiUrl, {\\n        method: 'POST',\\n        headers: {\\n            'Content-Type': 'application/json',\\n            'Authorization': `Bearer ${apiKey}`\\n        },\\n        body: JSON.stringify({\\n            model: 'text-generation-model',\\n            prompt: prompt,\\n            max_tokens: 50\\n        })\\n    });\\n\\n    const data = await response.json();\\n    console.log(data.choices[0].text.trim());\\n}\\n\\n// Example usage\\ngenerateText(\\"Once upon a time in a faraway land,\\");\\n", "language": "javascript", "blockName": "Generate Text", "blockType": "code"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IoT: Connecting the World Around Us", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today's rapidly evolving technological landscape, the Internet of Things (IoT) stands out as a revolutionary force. From transforming our residences with smart home systems to redefining transportation through connected cars, IoT's influence is palpable in nearly every facet of our daily lives.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This technology hinges on the seamless integration of devices and systems, allowing them to communicate and collaborate effortlessly. With each connected device, we move a step closer to a world where convenience and efficiency are embedded in the very fabric of our existence. As a result, we're transitioning into an era where our surroundings intuitively respond to our needs, heralding a smarter and more interconnected global community.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "6a840f7d38da0e893663eae6", "media": 5, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "block", "fields": {"id": "6a840f7d38da0e893663eae7", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic Components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Digital Horizons: A Glimpse into Tomorrow	6	Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.	2026-08-18 07:53:24.048+00	f	digital-horizons	\N	\N	index	follow	f	f	2026-08-18 07:53:35.531+00	2026-08-18 07:53:24.049+00	published
5	Global Gaze: Beyond the Headlines	5	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "6a840f8638da0e893663eaee", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Power of Resilience: Stories of Recovery and Hope", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Throughout history, regions across the globe have faced the devastating impact of natural disasters, the turbulence of political unrest, and the challenging ripples of economic downturns. In these moments of profound crisis, an often-underestimated force emerges: the indomitable resilience of the human spirit. These aren't just tales of mere survival, but stories of communities forging bonds, uniting with a collective purpose, and demonstrating an innate ability to overcome.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "6a840f8638da0e893663eaef", "media": 7, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From neighbors forming makeshift rescue teams during floods to entire cities rallying to rebuild after economic collapse, the essence of humanity is most evident in these acts of solidarity. As we delve into these narratives, we witness the transformative power of community spirit, where adversity becomes a catalyst for growth, unity, and a brighter, rebuilt future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "6a840f8638da0e893663eaf0", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Global Gaze: Beyond the Headlines	5	Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.	2026-08-18 07:53:27.017+00	f	global-gaze	\N	\N	index	follow	f	f	2026-08-18 07:53:43.255+00	2026-08-18 07:53:27.018+00	published
6	Dollar and Sense: The Financial Forecast	7	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "block", "fields": {"id": "6a840f8e38da0e893663eaf4", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money isn't just currency; ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "it's a language. ", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}, {"mode": "normal", "text": "Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money, in its essence, transcends the mere concept of coins and paper notes; it becomes a profound language that speaks of value, trust, and societal structures. Like any language, it possesses intricate nuances and subtleties that require a discerning understanding. It's in these depths where the calculated world of financial strategy collides with the raw, instinctive nature of human intuition. Just as a seasoned linguist might dissect the syntax and semantics of a sentence, a financial expert navigates the vast and tumultuous ocean of finance, guided not only by logic and data but also by gut feelings and foresight. Every transaction, investment, and financial decision becomes a dialogue in this expansive lexicon of commerce and value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "6a840f8e38da0e893663eaf5", "media": 6, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Stock Market Dynamics: Bulls, Bears, and the Uncertain Middle", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market is a realm of vast opportunity but also poses risks. Discover the forces that drive market trends and the strategies employed by top traders to navigate this complex ecosystem. From market analysis to understanding investor psychology, get a comprehensive insight into the world of stocks.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market, often visualized as a bustling arena of numbers and ticker tapes, is as much about human behavior as it is about economics. It's a place where optimism, represented by the bullish rally, meets the caution of bearish downturns, with each vying to dictate the market's direction. But between these two extremes lies an uncertain middle ground, a zone populated by traders and investors who constantly weigh hope against fear. Successful navigation requires more than just financial acumen; it demands an understanding of collective sentiments and the ability to predict not just market movements, but also the reactions of other market participants. In this intricate dance of numbers and nerves, the most astute players are those who master both the hard data and the soft nuances of human behavior.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "6a840f8e38da0e893663eaf6", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Dollar and Sense: The Financial Forecast	7	Money isn't just currency; it's a language. Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.	2026-08-18 07:53:29.984+00	f	dollar-and-sense-the-financial-forecast	\N	\N	index	follow	f	f	2026-08-18 07:53:50.888+00	2026-08-18 07:53:29.985+00	published
\.


--
-- Data for Name: posts_populated_authors; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.posts_populated_authors (_order, _parent_id, id, name) FROM stdin;
\.


--
-- Data for Name: posts_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) FROM stdin;
10	1	4	relatedPosts	5	\N	\N
11	2	4	relatedPosts	6	\N	\N
12	1	4	authors	\N	\N	5
13	1	5	relatedPosts	4	\N	\N
14	2	5	relatedPosts	6	\N	\N
15	1	5	authors	\N	\N	5
16	1	6	relatedPosts	4	\N	\N
17	2	6	relatedPosts	5	\N	\N
18	1	6	authors	\N	\N	5
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.properties (id, status, featured, is_group_parent, parent_property_id, published_at, name, address, price, description, contact_form_id, property_summary_number_of_beds, property_summary_number_of_baths, property_summary_ac_area, property_summary_design_theme, broker_information_broker_name, broker_information_company_name, broker_information_broker_image_id, builder_name, architect_name, interior_design_name, features_and_amenities_property_details_property_type, features_and_amenities_property_details_year_built, features_and_amenities_property_details_total_interior_livable_, features_and_amenities_property_details_lot_size, features_and_amenities_beds_and_baths_beds, features_and_amenities_beds_and_baths_baths, features_and_amenities_beds_and_baths_number_of_floors, features_and_amenities_interior_features_first_floor, features_and_amenities_interior_features_second_floor, features_and_amenities_interior_features_third_floor, features_and_amenities_interior_features_additional_features, features_and_amenities_exterior_features_garage, features_and_amenities_exterior_features_yard, features_and_amenities_exterior_features_siding, features_and_amenities_exterior_features_pool, features_and_amenities_exterior_features_driveway, features_and_amenities_exterior_features_roof, features_and_amenities_exterior_features_deck_patio, video_video_type, video_youtube_url, video_video_file_id, project_team_broker_name, project_team_builder_name, project_team_architect_name, project_team_interior_designer_name, about_section_about_title, about_section_about_intro, about_section_about_background_image_id, about_section_history_text, about_section_lifestyle_text, about_section_neighborhood_text, elegance_banner_title, elegance_banner_description, meta_title, meta_description, meta_image_id, meta_focus_keyword, meta_canonical_url, meta_meta_robots_indexing, meta_meta_robots_following, meta_meta_robots_noarchive, meta_meta_robots_nosnippet, generate_slug, slug, updated_at, created_at) FROM stdin;
2	for_sale	f	t	\N	\N	Woodland Ave, Houston, Texas, 77009	Houston, Texas, 77009	$2,300,000 - $2,850,000	Welcome to Woodland Ave Community, featuring modern luxury townhomes and customized interior features in the heart of Houston's Woodland Heights.	\N	\N	\N	\N	\N	Jonathan Rosen	COMPASS	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	woodland	2026-08-18 08:19:52.151+00	2026-08-18 08:01:35.297+00
3	for_sale	f	f	1	\N	Potomac Dr - Unit 1	Houston, Texas, 77057	$1,375,000	Stunning Potomac community custom unit 1. Featuring 4 beds, 5 baths, and open floor plans designed with exceptional craftsmanship.	\N	4	5	4,500 - 5,500	Modern Mediterranean	Jonathan Rosen	COMPASS	8	Gilbert Homes	Clay Nelson	Kevin Spearman	Townhome	2026	5,000 Sq Ft	3,000 Sq Ft	4 Beds	5 Baths	3	Chef kitchen, living lounge room, outdoor courtyard access.	Spacious primary suite, 2 guest suites, and laundry room.	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	potomac-unit-1	2026-08-18 08:19:56.349+00	2026-08-18 08:01:36.927+00
4	for_sale	f	f	1	\N	Potomac Dr - Unit 2	Houston, Texas, 77057	$1,495,000	Stunning Potomac community custom unit 2. Featuring 4 beds, 5 baths, and open floor plans designed with exceptional craftsmanship.	\N	4	5	4,500 - 5,500	Modern Mediterranean	Jonathan Rosen	COMPASS	8	Gilbert Homes	Clay Nelson	Kevin Spearman	Townhome	2026	5,000 Sq Ft	3,000 Sq Ft	4 Beds	5 Baths	3	Chef kitchen, living lounge room, outdoor courtyard access.	Spacious primary suite, 2 guest suites, and laundry room.	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	potomac-unit-2	2026-08-18 08:20:01.005+00	2026-08-18 08:01:38.982+00
5	under_contract	f	f	1	\N	Potomac Dr - Unit 3	Houston, Texas, 77057	$1,615,000	Stunning Potomac community custom unit 3. Featuring 4 beds, 5 baths, and open floor plans designed with exceptional craftsmanship.	\N	4	5	4,500 - 5,500	Modern Mediterranean	Jonathan Rosen	COMPASS	8	Gilbert Homes	Clay Nelson	Kevin Spearman	Townhome	2026	5,000 Sq Ft	3,000 Sq Ft	4 Beds	5 Baths	3	Chef kitchen, living lounge room, outdoor courtyard access.	Spacious primary suite, 2 guest suites, and laundry room.	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	potomac-unit-3	2026-08-18 08:20:05.658+00	2026-08-18 08:01:41.035+00
6	under_contract	f	f	1	\N	Potomac Dr - Unit 4	Houston, Texas, 77057	$1,735,000	Stunning Potomac community custom unit 4. Featuring 4 beds, 5 baths, and open floor plans designed with exceptional craftsmanship.	\N	4	5	4,500 - 5,500	Modern Mediterranean	Jonathan Rosen	COMPASS	8	Gilbert Homes	Clay Nelson	Kevin Spearman	Townhome	2026	5,000 Sq Ft	3,000 Sq Ft	4 Beds	5 Baths	3	Chef kitchen, living lounge room, outdoor courtyard access.	Spacious primary suite, 2 guest suites, and laundry room.	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	potomac-unit-4	2026-08-18 08:20:10.316+00	2026-08-18 08:01:43.122+00
7	sold	f	f	1	\N	Potomac Dr - Unit 5	Houston, Texas, 77057	$1,855,000	Stunning Potomac community custom unit 5. Featuring 4 beds, 5 baths, and open floor plans designed with exceptional craftsmanship.	\N	4	5	4,500 - 5,500	Modern Mediterranean	Jonathan Rosen	COMPASS	8	Gilbert Homes	Clay Nelson	Kevin Spearman	Townhome	2026	5,000 Sq Ft	3,000 Sq Ft	4 Beds	5 Baths	3	Chef kitchen, living lounge room, outdoor courtyard access.	Spacious primary suite, 2 guest suites, and laundry room.	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	potomac-unit-5	2026-08-18 08:20:14.966+00	2026-08-18 08:01:46.052+00
8	sold	f	f	1	\N	Potomac Dr - Unit 6	Houston, Texas, 77057	$1,975,000	Stunning Potomac community custom unit 6. Featuring 4 beds, 5 baths, and open floor plans designed with exceptional craftsmanship.	\N	4	5	4,500 - 5,500	Modern Mediterranean	Jonathan Rosen	COMPASS	8	Gilbert Homes	Clay Nelson	Kevin Spearman	Townhome	2026	5,000 Sq Ft	3,000 Sq Ft	4 Beds	5 Baths	3	Chef kitchen, living lounge room, outdoor courtyard access.	Spacious primary suite, 2 guest suites, and laundry room.	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	potomac-unit-6	2026-08-18 08:20:19.619+00	2026-08-18 08:01:48.213+00
9	for_sale	f	f	2	\N	Woodland Ave - Unit 1	Houston, Texas, 77009	$2,300,000	Beautiful Woodland Heights luxury unit 1. Featuring a contemporary layout with premium custom siding, rooftop deck, and green yard space.	\N	3	3.5	3,200	Contemporary Modern	Oliver Carter	COMPASS	8	Gilbert Homes	Clay Nelson	Lisa Roberts	Townhome	2026	3,200 Sq Ft	2,500 Sq Ft	3 Beds	3.5 Baths	3	Open concept living area and executive modern kitchen.	Master bedroom suite and private study.	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	woodland-unit-1	2026-08-18 08:20:24.323+00	2026-08-18 08:01:50.283+00
10	under_contract	f	f	2	\N	Woodland Ave - Unit 2	Houston, Texas, 77009	$2,550,000	Beautiful Woodland Heights luxury unit 2. Featuring a contemporary layout with premium custom siding, rooftop deck, and green yard space.	\N	3	3.5	3,200	Contemporary Modern	Oliver Carter	COMPASS	8	Gilbert Homes	Clay Nelson	Lisa Roberts	Townhome	2026	3,200 Sq Ft	2,500 Sq Ft	3 Beds	3.5 Baths	3	Open concept living area and executive modern kitchen.	Master bedroom suite and private study.	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	woodland-unit-2	2026-08-18 08:20:28.976+00	2026-08-18 08:01:52.349+00
12	for_sale	t	f	\N	\N	4927 Heatherglen Drive, Houston, Texas, 77096	Houston, Texas, 77096	$4,200,000	\N	\N	5	7	5,897	Contemporary Estate	Jonathan Rosen	COMPASS	8	Gilbert Homes	Clay Nelson	Kevin Spearman	Single Family Residential	2026	5,897 Sq Ft	7,013.16 Sq Ft	5 Beds	7 Baths	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	4927-heatherglen-drive-houston-texas-77096	2026-08-18 08:20:36.396+00	2026-08-18 08:01:55.559+00
1	for_sale	t	t	\N	\N	Potomac Dr, Houston, Texas, 77057	Potomac Dr, Houston, Texas 77057	$2,450,000 - $3,950,000	This exclusive collection of luxury homes offers an unparalleled living experience in one of the city's most coveted areas. It enjoys proximity to prestigious schools like T.H. Rogers and Kinkaid, making it ideal for families. With Briarbend Park nearby and easy access to numerous retail centers, this home combines convenience with elegance. Designed by the renowned Kevin Spearman, the interiors exude sophistication, blending modern aesthetics with timeless charm. With excellent public transport access and a prime location, this home represents the height of luxury living in Houston.	\N	\N	\N	\N	\N	Jonathan Rosen	COMPASS	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	potomac	2026-08-18 08:19:48.646+00	2026-08-18 08:01:33.901+00
11	for_sale	t	f	\N	\N	3224 Amherst Ave, Dallas, TX 75225	Dallas, Texas, 75225	$4,894,000	Welcome to our luxury single-family home, located in one of Texas' finest neighborhoods. This stunning residence features spacious bedrooms, perfect for modern living. Curated by Kevin Spearman, built by Gilbert Homes.	\N	5	7	5,897	Transitional Cottage	Jonathan Rosen	COMPASS	8	Gilbert Homes	Clay Nelson	Kevin Spearman	Single Family Residential	2026	5,897 Sq Ft	7,013.16 Sq Ft	5 Beds	5 Full, 2 Half Baths	2	Great room, formal dining room, chef kitchen, prep kitchen, pocket study, mudroom, laundry room, master bedroom suite, and outdoor living area.	4 ensuite bedrooms, spacious game room, media room, and dedicated craft room.	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	3224-amherst-avenue-dallas-tx-75225	2026-08-18 08:20:32.921+00	2026-08-18 08:01:54.184+00
13	sold	t	f	\N	\N	1311 Pine Chase Drive, Houston, TX 77055	Houston, TX, 77055	$3,500,000	\N	\N	6	9	6,811	Modern Luxury	Oliver Carter	COMPASS	8	GEIS Development	Clay Nelson	Lisa Roberts	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	1311-pine-chase-dr-houston	2026-08-18 08:20:39.871+00	2026-08-18 08:01:56.939+00
14	for_sale	t	f	\N	\N	1001 E, Houston, TX 77002	Houston, Texas, 77002	$2,150,000	\N	\N	4	4.5	4,100	Urban Modern	Jonathan Rosen	COMPASS	8	Gilbert Homes	Clay Nelson	Kevin Spearman	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	youtube	\N	\N	Ed Wolff	Novel Signature Homes	Todd Rice	Steve Clifton	About Woodland Heights	\N	\N	\N	\N	\N	Experience Elegance In Every Detail	\N	\N	\N	\N	\N	\N	index	follow	f	f	f	1001-e-houston-tx-77002	2026-08-18 08:20:43.344+00	2026-08-18 08:01:58.315+00
\.


--
-- Data for Name: properties_floor_plans; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.properties_floor_plans (_order, _parent_id, id, floor_name, area_size, image_id) FROM stdin;
\.


--
-- Data for Name: properties_neighborhood_accordion; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.properties_neighborhood_accordion (_order, _parent_id, id, title, distance, image_id) FROM stdin;
\.


--
-- Data for Name: properties_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.properties_rels (id, "order", parent_id, path, media_id) FROM stdin;
15	1	1	bannerImages	8
16	1	2	bannerImages	8
17	1	3	bannerImages	8
18	1	4	bannerImages	8
19	1	5	bannerImages	8
20	1	6	bannerImages	8
21	1	7	bannerImages	8
22	1	8	bannerImages	8
23	1	9	bannerImages	8
24	1	10	bannerImages	8
25	1	11	bannerImages	8
26	1	12	bannerImages	8
27	1	13	bannerImages	8
28	1	14	bannerImages	8
\.


--
-- Data for Name: redirects; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.redirects (id, "from", to_type, to_url, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: redirects_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.redirects_rels (id, "order", parent_id, path, pages_id, posts_id) FROM stdin;
\.


--
-- Data for Name: search; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.search (id, title, priority, slug, meta_title, meta_description, meta_image_id, updated_at, created_at) FROM stdin;
4	Digital Horizons: A Glimpse into Tomorrow	0	digital-horizons	Digital Horizons: A Glimpse into Tomorrow	Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.	6	2026-08-18 07:53:40.321+00	2026-08-18 07:53:25.88+00
5	Global Gaze: Beyond the Headlines	0	global-gaze	Global Gaze: Beyond the Headlines	Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.	5	2026-08-18 07:53:48.152+00	2026-08-18 07:53:28.841+00
6	Dollar and Sense: The Financial Forecast	0	dollar-and-sense-the-financial-forecast	Dollar and Sense: The Financial Forecast	Money isn't just currency; it's a language. Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.	7	2026-08-18 07:53:55.673+00	2026-08-18 07:53:31.848+00
\.


--
-- Data for Name: search_categories; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.search_categories (_order, _parent_id, id, relation_to, category_i_d, title) FROM stdin;
\.


--
-- Data for Name: search_rels; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.search_rels (id, "order", parent_id, path, posts_id) FROM stdin;
7	\N	4	doc	4
8	\N	5	doc	5
9	\N	6	doc	6
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.settings (id, site_icon_id, header_logo_id, site_url, frappe_url, frappe_api_key, frappe_api_secret, frappe_api_method, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.users (id, name, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until) FROM stdin;
2	Content Editor	2026-08-18 05:49:24.053+00	2026-08-18 05:47:21.417+00	editor@example.com	\N	\N	896bcfc7d224c84a116de327da4ec7ffae03ffc200335a89a89710b92cf6ae9d	e1cf1dc9bb8ebd59e009aa2d843aeabe7a4db4473fa0fe6b935c35f00f1d21083a772c383186b43539e234d28a7ce87fe8c0684026149b6010c943a6fae9526c161cf45bbb99e3e85028ce27f78733da8aad33ad01bbd6706ab4ba71f315b1503cc4a6eb4470b982056bb4e21f588f20ddec7173cc86da3bc2d17d08c0b2c3da859f4e65ac9931772c4ffd374758017fb2dd71e63f258f581cf45333eff02de61acd818c70ce99648adeb17ca08bc9641c50993b81eff71946d661a924d0ff1880806cda7d48bccabc4564de9ea4e4240f7df276c3d397d584d7bfe165b480dd4c7cc170ae40cdfe0f8bdf2182a67441a2b55f580cd272d49fd4ef0f056480055aca41bb7dd300b78a51f25f4535fda7a5c513b6ca48cfc6baa95b4c21c9a5666727f5e93bb8f846733d293b3316b5d3dfb306304c149ddb43c533fdc9ae743e9f97104362680d88bff4d8f69b907f5ad55b7ab40dce6432551675861a533d589dbaf7375119ac35e08904b6163ded4e6d933ce5fcf3a72107459a2941da048121091abc1067450f077b3ab9bc23f6e134604c9e43827f408182657d475120c6f287f33d8ed5f63bc015daaaf148f79904886d20e41b97597a4d4b0fa3482cb1f233bc14b540385474d09251fabb2673414c05cee1fa9e8c08972ad20669423bb5cd6de348491cf8d0cc19e5fbf6f84b70bafeb75d63c4148cb8afe161865f3d	0	\N
3	SEO Editor	2026-08-18 05:49:26.756+00	2026-08-18 05:47:24.973+00	seo@example.com	\N	\N	0dc741fa8b91b663706aa0dad1c3be6542865f8302ec473df9b54b154e84003f	f05938ed674642bf135390b94b344f62bd703576a6789793dc6572f060f8118965bf153822d771d150de3d285837a3713bdf81ebffc27b848ea9eeba08d129e4ce4a55309d344cf0ef42e0c8c8764dd8c4a2261b633cbf29164e475dbc9f7cf69c5b5cb4f8ae0a76d77d2b1dd282ab7aca03070c3e9c28e00c89fd0e6a2d94510b7284f12e1e2c4cfbdbd135c1d1e1f3f4f69ea182fc561c121c0bb66dddf405bc5e44fcab2e853c2b0af2731f5ef35364f761a6d2a2e6d617fc088d64c9441ab896b4ef20f0e376ed1c71f5737c4b04334392400959b3be1702450e23e1a00893773e49f656c6401b24e219c975b2251b7d977c4ab6b691461363b43ff599a6bbf19a673a987d272071b32342c6732d79d6621062d55db8d2b57303796abb6d10d9e8292ab0abc9589a100f0ed0796229794d589f53ad73e8b6a4fc9b3758b1e5a9fd532db87989d608b18c9148c17c38e3102087be3d3ca91c08f8597e9c2f8a66b11f2a4c4b74ecc7d57dc87af5e4d847af746a8e074d2f694509b05f420546600c4a0afbbd6bbad3777b469e309868b9a5de7008b67c374ac04b5f1ffd40a70604bba13261e693ec2d354d5c3c9882c7e8376280fc30d5a6d48f10d16e0fac3cbaafb7267069a57dcaaafc917a12424d5f2564db8bf06c72d0c7369a7d2de016c4727074b2d26489bbc905053116346d179d8277478fb453e7c6c85a5397	0	\N
5	Demo Author	2026-08-18 07:53:18.777+00	2026-08-18 07:53:18.777+00	demo-author@example.com	\N	\N	a5812ef5c5d169d4ef6bc87f16969e99484627dab7a0f758b88549efef175740	71d7789d33a76e70ca4a5aff861f69cbd5688133c7dc4f6487cc102858b79de8f6549f0dc4f0ca2ec398bc91c4151d41245449d0b2f4f70107d60a04f8a1d97bbdca642994e2a8cdbcea1595e2d6553b3386ca30a0633fdb7b4a3cd73a42b9bec19e593421499ecd5e76d5a6dc35668bc421ad96e3a1b50498cf03b97713958c448b695ed4f082f94248b869568ef0d11c92135801d23925e8089d7c9d97d276cbf04f7d422ac85fdfce962e2153042fd297634777cdac7e85ca7b46d530c984cd30cedd248dab284bfdf68b4fd7d7e852cf3ad84ec15a99968b7bb4a27a851ccd47584fe057074241de5fa1913c25f278b7067e5a2f23614f9f4747f1311640a62a455b63869b604d3b3718251546ebb8e2372bbe8b668d5c37efb5dc874cceee0e4b7bf56d5d91f227b91d1e504287ae7286a6e855af5194b7c262ffa2f2fecb32952bf100bf587b7c8499efb1c91d93fc8130ae0dda66e0925f4015ce5ab336bf08eafd76b6a11cafba4ebc97dbeb0aef42185d5b17574e77f934a82dd6669140580ee03d243c19cd6b777158bf98f2cecb52f0cadad4e389cda75ffdf65974661dbf17e5b4c27b8b477486e150b0674a2c82f09f9d8d1b0463196bfe78d0bef52a6b4b1ece959044d97cc46a5b641c157af67d575276d8aea06137e95de750130f44cd8ba29778bef6446c347200ea56db5b42cc320df1956632d8c48e2a	0	\N
1	System Admin	2026-08-18 05:49:21.341+00	2026-08-18 05:47:19.061+00	admin@example.com	\N	\N	624c98221a83879bde5dede9a39508d6b232639f7519771ffd66491dafd2cc1a	b7a4a9a928b32f53c0d0d539891334a0bf9eb19ad3c947fe9524afc9411adcbb3992cabb8377be674213f3d7a1ef938c705442599fe6a5427279858293b9c1d291dd9aa7fbc3c3193bf511985e5602e891d2e1641bf297391025294cc6d1d22fdc15e99a32421b3847ace972134bc2b79acf6d1d5787359b6a180f214e4804d3a28d0c900070465c1d12d56637a25b7f579417ab142c775c45ac3b7aee00cfe477170c7c6b091159e3ece3a659d172677a6e1305ee87eed7a67abf6ab761aaea6125bc7373ade9f15191e1760c6ced35aa75a7b709d9e9ea2bb66e3194b4bf474694e7d396a05d41544e5ca980fb0b058dfdf0f06233c386336919b44073353fdd41338d8e88d4fdd932530e99a8a753d41b00ac2f76204a64d3745ea8f679623134ac06910e35680a89c904631d5d27a3c25a5b350b0046e6aced81cea41c919611ca19f0a604815a401f4b1f44de298572302e429b304b9199fb861e77cc96c30a0cb120ed4812a6ad412b480ad37b3b549252a20ada823dd102ead20a8829dec55a03b72dd33382761c4c7346fca9433b6a130af58002d2c968c6f8220e7d65466e299612d21a410c72246bf116532232f3a1c4847bebc6e47d3c5515ce98c5ec44082613ab8593347e0a54f9152f82e445270d72f83cde85341b73f4be9d638cd3885f5b0d9bc7a84b156d4df84467e4e01b93b15c343039494cead35ae7	0	\N
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.users_roles ("order", parent_id, value, id) FROM stdin;
1	2	editor	5
1	3	seo-editor	6
1	5	admin	8
1	1	admin	10
\.


--
-- Data for Name: users_sessions; Type: TABLE DATA; Schema: public; Owner: nsh_db_user
--

COPY public.users_sessions (_order, _parent_id, id, created_at, expires_at) FROM stdin;
1	1	647615c5-9aa1-42ca-aab5-17c1373121f5	2026-08-18 11:14:11.924+00	2026-08-18 13:14:11.924+00
\.


--
-- Name: _blogs_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._blogs_v_id_seq', 35, true);


--
-- Name: _blogs_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._blogs_v_rels_id_seq', 14, true);


--
-- Name: _blogs_v_version_populated_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._blogs_v_version_populated_authors_id_seq', 1, false);


--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_blocks_archive_id_seq', 3, true);


--
-- Name: _pages_v_blocks_carousel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_blocks_carousel_id_seq', 2, true);


--
-- Name: _pages_v_blocks_carousel_slides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_blocks_carousel_slides_id_seq', 4, true);


--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_blocks_content_columns_id_seq', 18, true);


--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_blocks_content_id_seq', 3, true);


--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_blocks_cta_id_seq', 3, true);


--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_blocks_cta_links_id_seq', 3, true);


--
-- Name: _pages_v_blocks_form_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_blocks_form_block_id_seq', 3, true);


--
-- Name: _pages_v_blocks_inquiry_hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_blocks_inquiry_hero_id_seq', 1, false);


--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_blocks_media_block_id_seq', 3, true);


--
-- Name: _pages_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_id_seq', 16, true);


--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_rels_id_seq', 1, false);


--
-- Name: _pages_v_version_concierge_page_how_it_works_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_version_concierge_page_how_it_works_steps_id_seq', 1, false);


--
-- Name: _pages_v_version_concierge_page_services_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_version_concierge_page_services_items_id_seq', 10, true);


--
-- Name: _pages_v_version_concierge_page_why_love_it_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_version_concierge_page_why_love_it_cards_id_seq', 1, false);


--
-- Name: _pages_v_version_featured_properties_override_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_version_featured_properties_override_id_seq', 32, true);


--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_version_hero_links_id_seq', 6, true);


--
-- Name: _pages_v_version_privacy_policy_page_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_version_privacy_policy_page_sections_id_seq', 1, false);


--
-- Name: _pages_v_version_terms_and_conditions_page_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_version_terms_and_conditions_page_sections_id_seq', 1, false);


--
-- Name: _pages_v_version_why_choose_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._pages_v_version_why_choose_us_id_seq', 48, true);


--
-- Name: _posts_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._posts_v_id_seq', 10, true);


--
-- Name: _posts_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._posts_v_rels_id_seq', 18, true);


--
-- Name: _posts_v_version_populated_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public._posts_v_version_populated_authors_id_seq', 1, false);


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.blogs_id_seq', 11, true);


--
-- Name: blogs_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.blogs_rels_id_seq', 14, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.categories_id_seq', 17, true);


--
-- Name: cf7_tracker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.cf7_tracker_id_seq', 1, false);


--
-- Name: footer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.footer_id_seq', 1, true);


--
-- Name: footer_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.footer_rels_id_seq', 1, false);


--
-- Name: form_submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.form_submissions_id_seq', 1, false);


--
-- Name: forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.forms_id_seq', 1, true);


--
-- Name: header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.header_id_seq', 1, true);


--
-- Name: header_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.header_rels_id_seq', 10, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.media_id_seq', 92, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.pages_id_seq', 11, true);


--
-- Name: pages_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.pages_rels_id_seq', 1, false);


--
-- Name: payload_folders_folder_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.payload_folders_folder_type_id_seq', 1, false);


--
-- Name: payload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.payload_folders_id_seq', 1, false);


--
-- Name: payload_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.payload_jobs_id_seq', 1, false);


--
-- Name: payload_kv_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.payload_kv_id_seq', 1, false);


--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.payload_locked_documents_id_seq', 1, false);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.payload_locked_documents_rels_id_seq', 1, false);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.payload_migrations_id_seq', 1, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.payload_preferences_id_seq', 3, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.payload_preferences_rels_id_seq', 5, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.posts_id_seq', 6, true);


--
-- Name: posts_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.posts_rels_id_seq', 18, true);


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.properties_id_seq', 14, true);


--
-- Name: properties_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.properties_rels_id_seq', 28, true);


--
-- Name: redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.redirects_id_seq', 1, false);


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.redirects_rels_id_seq', 1, false);


--
-- Name: search_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.search_id_seq', 6, true);


--
-- Name: search_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.search_rels_id_seq', 9, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: users_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsh_db_user
--

SELECT pg_catalog.setval('public.users_roles_id_seq', 10, true);


--
-- Name: _blogs_v _blogs_v_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v
    ADD CONSTRAINT _blogs_v_pkey PRIMARY KEY (id);


--
-- Name: _blogs_v_rels _blogs_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v_rels
    ADD CONSTRAINT _blogs_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _blogs_v_version_populated_authors _blogs_v_version_populated_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v_version_populated_authors
    ADD CONSTRAINT _blogs_v_version_populated_authors_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_archive _pages_v_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_archive
    ADD CONSTRAINT _pages_v_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_carousel _pages_v_blocks_carousel_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_carousel
    ADD CONSTRAINT _pages_v_blocks_carousel_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_carousel_slides _pages_v_blocks_carousel_slides_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_carousel_slides
    ADD CONSTRAINT _pages_v_blocks_carousel_slides_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_content_columns _pages_v_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns
    ADD CONSTRAINT _pages_v_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_content _pages_v_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_content
    ADD CONSTRAINT _pages_v_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_cta_links _pages_v_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links
    ADD CONSTRAINT _pages_v_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_cta _pages_v_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_cta
    ADD CONSTRAINT _pages_v_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_form_block _pages_v_blocks_form_block_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_form_block
    ADD CONSTRAINT _pages_v_blocks_form_block_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_inquiry_hero _pages_v_blocks_inquiry_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_inquiry_hero
    ADD CONSTRAINT _pages_v_blocks_inquiry_hero_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: _pages_v _pages_v_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_rels _pages_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_concierge_page_how_it_works_steps _pages_v_version_concierge_page_how_it_works_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_concierge_page_how_it_works_steps
    ADD CONSTRAINT _pages_v_version_concierge_page_how_it_works_steps_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_concierge_page_services_items _pages_v_version_concierge_page_services_items_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_concierge_page_services_items
    ADD CONSTRAINT _pages_v_version_concierge_page_services_items_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_concierge_page_why_love_it_cards _pages_v_version_concierge_page_why_love_it_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_concierge_page_why_love_it_cards
    ADD CONSTRAINT _pages_v_version_concierge_page_why_love_it_cards_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_featured_properties_override _pages_v_version_featured_properties_override_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_featured_properties_override
    ADD CONSTRAINT _pages_v_version_featured_properties_override_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_hero_links
    ADD CONSTRAINT _pages_v_version_hero_links_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_privacy_policy_page_sections _pages_v_version_privacy_policy_page_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_privacy_policy_page_sections
    ADD CONSTRAINT _pages_v_version_privacy_policy_page_sections_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_terms_and_conditions_page_sections _pages_v_version_terms_and_conditions_page_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_terms_and_conditions_page_sections
    ADD CONSTRAINT _pages_v_version_terms_and_conditions_page_sections_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_why_choose_us _pages_v_version_why_choose_us_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_why_choose_us
    ADD CONSTRAINT _pages_v_version_why_choose_us_pkey PRIMARY KEY (id);


--
-- Name: _posts_v _posts_v_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_pkey PRIMARY KEY (id);


--
-- Name: _posts_v_rels _posts_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _posts_v_version_populated_authors _posts_v_version_populated_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v_version_populated_authors
    ADD CONSTRAINT _posts_v_version_populated_authors_pkey PRIMARY KEY (id);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: blogs_populated_authors blogs_populated_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs_populated_authors
    ADD CONSTRAINT blogs_populated_authors_pkey PRIMARY KEY (id);


--
-- Name: blogs_rels blogs_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs_rels
    ADD CONSTRAINT blogs_rels_pkey PRIMARY KEY (id);


--
-- Name: categories_breadcrumbs categories_breadcrumbs_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.categories_breadcrumbs
    ADD CONSTRAINT categories_breadcrumbs_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: cf7_tracker cf7_tracker_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.cf7_tracker
    ADD CONSTRAINT cf7_tracker_pkey PRIMARY KEY (id);


--
-- Name: footer_nav_items footer_nav_items_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.footer_nav_items
    ADD CONSTRAINT footer_nav_items_pkey PRIMARY KEY (id);


--
-- Name: footer footer_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.footer
    ADD CONSTRAINT footer_pkey PRIMARY KEY (id);


--
-- Name: footer_rels footer_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_pkey PRIMARY KEY (id);


--
-- Name: form_submissions form_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_pkey PRIMARY KEY (id);


--
-- Name: form_submissions_submission_data form_submissions_submission_data_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.form_submissions_submission_data
    ADD CONSTRAINT form_submissions_submission_data_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_checkbox forms_blocks_checkbox_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_checkbox
    ADD CONSTRAINT forms_blocks_checkbox_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_country forms_blocks_country_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_country
    ADD CONSTRAINT forms_blocks_country_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_email forms_blocks_email_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_email
    ADD CONSTRAINT forms_blocks_email_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_message forms_blocks_message_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_message
    ADD CONSTRAINT forms_blocks_message_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_number forms_blocks_number_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_number
    ADD CONSTRAINT forms_blocks_number_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_select_options forms_blocks_select_options_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_select_options
    ADD CONSTRAINT forms_blocks_select_options_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_select forms_blocks_select_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_select
    ADD CONSTRAINT forms_blocks_select_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_state forms_blocks_state_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_state
    ADD CONSTRAINT forms_blocks_state_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_text forms_blocks_text_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_text
    ADD CONSTRAINT forms_blocks_text_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_textarea forms_blocks_textarea_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_textarea
    ADD CONSTRAINT forms_blocks_textarea_pkey PRIMARY KEY (id);


--
-- Name: forms_emails forms_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_emails
    ADD CONSTRAINT forms_emails_pkey PRIMARY KEY (id);


--
-- Name: forms_field_mapping forms_field_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_field_mapping
    ADD CONSTRAINT forms_field_mapping_pkey PRIMARY KEY (id);


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: forms_static_fields forms_static_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_static_fields
    ADD CONSTRAINT forms_static_fields_pkey PRIMARY KEY (id);


--
-- Name: header_nav_items header_nav_items_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.header_nav_items
    ADD CONSTRAINT header_nav_items_pkey PRIMARY KEY (id);


--
-- Name: header header_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.header
    ADD CONSTRAINT header_pkey PRIMARY KEY (id);


--
-- Name: header_rels header_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_archive pages_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_archive
    ADD CONSTRAINT pages_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_carousel pages_blocks_carousel_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_carousel
    ADD CONSTRAINT pages_blocks_carousel_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_carousel_slides pages_blocks_carousel_slides_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_carousel_slides
    ADD CONSTRAINT pages_blocks_carousel_slides_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_content_columns pages_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_content_columns
    ADD CONSTRAINT pages_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_content pages_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_content
    ADD CONSTRAINT pages_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_cta_links pages_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_cta_links
    ADD CONSTRAINT pages_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_cta pages_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_cta
    ADD CONSTRAINT pages_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_form_block pages_blocks_form_block_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_form_block
    ADD CONSTRAINT pages_blocks_form_block_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_inquiry_hero pages_blocks_inquiry_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_inquiry_hero
    ADD CONSTRAINT pages_blocks_inquiry_hero_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_media_block pages_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: pages_concierge_page_how_it_works_steps pages_concierge_page_how_it_works_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_concierge_page_how_it_works_steps
    ADD CONSTRAINT pages_concierge_page_how_it_works_steps_pkey PRIMARY KEY (id);


--
-- Name: pages_concierge_page_services_items pages_concierge_page_services_items_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_concierge_page_services_items
    ADD CONSTRAINT pages_concierge_page_services_items_pkey PRIMARY KEY (id);


--
-- Name: pages_concierge_page_why_love_it_cards pages_concierge_page_why_love_it_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_concierge_page_why_love_it_cards
    ADD CONSTRAINT pages_concierge_page_why_love_it_cards_pkey PRIMARY KEY (id);


--
-- Name: pages_featured_properties_override pages_featured_properties_override_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_featured_properties_override
    ADD CONSTRAINT pages_featured_properties_override_pkey PRIMARY KEY (id);


--
-- Name: pages_hero_links pages_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_hero_links
    ADD CONSTRAINT pages_hero_links_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages_privacy_policy_page_sections pages_privacy_policy_page_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_privacy_policy_page_sections
    ADD CONSTRAINT pages_privacy_policy_page_sections_pkey PRIMARY KEY (id);


--
-- Name: pages_rels pages_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_pkey PRIMARY KEY (id);


--
-- Name: pages_terms_and_conditions_page_sections pages_terms_and_conditions_page_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_terms_and_conditions_page_sections
    ADD CONSTRAINT pages_terms_and_conditions_page_sections_pkey PRIMARY KEY (id);


--
-- Name: pages_why_choose_us pages_why_choose_us_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_why_choose_us
    ADD CONSTRAINT pages_why_choose_us_pkey PRIMARY KEY (id);


--
-- Name: payload_folders_folder_type payload_folders_folder_type_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_folders_folder_type
    ADD CONSTRAINT payload_folders_folder_type_pkey PRIMARY KEY (id);


--
-- Name: payload_folders payload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_folders
    ADD CONSTRAINT payload_folders_pkey PRIMARY KEY (id);


--
-- Name: payload_jobs_log payload_jobs_log_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_jobs_log
    ADD CONSTRAINT payload_jobs_log_pkey PRIMARY KEY (id);


--
-- Name: payload_jobs payload_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_jobs
    ADD CONSTRAINT payload_jobs_pkey PRIMARY KEY (id);


--
-- Name: payload_kv payload_kv_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_kv
    ADD CONSTRAINT payload_kv_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents payload_locked_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents
    ADD CONSTRAINT payload_locked_documents_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts_populated_authors posts_populated_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts_populated_authors
    ADD CONSTRAINT posts_populated_authors_pkey PRIMARY KEY (id);


--
-- Name: posts_rels posts_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_pkey PRIMARY KEY (id);


--
-- Name: properties_floor_plans properties_floor_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties_floor_plans
    ADD CONSTRAINT properties_floor_plans_pkey PRIMARY KEY (id);


--
-- Name: properties_neighborhood_accordion properties_neighborhood_accordion_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties_neighborhood_accordion
    ADD CONSTRAINT properties_neighborhood_accordion_pkey PRIMARY KEY (id);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: properties_rels properties_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties_rels
    ADD CONSTRAINT properties_rels_pkey PRIMARY KEY (id);


--
-- Name: redirects redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.redirects
    ADD CONSTRAINT redirects_pkey PRIMARY KEY (id);


--
-- Name: redirects_rels redirects_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_pkey PRIMARY KEY (id);


--
-- Name: search_categories search_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.search_categories
    ADD CONSTRAINT search_categories_pkey PRIMARY KEY (id);


--
-- Name: search search_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.search
    ADD CONSTRAINT search_pkey PRIMARY KEY (id);


--
-- Name: search_rels search_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.search_rels
    ADD CONSTRAINT search_rels_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (id);


--
-- Name: users_sessions users_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_pkey PRIMARY KEY (id);


--
-- Name: _blogs_v_autosave_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_autosave_idx ON public._blogs_v USING btree (autosave);


--
-- Name: _blogs_v_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_created_at_idx ON public._blogs_v USING btree (created_at);


--
-- Name: _blogs_v_latest_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_latest_idx ON public._blogs_v USING btree (latest);


--
-- Name: _blogs_v_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_parent_idx ON public._blogs_v USING btree (parent_id);


--
-- Name: _blogs_v_rels_blogs_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_rels_blogs_id_idx ON public._blogs_v_rels USING btree (blogs_id);


--
-- Name: _blogs_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_rels_categories_id_idx ON public._blogs_v_rels USING btree (categories_id);


--
-- Name: _blogs_v_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_rels_order_idx ON public._blogs_v_rels USING btree ("order");


--
-- Name: _blogs_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_rels_parent_idx ON public._blogs_v_rels USING btree (parent_id);


--
-- Name: _blogs_v_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_rels_path_idx ON public._blogs_v_rels USING btree (path);


--
-- Name: _blogs_v_rels_users_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_rels_users_id_idx ON public._blogs_v_rels USING btree (users_id);


--
-- Name: _blogs_v_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_updated_at_idx ON public._blogs_v USING btree (updated_at);


--
-- Name: _blogs_v_version_meta_version_meta_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_version_meta_version_meta_image_idx ON public._blogs_v USING btree (version_meta_image_id);


--
-- Name: _blogs_v_version_populated_authors_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_version_populated_authors_order_idx ON public._blogs_v_version_populated_authors USING btree (_order);


--
-- Name: _blogs_v_version_populated_authors_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_version_populated_authors_parent_id_idx ON public._blogs_v_version_populated_authors USING btree (_parent_id);


--
-- Name: _blogs_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_version_version__status_idx ON public._blogs_v USING btree (version__status);


--
-- Name: _blogs_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_version_version_created_at_idx ON public._blogs_v USING btree (version_created_at);


--
-- Name: _blogs_v_version_version_hero_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_version_version_hero_image_idx ON public._blogs_v USING btree (version_hero_image_id);


--
-- Name: _blogs_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_version_version_slug_idx ON public._blogs_v USING btree (version_slug);


--
-- Name: _blogs_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _blogs_v_version_version_updated_at_idx ON public._blogs_v USING btree (version_updated_at);


--
-- Name: _pages_v_autosave_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_autosave_idx ON public._pages_v USING btree (autosave);


--
-- Name: _pages_v_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_archive_order_idx ON public._pages_v_blocks_archive USING btree (_order);


--
-- Name: _pages_v_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_archive_parent_id_idx ON public._pages_v_blocks_archive USING btree (_parent_id);


--
-- Name: _pages_v_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_archive_path_idx ON public._pages_v_blocks_archive USING btree (_path);


--
-- Name: _pages_v_blocks_carousel_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_carousel_order_idx ON public._pages_v_blocks_carousel USING btree (_order);


--
-- Name: _pages_v_blocks_carousel_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_carousel_parent_id_idx ON public._pages_v_blocks_carousel USING btree (_parent_id);


--
-- Name: _pages_v_blocks_carousel_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_carousel_path_idx ON public._pages_v_blocks_carousel USING btree (_path);


--
-- Name: _pages_v_blocks_carousel_slides_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_carousel_slides_image_idx ON public._pages_v_blocks_carousel_slides USING btree (image_id);


--
-- Name: _pages_v_blocks_carousel_slides_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_carousel_slides_order_idx ON public._pages_v_blocks_carousel_slides USING btree (_order);


--
-- Name: _pages_v_blocks_carousel_slides_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_carousel_slides_parent_id_idx ON public._pages_v_blocks_carousel_slides USING btree (_parent_id);


--
-- Name: _pages_v_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_content_columns_order_idx ON public._pages_v_blocks_content_columns USING btree (_order);


--
-- Name: _pages_v_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_content_columns_parent_id_idx ON public._pages_v_blocks_content_columns USING btree (_parent_id);


--
-- Name: _pages_v_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_content_order_idx ON public._pages_v_blocks_content USING btree (_order);


--
-- Name: _pages_v_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_content_parent_id_idx ON public._pages_v_blocks_content USING btree (_parent_id);


--
-- Name: _pages_v_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_content_path_idx ON public._pages_v_blocks_content USING btree (_path);


--
-- Name: _pages_v_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_cta_links_order_idx ON public._pages_v_blocks_cta_links USING btree (_order);


--
-- Name: _pages_v_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_cta_links_parent_id_idx ON public._pages_v_blocks_cta_links USING btree (_parent_id);


--
-- Name: _pages_v_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_cta_order_idx ON public._pages_v_blocks_cta USING btree (_order);


--
-- Name: _pages_v_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_cta_parent_id_idx ON public._pages_v_blocks_cta USING btree (_parent_id);


--
-- Name: _pages_v_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_cta_path_idx ON public._pages_v_blocks_cta USING btree (_path);


--
-- Name: _pages_v_blocks_form_block_form_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_form_block_form_idx ON public._pages_v_blocks_form_block USING btree (form_id);


--
-- Name: _pages_v_blocks_form_block_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_form_block_order_idx ON public._pages_v_blocks_form_block USING btree (_order);


--
-- Name: _pages_v_blocks_form_block_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_form_block_parent_id_idx ON public._pages_v_blocks_form_block USING btree (_parent_id);


--
-- Name: _pages_v_blocks_form_block_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_form_block_path_idx ON public._pages_v_blocks_form_block USING btree (_path);


--
-- Name: _pages_v_blocks_inquiry_hero_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_inquiry_hero_image_idx ON public._pages_v_blocks_inquiry_hero USING btree (image_id);


--
-- Name: _pages_v_blocks_inquiry_hero_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_inquiry_hero_order_idx ON public._pages_v_blocks_inquiry_hero USING btree (_order);


--
-- Name: _pages_v_blocks_inquiry_hero_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_inquiry_hero_parent_id_idx ON public._pages_v_blocks_inquiry_hero USING btree (_parent_id);


--
-- Name: _pages_v_blocks_inquiry_hero_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_inquiry_hero_path_idx ON public._pages_v_blocks_inquiry_hero USING btree (_path);


--
-- Name: _pages_v_blocks_inquiry_hero_selected_form_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_inquiry_hero_selected_form_idx ON public._pages_v_blocks_inquiry_hero USING btree (selected_form_id);


--
-- Name: _pages_v_blocks_media_block_media_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_media_block_media_idx ON public._pages_v_blocks_media_block USING btree (media_id);


--
-- Name: _pages_v_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_media_block_order_idx ON public._pages_v_blocks_media_block USING btree (_order);


--
-- Name: _pages_v_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_media_block_parent_id_idx ON public._pages_v_blocks_media_block USING btree (_parent_id);


--
-- Name: _pages_v_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_blocks_media_block_path_idx ON public._pages_v_blocks_media_block USING btree (_path);


--
-- Name: _pages_v_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_created_at_idx ON public._pages_v USING btree (created_at);


--
-- Name: _pages_v_latest_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_latest_idx ON public._pages_v USING btree (latest);


--
-- Name: _pages_v_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_parent_idx ON public._pages_v USING btree (parent_id);


--
-- Name: _pages_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_rels_categories_id_idx ON public._pages_v_rels USING btree (categories_id);


--
-- Name: _pages_v_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_rels_order_idx ON public._pages_v_rels USING btree ("order");


--
-- Name: _pages_v_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_rels_pages_id_idx ON public._pages_v_rels USING btree (pages_id);


--
-- Name: _pages_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_rels_parent_idx ON public._pages_v_rels USING btree (parent_id);


--
-- Name: _pages_v_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_rels_path_idx ON public._pages_v_rels USING btree (path);


--
-- Name: _pages_v_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_rels_posts_id_idx ON public._pages_v_rels USING btree (posts_id);


--
-- Name: _pages_v_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_updated_at_idx ON public._pages_v USING btree (updated_at);


--
-- Name: _pages_v_version_buy_a_home_page_version_buy_a_home_pa_1_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_buy_a_home_page_version_buy_a_home_pa_1_idx ON public._pages_v USING btree (version_buy_a_home_page_selected_form_id);


--
-- Name: _pages_v_version_buy_a_home_page_version_buy_a_home_page_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_buy_a_home_page_version_buy_a_home_page_idx ON public._pages_v USING btree (version_buy_a_home_page_image_id);


--
-- Name: _pages_v_version_concierge_page_contact_form_version_con_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_concierge_page_contact_form_version_con_idx ON public._pages_v USING btree (version_concierge_page_contact_form_selected_form_id);


--
-- Name: _pages_v_version_concierge_page_how_it_works_steps_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_concierge_page_how_it_works_steps_order_idx ON public._pages_v_version_concierge_page_how_it_works_steps USING btree (_order);


--
-- Name: _pages_v_version_concierge_page_how_it_works_steps_parent_id_id; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_concierge_page_how_it_works_steps_parent_id_id ON public._pages_v_version_concierge_page_how_it_works_steps USING btree (_parent_id);


--
-- Name: _pages_v_version_concierge_page_services_items_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_concierge_page_services_items_order_idx ON public._pages_v_version_concierge_page_services_items USING btree (_order);


--
-- Name: _pages_v_version_concierge_page_services_items_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_concierge_page_services_items_parent_id_idx ON public._pages_v_version_concierge_page_services_items USING btree (_parent_id);


--
-- Name: _pages_v_version_concierge_page_why_love_it_cards_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_concierge_page_why_love_it_cards_order_idx ON public._pages_v_version_concierge_page_why_love_it_cards USING btree (_order);


--
-- Name: _pages_v_version_concierge_page_why_love_it_cards_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_concierge_page_why_love_it_cards_parent_id_idx ON public._pages_v_version_concierge_page_why_love_it_cards USING btree (_parent_id);


--
-- Name: _pages_v_version_featured_properties_override_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_featured_properties_override_order_idx ON public._pages_v_version_featured_properties_override USING btree (_order);


--
-- Name: _pages_v_version_featured_properties_override_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_featured_properties_override_parent_id_idx ON public._pages_v_version_featured_properties_override USING btree (_parent_id);


--
-- Name: _pages_v_version_hero_links_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_hero_links_order_idx ON public._pages_v_version_hero_links USING btree (_order);


--
-- Name: _pages_v_version_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_hero_links_parent_id_idx ON public._pages_v_version_hero_links USING btree (_parent_id);


--
-- Name: _pages_v_version_hero_version_hero_media_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_hero_version_hero_media_idx ON public._pages_v USING btree (version_hero_media_id);


--
-- Name: _pages_v_version_home_contact_version_home_contact_selec_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_home_contact_version_home_contact_selec_idx ON public._pages_v USING btree (version_home_contact_selected_form_id);


--
-- Name: _pages_v_version_meta_version_meta_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_meta_version_meta_image_idx ON public._pages_v USING btree (version_meta_image_id);


--
-- Name: _pages_v_version_other_inquiries_page_version_other_in_1_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_other_inquiries_page_version_other_in_1_idx ON public._pages_v USING btree (version_other_inquiries_page_selected_form_id);


--
-- Name: _pages_v_version_other_inquiries_page_version_other_inqu_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_other_inquiries_page_version_other_inqu_idx ON public._pages_v USING btree (version_other_inquiries_page_image_id);


--
-- Name: _pages_v_version_privacy_policy_page_sections_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_privacy_policy_page_sections_order_idx ON public._pages_v_version_privacy_policy_page_sections USING btree (_order);


--
-- Name: _pages_v_version_privacy_policy_page_sections_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_privacy_policy_page_sections_parent_id_idx ON public._pages_v_version_privacy_policy_page_sections USING btree (_parent_id);


--
-- Name: _pages_v_version_terms_and_conditions_page_sections_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_terms_and_conditions_page_sections_order_idx ON public._pages_v_version_terms_and_conditions_page_sections USING btree (_order);


--
-- Name: _pages_v_version_terms_and_conditions_page_sections_parent_id_i; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_terms_and_conditions_page_sections_parent_id_i ON public._pages_v_version_terms_and_conditions_page_sections USING btree (_parent_id);


--
-- Name: _pages_v_version_trade_inquiry_page_version_trade_inqu_1_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_trade_inquiry_page_version_trade_inqu_1_idx ON public._pages_v USING btree (version_trade_inquiry_page_selected_form_id);


--
-- Name: _pages_v_version_trade_inquiry_page_version_trade_inquir_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_trade_inquiry_page_version_trade_inquir_idx ON public._pages_v USING btree (version_trade_inquiry_page_image_id);


--
-- Name: _pages_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_version__status_idx ON public._pages_v USING btree (version__status);


--
-- Name: _pages_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_version_created_at_idx ON public._pages_v USING btree (version_created_at);


--
-- Name: _pages_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_version_slug_idx ON public._pages_v USING btree (version_slug);


--
-- Name: _pages_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_version_updated_at_idx ON public._pages_v USING btree (version_updated_at);


--
-- Name: _pages_v_version_why_choose_us_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_why_choose_us_order_idx ON public._pages_v_version_why_choose_us USING btree (_order);


--
-- Name: _pages_v_version_why_choose_us_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _pages_v_version_why_choose_us_parent_id_idx ON public._pages_v_version_why_choose_us USING btree (_parent_id);


--
-- Name: _posts_v_autosave_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_autosave_idx ON public._posts_v USING btree (autosave);


--
-- Name: _posts_v_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_created_at_idx ON public._posts_v USING btree (created_at);


--
-- Name: _posts_v_latest_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_latest_idx ON public._posts_v USING btree (latest);


--
-- Name: _posts_v_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_parent_idx ON public._posts_v USING btree (parent_id);


--
-- Name: _posts_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_rels_categories_id_idx ON public._posts_v_rels USING btree (categories_id);


--
-- Name: _posts_v_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_rels_order_idx ON public._posts_v_rels USING btree ("order");


--
-- Name: _posts_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_rels_parent_idx ON public._posts_v_rels USING btree (parent_id);


--
-- Name: _posts_v_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_rels_path_idx ON public._posts_v_rels USING btree (path);


--
-- Name: _posts_v_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_rels_posts_id_idx ON public._posts_v_rels USING btree (posts_id);


--
-- Name: _posts_v_rels_users_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_rels_users_id_idx ON public._posts_v_rels USING btree (users_id);


--
-- Name: _posts_v_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_updated_at_idx ON public._posts_v USING btree (updated_at);


--
-- Name: _posts_v_version_meta_version_meta_image_1_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_version_meta_version_meta_image_1_idx ON public._posts_v USING btree (version_meta_image_id);


--
-- Name: _posts_v_version_meta_version_meta_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_version_meta_version_meta_image_idx ON public._posts_v USING btree (version_meta_image_id);


--
-- Name: _posts_v_version_populated_authors_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_version_populated_authors_order_idx ON public._posts_v_version_populated_authors USING btree (_order);


--
-- Name: _posts_v_version_populated_authors_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_version_populated_authors_parent_id_idx ON public._posts_v_version_populated_authors USING btree (_parent_id);


--
-- Name: _posts_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_version_version__status_idx ON public._posts_v USING btree (version__status);


--
-- Name: _posts_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_version_version_created_at_idx ON public._posts_v USING btree (version_created_at);


--
-- Name: _posts_v_version_version_hero_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_version_version_hero_image_idx ON public._posts_v USING btree (version_hero_image_id);


--
-- Name: _posts_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_version_version_slug_idx ON public._posts_v USING btree (version_slug);


--
-- Name: _posts_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX _posts_v_version_version_updated_at_idx ON public._posts_v USING btree (version_updated_at);


--
-- Name: blogs__status_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs__status_idx ON public.blogs USING btree (_status);


--
-- Name: blogs_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_created_at_idx ON public.blogs USING btree (created_at);


--
-- Name: blogs_hero_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_hero_image_idx ON public.blogs USING btree (hero_image_id);


--
-- Name: blogs_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_meta_meta_image_idx ON public.blogs USING btree (meta_image_id);


--
-- Name: blogs_populated_authors_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_populated_authors_order_idx ON public.blogs_populated_authors USING btree (_order);


--
-- Name: blogs_populated_authors_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_populated_authors_parent_id_idx ON public.blogs_populated_authors USING btree (_parent_id);


--
-- Name: blogs_rels_blogs_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_rels_blogs_id_idx ON public.blogs_rels USING btree (blogs_id);


--
-- Name: blogs_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_rels_categories_id_idx ON public.blogs_rels USING btree (categories_id);


--
-- Name: blogs_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_rels_order_idx ON public.blogs_rels USING btree ("order");


--
-- Name: blogs_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_rels_parent_idx ON public.blogs_rels USING btree (parent_id);


--
-- Name: blogs_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_rels_path_idx ON public.blogs_rels USING btree (path);


--
-- Name: blogs_rels_users_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_rels_users_id_idx ON public.blogs_rels USING btree (users_id);


--
-- Name: blogs_slug_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE UNIQUE INDEX blogs_slug_idx ON public.blogs USING btree (slug);


--
-- Name: blogs_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX blogs_updated_at_idx ON public.blogs USING btree (updated_at);


--
-- Name: categories_breadcrumbs_doc_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX categories_breadcrumbs_doc_idx ON public.categories_breadcrumbs USING btree (doc_id);


--
-- Name: categories_breadcrumbs_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX categories_breadcrumbs_order_idx ON public.categories_breadcrumbs USING btree (_order);


--
-- Name: categories_breadcrumbs_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX categories_breadcrumbs_parent_id_idx ON public.categories_breadcrumbs USING btree (_parent_id);


--
-- Name: categories_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX categories_created_at_idx ON public.categories USING btree (created_at);


--
-- Name: categories_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX categories_parent_idx ON public.categories USING btree (parent_id);


--
-- Name: categories_slug_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE UNIQUE INDEX categories_slug_idx ON public.categories USING btree (slug);


--
-- Name: categories_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX categories_updated_at_idx ON public.categories USING btree (updated_at);


--
-- Name: cf7_tracker_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX cf7_tracker_created_at_idx ON public.cf7_tracker USING btree (created_at);


--
-- Name: cf7_tracker_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX cf7_tracker_updated_at_idx ON public.cf7_tracker USING btree (updated_at);


--
-- Name: footer_nav_items_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX footer_nav_items_order_idx ON public.footer_nav_items USING btree (_order);


--
-- Name: footer_nav_items_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX footer_nav_items_parent_id_idx ON public.footer_nav_items USING btree (_parent_id);


--
-- Name: footer_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX footer_rels_order_idx ON public.footer_rels USING btree ("order");


--
-- Name: footer_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX footer_rels_pages_id_idx ON public.footer_rels USING btree (pages_id);


--
-- Name: footer_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX footer_rels_parent_idx ON public.footer_rels USING btree (parent_id);


--
-- Name: footer_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX footer_rels_path_idx ON public.footer_rels USING btree (path);


--
-- Name: footer_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX footer_rels_posts_id_idx ON public.footer_rels USING btree (posts_id);


--
-- Name: form_submissions_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX form_submissions_created_at_idx ON public.form_submissions USING btree (created_at);


--
-- Name: form_submissions_form_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX form_submissions_form_idx ON public.form_submissions USING btree (form_id);


--
-- Name: form_submissions_submission_data_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX form_submissions_submission_data_order_idx ON public.form_submissions_submission_data USING btree (_order);


--
-- Name: form_submissions_submission_data_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX form_submissions_submission_data_parent_id_idx ON public.form_submissions_submission_data USING btree (_parent_id);


--
-- Name: form_submissions_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX form_submissions_updated_at_idx ON public.form_submissions USING btree (updated_at);


--
-- Name: forms_blocks_checkbox_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_checkbox_order_idx ON public.forms_blocks_checkbox USING btree (_order);


--
-- Name: forms_blocks_checkbox_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_checkbox_parent_id_idx ON public.forms_blocks_checkbox USING btree (_parent_id);


--
-- Name: forms_blocks_checkbox_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_checkbox_path_idx ON public.forms_blocks_checkbox USING btree (_path);


--
-- Name: forms_blocks_country_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_country_order_idx ON public.forms_blocks_country USING btree (_order);


--
-- Name: forms_blocks_country_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_country_parent_id_idx ON public.forms_blocks_country USING btree (_parent_id);


--
-- Name: forms_blocks_country_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_country_path_idx ON public.forms_blocks_country USING btree (_path);


--
-- Name: forms_blocks_email_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_email_order_idx ON public.forms_blocks_email USING btree (_order);


--
-- Name: forms_blocks_email_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_email_parent_id_idx ON public.forms_blocks_email USING btree (_parent_id);


--
-- Name: forms_blocks_email_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_email_path_idx ON public.forms_blocks_email USING btree (_path);


--
-- Name: forms_blocks_message_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_message_order_idx ON public.forms_blocks_message USING btree (_order);


--
-- Name: forms_blocks_message_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_message_parent_id_idx ON public.forms_blocks_message USING btree (_parent_id);


--
-- Name: forms_blocks_message_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_message_path_idx ON public.forms_blocks_message USING btree (_path);


--
-- Name: forms_blocks_number_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_number_order_idx ON public.forms_blocks_number USING btree (_order);


--
-- Name: forms_blocks_number_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_number_parent_id_idx ON public.forms_blocks_number USING btree (_parent_id);


--
-- Name: forms_blocks_number_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_number_path_idx ON public.forms_blocks_number USING btree (_path);


--
-- Name: forms_blocks_select_options_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_select_options_order_idx ON public.forms_blocks_select_options USING btree (_order);


--
-- Name: forms_blocks_select_options_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_select_options_parent_id_idx ON public.forms_blocks_select_options USING btree (_parent_id);


--
-- Name: forms_blocks_select_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_select_order_idx ON public.forms_blocks_select USING btree (_order);


--
-- Name: forms_blocks_select_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_select_parent_id_idx ON public.forms_blocks_select USING btree (_parent_id);


--
-- Name: forms_blocks_select_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_select_path_idx ON public.forms_blocks_select USING btree (_path);


--
-- Name: forms_blocks_state_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_state_order_idx ON public.forms_blocks_state USING btree (_order);


--
-- Name: forms_blocks_state_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_state_parent_id_idx ON public.forms_blocks_state USING btree (_parent_id);


--
-- Name: forms_blocks_state_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_state_path_idx ON public.forms_blocks_state USING btree (_path);


--
-- Name: forms_blocks_text_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_text_order_idx ON public.forms_blocks_text USING btree (_order);


--
-- Name: forms_blocks_text_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_text_parent_id_idx ON public.forms_blocks_text USING btree (_parent_id);


--
-- Name: forms_blocks_text_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_text_path_idx ON public.forms_blocks_text USING btree (_path);


--
-- Name: forms_blocks_textarea_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_textarea_order_idx ON public.forms_blocks_textarea USING btree (_order);


--
-- Name: forms_blocks_textarea_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_textarea_parent_id_idx ON public.forms_blocks_textarea USING btree (_parent_id);


--
-- Name: forms_blocks_textarea_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_blocks_textarea_path_idx ON public.forms_blocks_textarea USING btree (_path);


--
-- Name: forms_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_created_at_idx ON public.forms USING btree (created_at);


--
-- Name: forms_emails_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_emails_order_idx ON public.forms_emails USING btree (_order);


--
-- Name: forms_emails_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_emails_parent_id_idx ON public.forms_emails USING btree (_parent_id);


--
-- Name: forms_field_mapping_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_field_mapping_order_idx ON public.forms_field_mapping USING btree (_order);


--
-- Name: forms_field_mapping_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_field_mapping_parent_id_idx ON public.forms_field_mapping USING btree (_parent_id);


--
-- Name: forms_static_fields_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_static_fields_order_idx ON public.forms_static_fields USING btree (_order);


--
-- Name: forms_static_fields_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_static_fields_parent_id_idx ON public.forms_static_fields USING btree (_parent_id);


--
-- Name: forms_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX forms_updated_at_idx ON public.forms USING btree (updated_at);


--
-- Name: header_nav_items_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX header_nav_items_order_idx ON public.header_nav_items USING btree (_order);


--
-- Name: header_nav_items_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX header_nav_items_parent_id_idx ON public.header_nav_items USING btree (_parent_id);


--
-- Name: header_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX header_rels_order_idx ON public.header_rels USING btree ("order");


--
-- Name: header_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX header_rels_pages_id_idx ON public.header_rels USING btree (pages_id);


--
-- Name: header_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX header_rels_parent_idx ON public.header_rels USING btree (parent_id);


--
-- Name: header_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX header_rels_path_idx ON public.header_rels USING btree (path);


--
-- Name: header_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX header_rels_posts_id_idx ON public.header_rels USING btree (posts_id);


--
-- Name: media_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX media_created_at_idx ON public.media USING btree (created_at);


--
-- Name: media_filename_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE UNIQUE INDEX media_filename_idx ON public.media USING btree (filename);


--
-- Name: media_folder_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX media_folder_idx ON public.media USING btree (folder_id);


--
-- Name: media_sizes_large_sizes_large_filename_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX media_sizes_large_sizes_large_filename_idx ON public.media USING btree (sizes_large_filename);


--
-- Name: media_sizes_medium_sizes_medium_filename_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX media_sizes_medium_sizes_medium_filename_idx ON public.media USING btree (sizes_medium_filename);


--
-- Name: media_sizes_og_sizes_og_filename_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX media_sizes_og_sizes_og_filename_idx ON public.media USING btree (sizes_og_filename);


--
-- Name: media_sizes_small_sizes_small_filename_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX media_sizes_small_sizes_small_filename_idx ON public.media USING btree (sizes_small_filename);


--
-- Name: media_sizes_square_sizes_square_filename_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX media_sizes_square_sizes_square_filename_idx ON public.media USING btree (sizes_square_filename);


--
-- Name: media_sizes_thumbnail_sizes_thumbnail_filename_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX media_sizes_thumbnail_sizes_thumbnail_filename_idx ON public.media USING btree (sizes_thumbnail_filename);


--
-- Name: media_sizes_xlarge_sizes_xlarge_filename_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX media_sizes_xlarge_sizes_xlarge_filename_idx ON public.media USING btree (sizes_xlarge_filename);


--
-- Name: media_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX media_updated_at_idx ON public.media USING btree (updated_at);


--
-- Name: pages__status_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages__status_idx ON public.pages USING btree (_status);


--
-- Name: pages_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_archive_order_idx ON public.pages_blocks_archive USING btree (_order);


--
-- Name: pages_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_archive_parent_id_idx ON public.pages_blocks_archive USING btree (_parent_id);


--
-- Name: pages_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_archive_path_idx ON public.pages_blocks_archive USING btree (_path);


--
-- Name: pages_blocks_carousel_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_carousel_order_idx ON public.pages_blocks_carousel USING btree (_order);


--
-- Name: pages_blocks_carousel_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_carousel_parent_id_idx ON public.pages_blocks_carousel USING btree (_parent_id);


--
-- Name: pages_blocks_carousel_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_carousel_path_idx ON public.pages_blocks_carousel USING btree (_path);


--
-- Name: pages_blocks_carousel_slides_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_carousel_slides_image_idx ON public.pages_blocks_carousel_slides USING btree (image_id);


--
-- Name: pages_blocks_carousel_slides_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_carousel_slides_order_idx ON public.pages_blocks_carousel_slides USING btree (_order);


--
-- Name: pages_blocks_carousel_slides_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_carousel_slides_parent_id_idx ON public.pages_blocks_carousel_slides USING btree (_parent_id);


--
-- Name: pages_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_content_columns_order_idx ON public.pages_blocks_content_columns USING btree (_order);


--
-- Name: pages_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_content_columns_parent_id_idx ON public.pages_blocks_content_columns USING btree (_parent_id);


--
-- Name: pages_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_content_order_idx ON public.pages_blocks_content USING btree (_order);


--
-- Name: pages_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_content_parent_id_idx ON public.pages_blocks_content USING btree (_parent_id);


--
-- Name: pages_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_content_path_idx ON public.pages_blocks_content USING btree (_path);


--
-- Name: pages_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_cta_links_order_idx ON public.pages_blocks_cta_links USING btree (_order);


--
-- Name: pages_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_cta_links_parent_id_idx ON public.pages_blocks_cta_links USING btree (_parent_id);


--
-- Name: pages_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_cta_order_idx ON public.pages_blocks_cta USING btree (_order);


--
-- Name: pages_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_cta_parent_id_idx ON public.pages_blocks_cta USING btree (_parent_id);


--
-- Name: pages_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_cta_path_idx ON public.pages_blocks_cta USING btree (_path);


--
-- Name: pages_blocks_form_block_form_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_form_block_form_idx ON public.pages_blocks_form_block USING btree (form_id);


--
-- Name: pages_blocks_form_block_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_form_block_order_idx ON public.pages_blocks_form_block USING btree (_order);


--
-- Name: pages_blocks_form_block_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_form_block_parent_id_idx ON public.pages_blocks_form_block USING btree (_parent_id);


--
-- Name: pages_blocks_form_block_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_form_block_path_idx ON public.pages_blocks_form_block USING btree (_path);


--
-- Name: pages_blocks_inquiry_hero_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_inquiry_hero_image_idx ON public.pages_blocks_inquiry_hero USING btree (image_id);


--
-- Name: pages_blocks_inquiry_hero_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_inquiry_hero_order_idx ON public.pages_blocks_inquiry_hero USING btree (_order);


--
-- Name: pages_blocks_inquiry_hero_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_inquiry_hero_parent_id_idx ON public.pages_blocks_inquiry_hero USING btree (_parent_id);


--
-- Name: pages_blocks_inquiry_hero_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_inquiry_hero_path_idx ON public.pages_blocks_inquiry_hero USING btree (_path);


--
-- Name: pages_blocks_inquiry_hero_selected_form_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_inquiry_hero_selected_form_idx ON public.pages_blocks_inquiry_hero USING btree (selected_form_id);


--
-- Name: pages_blocks_media_block_media_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_media_block_media_idx ON public.pages_blocks_media_block USING btree (media_id);


--
-- Name: pages_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_media_block_order_idx ON public.pages_blocks_media_block USING btree (_order);


--
-- Name: pages_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_media_block_parent_id_idx ON public.pages_blocks_media_block USING btree (_parent_id);


--
-- Name: pages_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_blocks_media_block_path_idx ON public.pages_blocks_media_block USING btree (_path);


--
-- Name: pages_buy_a_home_page_buy_a_home_page_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_buy_a_home_page_buy_a_home_page_image_idx ON public.pages USING btree (buy_a_home_page_image_id);


--
-- Name: pages_buy_a_home_page_buy_a_home_page_selected_form_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_buy_a_home_page_buy_a_home_page_selected_form_idx ON public.pages USING btree (buy_a_home_page_selected_form_id);


--
-- Name: pages_concierge_page_contact_form_concierge_page_contact_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_concierge_page_contact_form_concierge_page_contact_idx ON public.pages USING btree (concierge_page_contact_form_selected_form_id);


--
-- Name: pages_concierge_page_how_it_works_steps_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_concierge_page_how_it_works_steps_order_idx ON public.pages_concierge_page_how_it_works_steps USING btree (_order);


--
-- Name: pages_concierge_page_how_it_works_steps_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_concierge_page_how_it_works_steps_parent_id_idx ON public.pages_concierge_page_how_it_works_steps USING btree (_parent_id);


--
-- Name: pages_concierge_page_services_items_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_concierge_page_services_items_order_idx ON public.pages_concierge_page_services_items USING btree (_order);


--
-- Name: pages_concierge_page_services_items_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_concierge_page_services_items_parent_id_idx ON public.pages_concierge_page_services_items USING btree (_parent_id);


--
-- Name: pages_concierge_page_why_love_it_cards_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_concierge_page_why_love_it_cards_order_idx ON public.pages_concierge_page_why_love_it_cards USING btree (_order);


--
-- Name: pages_concierge_page_why_love_it_cards_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_concierge_page_why_love_it_cards_parent_id_idx ON public.pages_concierge_page_why_love_it_cards USING btree (_parent_id);


--
-- Name: pages_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_created_at_idx ON public.pages USING btree (created_at);


--
-- Name: pages_featured_properties_override_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_featured_properties_override_order_idx ON public.pages_featured_properties_override USING btree (_order);


--
-- Name: pages_featured_properties_override_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_featured_properties_override_parent_id_idx ON public.pages_featured_properties_override USING btree (_parent_id);


--
-- Name: pages_hero_hero_media_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_hero_hero_media_idx ON public.pages USING btree (hero_media_id);


--
-- Name: pages_hero_links_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_hero_links_order_idx ON public.pages_hero_links USING btree (_order);


--
-- Name: pages_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_hero_links_parent_id_idx ON public.pages_hero_links USING btree (_parent_id);


--
-- Name: pages_home_contact_home_contact_selected_form_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_home_contact_home_contact_selected_form_idx ON public.pages USING btree (home_contact_selected_form_id);


--
-- Name: pages_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_meta_meta_image_idx ON public.pages USING btree (meta_image_id);


--
-- Name: pages_other_inquiries_page_other_inquiries_page_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_other_inquiries_page_other_inquiries_page_image_idx ON public.pages USING btree (other_inquiries_page_image_id);


--
-- Name: pages_other_inquiries_page_other_inquiries_page_selected_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_other_inquiries_page_other_inquiries_page_selected_idx ON public.pages USING btree (other_inquiries_page_selected_form_id);


--
-- Name: pages_privacy_policy_page_sections_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_privacy_policy_page_sections_order_idx ON public.pages_privacy_policy_page_sections USING btree (_order);


--
-- Name: pages_privacy_policy_page_sections_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_privacy_policy_page_sections_parent_id_idx ON public.pages_privacy_policy_page_sections USING btree (_parent_id);


--
-- Name: pages_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_rels_categories_id_idx ON public.pages_rels USING btree (categories_id);


--
-- Name: pages_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_rels_order_idx ON public.pages_rels USING btree ("order");


--
-- Name: pages_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_rels_pages_id_idx ON public.pages_rels USING btree (pages_id);


--
-- Name: pages_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_rels_parent_idx ON public.pages_rels USING btree (parent_id);


--
-- Name: pages_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_rels_path_idx ON public.pages_rels USING btree (path);


--
-- Name: pages_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_rels_posts_id_idx ON public.pages_rels USING btree (posts_id);


--
-- Name: pages_slug_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE UNIQUE INDEX pages_slug_idx ON public.pages USING btree (slug);


--
-- Name: pages_terms_and_conditions_page_sections_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_terms_and_conditions_page_sections_order_idx ON public.pages_terms_and_conditions_page_sections USING btree (_order);


--
-- Name: pages_terms_and_conditions_page_sections_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_terms_and_conditions_page_sections_parent_id_idx ON public.pages_terms_and_conditions_page_sections USING btree (_parent_id);


--
-- Name: pages_trade_inquiry_page_trade_inquiry_page_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_trade_inquiry_page_trade_inquiry_page_image_idx ON public.pages USING btree (trade_inquiry_page_image_id);


--
-- Name: pages_trade_inquiry_page_trade_inquiry_page_selected_for_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_trade_inquiry_page_trade_inquiry_page_selected_for_idx ON public.pages USING btree (trade_inquiry_page_selected_form_id);


--
-- Name: pages_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_updated_at_idx ON public.pages USING btree (updated_at);


--
-- Name: pages_why_choose_us_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_why_choose_us_order_idx ON public.pages_why_choose_us USING btree (_order);


--
-- Name: pages_why_choose_us_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX pages_why_choose_us_parent_id_idx ON public.pages_why_choose_us USING btree (_parent_id);


--
-- Name: payload_folders_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_folders_created_at_idx ON public.payload_folders USING btree (created_at);


--
-- Name: payload_folders_folder_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_folders_folder_idx ON public.payload_folders USING btree (folder_id);


--
-- Name: payload_folders_folder_type_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_folders_folder_type_order_idx ON public.payload_folders_folder_type USING btree ("order");


--
-- Name: payload_folders_folder_type_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_folders_folder_type_parent_idx ON public.payload_folders_folder_type USING btree (parent_id);


--
-- Name: payload_folders_name_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_folders_name_idx ON public.payload_folders USING btree (name);


--
-- Name: payload_folders_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_folders_updated_at_idx ON public.payload_folders USING btree (updated_at);


--
-- Name: payload_jobs_completed_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_jobs_completed_at_idx ON public.payload_jobs USING btree (completed_at);


--
-- Name: payload_jobs_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_jobs_created_at_idx ON public.payload_jobs USING btree (created_at);


--
-- Name: payload_jobs_has_error_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_jobs_has_error_idx ON public.payload_jobs USING btree (has_error);


--
-- Name: payload_jobs_log_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_jobs_log_order_idx ON public.payload_jobs_log USING btree (_order);


--
-- Name: payload_jobs_log_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_jobs_log_parent_id_idx ON public.payload_jobs_log USING btree (_parent_id);


--
-- Name: payload_jobs_processing_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_jobs_processing_idx ON public.payload_jobs USING btree (processing);


--
-- Name: payload_jobs_queue_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_jobs_queue_idx ON public.payload_jobs USING btree (queue);


--
-- Name: payload_jobs_task_slug_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_jobs_task_slug_idx ON public.payload_jobs USING btree (task_slug);


--
-- Name: payload_jobs_total_tried_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_jobs_total_tried_idx ON public.payload_jobs USING btree (total_tried);


--
-- Name: payload_jobs_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_jobs_updated_at_idx ON public.payload_jobs USING btree (updated_at);


--
-- Name: payload_jobs_wait_until_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_jobs_wait_until_idx ON public.payload_jobs USING btree (wait_until);


--
-- Name: payload_kv_key_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE UNIQUE INDEX payload_kv_key_idx ON public.payload_kv USING btree (key);


--
-- Name: payload_locked_documents_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_created_at_idx ON public.payload_locked_documents USING btree (created_at);


--
-- Name: payload_locked_documents_global_slug_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_global_slug_idx ON public.payload_locked_documents USING btree (global_slug);


--
-- Name: payload_locked_documents_rels_blogs_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_blogs_id_idx ON public.payload_locked_documents_rels USING btree (blogs_id);


--
-- Name: payload_locked_documents_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_categories_id_idx ON public.payload_locked_documents_rels USING btree (categories_id);


--
-- Name: payload_locked_documents_rels_cf7_tracker_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_cf7_tracker_id_idx ON public.payload_locked_documents_rels USING btree (cf7_tracker_id);


--
-- Name: payload_locked_documents_rels_form_submissions_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_form_submissions_id_idx ON public.payload_locked_documents_rels USING btree (form_submissions_id);


--
-- Name: payload_locked_documents_rels_forms_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_forms_id_idx ON public.payload_locked_documents_rels USING btree (forms_id);


--
-- Name: payload_locked_documents_rels_media_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_media_id_idx ON public.payload_locked_documents_rels USING btree (media_id);


--
-- Name: payload_locked_documents_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_order_idx ON public.payload_locked_documents_rels USING btree ("order");


--
-- Name: payload_locked_documents_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_pages_id_idx ON public.payload_locked_documents_rels USING btree (pages_id);


--
-- Name: payload_locked_documents_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_parent_idx ON public.payload_locked_documents_rels USING btree (parent_id);


--
-- Name: payload_locked_documents_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_path_idx ON public.payload_locked_documents_rels USING btree (path);


--
-- Name: payload_locked_documents_rels_payload_folders_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_payload_folders_id_idx ON public.payload_locked_documents_rels USING btree (payload_folders_id);


--
-- Name: payload_locked_documents_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_posts_id_idx ON public.payload_locked_documents_rels USING btree (posts_id);


--
-- Name: payload_locked_documents_rels_properties_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_properties_id_idx ON public.payload_locked_documents_rels USING btree (properties_id);


--
-- Name: payload_locked_documents_rels_redirects_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_redirects_id_idx ON public.payload_locked_documents_rels USING btree (redirects_id);


--
-- Name: payload_locked_documents_rels_search_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_search_id_idx ON public.payload_locked_documents_rels USING btree (search_id);


--
-- Name: payload_locked_documents_rels_users_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_rels_users_id_idx ON public.payload_locked_documents_rels USING btree (users_id);


--
-- Name: payload_locked_documents_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_locked_documents_updated_at_idx ON public.payload_locked_documents USING btree (updated_at);


--
-- Name: payload_migrations_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_migrations_created_at_idx ON public.payload_migrations USING btree (created_at);


--
-- Name: payload_migrations_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_migrations_updated_at_idx ON public.payload_migrations USING btree (updated_at);


--
-- Name: payload_preferences_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_preferences_created_at_idx ON public.payload_preferences USING btree (created_at);


--
-- Name: payload_preferences_key_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_preferences_key_idx ON public.payload_preferences USING btree (key);


--
-- Name: payload_preferences_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_preferences_rels_order_idx ON public.payload_preferences_rels USING btree ("order");


--
-- Name: payload_preferences_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_preferences_rels_parent_idx ON public.payload_preferences_rels USING btree (parent_id);


--
-- Name: payload_preferences_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_preferences_rels_path_idx ON public.payload_preferences_rels USING btree (path);


--
-- Name: payload_preferences_rels_users_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_preferences_rels_users_id_idx ON public.payload_preferences_rels USING btree (users_id);


--
-- Name: payload_preferences_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX payload_preferences_updated_at_idx ON public.payload_preferences USING btree (updated_at);


--
-- Name: posts__status_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts__status_idx ON public.posts USING btree (_status);


--
-- Name: posts_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_created_at_idx ON public.posts USING btree (created_at);


--
-- Name: posts_hero_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_hero_image_idx ON public.posts USING btree (hero_image_id);


--
-- Name: posts_meta_meta_image_1_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_meta_meta_image_1_idx ON public.posts USING btree (meta_image_id);


--
-- Name: posts_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_meta_meta_image_idx ON public.posts USING btree (meta_image_id);


--
-- Name: posts_populated_authors_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_populated_authors_order_idx ON public.posts_populated_authors USING btree (_order);


--
-- Name: posts_populated_authors_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_populated_authors_parent_id_idx ON public.posts_populated_authors USING btree (_parent_id);


--
-- Name: posts_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_rels_categories_id_idx ON public.posts_rels USING btree (categories_id);


--
-- Name: posts_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_rels_order_idx ON public.posts_rels USING btree ("order");


--
-- Name: posts_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_rels_parent_idx ON public.posts_rels USING btree (parent_id);


--
-- Name: posts_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_rels_path_idx ON public.posts_rels USING btree (path);


--
-- Name: posts_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_rels_posts_id_idx ON public.posts_rels USING btree (posts_id);


--
-- Name: posts_rels_users_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_rels_users_id_idx ON public.posts_rels USING btree (users_id);


--
-- Name: posts_slug_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE UNIQUE INDEX posts_slug_idx ON public.posts USING btree (slug);


--
-- Name: posts_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX posts_updated_at_idx ON public.posts USING btree (updated_at);


--
-- Name: properties_about_section_about_section_about_background__idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_about_section_about_section_about_background__idx ON public.properties USING btree (about_section_about_background_image_id);


--
-- Name: properties_broker_information_broker_information_broker__idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_broker_information_broker_information_broker__idx ON public.properties USING btree (broker_information_broker_image_id);


--
-- Name: properties_contact_form_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_contact_form_idx ON public.properties USING btree (contact_form_id);


--
-- Name: properties_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_created_at_idx ON public.properties USING btree (created_at);


--
-- Name: properties_floor_plans_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_floor_plans_image_idx ON public.properties_floor_plans USING btree (image_id);


--
-- Name: properties_floor_plans_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_floor_plans_order_idx ON public.properties_floor_plans USING btree (_order);


--
-- Name: properties_floor_plans_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_floor_plans_parent_id_idx ON public.properties_floor_plans USING btree (_parent_id);


--
-- Name: properties_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_meta_meta_image_idx ON public.properties USING btree (meta_image_id);


--
-- Name: properties_neighborhood_accordion_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_neighborhood_accordion_image_idx ON public.properties_neighborhood_accordion USING btree (image_id);


--
-- Name: properties_neighborhood_accordion_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_neighborhood_accordion_order_idx ON public.properties_neighborhood_accordion USING btree (_order);


--
-- Name: properties_neighborhood_accordion_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_neighborhood_accordion_parent_id_idx ON public.properties_neighborhood_accordion USING btree (_parent_id);


--
-- Name: properties_parent_property_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_parent_property_idx ON public.properties USING btree (parent_property_id);


--
-- Name: properties_rels_media_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_rels_media_id_idx ON public.properties_rels USING btree (media_id);


--
-- Name: properties_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_rels_order_idx ON public.properties_rels USING btree ("order");


--
-- Name: properties_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_rels_parent_idx ON public.properties_rels USING btree (parent_id);


--
-- Name: properties_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_rels_path_idx ON public.properties_rels USING btree (path);


--
-- Name: properties_slug_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE UNIQUE INDEX properties_slug_idx ON public.properties USING btree (slug);


--
-- Name: properties_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_updated_at_idx ON public.properties USING btree (updated_at);


--
-- Name: properties_video_video_video_file_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX properties_video_video_video_file_idx ON public.properties USING btree (video_video_file_id);


--
-- Name: redirects_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX redirects_created_at_idx ON public.redirects USING btree (created_at);


--
-- Name: redirects_from_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE UNIQUE INDEX redirects_from_idx ON public.redirects USING btree ("from");


--
-- Name: redirects_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX redirects_rels_order_idx ON public.redirects_rels USING btree ("order");


--
-- Name: redirects_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX redirects_rels_pages_id_idx ON public.redirects_rels USING btree (pages_id);


--
-- Name: redirects_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX redirects_rels_parent_idx ON public.redirects_rels USING btree (parent_id);


--
-- Name: redirects_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX redirects_rels_path_idx ON public.redirects_rels USING btree (path);


--
-- Name: redirects_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX redirects_rels_posts_id_idx ON public.redirects_rels USING btree (posts_id);


--
-- Name: redirects_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX redirects_updated_at_idx ON public.redirects USING btree (updated_at);


--
-- Name: search_categories_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX search_categories_order_idx ON public.search_categories USING btree (_order);


--
-- Name: search_categories_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX search_categories_parent_id_idx ON public.search_categories USING btree (_parent_id);


--
-- Name: search_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX search_created_at_idx ON public.search USING btree (created_at);


--
-- Name: search_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX search_meta_meta_image_idx ON public.search USING btree (meta_image_id);


--
-- Name: search_rels_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX search_rels_order_idx ON public.search_rels USING btree ("order");


--
-- Name: search_rels_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX search_rels_parent_idx ON public.search_rels USING btree (parent_id);


--
-- Name: search_rels_path_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX search_rels_path_idx ON public.search_rels USING btree (path);


--
-- Name: search_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX search_rels_posts_id_idx ON public.search_rels USING btree (posts_id);


--
-- Name: search_slug_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX search_slug_idx ON public.search USING btree (slug);


--
-- Name: search_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX search_updated_at_idx ON public.search USING btree (updated_at);


--
-- Name: settings_header_logo_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX settings_header_logo_idx ON public.settings USING btree (header_logo_id);


--
-- Name: settings_site_icon_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX settings_site_icon_idx ON public.settings USING btree (site_icon_id);


--
-- Name: users_created_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX users_created_at_idx ON public.users USING btree (created_at);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_roles_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX users_roles_order_idx ON public.users_roles USING btree ("order");


--
-- Name: users_roles_parent_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX users_roles_parent_idx ON public.users_roles USING btree (parent_id);


--
-- Name: users_sessions_order_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX users_sessions_order_idx ON public.users_sessions USING btree (_order);


--
-- Name: users_sessions_parent_id_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX users_sessions_parent_id_idx ON public.users_sessions USING btree (_parent_id);


--
-- Name: users_updated_at_idx; Type: INDEX; Schema: public; Owner: nsh_db_user
--

CREATE INDEX users_updated_at_idx ON public.users USING btree (updated_at);


--
-- Name: _blogs_v _blogs_v_parent_id_blogs_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v
    ADD CONSTRAINT _blogs_v_parent_id_blogs_id_fk FOREIGN KEY (parent_id) REFERENCES public.blogs(id) ON DELETE SET NULL;


--
-- Name: _blogs_v_rels _blogs_v_rels_blogs_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v_rels
    ADD CONSTRAINT _blogs_v_rels_blogs_fk FOREIGN KEY (blogs_id) REFERENCES public.blogs(id) ON DELETE CASCADE;


--
-- Name: _blogs_v_rels _blogs_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v_rels
    ADD CONSTRAINT _blogs_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: _blogs_v_rels _blogs_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v_rels
    ADD CONSTRAINT _blogs_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._blogs_v(id) ON DELETE CASCADE;


--
-- Name: _blogs_v_rels _blogs_v_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v_rels
    ADD CONSTRAINT _blogs_v_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: _blogs_v _blogs_v_version_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v
    ADD CONSTRAINT _blogs_v_version_hero_image_id_media_id_fk FOREIGN KEY (version_hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _blogs_v _blogs_v_version_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v
    ADD CONSTRAINT _blogs_v_version_meta_image_id_media_id_fk FOREIGN KEY (version_meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _blogs_v_version_populated_authors _blogs_v_version_populated_authors_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._blogs_v_version_populated_authors
    ADD CONSTRAINT _blogs_v_version_populated_authors_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._blogs_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_archive _pages_v_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_archive
    ADD CONSTRAINT _pages_v_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_carousel _pages_v_blocks_carousel_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_carousel
    ADD CONSTRAINT _pages_v_blocks_carousel_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_carousel_slides _pages_v_blocks_carousel_slides_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_carousel_slides
    ADD CONSTRAINT _pages_v_blocks_carousel_slides_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v_blocks_carousel_slides _pages_v_blocks_carousel_slides_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_carousel_slides
    ADD CONSTRAINT _pages_v_blocks_carousel_slides_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_carousel(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_content_columns _pages_v_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns
    ADD CONSTRAINT _pages_v_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_content(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_content _pages_v_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_content
    ADD CONSTRAINT _pages_v_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_cta_links _pages_v_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links
    ADD CONSTRAINT _pages_v_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_cta _pages_v_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_cta
    ADD CONSTRAINT _pages_v_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_form_block _pages_v_blocks_form_block_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_form_block
    ADD CONSTRAINT _pages_v_blocks_form_block_form_id_forms_id_fk FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: _pages_v_blocks_form_block _pages_v_blocks_form_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_form_block
    ADD CONSTRAINT _pages_v_blocks_form_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_inquiry_hero _pages_v_blocks_inquiry_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_inquiry_hero
    ADD CONSTRAINT _pages_v_blocks_inquiry_hero_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v_blocks_inquiry_hero _pages_v_blocks_inquiry_hero_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_inquiry_hero
    ADD CONSTRAINT _pages_v_blocks_inquiry_hero_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_inquiry_hero _pages_v_blocks_inquiry_hero_selected_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_inquiry_hero
    ADD CONSTRAINT _pages_v_blocks_inquiry_hero_selected_form_id_forms_id_fk FOREIGN KEY (selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_media_id_media_id_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v _pages_v_parent_id_pages_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_parent_id_pages_id_fk FOREIGN KEY (parent_id) REFERENCES public.pages(id) ON DELETE SET NULL;


--
-- Name: _pages_v_rels _pages_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: _pages_v _pages_v_version_buy_a_home_page_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_buy_a_home_page_image_id_media_id_fk FOREIGN KEY (version_buy_a_home_page_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_version_buy_a_home_page_selected_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_buy_a_home_page_selected_form_id_forms_id_fk FOREIGN KEY (version_buy_a_home_page_selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_version_concierge_page_contact_form_selected_form_id_f; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_concierge_page_contact_form_selected_form_id_f FOREIGN KEY (version_concierge_page_contact_form_selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: _pages_v_version_concierge_page_how_it_works_steps _pages_v_version_concierge_page_how_it_works_steps_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_concierge_page_how_it_works_steps
    ADD CONSTRAINT _pages_v_version_concierge_page_how_it_works_steps_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_version_concierge_page_services_items _pages_v_version_concierge_page_services_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_concierge_page_services_items
    ADD CONSTRAINT _pages_v_version_concierge_page_services_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_version_concierge_page_why_love_it_cards _pages_v_version_concierge_page_why_love_it_cards_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_concierge_page_why_love_it_cards
    ADD CONSTRAINT _pages_v_version_concierge_page_why_love_it_cards_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_version_featured_properties_override _pages_v_version_featured_properties_override_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_featured_properties_override
    ADD CONSTRAINT _pages_v_version_featured_properties_override_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_hero_links
    ADD CONSTRAINT _pages_v_version_hero_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v _pages_v_version_hero_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_hero_media_id_media_id_fk FOREIGN KEY (version_hero_media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_version_home_contact_selected_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_home_contact_selected_form_id_forms_id_fk FOREIGN KEY (version_home_contact_selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_version_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_meta_image_id_media_id_fk FOREIGN KEY (version_meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_version_other_inquiries_page_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_other_inquiries_page_image_id_media_id_fk FOREIGN KEY (version_other_inquiries_page_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_version_other_inquiries_page_selected_form_id_forms_id; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_other_inquiries_page_selected_form_id_forms_id FOREIGN KEY (version_other_inquiries_page_selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: _pages_v_version_privacy_policy_page_sections _pages_v_version_privacy_policy_page_sections_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_privacy_policy_page_sections
    ADD CONSTRAINT _pages_v_version_privacy_policy_page_sections_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_version_terms_and_conditions_page_sections _pages_v_version_terms_and_conditions_page_sections_parent_id_f; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_terms_and_conditions_page_sections
    ADD CONSTRAINT _pages_v_version_terms_and_conditions_page_sections_parent_id_f FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v _pages_v_version_trade_inquiry_page_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_trade_inquiry_page_image_id_media_id_fk FOREIGN KEY (version_trade_inquiry_page_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_version_trade_inquiry_page_selected_form_id_forms_id_f; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_trade_inquiry_page_selected_form_id_forms_id_f FOREIGN KEY (version_trade_inquiry_page_selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: _pages_v_version_why_choose_us _pages_v_version_why_choose_us_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._pages_v_version_why_choose_us
    ADD CONSTRAINT _pages_v_version_why_choose_us_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _posts_v _posts_v_parent_id_posts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_parent_id_posts_id_fk FOREIGN KEY (parent_id) REFERENCES public.posts(id) ON DELETE SET NULL;


--
-- Name: _posts_v_rels _posts_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: _posts_v_rels _posts_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._posts_v(id) ON DELETE CASCADE;


--
-- Name: _posts_v_rels _posts_v_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: _posts_v_rels _posts_v_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: _posts_v _posts_v_version_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_version_hero_image_id_media_id_fk FOREIGN KEY (version_hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _posts_v _posts_v_version_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_version_meta_image_id_media_id_fk FOREIGN KEY (version_meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _posts_v_version_populated_authors _posts_v_version_populated_authors_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public._posts_v_version_populated_authors
    ADD CONSTRAINT _posts_v_version_populated_authors_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._posts_v(id) ON DELETE CASCADE;


--
-- Name: blogs blogs_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_hero_image_id_media_id_fk FOREIGN KEY (hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: blogs blogs_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: blogs_populated_authors blogs_populated_authors_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs_populated_authors
    ADD CONSTRAINT blogs_populated_authors_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.blogs(id) ON DELETE CASCADE;


--
-- Name: blogs_rels blogs_rels_blogs_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs_rels
    ADD CONSTRAINT blogs_rels_blogs_fk FOREIGN KEY (blogs_id) REFERENCES public.blogs(id) ON DELETE CASCADE;


--
-- Name: blogs_rels blogs_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs_rels
    ADD CONSTRAINT blogs_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: blogs_rels blogs_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs_rels
    ADD CONSTRAINT blogs_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.blogs(id) ON DELETE CASCADE;


--
-- Name: blogs_rels blogs_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.blogs_rels
    ADD CONSTRAINT blogs_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: categories_breadcrumbs categories_breadcrumbs_doc_id_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.categories_breadcrumbs
    ADD CONSTRAINT categories_breadcrumbs_doc_id_categories_id_fk FOREIGN KEY (doc_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- Name: categories_breadcrumbs categories_breadcrumbs_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.categories_breadcrumbs
    ADD CONSTRAINT categories_breadcrumbs_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: categories categories_parent_id_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_categories_id_fk FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- Name: footer_nav_items footer_nav_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.footer_nav_items
    ADD CONSTRAINT footer_nav_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.footer(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.footer(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: form_submissions form_submissions_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_form_id_forms_id_fk FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: form_submissions_submission_data form_submissions_submission_data_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.form_submissions_submission_data
    ADD CONSTRAINT form_submissions_submission_data_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.form_submissions(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_checkbox forms_blocks_checkbox_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_checkbox
    ADD CONSTRAINT forms_blocks_checkbox_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_country forms_blocks_country_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_country
    ADD CONSTRAINT forms_blocks_country_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_email forms_blocks_email_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_email
    ADD CONSTRAINT forms_blocks_email_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_message forms_blocks_message_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_message
    ADD CONSTRAINT forms_blocks_message_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_number forms_blocks_number_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_number
    ADD CONSTRAINT forms_blocks_number_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_select_options forms_blocks_select_options_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_select_options
    ADD CONSTRAINT forms_blocks_select_options_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms_blocks_select(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_select forms_blocks_select_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_select
    ADD CONSTRAINT forms_blocks_select_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_state forms_blocks_state_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_state
    ADD CONSTRAINT forms_blocks_state_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_text forms_blocks_text_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_text
    ADD CONSTRAINT forms_blocks_text_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_textarea forms_blocks_textarea_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_blocks_textarea
    ADD CONSTRAINT forms_blocks_textarea_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_emails forms_emails_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_emails
    ADD CONSTRAINT forms_emails_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_field_mapping forms_field_mapping_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_field_mapping
    ADD CONSTRAINT forms_field_mapping_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_static_fields forms_static_fields_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.forms_static_fields
    ADD CONSTRAINT forms_static_fields_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: header_nav_items header_nav_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.header_nav_items
    ADD CONSTRAINT header_nav_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.header(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.header(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: media media_folder_id_payload_folders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_folder_id_payload_folders_id_fk FOREIGN KEY (folder_id) REFERENCES public.payload_folders(id) ON DELETE SET NULL;


--
-- Name: pages_blocks_archive pages_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_archive
    ADD CONSTRAINT pages_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_carousel pages_blocks_carousel_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_carousel
    ADD CONSTRAINT pages_blocks_carousel_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_carousel_slides pages_blocks_carousel_slides_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_carousel_slides
    ADD CONSTRAINT pages_blocks_carousel_slides_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages_blocks_carousel_slides pages_blocks_carousel_slides_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_carousel_slides
    ADD CONSTRAINT pages_blocks_carousel_slides_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_carousel(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_content_columns pages_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_content_columns
    ADD CONSTRAINT pages_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_content(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_content pages_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_content
    ADD CONSTRAINT pages_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_cta_links pages_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_cta_links
    ADD CONSTRAINT pages_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_cta pages_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_cta
    ADD CONSTRAINT pages_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_form_block pages_blocks_form_block_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_form_block
    ADD CONSTRAINT pages_blocks_form_block_form_id_forms_id_fk FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: pages_blocks_form_block pages_blocks_form_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_form_block
    ADD CONSTRAINT pages_blocks_form_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_inquiry_hero pages_blocks_inquiry_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_inquiry_hero
    ADD CONSTRAINT pages_blocks_inquiry_hero_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages_blocks_inquiry_hero pages_blocks_inquiry_hero_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_inquiry_hero
    ADD CONSTRAINT pages_blocks_inquiry_hero_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_inquiry_hero pages_blocks_inquiry_hero_selected_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_inquiry_hero
    ADD CONSTRAINT pages_blocks_inquiry_hero_selected_form_id_forms_id_fk FOREIGN KEY (selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: pages_blocks_media_block pages_blocks_media_block_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_media_id_media_id_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages_blocks_media_block pages_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages pages_buy_a_home_page_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_buy_a_home_page_image_id_media_id_fk FOREIGN KEY (buy_a_home_page_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages pages_buy_a_home_page_selected_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_buy_a_home_page_selected_form_id_forms_id_fk FOREIGN KEY (buy_a_home_page_selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: pages pages_concierge_page_contact_form_selected_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_concierge_page_contact_form_selected_form_id_forms_id_fk FOREIGN KEY (concierge_page_contact_form_selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: pages_concierge_page_how_it_works_steps pages_concierge_page_how_it_works_steps_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_concierge_page_how_it_works_steps
    ADD CONSTRAINT pages_concierge_page_how_it_works_steps_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_concierge_page_services_items pages_concierge_page_services_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_concierge_page_services_items
    ADD CONSTRAINT pages_concierge_page_services_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_concierge_page_why_love_it_cards pages_concierge_page_why_love_it_cards_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_concierge_page_why_love_it_cards
    ADD CONSTRAINT pages_concierge_page_why_love_it_cards_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_featured_properties_override pages_featured_properties_override_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_featured_properties_override
    ADD CONSTRAINT pages_featured_properties_override_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_hero_links pages_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_hero_links
    ADD CONSTRAINT pages_hero_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages pages_hero_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_hero_media_id_media_id_fk FOREIGN KEY (hero_media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages pages_home_contact_selected_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_home_contact_selected_form_id_forms_id_fk FOREIGN KEY (home_contact_selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: pages pages_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages pages_other_inquiries_page_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_other_inquiries_page_image_id_media_id_fk FOREIGN KEY (other_inquiries_page_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages pages_other_inquiries_page_selected_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_other_inquiries_page_selected_form_id_forms_id_fk FOREIGN KEY (other_inquiries_page_selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: pages_privacy_policy_page_sections pages_privacy_policy_page_sections_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_privacy_policy_page_sections
    ADD CONSTRAINT pages_privacy_policy_page_sections_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: pages_terms_and_conditions_page_sections pages_terms_and_conditions_page_sections_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_terms_and_conditions_page_sections
    ADD CONSTRAINT pages_terms_and_conditions_page_sections_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages pages_trade_inquiry_page_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_trade_inquiry_page_image_id_media_id_fk FOREIGN KEY (trade_inquiry_page_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages pages_trade_inquiry_page_selected_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_trade_inquiry_page_selected_form_id_forms_id_fk FOREIGN KEY (trade_inquiry_page_selected_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: pages_why_choose_us pages_why_choose_us_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.pages_why_choose_us
    ADD CONSTRAINT pages_why_choose_us_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: payload_folders payload_folders_folder_id_payload_folders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_folders
    ADD CONSTRAINT payload_folders_folder_id_payload_folders_id_fk FOREIGN KEY (folder_id) REFERENCES public.payload_folders(id) ON DELETE SET NULL;


--
-- Name: payload_folders_folder_type payload_folders_folder_type_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_folders_folder_type
    ADD CONSTRAINT payload_folders_folder_type_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_folders(id) ON DELETE CASCADE;


--
-- Name: payload_jobs_log payload_jobs_log_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_jobs_log
    ADD CONSTRAINT payload_jobs_log_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.payload_jobs(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_blogs_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_blogs_fk FOREIGN KEY (blogs_id) REFERENCES public.blogs(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_cf7_tracker_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_cf7_tracker_fk FOREIGN KEY (cf7_tracker_id) REFERENCES public.cf7_tracker(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_form_submissions_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_form_submissions_fk FOREIGN KEY (form_submissions_id) REFERENCES public.form_submissions(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_forms_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_forms_fk FOREIGN KEY (forms_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_locked_documents(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_payload_folders_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_payload_folders_fk FOREIGN KEY (payload_folders_id) REFERENCES public.payload_folders(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_properties_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_properties_fk FOREIGN KEY (properties_id) REFERENCES public.properties(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_redirects_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_redirects_fk FOREIGN KEY (redirects_id) REFERENCES public.redirects(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_search_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_search_fk FOREIGN KEY (search_id) REFERENCES public.search(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: posts posts_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_hero_image_id_media_id_fk FOREIGN KEY (hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: posts posts_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: posts_populated_authors posts_populated_authors_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts_populated_authors
    ADD CONSTRAINT posts_populated_authors_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: properties properties_about_section_about_background_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_about_section_about_background_image_id_media_id_fk FOREIGN KEY (about_section_about_background_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: properties properties_broker_information_broker_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_broker_information_broker_image_id_media_id_fk FOREIGN KEY (broker_information_broker_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: properties properties_contact_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_contact_form_id_forms_id_fk FOREIGN KEY (contact_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: properties_floor_plans properties_floor_plans_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties_floor_plans
    ADD CONSTRAINT properties_floor_plans_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: properties_floor_plans properties_floor_plans_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties_floor_plans
    ADD CONSTRAINT properties_floor_plans_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.properties(id) ON DELETE CASCADE;


--
-- Name: properties properties_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: properties_neighborhood_accordion properties_neighborhood_accordion_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties_neighborhood_accordion
    ADD CONSTRAINT properties_neighborhood_accordion_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: properties_neighborhood_accordion properties_neighborhood_accordion_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties_neighborhood_accordion
    ADD CONSTRAINT properties_neighborhood_accordion_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.properties(id) ON DELETE CASCADE;


--
-- Name: properties properties_parent_property_id_properties_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_parent_property_id_properties_id_fk FOREIGN KEY (parent_property_id) REFERENCES public.properties(id) ON DELETE SET NULL;


--
-- Name: properties_rels properties_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties_rels
    ADD CONSTRAINT properties_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: properties_rels properties_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties_rels
    ADD CONSTRAINT properties_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.properties(id) ON DELETE CASCADE;


--
-- Name: properties properties_video_video_file_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_video_video_file_id_media_id_fk FOREIGN KEY (video_video_file_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: redirects_rels redirects_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.redirects(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: search_categories search_categories_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.search_categories
    ADD CONSTRAINT search_categories_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.search(id) ON DELETE CASCADE;


--
-- Name: search search_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.search
    ADD CONSTRAINT search_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: search_rels search_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.search_rels
    ADD CONSTRAINT search_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.search(id) ON DELETE CASCADE;


--
-- Name: search_rels search_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.search_rels
    ADD CONSTRAINT search_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: settings settings_header_logo_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_header_logo_id_media_id_fk FOREIGN KEY (header_logo_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: settings settings_site_icon_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_site_icon_id_media_id_fk FOREIGN KEY (site_icon_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: users_roles users_roles_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_parent_fk FOREIGN KEY (parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users_sessions users_sessions_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: nsh_db_user
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO nsh_db_user;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO nsh_db_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO nsh_db_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO nsh_db_user;


--
-- PostgreSQL database dump complete
--

\unrestrict k0WSxhNln0peexOsjnEqypbSvU7OfeUmtmmdFYLyDH4gL3a43ZJbjnZkntpdEvD

