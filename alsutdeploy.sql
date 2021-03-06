PGDMP         )                v         
   alamsutera    9.5.14    10.4 I    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16384 
   alamsutera    DATABASE     |   CREATE DATABASE alamsutera WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE alamsutera;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    12361    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16385    cluster_seq    SEQUENCE     t   CREATE SEQUENCE public.cluster_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cluster_seq;
       public       postgres    false    7            �            1259    16387    clusters    TABLE     b  CREATE TABLE public.clusters (
    id integer DEFAULT nextval('public.cluster_seq'::regclass) NOT NULL,
    name character varying(150),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    code character varying(10),
    latitude character varying(25),
    longitude character varying(25)
);
    DROP TABLE public.clusters;
       public         postgres    false    181    7            �            1259    16394    personal_track_seq    SEQUENCE     {   CREATE SEQUENCE public.personal_track_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.personal_track_seq;
       public       postgres    false    7            �            1259    16396    guard_schedule    TABLE     l  CREATE TABLE public.guard_schedule (
    id integer DEFAULT nextval('public.personal_track_seq'::regclass) NOT NULL,
    guard_username character varying(10),
    track_code character varying(10),
    assign_date timestamp without time zone,
    shift_id character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 "   DROP TABLE public.guard_schedule;
       public         postgres    false    183    7            �            1259    16403    personal_seq    SEQUENCE     u   CREATE SEQUENCE public.personal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.personal_seq;
       public       postgres    false    7            �            1259    16405    guards    TABLE     +  CREATE TABLE public.guards (
    id integer DEFAULT nextval('public.personal_seq'::regclass) NOT NULL,
    name character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    username character varying(100),
    password character varying(100)
);
    DROP TABLE public.guards;
       public         postgres    false    185    7            �            1259    16491    login_session_seq    SEQUENCE     z   CREATE SEQUENCE public.login_session_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.login_session_seq;
       public       postgres    false    7            �            1259    16488    login_session    TABLE     g  CREATE TABLE public.login_session (
    userid character varying(30),
    latest_activities timestamp without time zone,
    cluster_id character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer DEFAULT nextval('public.login_session_seq'::regclass) NOT NULL,
    uid character varying(50)
);
 !   DROP TABLE public.login_session;
       public         postgres    false    204    7            �            1259    16409 	   panic_seq    SEQUENCE     r   CREATE SEQUENCE public.panic_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.panic_seq;
       public       postgres    false    7            �            1259    16411    panics    TABLE     �  CREATE TABLE public.panics (
    id bigint DEFAULT nextval('public.panic_seq'::regclass) NOT NULL,
    username character varying(100),
    audio_filename character varying(100),
    latitude character varying(20),
    longitude character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    accuracy character varying(100),
    status smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.panics;
       public         postgres    false    187    7            �            1259    16416    patrol_seq_id    SEQUENCE     v   CREATE SEQUENCE public.patrol_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.patrol_seq_id;
       public       postgres    false    7            �            1259    16418    patrols    TABLE     v  CREATE TABLE public.patrols (
    id bigint DEFAULT nextval('public.patrol_seq_id'::regclass) NOT NULL,
    guard_id character(10),
    cluster_code character(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    shift_id character varying(1),
    start_at timestamp without time zone,
    finish_at timestamp without time zone
);
    DROP TABLE public.patrols;
       public         postgres    false    189    7            �            1259    16503    polygon_seq    SEQUENCE     t   CREATE SEQUENCE public.polygon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.polygon_seq;
       public       postgres    false    7            �            1259    16498    polygon    TABLE     �   CREATE TABLE public.polygon (
    id bigint DEFAULT nextval('public.polygon_seq'::regclass) NOT NULL,
    cluster_code character varying(25),
    track_code character varying(25),
    longitude character varying(25),
    latitude character varying(25)
);
    DROP TABLE public.polygon;
       public         postgres    false    206    7            �            1259    16422    schedule_seq    SEQUENCE     u   CREATE SEQUENCE public.schedule_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.schedule_seq;
       public       postgres    false    7            �            1259    16424    shift    TABLE     5  CREATE TABLE public.shift (
    name character varying(30),
    description text,
    start_at time without time zone,
    end_at time without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer DEFAULT nextval('public.schedule_seq'::regclass)
);
    DROP TABLE public.shift;
       public         postgres    false    191    7            �            1259    16431    temp_id_seq    SEQUENCE     t   CREATE SEQUENCE public.temp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.temp_id_seq;
       public       postgres    false    7            �            1259    16433    temp    TABLE       CREATE TABLE public.temp (
    id bigint DEFAULT nextval('public.temp_id_seq'::regclass) NOT NULL,
    cluster_id character varying(10),
    longitude character varying(50),
    latitude character varying(50),
    created_at timestamp without time zone,
    unique_key character(100),
    updated_at timestamp without time zone,
    accuracy character varying(30),
    speed character varying(30),
    device_date timestamp without time zone,
    shift_id character varying(9),
    guard_id character varying(5)
);
    DROP TABLE public.temp;
       public         postgres    false    193    7            �            1259    16438    track_checkpoint_seq    SEQUENCE     }   CREATE SEQUENCE public.track_checkpoint_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.track_checkpoint_seq;
       public       postgres    false    7            �            1259    16440    track_checkpoint    TABLE       CREATE TABLE public.track_checkpoint (
    id integer DEFAULT nextval('public.track_checkpoint_seq'::regclass) NOT NULL,
    track_code character varying(15),
    latitude character varying(25),
    longitude character varying(25),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    checkpoint_code character varying(15),
    previous_checkpoint_id character varying(15),
    next_checkpoint_id character varying(15),
    point_order smallint,
    description text,
    beacon_id text
);
 $   DROP TABLE public.track_checkpoint;
       public         postgres    false    195    7            �            1259    16447    track_coordinates_seq    SEQUENCE     ~   CREATE SEQUENCE public.track_coordinates_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.track_coordinates_seq;
       public       postgres    false    7            �            1259    16449    track_coordinates    TABLE     ^  CREATE TABLE public.track_coordinates (
    id integer DEFAULT nextval('public.track_coordinates_seq'::regclass) NOT NULL,
    track_code character varying(15),
    latitude character varying(25),
    longitude character varying(25),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    point_order smallint
);
 %   DROP TABLE public.track_coordinates;
       public         postgres    false    197    7            �            1259    16453 
   tracks_seq    SEQUENCE     s   CREATE SEQUENCE public.tracks_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.tracks_seq;
       public       postgres    false    7            �            1259    16455    tracks    TABLE     (  CREATE TABLE public.tracks (
    id integer DEFAULT nextval('public.tracks_seq'::regclass) NOT NULL,
    code character varying(15),
    name character varying(300),
    cluster_code character varying(15),
    updated_at timestamp without time zone,
    created_at timestamp without time zone
);
    DROP TABLE public.tracks;
       public         postgres    false    199    7            �            1259    16459 	   users_seq    SEQUENCE     r   CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.users_seq;
       public       postgres    false    7            �            1259    16461    users    TABLE     �  CREATE TABLE public.users (
    id integer DEFAULT nextval('public.users_seq'::regclass) NOT NULL,
    name character varying(25),
    email character varying(80),
    image character varying(50),
    created_by character varying(1),
    privilege character varying(1),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    password character varying(80),
    remember_token character varying(100)
);
    DROP TABLE public.users;
       public         postgres    false    201    7            �          0    16387    clusters 
   TABLE DATA               l   COPY public.clusters (id, name, description, created_at, updated_at, code, latitude, longitude) FROM stdin;
    public       postgres    false    182   �V       �          0    16396    guard_schedule 
   TABLE DATA               w   COPY public.guard_schedule (id, guard_username, track_code, assign_date, shift_id, created_at, updated_at) FROM stdin;
    public       postgres    false    184   '[       �          0    16405    guards 
   TABLE DATA               V   COPY public.guards (id, name, created_at, updated_at, username, password) FROM stdin;
    public       postgres    false    186   (\       �          0    16488    login_session 
   TABLE DATA               o   COPY public.login_session (userid, latest_activities, cluster_id, created_at, updated_at, id, uid) FROM stdin;
    public       postgres    false    203   �]       �          0    16411    panics 
   TABLE DATA               }   COPY public.panics (id, username, audio_filename, latitude, longitude, created_at, updated_at, accuracy, status) FROM stdin;
    public       postgres    false    188   �]       �          0    16418    patrols 
   TABLE DATA               t   COPY public.patrols (id, guard_id, cluster_code, created_at, updated_at, shift_id, start_at, finish_at) FROM stdin;
    public       postgres    false    190   �`       �          0    16498    polygon 
   TABLE DATA               T   COPY public.polygon (id, cluster_code, track_code, longitude, latitude) FROM stdin;
    public       postgres    false    205   a       �          0    16424    shift 
   TABLE DATA               `   COPY public.shift (name, description, start_at, end_at, created_at, updated_at, id) FROM stdin;
    public       postgres    false    192   +a       �          0    16433    temp 
   TABLE DATA               �   COPY public.temp (id, cluster_id, longitude, latitude, created_at, unique_key, updated_at, accuracy, speed, device_date, shift_id, guard_id) FROM stdin;
    public       postgres    false    194   �a       �          0    16440    track_checkpoint 
   TABLE DATA               �   COPY public.track_checkpoint (id, track_code, latitude, longitude, created_at, updated_at, checkpoint_code, previous_checkpoint_id, next_checkpoint_id, point_order, description, beacon_id) FROM stdin;
    public       postgres    false    196   ��       �          0    16449    track_coordinates 
   TABLE DATA               u   COPY public.track_coordinates (id, track_code, latitude, longitude, created_at, updated_at, point_order) FROM stdin;
    public       postgres    false    198   ��       �          0    16455    tracks 
   TABLE DATA               V   COPY public.tracks (id, code, name, cluster_code, updated_at, created_at) FROM stdin;
    public       postgres    false    200   ��       �          0    16461    users 
   TABLE DATA               �   COPY public.users (id, name, email, image, created_by, privilege, created_at, updated_at, password, remember_token) FROM stdin;
    public       postgres    false    202   g�       �           0    0    cluster_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cluster_seq', 74, true);
            public       postgres    false    181            �           0    0    login_session_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.login_session_seq', 185, true);
            public       postgres    false    204            �           0    0 	   panic_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.panic_seq', 504, true);
            public       postgres    false    187            �           0    0    patrol_seq_id    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.patrol_seq_id', 44695, true);
            public       postgres    false    189            �           0    0    personal_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.personal_seq', 14, true);
            public       postgres    false    185            �           0    0    personal_track_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.personal_track_seq', 31, true);
            public       postgres    false    183            �           0    0    polygon_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.polygon_seq', 1, true);
            public       postgres    false    206            �           0    0    schedule_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.schedule_seq', 3, true);
            public       postgres    false    191            �           0    0    temp_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.temp_id_seq', 47168, true);
            public       postgres    false    193            �           0    0    track_checkpoint_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.track_checkpoint_seq', 1039, true);
            public       postgres    false    195            �           0    0    track_coordinates_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.track_coordinates_seq', 3168, true);
            public       postgres    false    197            �           0    0 
   tracks_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.tracks_seq', 101, true);
            public       postgres    false    199            �           0    0 	   users_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.users_seq', 1, true);
            public       postgres    false    201                       2606    16467    clusters clusters_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clusters DROP CONSTRAINT clusters_pkey;
       public         postgres    false    182            0           2606    16495     login_session login_session_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.login_session
    ADD CONSTRAINT login_session_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.login_session DROP CONSTRAINT login_session_pkey;
       public         postgres    false    203            "           2606    16469    panics panic_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.panics
    ADD CONSTRAINT panic_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.panics DROP CONSTRAINT panic_pkey;
       public         postgres    false    188            $           2606    16471    patrols patrols_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.patrols
    ADD CONSTRAINT patrols_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.patrols DROP CONSTRAINT patrols_pkey;
       public         postgres    false    190                        2606    16473    guards personal_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.guards
    ADD CONSTRAINT personal_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.guards DROP CONSTRAINT personal_pkey;
       public         postgres    false    186                       2606    16475 "   guard_schedule personal_track_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.guard_schedule
    ADD CONSTRAINT personal_track_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.guard_schedule DROP CONSTRAINT personal_track_pkey;
       public         postgres    false    184            2           2606    16502    polygon polygon_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.polygon
    ADD CONSTRAINT polygon_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.polygon DROP CONSTRAINT polygon_pkey;
       public         postgres    false    205            *           2606    16477 '   track_coordinates route_coordinate_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.track_coordinates
    ADD CONSTRAINT route_coordinate_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.track_coordinates DROP CONSTRAINT route_coordinate_pkey;
       public         postgres    false    198            ,           2606    16479    tracks routes_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tracks DROP CONSTRAINT routes_pkey;
       public         postgres    false    200            &           2606    16481    temp temp_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.temp
    ADD CONSTRAINT temp_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.temp DROP CONSTRAINT temp_pkey;
       public         postgres    false    194            (           2606    16483 &   track_checkpoint track_checkpoint_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.track_checkpoint
    ADD CONSTRAINT track_checkpoint_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.track_checkpoint DROP CONSTRAINT track_checkpoint_pkey;
       public         postgres    false    196            .           2606    16485    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    202            �     x����n"G����b^ ���Z	�����8��(7����v�0lB�>����A��mq��r]Uw�&�c��Y:̷Y�%��x��酚��A�m��PLt��)f}��sSN���CғwTH��N�wRpN�@�x��1�:�V� ߯-�m�Sb8C�{�C��~�=k؇i��X�V)b$��cGyYl;[5=r�6XR��A\x�#��mwʪkzX�8���NI��c�6�]�fV�@�-�
���$��h$��^����V� �Z0��)~s�٠�֍��x�.^F�s�$R3���c�Z�bxa�\	!}�!��W��Z�6��谽��:�x)4w�p�E"x|^���F�5�=����V�1�b�ꍄ��ˬ�{Y9�`�V3.�qpA0	�᳼j��wr|��L��LP.�0�TT�M��V�@?MZ��]�����qV��U�g^����m	,�\+��-%���ު1�ۜ��	&�m�v�C�'P��ފ��597�3�a����<�~��[^_����ڔ��8�/V�*ă׾��Q���/�k\��f�=dxUVp����E}��X�8�ʵo���DB���#��x��+1�s=78��J�{��ݍ+��'�ц/� :� ��$u2��S����O�<^,׮�+�o:�)
���,�T����c^X�z��ϻ�X$���#�[n���C
�ۗ���ˢ�Q��y����č�Zk�5�C2��y	�۪蹝���R��k�o7~o�5�y���J����.���gX��]�mo8w����	~|��|�������>������="RB���aLlǹ�k60���g��"�h{�3�uW5�?�m�?���>o�$�U�؜I0�_i��t2��:|Y��]ͺMI�`H�$�篬N_m�g`���څk��i��-m��[�1���&0�)�̖�t8]/W��U74oJRB�X��}�x��`�3�(��YK��p1HO����j�j�6����ܝ����8��R��T�w؞Q������!�/!��      �   �   x���;N�@�z�\�h^��E	�qG���pz֛/�-��կߟg���>?����}?<�#�SG���qԦD��T�2`���K���0�hM�зM
FR�V�o�cY󒱖g�&�i4)���^�����e3�[�3�TO��]��<��8�^���V�<nS1S�e�L8����mv��q*�E*׵�I���q�p�����Z��Mi)�f��������o"4��\n}��q��{ ��2�      �   �  x����n�@�5<�,�j�̅��i�E�)-�*U�*�Rѧ/��1���3|�\��H!�6�mB���4;����b/��|w�ژ!���4;��G�_��M�"�$N�Fx�0*0�fef��Ȯ�eϒ��,�]Ǩz�<,,���L�}����o��t����`��n��D�
����\���ކ��6��4�Yc���K�_CT��#�o��gH�uz�:����zݔEx~�#��k���� F�5��Z��t���z�9��4���nl�/E��$U),�����+�L٠z�R�*���~-�͈٨LX�f{��v��W�aw����|{��a<f�U�^���a�s�'ڢ3:[K�W�~�|�ץ3��Qh0����P��E�;����q�      �      x������ � �      �   �  x���Kn�0�|�\ ¼8�-r���f������EK���A,�f ���Oђp����k"@�L��
&&�Z)3��7=�9�M:Z���������&8I"�,�J+G����v�xz����k�n0�#�be����PXC��
  ��a��Ϲ4#6WX,�.�/�9�E�&��d�@�!��rT�
w�\nU�W��#�N�]G`��R���A�� Z�&NM�	�����J��=]�V��= �>W�
�B+���	J��3AXC���Om��W�]�ue��&���W���um�-��lr�oc��.���]��G�$ۏvQ���l7:�0��	�.:�Ǻ�"څ�~tf�ЛW��bnr�n8�V#QS��
R�y�����a6��:΅嬞`�kiNl�cP���:Xݰ�wNJE+�u����;���&��V=��������*��l�+[g�~���2�9@e�r*a-B�����(���x4H�4�!�6�G�"�S�R���RK[6H�����Z�k�I6P��W�B�kQ�>�ha��`��"��R��:[w�ughve��1�3IX���a>��d@��l��q$w�ԫFzەf�m5�I��l[|��lz��h�'�.�Ϥ]X�J��>�va}.������l�R:��FW76R�⌄�58(`Uk"���pp}��x�[�mN��^�џ H��@<�T�%c;����E%ip�D;�\����t�
��      �      x������ � �      �      x�3�,NL"�?����� K�v      �   �   x�m��
�0���S�:��j�7�v��S�+�ޟ�"��K>�/�}�[���I��R��Hޠ3�jꅬ��`�𠉄Y��k\�J��.�=�%�|�pVM1-�ޟ�sK�K_��C��=Ꞑ�T���}���A���|QJ}�V5�      �      x��}͎&;n��)�: R�(�����3��7�U�0o��C���"/�������Fg��a|��q�_���������/P�&jC��Ul
�������"~��I�ڗ�{-�_�Ҿ�+��2�v�����������?���PJ)�t�h����_�������
��?��_��_��0� ��V��Q�W[%�!_ް�5~���Ƿ7j(ߠ�xmX�2#Ʀ���c@#Z�ƊV���dE�=+�k������'�B����}����ޝ���ekU��i��ވ��F@ِ	�[q��ፐy�z籰6,�#�g�?����d�BvFH�m#�VS�Od8#���-@K#��1n�AX�;N�\D������M�#�C��Z������i�@?�~��J���w|-��[��!�M�R[)���sI0���C��mFn��H_�"�i���D���O�1�?���g�g#��ԨSU�������v�@1�P�Z�֞�չ�i�Lg�����}?C�[�j�k}�P�o���jO�t������Rv��\�ێR��^&���>�%����c��t�m�Ȅ��&�>�	�W�ћ(C|�ߠ}�����p���� \[o�dI����4(z�9��c#����3���<Lܣ\͈��mF��D�0�+��`$z�ꏌ��	*�|#B|M�J<�W����ǩ����]�b����4"�׿4���k1.�OdD��It�T{G�����]l$P}���X[!]l�nݼ��#��k�v�mQ�X����k�!�F��8���%Ԉ�5��[3B ���`E��?�bl�˪������@ɼ�8P�^�o{�*���j�����/�Bm���0���%�W����7%p��MXf�����8+r��G��jw�����M�歐������,z뭨J[���fN�7"���F�V+��j�ڈ@�zy#Ԋh�/!��>��*9�y�C[���8[��@6�n�^�[�q��[����8��F�w�����"l>��2�0��~�w�{Q/��R�>Q�#<e�:��($P�aԣ��}D����4�v6�e�]@�V�a�<6���R������;�NZ�l��a��`E 쏬@�%�h�񙬈�x����͜�B��R-�G�)������ba�Ne,.Z}�ɍFo܊a�boDȈdDŭ`�|�y�؈Xî��2B��L����u*tF��B��_���-���;����غ��"�:7;P�GFX:Vo������Q����^'�[ֿ��:�F���1/�tQ��#���v����FU��PB�6���L��`;��w��u���z���k��ٿ���)4Z����+Bf\��a�p+Ԋ�A��bC�M,[�R_���9[/-�Y��y¯��
묻�
��{����U�WOx����%��$��F�([Τ�2�ʈA{����I]@�1Zc�ш�vFc��z	�~ź�(��$ �%2�w�������K�X����2;
�-^�j�)��BmD�6}e�Bݮa��VgXTC��aD7��aQl��h��"�����u}�o��?0"R6�	��gh�؂l��� +���y�a��?2B_��\��_�#BZ���(Kh�0#xӘ�*�w�vͺb��(��d�QMP/�7�Z6[�δ���\�Eb�a��>&ewo�n�P���@�X����1�0�C+���"��W�!Ζ�s�ƚ|�3��'���B��8	/��>4��$k��y����m�G\�4aX��}�3(�5k� uw����?�q��C�/}v�O�g鱷����Eݨ�싍�lk��]+db�x�.XAaL�=��<����/e����[��7��
��ҿ� ����տ�A�p��j4�͓�F�1�1�<6�?e�X���!�o�PgF���y������u|\�FX��U��6#�:KmG����CM����P�j���A%��GN���﬚a�*d�8���7��vV�C�{#fР3��2��6�mft�p��|*��O��V�K���L}lE����b��R�n$2�򶛱w��hvXc%�"qh���5R��/>4"�� ̢�/�������3bԭue��ƋE���
��Gl��폭�܍gJ�OB��zC��V�C��(�����"�7��@J��U+4�@}�n������T���p�Qu�[`�J���NTوmtP�>���o���i�+�}��Y)}nd�!Z5�`]�p6^���m�<)5�OdCdm�w=O�D��?�e�ی`��b]7�	��Bq��� ��7���Df,"��	5��c���EH}h�o�zb�&/��_�`eHk��<&�����iy�Ʀ�v��d��C�:���x��V0鿭��~lE�l~'����fo����m�	��I�/^0��lVqaj���v|`C�|����0q���$s��-m$��
R/QLŔ~�
(�i���^0#�6A��ݠj��{1����+���Wy}��G�1^��`�Wu����Uf`��z���l��eЮ�!����'2CI�_�����#�o�]�\�Ͱ��x������ۯC�����V���� J}�?^�߸|y���W�P�������������񰁝�@�ӈw�촂A�Z_�mVXc�Y)0ʻ��iC�Ø6�:����V#:�v�h�z��S�S"Z!�xt��ǩ�h�&��Tﳂ�^�Ũ�T$���P�a�~T3ԇ��c؁�&�q0b����G#���J$7���T�̕-�>3��#��ebg���@���㵼b��o�*ߨ�b�������2�F�k�؈��lc0�Q3*E+���}F���`;�BN#0���-½ �B��N3�m�����ŭ/�g2#Rw���`�B#$2�����C���6�^/����K6�/�>���a�P�z/ʦ�lV6��T�����}Ɋ��o�LVx�&+�V�`ѕ�N#��%��)Z������dE������V�^�����l6In"Tت�ь��W��{|*3"w��4�4rޛ��.ՑԥeQ�o�Po�����w}�z�6�/����؈C��[�"a��NwYa�<JPMY.�[
�FԺ�b�؆��n�����)yъH���#%������@���,�It��'ou���n�p��/_C$��~�������k��+Vt�>������-����X�rНV�]��I�"��	V�d�_�y����C[�]
V0l�+5������*J<�!�͈�}��t�q�O����~�͸`�g�kf����dF����o2|*3"�_1�����Ɍ~_1c����F��/�1���LV���%+4��\?F��$�pn�m�J�;��]�琛��I���+f����O����F��bF��/�ъ�?�1�b��~*3b~������C3~U�����}�3b~�����x�ï��p�Gu�
G�L�!�U��������)27Q�/?�� _^���xax�/�]^߾�׷��2C�$� ��¹�v�yaC�H�Zo�J@��r�&km���]��T��a���6/>���r)JE��s��P�h�`�J������� ;�?vm=a��n�)τMv8`��I�5T�g�� �&l�c��	���M�-v���X�mހ�詰�Ö��[�f�*��@�rD��V���7�>�\��I2��ꊃWG���I}%��@��j~�^y'4L�	r�?ُ2���a?��\ԁ"ߡ�c�h3�E\u3a��y~�8ڌV�,��`�ȣ�T�v_}m��j��L؁"-,��N�F=ݤ�rI��v~�Q����T�E���v[�|gdH�8���,��OL��412a�$���ǂ�لnm�4v$Yg_��/�m���G����_��1fm*I�@���g�F6��w���2�H������V��~������p!J��9��k�����׺��B��{HG�<#%&vp��]%u�H�pr�6��R&�@�u����C3�v�e�Yۉzy!    mӫ2d�;B�!O珂Ϻ���F�ɦ�h��b��˴̍�(fZ����1��@�����@�4szV_��@�E
I�Ϡ}��n�$m3Q�d���^�#�	05�����ױǂ����GH�)�Eΐ}���D�sv H~�h��ǖQ]�\؁!�̓�W�n�R@��g������R$��qf��6/�6¦�1��Ɂ"�䚎��Wa��>��:0$�2;�}��m�\Jn��C������ I���g�c%����Ա�
=� ��^�Ӊ����aW+4d����23h?A�5���3�>"g����ۺcRa{��y�+�"9����(�i� �Z�fG��dS٤i�'�y����$V������΄�	���(��'j��H��Wm��me��ږ�5^��Y���JW�Er�:^	�&�TY�5���I������;��0L��x�'~����w�D=��x��e~��ľ��[��jN���0��۟�۫7q�q$�hц��m+�Sa{���N��O����L؞"t���
6l@�(���zL<���dm��)ѕ:R�V��dZ��J�*�J� �M�y�%������]6���j����Yf"[2���4��6^V���z¶!�5l4ōL���}�O����[.lǒ����a� vkW��� ����KvZ�6�
�&=�	<�����]���InB�+!��v��E��	�%�Ǽ�Qó�G��'l�r	y��1h�t�
�s��~q��!�9`'7�x1�Vm���׻�=:�>�#+�q�m{��-NW�$�k{�4m�6ƶ�'�j2T��=G�����&�'l.���$jD����~{�	^��������'�6r����P�9�-z�O�v�2A{�dl�d���F�{n���	Yf����'��rS�^>H�isT�6H�a��r�!���|��_<ak �Gzy��W���1vY>ac�ܯ�9RC�	�bj�	���o&lϑB���gkװ	(���^�Ǽ��#iko�3���=Gv�)@?����M��9���c���Pe&lϒ�ί�1m��-��4�gɁS�@~��4�:����_7IR㞟�=�c{�}f-�_Yq;��Zr��#I)0���F�#�f7�0�$��ۑ�c��W$)�e�8�����}����֚:dؽĎz���Ŵ�#�A5U�T��a3M�'?�W�5v u6�{�)�������Z��qͅ]�Y�Tn_����Z�k16y�6���+�Ī_0���{��=��Vy�]�s�d��l�R�[Yr���΄X�O������,9���d݋�(�ɒm�q�jl�"���t�f���TvR�$�k�(�!3�]%Ilw��ک9��5v���o�`�������>��Evl�$���ֶSs3i݋��wPd�q����@j��{��=i�3R�i����5v�!k%�uU[ �Inڲ{��=3�Vg��̳������ �E�{
����o�;�f��[��UԦBǶ�'�'H��Sll�&�ZD�=m/����Y�Ĩ�RmdE=�:�޽@�m�\��[ݕZ);@�
;
��"Y%�����J�;�vlq��"�UXc}��(7��v4?[�[���P+�Tk*lϐX�4ѪfC{Jj��+�ͯ���6?��sa{�D�#+��ة�R+UI���^b�"�9�&�Ʈ]��1�f�5v�}�k����jD�
�k�Ⱦ6�	�����J�r�/�#����*d7���=u֦{��=N��U�Ä!��LG�^dG��SB�.^������t/�#(Say�"e�	j��^�*;��}W;jLY�^cGv�'�v�5�6�t/�����j�6Cn9ҫ�H=��V���^T���Ya*.�Q$$S�ّ]�����tZ5@��}�k��G6�����M&�
l��T؞!k����G8�dJ�Ֆj�~�������M�b��m�4̅��5*!��]��2a�l����(iD��ڭ� ���2;��M�X�8����é����h�p�m���
��窙w��#{��;��K�B��I��uv���E���67��:;��|�2�V����x�����	by�v�Vu���uȴ���v��H2�V����k{���l�/�RkE�J�^fGv��6�������(/�#�E˄E�ȺZK��:�ڽ̎�\N�c1�L�ժ�b�-�y�)G�m������_����2;R�Lز��{����ٽΎu����y��ц�>s��#ϣ�1�M{S+kОz��Ύ>�'�E��M��ƍ�FW����0KرBF{Sk5��T�~�c���^��C��@n����AGU?h�k���JR5z�ٙ��q@����՞�ܣ&?J��b�=�͗��&��t9:vp� ��ek�<f݃�N�§�=�O�C�?�뼑}�9����a��p�Oح�H�̎����%�a��*ރ̎UE��ɚZ�싣3Q{���c�RY{(Zf3��Hˣ�-�\®R7p����gQرe��eѴ/�a�c��-Y�Vf��3$ڱ��b��	[lOz&lϑ����1�zUS�=��跞gd1�G{[k7-�L�Ae�����fcm��r�H�a�NkWF��	v���e^=��������-ac)�E�(�c�^;�V����XP١1�H� �i�zs�1���L#cyB4�D��M�������b-��u$�!����I[�4����fЂ�N=�,m��ꀌ����T&jώ��< 5n_|�5�X� �S秆�	���KM��A\��J�2]dͬ������غ�mDi��Q.�� �c�{Y`b�Hv�F��A���]5�ֿi|�ꇌ��ֻ����m�>E�X=U6tm�c�	�B���?J�^[�A�ѣ���(�9��u���y%+������|H<A�>_m����m���JY��c��6�y���S;���i�NߏǦ���"P��,�uZ������FEH�ݬ�K���Fr��'lK�f���>f��)z$O�̩��W��q:��qk���?r�V���r�����5���Gj|��u��X�����
��6�/�c�w�U��ZYY��g�/�G�3�:ﭬEFM��^XǾ�A�u1���Z��e����\��u!�Ə^֎��L���(�c���u�:[/+@+�ݕ������Wϲ���H�^XGa�(9 ����Թ��uv=�?Ę��]��v�Id�C�-X�f�I_^XG��C�������#��xaS�?�b��{+k�m�^WG��cD�cK��U��T��봂35#_~ȳ��I�|��N+��DME~���e�L�!�l�J5�<󣑵��`��2J?a��6Z��H-A/�� ��ڱ0�{#+���3a�<k���&ֱ�M�PSr�^X��ƨ	{uFڦ��NV��Ӡj�jG9�'�6Rː����.'�86�&�jn!�F�^W�a���cG<��T�H��^W�!Ϫ/�U2��YG��n�����y#�D$��X{����:ͦ�'�(>Ǉ:k���:���ر#�M�ոܘ���Xż�1���*�����:���ׁ[B�1W	|x]�`8C���4j�B��^W�Q�TQ���J͍l��N�����b��Qr�HX�mf� �E�5�B)-u9��:��6��u�^-�Z$U2ta�we��n��X0�\�u��u���7�F���>$AX�
l=ۜ��?����Q�1�i{��ᙰ�j�5ؘ�/wa�BvHVW��5$�=$^5�lҨ'�%�di��
uߌ=)���:�P#�T�	�:$��\Q��=R��`*����`��:S����'��G�G�r;����5�(��_�ձE<v�h��vr?W�չ�L�&v H�����/jߕF��H��K�ٖe��H4&�`+!�ԩ�Tu��n���cU�b�K��^�0)�Ԫ^Pչ1���:B6�2a���6! �Tb��:aWL�;1����N�ׇ�Z1�S�N��sv�T}��eu��r^I騶//�-�<�Uu.�yë�H���vT�h�����>���5���v�xU� qz�WJ5+땞�<7���E�s;Ѽ����n�`�.5�I �	  u����E�Xr�����`?��G��h{��V��z$^U�lK���6^UG���h$�@����}����5Ԙ�xQ1��9��C۾�Z�r?v�/�r�ٽ����6�.P?�����s����DR�	�E�y���`c���C^���;ه�Q��6��WV��0Fչ 4���2xI}��(v��}����:�`$��8�,!��eD�M(99��Uu.�)� ���H-�*e�En{h���R�q��3�f�xi|y¦���l�RP�����x	6Ȍ �xi�u�<����/1;"�K�\�m��Ra�,+�s�3��h��m�]�b;�lh�e&)^ZG����
ƨnX2'�tH�^�ܞ�J��:R�����v����%X��G^���^�/�#��k0NE���e/�K�u(D^A=R�TuhՙiX��u�̆?EZu���Ŕ3Q�V�9ɉ5jAa�������WPWK�f����e�� ��g;l�M�
��5��s���Ʃb��J��п��)���=A^�MS��K��:¦5|������s�N(lϐ�`��UzR����̞\6�2n�ב��ye�k�� ��ڞ$[9e���5ژ^�C�u��摩�=G6��=�w�1 ���k�{bA��Ց�S|ĪH�I 2�R���%ԕ1��xY�X�< +ؼ�d�U+lO�W`K��Y���eud߽8yfpۊH�͍xY�k��kg6�I�:����҇S�L����
l�#�L؁ ǔ�]�>U�}�����?�	�U2[0�^y�܋e긌���������:ac��9��ء(&���1�,�5u����)�&��Ⱦ�c�L uE�F3��3'��\�=R�Mز�@��>�mʙʄ�K���g�O��u��gO��Fa�����^Q�"jN�.R'?����	1M�!Ps߿��sv��dP�i���	�w	`��g;(�\���%f
�K	�:��|�P�؝sc� �s��~�G;&Xy��E=Ol�����:W`+�&WO��w<�����3�VsK5AQ�l}H2�۔�C�ߵ�n�0���6���s��@�EH�zb{Ŗ�t�9w��C��^0S�MJ�g�*��N۶�ۣu���E2u	v��9]�u�w�jd.�PԡO�j�K*�DA�z�L��b[k�Gr�#
�\�]K�ߔ�t���R�Y�w��(��Ө�sv�SL
;LzL �('!& ����X���%Զ�(u���3.;jF�������?�Z�T�a��J��6*�Z(s�����s	6HI��-|Wʃ(�,�)h��.
;�B^��r�ޠ��2�c�DeW6-U�JQG��Qۓ�D)z�,�Z��Ru����?�Gnk�ұ-����"S�Tkɔ��t.��;��t��O�V"]��7�d��y	6郞�1+1�[\�+���#7W�t���V��]��̮r���M�Yi*���K�m;n*jϑVa��㴬�ڦ��t�a�$5R:Ŷ�=a 1aS���*�'�k�{�o��)�\!�qώ<$�J����t����;	�t
�\|
qY��Hޠ��H�'�K�m�g�!���S�qM����}P�L!=��aW[X���x=ӱ<�0ʈ�_��)����%�,L�.+x9�v��j𰺐�zWX�D�C^B�!U���N؏�G�81!&�(��ra���`����/�&��q�v� !�_y�H�u�j:�D͕���O��P�I=�^M�"l�fH������WM��
��d��t��憩N+x=�67��Rbb�Đ�^N�h.��j:��t����(�+���Vs��'�k�	2WH	x9k-�^,����Dx9�k�r�=���Xk��$	��LOS���\�m{Sa{�ܛ�vؠ��"BPص)�Գ��t.��Z{j'x9���&�Q�M`o<�D�)�#�\��UR;������q�Vְ�ԡ	�j:`�m0��Y���f�
Oؼ�1�a7�Ǽ��E��S{p�+��?��hQ?�a��*�^R�"�!�Ym��cc�����Y���!Iu����Eة�#�u�Gh\�Q;hTjO��)��ZS7�+�4���'l{װ�b��y6C�BxE��<$��a���vF�WԹ��C��xI����3�}������/�s��ݥ�H����8����3ؘڇ^T�"�Zs�1���� :`����	�j��)x]�����&v��N���~�����y��l���zH�~;�$Svԣ�Z���5ؽPnb���j]�O�&d�����y]���Qr������d�^�V�I}H���E�$#��x�D��'lYl�|���y_�:QKrW���iȇ���t���n>U؞#���f�����<a���5�!Hh��s6�ԩp�:�E�`��c������>���xa����ɣf�$i��	�����%IUq/�s6%�$^[�a=���܏ ?a���{m���;�>�^Z�P7�%�/u�#Z����{m����1�FF�,G��5	O��j6����o����(      �      x��]�n]In}��
=&=S��ގoۺA��  PO�ey��q�&ߒ/���ڧ�$��1�h"-Vk�R$��釋�G>�{��O�O.�j���������>���-?���)���?���~��	��~��������t���������������y�-5���5�︾��m�bp���K�w`g��j�ЁC�pt���9�D+N�f5p�����q�}Z�����hB9&5r�ȩ#�	�vd;#�"!����܁s�8 �/�m�F㌷�uȥ�\p�v��ϸ.���V׎[;n�	pCm�a�)��G�S[ӑ�_�5��g_�����4�,B����_��$�%���m�I�:���ǚ}�+�%�Dc�m�x�&{��A'g+�j�}-J��oy����.onl�e��v��V����u�v�3�/�Pm-j{�Vb���p5;�5u����X{�ۊ���ׂ�"���V�J��:^��Tu�Kb�`MѪ���gw`4S�Qg�;
m<)t0)�X��Պs_q���7���ӵ�gw``ήYq���[2Q!V����o%��h��o�i.��U
�G�f�a�����Y| �R���Β�z�GPg�ʱ��V�e���h�Sװ�����̙�j��&��D_�oC/V��m��<�Dq�Ku������߯n��k֐��Ɍ|�ު����_\~��=�p?D`�,�ϙܪ}ϣ�d1֓�{�'`pXӼMW#K&���.�~?�x����7a�����O�kv��lǶ a���f� ��	�h#Y�|���,��o5�dH�t��|�Q�B�0ķQ{Ϗ6�!a��n�7eBR��'��sɘ042���]'�j��aǀbd{���Fpv&����z=��1)��|�PK.�.۔-���3���ma�s����ı�4!f��%rbL1�B�Yb;�Ew�Bo���8p�'��`�վ��h��.o>�btҶamv��9⒵Йh���i��·L�@�Zv9Ze��6��l�c����L�e�"���[f�������:M��M��{JF{�:9x&���Q�q����b-��R�˕LV�u�9��蚶9ڜ�7H�X+\��ʹy�C���M,z`�^�6����3g�B� ;��E{�U�6��n���ʂ�H�\�]{lU�N��ʊ�T�_�?�(e;�Oz��3k�Ǎ�S�~�Vjݐ��6�����dV� ۜJ�a����]7�,�2'��w�0lN%�Ё#s��3����R֚�ͩ�t��i��ͼ�Δ:p�G�9�lD�n����zsq���L��T��}��wpC��+��rs*Y��fy?���j�ޜJF�`b�9E��Wd�:�4�q�'�ڜ7� ˙@���=�n�W����z{	�38�=M��{�-N`��Z�ϥ뻅n9	z;�G[2-��h#�͹t����p�|���7
�>��Ԭy.]�-����:��`�f������\��[請���y��L��\�ػ�o�|���Dt�I���9�n��۹v��'랡��u߂w�����/����W���`�;� �
�4���9z����Ү_c�&��*��ɖ��w6G]~�b���k�̕]<d-�Cw���ig鎭���HͺG�|���=�c��	���n>��a�We�x��5���.\����|����7�4}^�Q=t�}1x��/�Y�l��@��-x��$��D;K`kd=LY� �9�Bõç�ā�'�  6ޫ���zNo����	!Ӧ��	�*# �-Z�?=�Hg����6$~
t��a��H|���7�8���:�ZX�iX;��1Ͱ�+�)�a9=�(��Ƒ��y�e3ǃ�-���H^��r��r��k���(ԮζΨ�>��ƕ�c�%���&�s�ǃq)��BK����ݯ_�nn��	��ıJ1��&�9��,y������J�0rp�44 �٤979�l�ʒ&_1S�F��Ir�G��ʏ��7�
�ʩ$Q�f�
ke�9���U]~�X�=�bل��N0�M�e��,S��-J3s���@�jW���,q�e�Z��f��ȶuB���,���5ӵ�	,��hb~�9�Y�0[����3}�1��Y�q���,�k�j�9�}z�!O_/�Y��ҟ�:�O���rw=���f�J'�PBUGܟ�j�z�j?����ՠ�E�p}�	uY9� gzOڪ�,?����}��t��9e�s�I�(܂v���֟O�3A�b�6��$��SI.�ghK��l��$�XT8�W�@Su�Ӧ�	��XP�s�\�\����:^3�Dz�� �G�>��.f���2)ꂈO�j��{1B��,�H�L(Y_x�i_y�z�ef�U��WQ'N?��/d�4�'ef�X�!����Ӿ�m��4.3�ŰB�A� �o���.u)M������7��]$q�gz��KB�貛��|B�.��I1�8 �eWi������u>�SJ	V�/��/m�wt����i���}tj�?~�@��������z9����L��p�S��H�.;��&|n@��%��1S�H�N��9��$����.��ĕ+�)�8��z\�mC*����sZ�s,v�	�^���N�1�Q��Jժ��XCsryw�k���Uq��`$�V����u��9[ۨ��X���E�#},����9���@",/�$����X츛D��Ŕ��*� ��NK��w� y�e���\��C��t	2�N3�`(�
<lՙ��}=x��=43;�,���l��	��3;����XA�A��\߆��=s�3l��M�]�`f6?�˽�UQ����#&��E�i��D���/ϹjdoLچ&�.)R7A�^ 	d�l1�&�ޑe	�>q�j��C�������o�������]�e܅�:.�ί�~���%���y�6{N�$|��.���n�(�� `�9�RsR?f�=䕑 ~�$ܓ�dO	��^��l�!�l-@;|kf|��e|}��CN�GV}n�`|c�)(Ԫ9{�5��o��$ (|!4ɫ!g9F$@�<pcƙ@�6Euw��Cn�7� ��Ѯ�C]-�nі ��>RI	�7��������q�3	{�Mm��\�q�H.gv&C_F�=D�ϐ�A��$(Cf6*�䟺��^��"!>��p���iRgd�q�H��f:��_������G�"�g�ȝ��R����̍j7��h��]���[��o�n����`�E킼�w:l�x$p��BN��!�.Cx'��t`l �*��A��۞����'�N|�Y�s24p�cG��FcM�o�8�g`7��V��iϣ�������a�9�уu�N��j����a?�n�F���*h��R��~09����3>�8x,��3��{3����P�>�}��g��j��!�]�o��@�,����sN�/;�uOoi����,�������J�v����$��l�P4A聀cH�qY�D�/�&AN&���*(�CDC�����2�1��fl�&���Z��@�1D��YȞN%s��n�:���/��rsM���y��@JE+o��obK2�{.��0B��޴�o:�l0t�~���"��ݫ䩋����d�cB0;Ё_��*�iGҵm�l��6�����:�c�E����@g����)�~��K����:*pW!�li�I,5�\��,�lr���I\汇Z�,��-�VL���k�I*ƫ��}���V*N���Z.���Q��~"OW����˃׷�w��/�>_��7�$@Α�8�M/QZV�l�J�a�b�.Aﴺv"RZ�����0�xK��Fua�Hh����oW���$�̈́�>,��A��|"�Z��\h�烁�B���WO,:I�V�v�������qjF��l{��x1�V�C�����D��&��׿���z����n�37b�����n���d�t9�[]����v�7�~6>�7a�L��3�@�H�{���j9!ֱ+W�8\o>����۞L��As��1�    ǉ��s5�m��i�/���\��<�Fk�L�8��n�w�;��Ł�=�7�g0t0�������P�m�vɹA����� ��]6��\���-�v�0��a�Uk��X����̀����4<x�b6��cq<cǑ��.������
��[�����1�6��#"���9�%lA���3���Ԭn�>��ɴ�Ƨ�/��p�\~�����/��^Y���>�f-���)^�J��7�b먹��9s��G���c�5Nƈu�jd�V�yo-�Ab�k�N\�i���d��a�B�*�����ʋ뻯�C=L�.�Yۜ���B|���z����q82;u������^;�t��O����f��@�=I��ȝ*H�T#�'>gDڅ������#\��e� �����$\���k	�xY��
>��٪�'����_�g�v��_�j�/_5�6�C�W���_��k�����}"��ɩ����O؝�����cE��{����瞚�z?	�3	xa��{�J�� L����hB�R�+14�HmHA�&�!B�6�X����@�w+�p�ǂ�=T��[�3�J�W���s�śv响2&'�7��h��\�}��n��!7X�3�v���i��h�~�N�[����� �ѬX�t<�R����a��5���7��#�Q����[8F7C=2�h����� \�l:dlU��߈��� �3p�sSV��|#���;IBP�u�.����xIq�b�7b��b.6o�[x�9�T���F,P#�>��{s͗�΅!�eo6�5��+P�b��3�A���Y}���}�i[,��B׺�n9Ʊ�$��>�o_����|����A����q�:�{��.mw�(@�*��#*J���X� �⤳��.ǘ��ձ�[�3Y����⌳��}����������o�M7���Y_;��T�vF�O\1�8�7>�-;%[�Dq�!;��"W�2�M�-��������<r1,/��hɹ���H�x�Ќ9M��ҧ�"*�'���:rY��<1��j����V�}�˼�.W�O�Wg�N�f�MJ町�h����c�7�h�J{݈�sWcu㡼����������v}e�j*��=S���~�T�o��qe���x}���2p�ǘ3��b���5�{���Ĺ!�C��-�[F�]�7�}�-�w�C��Ş3t���ow�&qg��5���!>C��������[%ő�\���x8!>ϫ�7��[O�7��e����<�����?���������,}ݾ�D��/��.z3cל�P��;iN�-om�"�����GX᪅���C_W�z��{�%�L�B�њ~�?��HM �{c=f�h�)����������O��{h�!�����JD�����K���+HS'i\��k��Ddi�X�P�����H̽%��߷��J��Mḭ�i��Z��8v1�ő�|K�����8�j0b�ga/���N�x�.���[�XvX�Y�5�Y�c����o�Wz�x���Y@���4D�e�F��~7$�ߑ���2Hf[��L���H�9�-�Q�#�]ɮ�gq\5՗�<>�<X��p R�_%�F�\�T�<i�'Մ��v��j�1>�&�9��D�JOK���Q�3��z�4�f��]�~�\�d���36�?�?����o�{��W�o_�ރ��azyh^��a0�Հ�'�๵n[{�����qb~[���[�f�O{���� ~���K8Q��%�d<*�5�\���3��hg_|4+st�y���������yJ��Iف�U��9}z�(GN[�J�-ߠKm}�lT��?`#>��ǒO����W[	��_u��h�qL1�e��p�H2>y��\��&�F�"\��'%�|�i��u-�C���3@@��o#���l��_{��Č��w����q���RY�;��0��Xğ-C�:䟗 ��5�&'�P�[���9w�^�S`ǵ��a�kk�Q�?\	��=D�:�q��g�2�W��w�]��k��ו�v�+60l݆���c3}�a=�cW�h6}"�pSl$ؖ�X��b��Pa�b� 4�嚣�:��4�İv�6��=�P��,})A�S��h��a�SVl*~�]��ÿh��q��� �J-.&�JE.>)o�p$leذkp^K�g)Jf�.�bm@Qޠ�I�ayb*Ck5k��B�´�IeD�OE^�~Gf�r[�� %�j�᷇��0M���wd&,����G��b���l3�U��9%��5�3cqR���^�U�����<-t��uK��=4�$�l�ah�37`���r�U�Y�x-�`.g3�����O�&{BTb1^�+X��kw��z�]���8�#a�`.I�^�4t\7�Z�6lu�;�1�
+�*�i,V�+؆��g\���� �s`8c(�q��qÌ�Np��QK�F�VKͦW�7�����ș�[�l�P؇J��
ơæ	��43�"��\�pwޖQ��D`�<t�4�1��܏�]���R��H�z�,U^(|�b�
�}
N��Jd�>td"��T�i���"�%\}[
+؄;�xs��џ�rI�en����L���?�;z�8�@����8���B�ťb�R�ɩ����n����
4��	#�e�|�3}=-0g��4:>�`��fu�aQ��+�8�@�:�@�ڀ+�v�[�Y��6Η�qh�?;t����Z��3�R�[�#�i*�Z���&h��O/�k;�Hš��8S����v��耯��[��SCDڡ�4�b*��gE��;ޭ�"Ri�F�W;8L��2�-$��	c�ov(�Q�g<Fj�U_�\��43w�,4� �c۹���� �ڡ��Eˬ�(<H:s����KM4;1�����|nV�����w$�&��e��?��1�h�@UB�?3�㲈��M��U9�Y��q�,������n�(]o.<cS��&H�9 ���TW�!hz9�B�&���hB�Y�R�Hp����������E��n2���q�-�����87�>/�gf���H]ˉ���~�H`���V���`�N_�"=u��hυ�[�H�N��K��i�% ��;n��LHbA���U!B}}Di�=&�z�v��8:�4�[�иCWşџ���͗�G�|Nu�|m��,�.D�����Wg�.�D���E��]�C�
�����	D�8����B"R"�&��9��0\�<b)
llE���(�ϣ+'�+�������f3ji2�O�B��E�0ؓ;Y
�n�ůsi���`�e����sb��ܸ؅� +D�	Ӛ���,��&S�)$�\����Y
��&���
`��/^��Db�E
�5���Y
�i��~��/�b`m����w��e�"��E�/����_��&ߌ&e��|(��"�h/"A�C+h7����>�_O���t硭���ϊ�F7������vt���jtD�h)�>�1�+aZځ[���(��y�%I�M�:oJXr��#�����E-�؋Ģ�<�<��H�
Ĺ�v�lI˷��\��'J"v'�$�g��ѠDLf���.�"�k�j	T���H񉢈K,
�ƥ��ѳD�D��`���
=���kz9�S�OEla�%5+3����b⼀@�O�mT�3��8�(�n��7%�n
İ�T�N��#�xp8vM�O�DlmbIV�w47�?��<yd�Z+6;m��l
�^�=�x�b�ӳ��y)�ZmA=0�y���ğ�<�Wt���m�B)*�}55�½?�.T��9f�0f��B4���uv[��ߡ)�����w�^m�*nnxD[
x�I-�XDI�pwl�e�n&�-D!ܧq����cՂ��$��Z�ºɂ��{��Y�ܮ�Cj����jA��ɵ �V�p'�������g����%�[g�Ԅ�"X�i��a���C9�B�V�#�O�$�+��I�$�����tlF=6�֪�D��$Iۋ½$I�|R0ُ��C�p��Z�f�$�+=	�@Th+ �  �i�8�v�_�U��M�}�|G�8K��]����w�F�� �Iw�í�
wZ�mBF���b8���sgl�*�Zp�;�9��3��Ǿ��_��-�vŸ�=g4�)�9���y\�]~m2�!Cّ!�PkF���p_�Iz$jR���!M�Mk�
�z���W�Ǹ駋!kc|c�p	��w#@��穨ŀ�B�Z�~7$Vmb��v�b"`��~ ���Mc���ǥ��I��~�ȸƁ$1�,X�+4����\$J�E�;�TX���K��AP�EEqf��E�8u[:����p2���W���x�L}}H��D�<uẈ�%@`�i7Fl�g��1�7d�6A��ت��� ��
Q�������p!���{�N�_���?�?H<��      �      x����%�q�KO������il�!�n����Ŭ�Y���-O{�aCږVg�\��`ĊR��������w�����_B	-WWk����+�ʿ4��[׿o�W���[�~�o|�H������ן~B�<ŚJ9������=t�[�8Wc��8��b/�>x�z�^H�i���_��U���Wt�k�%׬�o=��C�-�C�j�S���{l�^�Ps���#��Y��*>�Z�����������|{�9uW�8�K�������MGg�g�udZ,�'>���it�c�!ͥ�����d6du9�T���4?wU'=�Ҝ��膭N'#%!���<�)��c-��ۓ=����:�7�����Sg�u,������.F�����K���l��ˮ��G�o����d��Np>�]2����i����X�L�ߛ+Yb<��l�cl�ɠ����e}jJ)��/^G��e)}���j�.��e���7�>�ޣh,6�C��������4�^�ѳ>��ӵ��iݳ�_���7�2���9�����S��W҄�{���ʡo�{d��K1C�_k�dGu��C�����Z�kA[��X�Cx�[/N�����W�u\u��[��J!�O���H����y�,me���3��&�\����'��VnXw.s������R���-m��>YFم4Ͻ��v_]���*4K[��rCj�u�g�Ҙt���ű��|u��ׯ�eH-�õ閴.q���]N\�u.���[�j�e��Tm�m�\���`6y����:9�^֫ݟe�},��~x�%�ӝ'�S��L�&[,k��n8+�F��r�r��,Z�����^���Wxy�:K��ӯ/���V��~��"�é0(�̕�:}E���a���>C~�"�Ӄ��V�Y'�*�.�$/�i�mB_H�����L'M��Z��ή���S���~���v^��b���$�J~�\���r��~|u��o|\���)��9/��Ir��^�?�O|�J���|Z��{V?�V����g�jOD�E[�'~㯓u��!~���������\��^~�qa��u�|9�NF&?~��JU!Jy�c�f�s����[Nw�x�g�t�;]��»��c3Vס���{g�u׊@�u�&��ݪ��9��^�F��������_��[����8����G�cw�[֊��^^��k��Y�y��>�.�e��Bmoi�AW�^]���{KZycM޷�%��6r�m�Zm���MbP�>�Z}��Q������rV7�֡��y���U���c9�~Ԣ�T�|o9�\>9��qӴ�1��T��M��D��p�g��{g���#I���@����v��^k�K��3����N��՞�|��
�pgj��g���$�{�-�{��+���_�dዯ��$'3Υ���Xk���^qe)2:��oR��8�r��=8;������θ��=�h<�:ky��	;�j�k������ߤ*Zwy1fw��mAd��$k�&|�MwW�!����q�	�Ž��`���9i?��8�����������o��K��w�~!m�W���^.f�ܷ�pq�BZ�U�@�����]��$./>�~a�H��*�&LxRIΛq��V�1�>Y[�ou'˔�������2���g�qN��v�gu���ȍ�xK�vgh��컍U��BZ¹Cx�Y�(JW4�J��|�q��O���Y��ϕK3�q{����o����>��%�� �d�u��ʊ��	oo���{��ࡹL+e�bt]�8�e.�Z7��I��*���VsW8�E*���������� �R-������z�r�����ѴRQ�A��!���[����|�:�(�X��wwzY����-�����ї��5_{�5�giDZ�b8���em�cJ:�!�`�X~^x�x"�i�'?�>��v�P:�m^�c���������y߳��C��ھ�ת'y�:���>/��eMd�_�^�,�c�˼�v�i�{��h��|��G��w�&�薳Et��w�9�y�8^S]+��k��-Zy�T�\̴NO�u~o9[z��e(̠P�b��gwz,o������U��?ύ��3��f�}n�Sx�v��^�H$��i�sx���l��[�øl}�ק���	ὁn���H���/��i?�C�>Xx}x/��#��M������S������뻮%]��y�)�u@��~}Z�����|_�
sS\M���󲵼�sm���Ptb"���R֓#����\9&
}^�!|]���iq���&��+VR:��kEWy�x��?3�/������2����{��5�f<�ׅ��'
�J1nEQe�s��-k�%�A~Hx�囑�t�k_-ku)E���f�B�MA���doY�-ձ���L���l�I[i�tG�x)�\���&�$Sth0k��
he�zoO���l�Xѭ��|��Z]��XY�{mDX��߇�V�`.P2�zx�h��/Cqz.������P��ِ���ܵC�Yi�p��ɧɪ*�Ye����l���_��yFm2�7���S�e��'��e��)f����������ja�/r�xC���h�OlJ8��YR�?oxH��^��䐾T */��`��8A�����o|2�M�~�2�<����!%����|_^���*������~�,�A����QV9���o�W_e��_d�?�[L��p�����[U�Y���M&+�z%x�ޗ�!��3X?D�JN��.��&߁�EE<��D%�Md�qI��P?������I���*ϵi�����Β�ɪ4*.�����P�]����iq�"�͏׽�C�#?<7ݒ����ă���������[�����xd�p��}Y5����|<=8���Lthx)��Մ�"��j��oI�(n�ߋ�}��*�C��ۺ8Η�H'�wZ*�d�{���-�nቌ�(���z=*j������>����{k	�1�������h}d��g��࣬��P���L.Xxb��d^�e:;I�|vp�3�-��]4�����v����ߗ,ݷ��/��R�Qe�y�i?!�-Zr����;E����iĹr����~Y�^�@�lk~V��I�G������u8)e	�A�g��[J���/��;&7ʉ�῁Vk�s�G����Ó9+���ww5��?��r�]��_	Gy�_y>��p��o��>a[c_�!~��-хGeά��>�/TE@�>.��KO<�*^��E��!z����t�)���B�V��ӯ���A Q�ڳ84%�_,<�����UP�¬q6���V�/cI��'#=�@�9�$���^�P%�7z��#��O��/k���
[�Y�-�lF�d�>,��fS����*e���t�|}!�l�H'�mM�\Alh�~��M<���^����ᾆ��2���t��9��5�f<�_XK�X~Z�/5�V�ǳ�S�,i����,�u���!u�s?�����G�0�>�:��1���}����B�R��,�B���to)���L��U��g4���SVY�oʜy�H_Zv���|����U��}^�$�F�}8\�hY�8J��|��dꆧ��Y�3x��&�E��_�^w��`��=�e��`�N�qF�-���S�-eG��1�b�JŰª���h��1�>ެ�����y�8�_ۋ�]ު+/��2�&c����R��NTʤٔJ��,�B�r��7e��Fv�B��#�;��Ѯ}���~�v���^����*Ӧ�q�0�C�~�E=�E(nT�݁���Ϟ�u9��_��{GAr��/���©|��E�w��*iN+'��ӯ�^�W`�H�̛JƘ5-��i�����-��	�V(b�:!;�lЩ��UW����3K_x�qO�B(�EA]�=[����zp�*��Ɨl�lΨ�<eUj�̮�O����;1E�W��/;+{�H!�'_A8Hْ������ϫ�$5�0�EOPnC��b���~,v����<� 2
-�t?5꧳��;���+�q�Gksg�^�'�����w�HpU����1|2�t�R�;#N�˷�D-�>��R��g?��DC�|o���|����5O�U    �&g_��n�(O�ߍ��M����.N�𔕻D��dT$Gԃ���v/�2�o� ���<
ȧ�_
�_V��Q1��m0�GnW7��┅���詿-�����%]�5
~n�|z�9���bs�\@����e�����I�[薴��fT:W"�~
oIK�����xl�#����-giN��:�'���6�� ��r�7�L7m{�o�6[���-g;�NntF���^����Ho�|����"'��Z���d��)g�[�eϸLz��t���r�-<e�q��><k��
ԭ���cI���w��O,}�<q7��;1]8�1P��O�>Yt�����]�*x�Axd:�h��nXy��t�#������Ћ��J�p	��c���֐s_��S��|C2�MR�k�?3�Ӄ���e%�K;�mrBg3/y��������&rAS��g�P�g��/P����o�$�G�C�g.�M��Clo��#ق�_���5Y���C�>,�}�&���ꃐ5�I�=~\��$s���JF���'������93�m��k^��)��Pտx�!�N���cs)T���1��=��3���#˥�B缨t�6�%���7_eZ��8�ԏx�>���˅�d�����Ӟ���ȇK�-c��GW��׋��}	��������9��?UН)#,ɇ�g�}|#G�������d�c�51S�b����ʯ�um� i�����*C�x�R6�ZU.�{c��yI�ï�%��Z�Oc��I���Wβ!#�t����G��9�W��D�=^N�;�k�¬v��c�r���&�^�O����n�c��/hb�����"dg)����p_='Rl/z���,gy�Q0�\�/�Ow���l=�=�%m��5��f�:�2R-��g-;�ZddG��ӽL	{F�8����,k�2�*��\��Sc����I�β�4NAV�>�~$��?{�햳#:�t�:94�F��bw�ǒ�!��r�l�]3r��,k�_�)�#��_�=�%-g�޲���j�~�	�Y"�����{KZZr}#���%��xɖ���-i�R�⧠�'�q��7��r�f���$����u�d�Pv�B�& Q��.��槜�eQyL��!��dD�u7�z��7e�p=��˴8
)��:
��7�81|x{�^�]�u�Gfj�|?Yod��=˪|[�u�phr)3͒���$��\���7��n��u������z�u��&kif<6��7�{��{�/:���?��ڢM-�V���?|QVIuh���Dĺ����G/�KoD�ӹ��F	�*����w���,{��� �ڥ|�:��[&E����(  ��b�CxK\�s�4U�G=}D���=D���#��0���͏�c`D	Kp�����h}ɤ�6�B

��]͝|�[}6x���>k�ǣ���N����AZ	2�}څ�i=��6~~��Ձ!�B�d�#0����ߡM����_�n'���cg���V3Z�j-b�#su�����?���Ew;ɟ�����-`H���[ڢ���^l�pt��S=����m�@�g���4�~���Yء��m���I��g��8���ӷ��\��Ք'�?�l�}Ɉ���6"�G+���vR [ݡAN���_M+C�e&����l��<ݮ���f��-j9j��p�e-ˮ�j��G�C��p�%mfF�Zw��I�5�ܩIN��CM����g�}��}�6���'�Y��-���ф�,ݷd3�-i���N	�[:;xKZ�?95���6�I2���wa���h�v}H��.8�(�5w��y嬼x?����r���o���9T���{0[Ƣn'j�̳B�1�IW�.�Åϖ��m<��=�y4Q\�#��l	+c�<0��	�Jm�'���Ƿ�MXvB�4;��k+Ł�.y���l�>=��$D���%Tthq���Ґ�u����T�SD?����ߌ�����Hi�ٔf�b�/D�,.ǲڪ����]~��z,�9�,���	9���N]	jN�hZoK䰁���4�P�l}��h�X\�z���F�fZ�t�x�d���C�h�ч�O@�����e�CG��>x$��C�c��(�SQ�8�3�l�io�'��9KcN^N��,����.��I;DB�F漼�����3J�S)�9�ψ�CV�١��$OO���N�\�W��%-�21ȣm@�oy~�No�%��(���^w�"�&�C�VKZ�T|���4Z�6t��`V�ZA#����hb�X���pg�%��^��a(j��h���ӵ��E���ڊ��W�Y�U�9���ָZΒ��C����W��Ǥ�Ct�X�.���,�6"�B��!���.���}�#�d�.f�k�h�n;��(�PpVD��7R-[�Y
���61���k�ӇPhz�Z�$0k���.t�����G��$l�c}���z�G�x\�?stZ'%{���G���Gv@�`�m���,��hW����Ԗ���m�M��g�O)�1���L*�.N1�����FĴ���Tk�}{�j�@��~
�1���}��|�����HR�O;�%���ȼ��|̑�����0��4ݟ�wKZf�E��6oY��y�\
_�薴5*����ֈS�D��޺c�5��[Ғ�aZR"��M�����;�߲�k���)!��B(���v��yԊiW�>]�4>0*���-m�P}F ?b��̈~Ɍ��-kuc��<Y��n&Є_�rs��-i�e"�BϤ*�ߧKc9[�W����ER=�mؗ�xo9{�鍓9�Q�:��$�?�/n�i1[X�S(����9�g����-~g�QZ�	��F�Э泃S�r�&<uY���e�@��n��m�^�9ӈ^�80���Û�����4y�^���-��Jw�]�#��Nd_y�a��r6{��ty�}�(K��v����T��1�?1=UCv �.�%���S���q�?�~��6�:TZ�ꦥ��*�y��*�p��hs�E!��*��BZ
��_Ĭ-�{��UX�%m��ܡ�3_K2�P(O1}�ޒv��h(�Ƈ�.����<���-i#�9>3��hbAF>�,a�޲6�d��Y��c6���9��-k�jA�4� ���/4���::�+���󁐜m�g�q�Ы��J [���߬��?}4jS;�[q���F\�O��M+V���m�ϊ�>{2���{��0�������O}H�������ϋ�:�?m�뮕7���!|��We�����rD��a!+o7��&"��o�FacP���v���mdH"�.����C!'�~ �c���+NSL�>���ͅ�Bu�^����K�O1Z�c�w���tq��oy�3'�����O˄�o�[�"�� ��g��DVd�У%-
ܺ��_|��t��Ly�<�	ђv\�2�mJeG�ݖ�X���%e�o5��Ҍ����R7����eJ8�j��{_�iO�}�L6𖱈�e��^��Hݵ�B^��p3��W�1�S�T�O͛YV��ھ��Zz|�v��Q.�G��u�E�J���m�^-:�]qLq�*�y�͎�����^�]�*s(���~z����w�<5
Ob�`��y�nV���Z���m��R���)���Yi��I��2&���{���@��em�0�})%���o��J�>�V~-<��Ld�!=�ub�P˚������	����S渚��:]���{
Z���I:�41��G��_x�	�N�U�UW19������3;�@xsk=�����tq���r�?6���䋓����u�������:i!gq�	z��E�iS��7x�}��R�A����ǄS�\E}&a�	�q���s���R~�v����������Ԝ���ꌪ# �]�����>1H�!f?�hŜ��[iw���#㆒2�`���_2��~xD���y�G%��	���B��O+>��ѓs�y�f�z]�4v��.>�#�w� �G'�{$���rt�e<��/�oϣ���Z���#����D�O�B�F)26�ф�cFZY��=�J[�H�L+����O���7�ͲV&�+$ׅ�\&�����Cۡ[�    2{գ���T�^�u��M�C��ՙ��H��������\���C��y2J�b����+"a
���[��T�Ϸ��i��T_�v�E>N�h���F��_2Ч��2_4�I�LUY�UT���2�"��z�9O~��Z�,ck&�cZ��� �W�iÞ�el�d7ƞ�3L�����l?5�R��.�%�l���ꖲ���<��y.�5떳�?u�0�Ӆb��":�_H;�hѬeP�J��9/%�;����)�/�r����������.�&-�<��8��{)��ci�O��^���v�ʳ�!��r�3gU>Gd��30�;T�c�	������޿]����:��0�nx
��2���Q�m(n�#���7��P ��3�i��Q=������������_>�Q.2B�C�`�3�:*�=���&��"2���_�dDUT}N��"��N��w�����ӽ��6�@�C��Y��$q�I�=|1��Ad��tSܞ�]��rt�����2��ZFy�k��,O>g��Β6&?dC�J�P1L?;���� W)�iRl�_��-�����tt����u>JF���zK[z�r@>9�&��e���Ã�-k�x:�W��g��bt��V;�l�nI�����H89r2r�!e��l�}�v�1��:�XK�%�-e-a:��JL͍1-h�]�G���>2�h���뾧<��Ӆ��E[6A7_�^H�͏��.��[ʦ����'��٥�l�G��R6�F�=Ƴp��D��ONX[;��:s�b.� ��␱aa,�eϴ+��X�?FT؊�=��X�Y��Z�3
[K���ڇ��ه>�d����.� O�N���cȹ�����G��.�e-�4�qHtMx�`נ`�ݲ6���VQf}�&�A�C��;&��"w�|u͐(���~�h��jq�*ϯ�u`{r��ܳy��>E<"�rz�ƅ����x��/�[d1�h9����<�n&���.�鹉������zx�h+��(���}����;�U����(C��K+���_���g��<��~������4�Έ�	��,�)�rђ��r�J��Ul8r���.��E��C[r�,�/_���-�<Wk~���6s�!e�rϢvkӔy;���*������`��(R>���r�v4����I$���{��/���`�<34_+���xq�{�rJ��ܘ�W�FI.��=��xV����9LC�Ȳ���IK8��@Ey�?��cTGi!�*-�,11��̽��ڙ-o僶��A�����XIĈ��<�4r��ff�U���i�~���/{C~4���6#��C�~������ĭ�8�}��څ��{?�dIM�	>��].j���O�s�%����v�=|�k_q=#|f� j!��.Fg�,<e��d���AJ��re��z���2�r��ۄ�u�����/˹�:�y)EC7�QUz�8��cn��0�Y{G�k�� {tKZ��!�z��.:9���2��-i�WbMU|?�ת��ާ�햵�? ע���!wW"Ww��ݲV.�5�е���S&�MZ��%Qi�E)q�L�=ɺSx��L7$�vH�Mxޗ#��MZ��͈8�Ɂ�F�c�[?<:�Q�/W=?T�QU�^
��(.�ɴP�#����/ޣ}�hDW��!�xeH�������F�����K��B��Bl�������#4�9�����O���-��c~^���$0��~��̄�򶙽����H�,s���Hm:���Z�����~�8m�����G^C��l�Gz�w���t��G:}��GGCy�C�dצ)���L͏�߆�&�roI��*Cœr�C���ENN;=8��r����#����;�(ۜ�l y�F*j��dfRpֶX��BYd������tE^r�;xKY^�2����4���S��s	�6��R6�O�
�������ٖ��Y�2���硐���)�i����j?>�oѯ�.�`љ!u��!;)
�M��=Z��'<�g@两��!|2�km�>���lgE�Ǯ�>[xES�%��� =�ڼm7;�z_���X�yi�W����S�j��RO����aƼ�ӝ�l���-�\S��>|����{�-|c�a`}��C��{��?-�����7���5E��p1.)����}���g?� ��Տ�dIN��-iQR�9���"=��[:�m��Q�����]��6Af�I_�b*�~�v���ym\*���������2��gO%QL����h�@�7��xYfM?�����#A�g_-|��rp�Y��YـC���7*�e��3Nn��h�X?��?�������l�>T}�?=����A����٠��Q��^,��t`��$pN8�3[1=-��>Xx�Pahsv��C6�/�xn)˃R��K{r�W2;{�o9��v��T���V�co9K���I��6	"��.9D���r��é��Lյ�Q?eU��_eܙh�2�m��'���l5s�μ��2	�,���%,�����jo�P��G<<��Rh]�}8�� �W�����Ig���;���R�߯��Cc������e�zU^�i�gyP�⠍�&�����t��O�������0���g
�+tX��	iK�����x$�x��qJ|�0�k|)������!�m/��3��K���E�%�� �Z�{���Co]�F�*bJ�9���!�!|_�yX��;�G�E�m����l)��F��K�ڐS�IK�h�cTJt~����*�\��>X�0�Q�X�g��cV�z\ֆ�n0��X⬑�j��ʖ�(Z)���<��(�=]y��RN��$t����4I1�RҼ����^�Ź�P~0���k3���ʎ*�Q�g}dc�:�rQm�-g�H������#�L���r6�1."R\1u_�����|��b9������>�%��W'��,��/�9�R�TS'�էj-�zL8g�������ӝ6���kj&/��r�-��ø���/�*��������T�jq��-����G�Ǒ8x>J�������W/��S�B����3��	�ЛEwL;���MDՕ��5�;�����I|�g�eȉq�vd�~��Ox�*�Kx!���B9�)��;��G`8���/����ř���������/C,��ᱯ���&TB�D��ӳ�:6>��{pKY�0�V�~C*���%;����֦W9�}�T�%	�;�do)���3�"�"�_��_(�\���Qf��|G�z(���[�I\C�k��,���ܻ󭵜e�m`C
}F�$��t�6�R6�&	h���:K�}��~�]w�I�0h|&4h�^J�w�Ԡv����&玥����S��%s�Qt��!؊����Ri�÷�UB�r<S�k��z����_.�$W�|N$�/a��H��ӣ�\�u;���i�Zw�Yy��w𖵑��GS޽8�����1�%��A��Ly�s��(;<�_H�Xr���u��t4� �C�nY� ������)|�
��/��RmhOt�+(�*�3�ޒ6�)A����k|q���c�-i�x0���8wV+ә������-g�P��Q���8��G<^{�Y^bA��g�3��-�S��-g9�#%�#;��p�����r6�ujLe�+�i��H��|9tKZ�Y׆���)�釒���C��UԀ�f�\�Ot�Z�I&;�V�2_B�3�ð���;�h}B����M�|m&eΞ<&b�6�jY��Gpo��Â>�e��MtD1m�\U;�h᩵'qS02�]^���O�3�P6+p��펽���v��1�����������P;�򝯧�R�ԛF�|���y39�3M�)*�����|��<�3C�!����.ZY�=z_N%��!9�_~�g�O�n��v�R��̎�`ZÞ�e�6/�~���\�z�Ɛ���wo)KV���_���w�ܳ;xKY,�l>�Z���.���ű�E�?���5ٶa������b}F�u�g�Kc�@uk���rv�x�@�u��L%G:� I  �R�FY8��M����ģ�!����IKQ���G��P��M>���e���-7s*�L �:\�`�ym��8��d�"��=.�;x�X9}CL��a�z��v���`˓ -Z�����6'&*�[�}Զ�DKu:�V�����u��0&6�G��^���%彃��%�#��x[�g�[W_O�!�%lT�ɉ��m3�YHX��d�v�cKC�مG����N0k�n	Ʀ���2��)�kȹ-e>;xKX�����$���A8<�q�d�����NW̨�m���K69<�J�� ���O);k��2=fZq�Y���t�(/G>��S��.���+�G����?�,|$��K#�t��1�����~��T�wD��=(�/�ҩ�]N��,��-N�0�^��џ�V����^�⩊��:��U�����79ɡ�4�R�>�C��>]������(��lT-v����C�~�AMx�����M��WO�.eP;xo�kc�\��ǕW�<����di+ ���`����8�m0�÷�Edչ��zmr�1� kyߡ[�b-j|d�d���ݙ6poY���\1��g_�o{y�/7�(�T�,ů�"{R���%������?2�/?�8��´�4����ұG��3�0!e�N֨j����9V�U��g���;��i=��+m=c,�+��g8�5;�p��B[��K�p&+Po�t��Y��r�2z�m�)1��:Eԧ9/���<��o��@����z���%�ې��ݑ&<Y$�����r6{T�mz�t�!k�l�Cs6����wқ������V�/����bՏ�	��|�T*�	��Βje��7�͠˅X��4U�6jT=ʚ�Bl໅����ڞ�V'��N�~B��*o�����=��#��&G7��.�l��C��~�d��<��e7����"A��x#*��)�z��~���Ӆ��{��;��d��x�8t��jH]�5���ˡ�����X����%�ڮ�Ϸ�E��P����_�P��:g2�ӵǼ9z��d�p�/������E-a�p6��D�?���G�2-������lAl�u�1'��[^zv�e�PN}|��l���6��S����|&gOViCX��������3���,�;�}�ۯч*���%�~���?yq*NK���3�l����$O7�j�@�ѭ"!;�b�[)��<�h���Ϋ|���Pm�C��F���-ػd�,<�Crq�=y�7������W�<Ƭ^���(�j�[�ųߠ�J��N���(_��5A�lE������:�+�y�d�����T���Â�]�U�ywc,���X�^�.
���JD�Rȫfi[��D��7�[���FǱ�D~`tU��@�=ԏ�-m $)��s���B���V�CEU�L�J&<�.rhs�em�x���G̗�iV?����V�[�^'���'���a�-me�xh���/>���vh=�?]£^�n�Ȃjo���-�?Ej���������M�c����eK�F2}�&���T����/�-o������9
G�G.�D;tK�D�,�F�4?&�����~�oY��S*�ʓE���t��)��%�5���)���/�em,cvc������_�I��T��1P�,_���t������3���s<h&�+�'�=�f��PN`��?gF����hJN��y��c�h���C��[���{��c�:������-i�3�!�&���[�:��W���'�|���ISh���6���:�Z�Zw�d�"3a�;����O;tKZJf��O͜��[?������zD���낼f�Y4�Y-��x�s�|�ŵn�*r�[΢{K)���Z��V}���Y�Z��GnA��S�-gI��<ϐ��`�Q|�Yo9K�0E�hνh�q�N���[�ơl���3���f���R��]Ҙ0�n�~�hɗ�F�tF�����z��r�fD���-�	��Tڥ�t�8Wi����ܠ�(s���ї'EC\0�)4�ƣ����h���޾���e��O��x�͈m�3t��~�����?�x�Y!��oŦJ��mM����*����.l�����W�Y���7m�P�����8*(�����M5|q�a�/��LE�:�~��F������[���'�B�lms��Ni�J���+45�<��G�j�P{�F��|�.�ҾFMy�أ�A�r�}��?���������Ԅ�׳�E���쟹J�7�N����#��������l໅g)��n�R�
B��*B����xT�uʛ��#}�J��rd6���S6���JK����ΠF3�#�R�Ir�N�=Z��H��K�ԛC~�Z�)|��2�TLpޝwZuτ<�-�g��ڗ�A�[���B�|��eY{�h<��DY�CD��}�R֓~vi�#ߤ��]R�����rK�q���������薲T�Q)07w�K�֋�5�h�~���W�@�&�|·�����!�嬗;Mqz�*zsW����[����^�1Ls�F� �:D��{�f����f��f�!����<�z�Sz��N�aU]����,�|�c앛+��2����	����ǡ�3�p�&C�ҏ��bphx!���L�ez_�D��0��'G�=]�(���ѝ��J�emJ=I>���?/o�ʀ�-�F��|�1?�}�+�D��:[	��P����c�5K3�=�۲>ݟ��r��ru5�������({Ȩb	�<�<���1ױ2.�������Ŵ�>��A~�TY��ʃ1�A�YzR���Ow�2�2z��\�'���"x�Xc�4�0�{n)��9������� �I      �   k  x���Ꭲ0��S�^
���� F!��dsɦ�C��Tٜo�ۮw��DE�i?��7��=(�0��f�A)���yw�T��v���Y�fm��I�d�K�ɐ�C2��( ^ؘ�N$#�㌰:1�A`�1d*!�U�>a��2"2OpȜ�G��G"b"����+kN܃�J΂�����_�cF����esA���O2V�ԯ �l#���%d��!�Z��c�XBMR�Q5{���Iz$EI�k09�*y���f8�v�E��	�%=-4ѡ9�xS����!)C�.z��L#I�\�)�����񔇩Ƒ�E�l$5��S&�J^q�0Jރ�T\iT\����n��wS�����St�������y�O��Y�,�c��1e���h/N͕���f���lz@��L5���zq�>c֤�$_�Yhʠ�?�
m1�y���RS�%�4۬B*���W'r�IO�K�E�)�U/�5[�+�~;��u���v>{���>��\����y'�xc����7gj ��̼;O�v�җ?�
�}�qKu�L�.��q�O���,���5�.�Bõ}��0�=���o8cl�p�2ߕ�IS}������(���Gؘ���eY� ~#      �   �   x�-��C0 ��k}���rDd��2]�t�ʜ65��ɒ?߯JVշ��Ϭc�����`9¶�
r��/k��*��آ�&1�N�mn���
k��Ԋs�Aa��J�������Y�I���Jܘ���l�x�ܘC��	�V;Y���v�R1�vX�e��@ ?5t     