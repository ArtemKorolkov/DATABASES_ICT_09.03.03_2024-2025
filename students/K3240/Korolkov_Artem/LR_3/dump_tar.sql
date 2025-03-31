toc.dat                                                                                             0000600 0004000 0002000 00000135137 14771407746 0014472 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   &    8                }            hotel_db    17.4    17.4 l    Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false         R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false         S           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false         T           1262    16394    hotel_db    DATABASE     n   CREATE DATABASE hotel_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru-RU';
    DROP DATABASE hotel_db;
                     postgres    false         �            1259    18289 
   Акция    TABLE     R  CREATE TABLE public."Акция" (
    "идентификатор_акции" integer NOT NULL,
    "название" character varying(80) NOT NULL,
    "процент_скидки" double precision NOT NULL,
    "дата_начала" date NOT NULL,
    "дата_конца" date NOT NULL,
    "идентификатор_типа_комнаты" integer NOT NULL,
    CONSTRAINT "Акция_check" CHECK (("дата_начала" < "дата_конца")),
    CONSTRAINT "Акция_процент_скидки_check" CHECK (("процент_скидки" > (0)::double precision))
);
     DROP TABLE public."Акция";
       public         heap r       postgres    false         �            1259    18288 4   Акция_идентификатор_акции_seq    SEQUENCE     �   CREATE SEQUENCE public."Акция_идентификатор_акции_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public."Акция_идентификатор_акции_seq";
       public               postgres    false    242         U           0    0 4   Акция_идентификатор_акции_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Акция_идентификатор_акции_seq" OWNED BY public."Акция"."идентификатор_акции";
          public               postgres    false    241         �            1259    18179    Договор    TABLE     6  CREATE TABLE public."Договор" (
    "идентификатор_договора" integer NOT NULL,
    "идентификатор_должности" integer NOT NULL,
    "табельный_номер" integer NOT NULL,
    "тип_договора" character varying(80) NOT NULL,
    "условия" character varying(100) NOT NULL,
    "вид" character varying(80),
    "дата_окончания" date NOT NULL,
    "дата_начала" date NOT NULL,
    CONSTRAINT "Договор_check" CHECK (("дата_начала" < "дата_окончания")),
    CONSTRAINT "Договор_тип_договора_check" CHECK ((("тип_договора")::text = ANY ((ARRAY['срочный'::character varying, 'бессрочный'::character varying, 'ГПХ'::character varying])::text[])))
);
 $   DROP TABLE public."Договор";
       public         heap r       postgres    false         �            1259    18178 >   Договор_идентификатор_договора_seq    SEQUENCE     �   CREATE SEQUENCE public."Договор_идентификатор_договора_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 W   DROP SEQUENCE public."Договор_идентификатор_договора_seq";
       public               postgres    false    228         V           0    0 >   Договор_идентификатор_договора_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Договор_идентификатор_договора_seq" OWNED BY public."Договор"."идентификатор_договора";
          public               postgres    false    227         �            1259    18163    Должность    TABLE     c  CREATE TABLE public."Должность" (
    "идентификатор_должности" integer NOT NULL,
    "название" character varying(80) NOT NULL,
    "количество_ставок" integer NOT NULL,
    CONSTRAINT "Должность_количество_ставок_check" CHECK (("количество_ставок" > 0))
);
 (   DROP TABLE public."Должность";
       public         heap r       postgres    false         �            1259    18162 >   Должность_идентификатор_должно_seq    SEQUENCE     �   CREATE SEQUENCE public."Должность_идентификатор_должно_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 W   DROP SEQUENCE public."Должность_идентификатор_должно_seq";
       public               postgres    false    224         W           0    0 >   Должность_идентификатор_должно_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Должность_идентификатор_должно_seq" OWNED BY public."Должность"."идентификатор_должности";
          public               postgres    false    223         �            1259    18203 
   Заказ    TABLE       CREATE TABLE public."Заказ" (
    "идентификатор_бронирования" integer NOT NULL,
    "дата_бронирования" date NOT NULL,
    "дата_заезда" date NOT NULL,
    "дата_отъезда" date NOT NULL,
    "итоговая_сумма" double precision NOT NULL,
    "состояние" boolean NOT NULL,
    "идентификатор_комнаты" integer NOT NULL,
    "идентификатор_договора" integer NOT NULL,
    "серия_и_номер" character varying(80) NOT NULL,
    CONSTRAINT "Заказ_check" CHECK (("дата_заезда" < "дата_отъезда")),
    CONSTRAINT "Заказ_итоговая_сумма_check" CHECK (("итоговая_сумма" > (0)::double precision))
);
     DROP TABLE public."Заказ";
       public         heap r       postgres    false         �            1259    18202 >   Заказ_идентификатор_бронирован_seq    SEQUENCE     �   CREATE SEQUENCE public."Заказ_идентификатор_бронирован_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 W   DROP SEQUENCE public."Заказ_идентификатор_бронирован_seq";
       public               postgres    false    231         X           0    0 >   Заказ_идентификатор_бронирован_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Заказ_идентификатор_бронирован_seq" OWNED BY public."Заказ"."идентификатор_бронирования";
          public               postgres    false    230         �            1259    18145    Комната    TABLE     �  CREATE TABLE public."Комната" (
    "идентификатор_комнаты" integer NOT NULL,
    "код_филиала" integer NOT NULL,
    "идентификатор_типа_комнаты" integer NOT NULL,
    "статус_занятости" boolean NOT NULL,
    "статус_уборки" boolean NOT NULL,
    "примечание" character varying(80) NOT NULL,
    "номер" integer NOT NULL,
    CONSTRAINT "Комната_номер_check" CHECK (("номер" > 0))
);
 $   DROP TABLE public."Комната";
       public         heap r       postgres    false         �            1259    18144 <   Комната_идентификатор_комнаты_seq    SEQUENCE     �   CREATE SEQUENCE public."Комната_идентификатор_комнаты_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 U   DROP SEQUENCE public."Комната_идентификатор_комнаты_seq";
       public               postgres    false    222         Y           0    0 <   Комната_идентификатор_комнаты_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Комната_идентификатор_комнаты_seq" OWNED BY public."Комната"."идентификатор_комнаты";
          public               postgres    false    221         �            1259    18227    Оплата    TABLE     �  CREATE TABLE public."Оплата" (
    "идентификатор_оплаты" integer NOT NULL,
    "идентификатор_бронирования" integer NOT NULL,
    "дата_оплаты" date NOT NULL,
    "сумма" double precision NOT NULL,
    "статус" boolean NOT NULL,
    "метод" character varying(40) NOT NULL,
    CONSTRAINT "Оплата_метод_check" CHECK ((("метод")::text = ANY ((ARRAY['наличные'::character varying, 'карта'::character varying, 'СБП'::character varying, 'криптовалюта'::character varying, 'перевод'::character varying])::text[]))),
    CONSTRAINT "Оплата_сумма_check" CHECK (("сумма" > (0)::double precision))
);
 "   DROP TABLE public."Оплата";
       public         heap r       postgres    false         �            1259    18226 8   Оплата_идентификатор_оплаты_seq    SEQUENCE     �   CREATE SEQUENCE public."Оплата_идентификатор_оплаты_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 Q   DROP SEQUENCE public."Оплата_идентификатор_оплаты_seq";
       public               postgres    false    233         Z           0    0 8   Оплата_идентификатор_оплаты_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Оплата_идентификатор_оплаты_seq" OWNED BY public."Оплата"."идентификатор_оплаты";
          public               postgres    false    232         �            1259    18130 
   Отель    TABLE     �   CREATE TABLE public."Отель" (
    "код_филиала" integer NOT NULL,
    "название" character varying(80) NOT NULL,
    "адрес" character varying(80) NOT NULL,
    "город" character varying(80) NOT NULL
);
     DROP TABLE public."Отель";
       public         heap r       postgres    false         �            1259    18129 $   Отель_код_филиала_seq    SEQUENCE     �   CREATE SEQUENCE public."Отель_код_филиала_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public."Отель_код_филиала_seq";
       public               postgres    false    218         [           0    0 $   Отель_код_филиала_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."Отель_код_филиала_seq" OWNED BY public."Отель"."код_филиала";
          public               postgres    false    217         �            1259    18197    Постоялец    TABLE        CREATE TABLE public."Постоялец" (
    "серия_и_номер" character varying(80) NOT NULL,
    "фио" character varying(80) NOT NULL,
    "прописка" character varying(120) NOT NULL,
    "дата_рождения" date NOT NULL
);
 (   DROP TABLE public."Постоялец";
       public         heap r       postgres    false         �            1259    18171    Сотрудник    TABLE     `  CREATE TABLE public."Сотрудник" (
    "табельный_номер" integer NOT NULL,
    "фио" character varying(80) NOT NULL,
    "номер_телефона" character varying(20) NOT NULL,
    "почта" character varying(80),
    CONSTRAINT "Сотрудник_почта_check" CHECK ((("почта")::text ~~ '%@%.%'::text))
);
 (   DROP TABLE public."Сотрудник";
       public         heap r       postgres    false         �            1259    18170 4   Сотрудник_табельный_номер_seq    SEQUENCE     �   CREATE SEQUENCE public."Сотрудник_табельный_номер_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public."Сотрудник_табельный_номер_seq";
       public               postgres    false    226         \           0    0 4   Сотрудник_табельный_номер_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Сотрудник_табельный_номер_seq" OWNED BY public."Сотрудник"."табельный_номер";
          public               postgres    false    225         �            1259    18263    Стоимость    TABLE     �  CREATE TABLE public."Стоимость" (
    "идентификатор_стоимости" integer NOT NULL,
    "начало_периода_действия" date NOT NULL,
    "конец_периода_действия" date NOT NULL,
    "название" character varying(80) NOT NULL,
    CONSTRAINT "Стоимость_check" CHECK (("начало_периода_действия" < "конец_периода_действия"))
);
 (   DROP TABLE public."Стоимость";
       public         heap r       postgres    false         �            1259    18262 >   Стоимость_идентификатор_стоимо_seq    SEQUENCE     �   CREATE SEQUENCE public."Стоимость_идентификатор_стоимо_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 W   DROP SEQUENCE public."Стоимость_идентификатор_стоимо_seq";
       public               postgres    false    238         ]           0    0 >   Стоимость_идентификатор_стоимо_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Стоимость_идентификатор_стоимо_seq" OWNED BY public."Стоимость"."идентификатор_стоимости";
          public               postgres    false    237         �            1259    18137    Тип_комнаты    TABLE     �  CREATE TABLE public."Тип_комнаты" (
    "идентификатор_типа_комнаты" integer NOT NULL,
    "кол_во_мест" integer NOT NULL,
    "наименование" character varying(80),
    "название_удобства" character varying(80),
    CONSTRAINT "Тип_комнаты_кол_во_мест_check" CHECK (("кол_во_мест" > 0))
);
 +   DROP TABLE public."Тип_комнаты";
       public         heap r       postgres    false         �            1259    18136 >   Тип_комнаты_идентификатор_типа__seq    SEQUENCE     �   CREATE SEQUENCE public."Тип_комнаты_идентификатор_типа__seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 W   DROP SEQUENCE public."Тип_комнаты_идентификатор_типа__seq";
       public               postgres    false    220         ^           0    0 >   Тип_комнаты_идентификатор_типа__seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Тип_комнаты_идентификатор_типа__seq" OWNED BY public."Тип_комнаты"."идентификатор_типа_комнаты";
          public               postgres    false    219         �            1259    18241    Уборка    TABLE     �  CREATE TABLE public."Уборка" (
    "идентификатор_уборки" integer NOT NULL,
    "дата_уборки" date NOT NULL,
    "статус_уборки" boolean NOT NULL,
    "сотрудник" character varying(80) NOT NULL,
    "идентификатор_комнаты" integer NOT NULL,
    "идентификатор_договора" integer NOT NULL
);
 "   DROP TABLE public."Уборка";
       public         heap r       postgres    false         �            1259    18240 8   Уборка_идентификатор_уборки_seq    SEQUENCE     �   CREATE SEQUENCE public."Уборка_идентификатор_уборки_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 Q   DROP SEQUENCE public."Уборка_идентификатор_уборки_seq";
       public               postgres    false    235         _           0    0 8   Уборка_идентификатор_уборки_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Уборка_идентификатор_уборки_seq" OWNED BY public."Уборка"."идентификатор_уборки";
          public               postgres    false    234         �            1259    18257    Удобства    TABLE     �   CREATE TABLE public."Удобства" (
    "название" character varying(80) NOT NULL,
    "описание" character varying(80) NOT NULL,
    "вкл_невкл" boolean NOT NULL
);
 &   DROP TABLE public."Удобства";
       public         heap r       postgres    false         �            1259    18276    Цена    TABLE     �  CREATE TABLE public."Цена" (
    "идентификатор_цены" integer NOT NULL,
    "начало_периода_действия" date NOT NULL,
    "конец_периода_действия" date NOT NULL,
    "идентификатор_типа_комнаты" integer NOT NULL,
    CONSTRAINT "Цена_check" CHECK (("начало_периода_действия" < "конец_периода_действия"))
);
    DROP TABLE public."Цена";
       public         heap r       postgres    false         �            1259    18275 0   Цена_идентификатор_цены_seq    SEQUENCE     �   CREATE SEQUENCE public."Цена_идентификатор_цены_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public."Цена_идентификатор_цены_seq";
       public               postgres    false    240         `           0    0 0   Цена_идентификатор_цены_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Цена_идентификатор_цены_seq" OWNED BY public."Цена"."идентификатор_цены";
          public               postgres    false    239         k           2604    18292 0   Акция идентификатор_акции    DEFAULT     �   ALTER TABLE ONLY public."Акция" ALTER COLUMN "идентификатор_акции" SET DEFAULT nextval('public."Акция_идентификатор_акции_seq"'::regclass);
 c   ALTER TABLE public."Акция" ALTER COLUMN "идентификатор_акции" DROP DEFAULT;
       public               postgres    false    241    242    242         e           2604    18182 :   Договор идентификатор_договора    DEFAULT     �   ALTER TABLE ONLY public."Договор" ALTER COLUMN "идентификатор_договора" SET DEFAULT nextval('public."Договор_идентификатор_договора_seq"'::regclass);
 m   ALTER TABLE public."Договор" ALTER COLUMN "идентификатор_договора" DROP DEFAULT;
       public               postgres    false    228    227    228         c           2604    18166 @   Должность идентификатор_должности    DEFAULT     �   ALTER TABLE ONLY public."Должность" ALTER COLUMN "идентификатор_должности" SET DEFAULT nextval('public."Должность_идентификатор_должно_seq"'::regclass);
 s   ALTER TABLE public."Должность" ALTER COLUMN "идентификатор_должности" DROP DEFAULT;
       public               postgres    false    223    224    224         f           2604    18206 >   Заказ идентификатор_бронирования    DEFAULT     �   ALTER TABLE ONLY public."Заказ" ALTER COLUMN "идентификатор_бронирования" SET DEFAULT nextval('public."Заказ_идентификатор_бронирован_seq"'::regclass);
 q   ALTER TABLE public."Заказ" ALTER COLUMN "идентификатор_бронирования" DROP DEFAULT;
       public               postgres    false    231    230    231         b           2604    18148 8   Комната идентификатор_комнаты    DEFAULT     �   ALTER TABLE ONLY public."Комната" ALTER COLUMN "идентификатор_комнаты" SET DEFAULT nextval('public."Комната_идентификатор_комнаты_seq"'::regclass);
 k   ALTER TABLE public."Комната" ALTER COLUMN "идентификатор_комнаты" DROP DEFAULT;
       public               postgres    false    221    222    222         g           2604    18230 4   Оплата идентификатор_оплаты    DEFAULT     �   ALTER TABLE ONLY public."Оплата" ALTER COLUMN "идентификатор_оплаты" SET DEFAULT nextval('public."Оплата_идентификатор_оплаты_seq"'::regclass);
 g   ALTER TABLE public."Оплата" ALTER COLUMN "идентификатор_оплаты" DROP DEFAULT;
       public               postgres    false    233    232    233         `           2604    18133     Отель код_филиала    DEFAULT     �   ALTER TABLE ONLY public."Отель" ALTER COLUMN "код_филиала" SET DEFAULT nextval('public."Отель_код_филиала_seq"'::regclass);
 S   ALTER TABLE public."Отель" ALTER COLUMN "код_филиала" DROP DEFAULT;
       public               postgres    false    217    218    218         d           2604    18174 0   Сотрудник табельный_номер    DEFAULT     �   ALTER TABLE ONLY public."Сотрудник" ALTER COLUMN "табельный_номер" SET DEFAULT nextval('public."Сотрудник_табельный_номер_seq"'::regclass);
 c   ALTER TABLE public."Сотрудник" ALTER COLUMN "табельный_номер" DROP DEFAULT;
       public               postgres    false    225    226    226         i           2604    18266 @   Стоимость идентификатор_стоимости    DEFAULT     �   ALTER TABLE ONLY public."Стоимость" ALTER COLUMN "идентификатор_стоимости" SET DEFAULT nextval('public."Стоимость_идентификатор_стоимо_seq"'::regclass);
 s   ALTER TABLE public."Стоимость" ALTER COLUMN "идентификатор_стоимости" DROP DEFAULT;
       public               postgres    false    237    238    238         a           2604    18140 H   Тип_комнаты идентификатор_типа_комнаты    DEFAULT     �   ALTER TABLE ONLY public."Тип_комнаты" ALTER COLUMN "идентификатор_типа_комнаты" SET DEFAULT nextval('public."Тип_комнаты_идентификатор_типа__seq"'::regclass);
 {   ALTER TABLE public."Тип_комнаты" ALTER COLUMN "идентификатор_типа_комнаты" DROP DEFAULT;
       public               postgres    false    220    219    220         h           2604    18244 4   Уборка идентификатор_уборки    DEFAULT     �   ALTER TABLE ONLY public."Уборка" ALTER COLUMN "идентификатор_уборки" SET DEFAULT nextval('public."Уборка_идентификатор_уборки_seq"'::regclass);
 g   ALTER TABLE public."Уборка" ALTER COLUMN "идентификатор_уборки" DROP DEFAULT;
       public               postgres    false    235    234    235         j           2604    18279 ,   Цена идентификатор_цены    DEFAULT     �   ALTER TABLE ONLY public."Цена" ALTER COLUMN "идентификатор_цены" SET DEFAULT nextval('public."Цена_идентификатор_цены_seq"'::regclass);
 _   ALTER TABLE public."Цена" ALTER COLUMN "идентификатор_цены" DROP DEFAULT;
       public               postgres    false    240    239    240         N          0    18289 
   Акция 
   TABLE DATA           �   COPY public."Акция" ("идентификатор_акции", "название", "процент_скидки", "дата_начала", "дата_конца", "идентификатор_типа_комнаты") FROM stdin;
    public               postgres    false    242       4942.dat @          0    18179    Договор 
   TABLE DATA             COPY public."Договор" ("идентификатор_договора", "идентификатор_должности", "табельный_номер", "тип_договора", "условия", "вид", "дата_окончания", "дата_начала") FROM stdin;
    public               postgres    false    228       4928.dat <          0    18163    Должность 
   TABLE DATA           �   COPY public."Должность" ("идентификатор_должности", "название", "количество_ставок") FROM stdin;
    public               postgres    false    224       4924.dat C          0    18203 
   Заказ 
   TABLE DATA           c  COPY public."Заказ" ("идентификатор_бронирования", "дата_бронирования", "дата_заезда", "дата_отъезда", "итоговая_сумма", "состояние", "идентификатор_комнаты", "идентификатор_договора", "серия_и_номер") FROM stdin;
    public               postgres    false    231       4931.dat :          0    18145    Комната 
   TABLE DATA             COPY public."Комната" ("идентификатор_комнаты", "код_филиала", "идентификатор_типа_комнаты", "статус_занятости", "статус_уборки", "примечание", "номер") FROM stdin;
    public               postgres    false    222       4922.dat E          0    18227    Оплата 
   TABLE DATA           �   COPY public."Оплата" ("идентификатор_оплаты", "идентификатор_бронирования", "дата_оплаты", "сумма", "статус", "метод") FROM stdin;
    public               postgres    false    233       4933.dat 6          0    18130 
   Отель 
   TABLE DATA           o   COPY public."Отель" ("код_филиала", "название", "адрес", "город") FROM stdin;
    public               postgres    false    218       4918.dat A          0    18197    Постоялец 
   TABLE DATA           �   COPY public."Постоялец" ("серия_и_номер", "фио", "прописка", "дата_рождения") FROM stdin;
    public               postgres    false    229       4929.dat >          0    18171    Сотрудник 
   TABLE DATA           �   COPY public."Сотрудник" ("табельный_номер", "фио", "номер_телефона", "почта") FROM stdin;
    public               postgres    false    226       4926.dat J          0    18263    Стоимость 
   TABLE DATA           �   COPY public."Стоимость" ("идентификатор_стоимости", "начало_периода_действия", "конец_периода_действия", "название") FROM stdin;
    public               postgres    false    238       4938.dat 8          0    18137    Тип_комнаты 
   TABLE DATA           �   COPY public."Тип_комнаты" ("идентификатор_типа_комнаты", "кол_во_мест", "наименование", "название_удобства") FROM stdin;
    public               postgres    false    220       4920.dat G          0    18241    Уборка 
   TABLE DATA           �   COPY public."Уборка" ("идентификатор_уборки", "дата_уборки", "статус_уборки", "сотрудник", "идентификатор_комнаты", "идентификатор_договора") FROM stdin;
    public               postgres    false    235       4935.dat H          0    18257    Удобства 
   TABLE DATA           i   COPY public."Удобства" ("название", "описание", "вкл_невкл") FROM stdin;
    public               postgres    false    236       4936.dat L          0    18276    Цена 
   TABLE DATA           �   COPY public."Цена" ("идентификатор_цены", "начало_периода_действия", "конец_периода_действия", "идентификатор_типа_комнаты") FROM stdin;
    public               postgres    false    240       4940.dat a           0    0 4   Акция_идентификатор_акции_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public."Акция_идентификатор_акции_seq"', 1000, true);
          public               postgres    false    241         b           0    0 >   Договор_идентификатор_договора_seq    SEQUENCE SET     q   SELECT pg_catalog.setval('public."Договор_идентификатор_договора_seq"', 1000, true);
          public               postgres    false    227         c           0    0 >   Должность_идентификатор_должно_seq    SEQUENCE SET     q   SELECT pg_catalog.setval('public."Должность_идентификатор_должно_seq"', 1000, true);
          public               postgres    false    223         d           0    0 >   Заказ_идентификатор_бронирован_seq    SEQUENCE SET     q   SELECT pg_catalog.setval('public."Заказ_идентификатор_бронирован_seq"', 1000, true);
          public               postgres    false    230         e           0    0 <   Комната_идентификатор_комнаты_seq    SEQUENCE SET     o   SELECT pg_catalog.setval('public."Комната_идентификатор_комнаты_seq"', 1000, true);
          public               postgres    false    221         f           0    0 8   Оплата_идентификатор_оплаты_seq    SEQUENCE SET     k   SELECT pg_catalog.setval('public."Оплата_идентификатор_оплаты_seq"', 1000, true);
          public               postgres    false    232         g           0    0 $   Отель_код_филиала_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public."Отель_код_филиала_seq"', 1000, true);
          public               postgres    false    217         h           0    0 4   Сотрудник_табельный_номер_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public."Сотрудник_табельный_номер_seq"', 1000, true);
          public               postgres    false    225         i           0    0 >   Стоимость_идентификатор_стоимо_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public."Стоимость_идентификатор_стоимо_seq"', 100, true);
          public               postgres    false    237         j           0    0 >   Тип_комнаты_идентификатор_типа__seq    SEQUENCE SET     q   SELECT pg_catalog.setval('public."Тип_комнаты_идентификатор_типа__seq"', 1000, true);
          public               postgres    false    219         k           0    0 8   Уборка_идентификатор_уборки_seq    SEQUENCE SET     k   SELECT pg_catalog.setval('public."Уборка_идентификатор_уборки_seq"', 1000, true);
          public               postgres    false    234         l           0    0 0   Цена_идентификатор_цены_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public."Цена_идентификатор_цены_seq"', 1000, true);
          public               postgres    false    239         �           2606    18296    Акция Акция_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Акция"
    ADD CONSTRAINT "Акция_pkey" PRIMARY KEY ("идентификатор_акции");
 H   ALTER TABLE ONLY public."Акция" DROP CONSTRAINT "Акция_pkey";
       public                 postgres    false    242         �           2606    18186 "   Договор Договор_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Договор"
    ADD CONSTRAINT "Договор_pkey" PRIMARY KEY ("идентификатор_договора");
 P   ALTER TABLE ONLY public."Договор" DROP CONSTRAINT "Договор_pkey";
       public                 postgres    false    228         �           2606    18169 *   Должность Должность_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Должность"
    ADD CONSTRAINT "Должность_pkey" PRIMARY KEY ("идентификатор_должности");
 X   ALTER TABLE ONLY public."Должность" DROP CONSTRAINT "Должность_pkey";
       public                 postgres    false    224         �           2606    18210    Заказ Заказ_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Заказ"
    ADD CONSTRAINT "Заказ_pkey" PRIMARY KEY ("идентификатор_бронирования");
 H   ALTER TABLE ONLY public."Заказ" DROP CONSTRAINT "Заказ_pkey";
       public                 postgres    false    231                    2606    18151 "   Комната Комната_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Комната"
    ADD CONSTRAINT "Комната_pkey" PRIMARY KEY ("идентификатор_комнаты");
 P   ALTER TABLE ONLY public."Комната" DROP CONSTRAINT "Комната_pkey";
       public                 postgres    false    222         �           2606    18234    Оплата Оплата_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Оплата"
    ADD CONSTRAINT "Оплата_pkey" PRIMARY KEY ("идентификатор_оплаты");
 L   ALTER TABLE ONLY public."Оплата" DROP CONSTRAINT "Оплата_pkey";
       public                 postgres    false    233         {           2606    18135    Отель Отель_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Отель"
    ADD CONSTRAINT "Отель_pkey" PRIMARY KEY ("код_филиала");
 H   ALTER TABLE ONLY public."Отель" DROP CONSTRAINT "Отель_pkey";
       public                 postgres    false    218         �           2606    18201 *   Постоялец Постоялец_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Постоялец"
    ADD CONSTRAINT "Постоялец_pkey" PRIMARY KEY ("серия_и_номер");
 X   ALTER TABLE ONLY public."Постоялец" DROP CONSTRAINT "Постоялец_pkey";
       public                 postgres    false    229         �           2606    18177 *   Сотрудник Сотрудник_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_pkey" PRIMARY KEY ("табельный_номер");
 X   ALTER TABLE ONLY public."Сотрудник" DROP CONSTRAINT "Сотрудник_pkey";
       public                 postgres    false    226         �           2606    18269 *   Стоимость Стоимость_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Стоимость"
    ADD CONSTRAINT "Стоимость_pkey" PRIMARY KEY ("идентификатор_стоимости");
 X   ALTER TABLE ONLY public."Стоимость" DROP CONSTRAINT "Стоимость_pkey";
       public                 postgres    false    238         }           2606    18143 0   Тип_комнаты Тип_комнаты_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Тип_комнаты"
    ADD CONSTRAINT "Тип_комнаты_pkey" PRIMARY KEY ("идентификатор_типа_комнаты");
 ^   ALTER TABLE ONLY public."Тип_комнаты" DROP CONSTRAINT "Тип_комнаты_pkey";
       public                 postgres    false    220         �           2606    18246    Уборка Уборка_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Уборка"
    ADD CONSTRAINT "Уборка_pkey" PRIMARY KEY ("идентификатор_уборки");
 L   ALTER TABLE ONLY public."Уборка" DROP CONSTRAINT "Уборка_pkey";
       public                 postgres    false    235         �           2606    18261 &   Удобства Удобства_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Удобства"
    ADD CONSTRAINT "Удобства_pkey" PRIMARY KEY ("название");
 T   ALTER TABLE ONLY public."Удобства" DROP CONSTRAINT "Удобства_pkey";
       public                 postgres    false    236         �           2606    18282    Цена Цена_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public."Цена"
    ADD CONSTRAINT "Цена_pkey" PRIMARY KEY ("идентификатор_цены");
 D   ALTER TABLE ONLY public."Цена" DROP CONSTRAINT "Цена_pkey";
       public                 postgres    false    240         �           2606    18297 I   Акция Акция_идентификатор_типа_комна_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."Акция"
    ADD CONSTRAINT "Акция_идентификатор_типа_комна_fkey" FOREIGN KEY ("идентификатор_типа_комнаты") REFERENCES public."Тип_комнаты"("идентификатор_типа_комнаты");
 w   ALTER TABLE ONLY public."Акция" DROP CONSTRAINT "Акция_идентификатор_типа_комна_fkey";
       public               postgres    false    220    242    4733         �           2606    18187 N   Договор Договор_идентификатор_должност_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."Договор"
    ADD CONSTRAINT "Договор_идентификатор_должност_fkey" FOREIGN KEY ("идентификатор_должности") REFERENCES public."Должность"("идентификатор_должности");
 |   ALTER TABLE ONLY public."Договор" DROP CONSTRAINT "Договор_идентификатор_должност_fkey";
       public               postgres    false    4737    228    224         �           2606    18192 @   Договор Договор_табельный_номер_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Договор"
    ADD CONSTRAINT "Договор_табельный_номер_fkey" FOREIGN KEY ("табельный_номер") REFERENCES public."Сотрудник"("табельный_номер");
 n   ALTER TABLE ONLY public."Договор" DROP CONSTRAINT "Договор_табельный_номер_fkey";
       public               postgres    false    228    226    4739         �           2606    18216 F   Заказ Заказ_идентификатор_договора_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."Заказ"
    ADD CONSTRAINT "Заказ_идентификатор_договора_fkey" FOREIGN KEY ("идентификатор_договора") REFERENCES public."Договор"("идентификатор_договора");
 t   ALTER TABLE ONLY public."Заказ" DROP CONSTRAINT "Заказ_идентификатор_договора_fkey";
       public               postgres    false    231    4741    228         �           2606    18211 D   Заказ Заказ_идентификатор_комнаты_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Заказ"
    ADD CONSTRAINT "Заказ_идентификатор_комнаты_fkey" FOREIGN KEY ("идентификатор_комнаты") REFERENCES public."Комната"("идентификатор_комнаты");
 r   ALTER TABLE ONLY public."Заказ" DROP CONSTRAINT "Заказ_идентификатор_комнаты_fkey";
       public               postgres    false    231    4735    222         �           2606    18221 3   Заказ Заказ_серия_и_номер_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Заказ"
    ADD CONSTRAINT "Заказ_серия_и_номер_fkey" FOREIGN KEY ("серия_и_номер") REFERENCES public."Постоялец"("серия_и_номер");
 a   ALTER TABLE ONLY public."Заказ" DROP CONSTRAINT "Заказ_серия_и_номер_fkey";
       public               postgres    false    231    229    4743         �           2606    18157 M   Комната Комната_идентификатор_типа_ком_fkey    FK CONSTRAINT     !  ALTER TABLE ONLY public."Комната"
    ADD CONSTRAINT "Комната_идентификатор_типа_ком_fkey" FOREIGN KEY ("идентификатор_типа_комнаты") REFERENCES public."Тип_комнаты"("идентификатор_типа_комнаты");
 {   ALTER TABLE ONLY public."Комната" DROP CONSTRAINT "Комната_идентификатор_типа_ком_fkey";
       public               postgres    false    222    220    4733         �           2606    18152 8   Комната Комната_код_филиала_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Комната"
    ADD CONSTRAINT "Комната_код_филиала_fkey" FOREIGN KEY ("код_филиала") REFERENCES public."Отель"("код_филиала");
 f   ALTER TABLE ONLY public."Комната" DROP CONSTRAINT "Комната_код_филиала_fkey";
       public               postgres    false    4731    218    222         �           2606    18235 L   Оплата Оплата_идентификатор_бронирова_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."Оплата"
    ADD CONSTRAINT "Оплата_идентификатор_бронирова_fkey" FOREIGN KEY ("идентификатор_бронирования") REFERENCES public."Заказ"("идентификатор_бронирования");
 z   ALTER TABLE ONLY public."Оплата" DROP CONSTRAINT "Оплата_идентификатор_бронирова_fkey";
       public               postgres    false    233    231    4745         �           2606    18270 ;   Стоимость Стоимость_название_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Стоимость"
    ADD CONSTRAINT "Стоимость_название_fkey" FOREIGN KEY ("название") REFERENCES public."Удобства"("название");
 i   ALTER TABLE ONLY public."Стоимость" DROP CONSTRAINT "Стоимость_название_fkey";
       public               postgres    false    236    238    4751         �           2606    18305 R   Тип_комнаты Тип_комнаты_название_удобства_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Тип_комнаты"
    ADD CONSTRAINT "Тип_комнаты_название_удобства_fkey" FOREIGN KEY ("название_удобства") REFERENCES public."Удобства"("название") NOT VALID;
 �   ALTER TABLE ONLY public."Тип_комнаты" DROP CONSTRAINT "Тип_комнаты_название_удобства_fkey";
       public               postgres    false    220    4751    236         �           2606    18252 J   Уборка Уборка_идентификатор_договора_fkey    FK CONSTRAINT     	  ALTER TABLE ONLY public."Уборка"
    ADD CONSTRAINT "Уборка_идентификатор_договора_fkey" FOREIGN KEY ("идентификатор_договора") REFERENCES public."Договор"("идентификатор_договора");
 x   ALTER TABLE ONLY public."Уборка" DROP CONSTRAINT "Уборка_идентификатор_договора_fkey";
       public               postgres    false    4741    235    228         �           2606    18247 H   Уборка Уборка_идентификатор_комнаты_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."Уборка"
    ADD CONSTRAINT "Уборка_идентификатор_комнаты_fkey" FOREIGN KEY ("идентификатор_комнаты") REFERENCES public."Комната"("идентификатор_комнаты");
 v   ALTER TABLE ONLY public."Уборка" DROP CONSTRAINT "Уборка_идентификатор_комнаты_fkey";
       public               postgres    false    4735    222    235         �           2606    18283 G   Цена Цена_идентификатор_типа_комнат_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."Цена"
    ADD CONSTRAINT "Цена_идентификатор_типа_комнат_fkey" FOREIGN KEY ("идентификатор_типа_комнаты") REFERENCES public."Тип_комнаты"("идентификатор_типа_комнаты");
 u   ALTER TABLE ONLY public."Цена" DROP CONSTRAINT "Цена_идентификатор_типа_комнат_fkey";
       public               postgres    false    240    4733    220                                                                                                                                                                                                                                                                                                                                                                                                                                         4942.dat                                                                                            0000600 0004000 0002000 00000220776 14771407746 0014313 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Долгосрочное проживание	15	2023-03-15	2023-05-15	11
2	Зимний отдых	40	2023-06-01	2023-08-31	3
3	Последняя минута	20	2023-03-15	2023-05-15	4
4	Серебряная Весеннее предложение	50	2023-09-01	2023-10-31	13
5	Эксклюзивная Летняя скидка	45	2023-08-12	2023-08-28	6
6	Новогодний спецпредлог	20	2023-04-18	2023-05-08	12
7	Бизнес-предложение	40	2023-09-01	2023-10-31	1
8	Семейная скидка	20	2023-09-01	2023-10-31	1
9	Эксклюзивная Весеннее предложение	10	2023-03-15	2023-05-15	4
10	Золотая Летняя скидка	5	2023-03-29	2023-04-10	12
11	Серебряная Осенние каникулы	15	2023-03-15	2023-05-15	3
12	Летняя скидка	10	2023-06-21	2023-07-17	20
13	Весеннее предложение	40	2023-03-15	2023-05-15	14
14	Горячая Романтический уикенд	20	2023-09-01	2023-10-31	10
15	Семейная скидка	35	2023-06-01	2023-08-31	11
16	Долгосрочное проживание	30	2023-09-01	2023-10-31	4
17	Золотая Долгосрочное проживание	45	2023-03-15	2023-05-15	2
18	Семейная скидка	40	2023-12-01	2023-12-31	17
19	Зимний отдых	20	2023-06-01	2023-08-31	7
20	Золотая Зимний отдых	30	2023-12-01	2023-12-31	11
21	Горячая Семейная скидка	20	2023-06-01	2023-08-31	18
22	Золотая Новогодний спецпредлог	35	2023-06-01	2023-08-31	11
23	Скидка для постоянных клиентов	10	2023-09-01	2023-10-31	3
24	Осенние каникулы	10	2023-06-01	2023-08-31	5
25	Осенние каникулы	10	2023-03-15	2023-05-15	16
26	Летняя скидка	35	2023-03-15	2023-05-15	18
27	Весеннее предложение	35	2023-01-03	2023-01-24	1
28	Семейная скидка	10	2023-09-01	2023-10-31	15
29	Семейная скидка	20	2023-02-11	2023-03-08	7
30	Осенние каникулы	25	2023-12-01	2023-12-31	14
31	Последняя минута	35	2023-05-29	2023-06-22	5
32	Раннее бронирование	25	2023-03-15	2023-05-15	9
33	Семейная скидка	10	2023-03-15	2023-05-15	13
34	Новогодний спецпредлог	15	2023-06-01	2023-08-31	4
35	Весеннее предложение	20	2023-05-23	2023-06-14	14
36	Последняя минута	45	2023-09-01	2023-10-31	4
37	Раннее бронирование	30	2023-09-24	2023-10-12	15
38	Новогодний спецпредлог	15	2023-09-01	2023-10-31	4
39	Долгосрочное проживание	10	2023-09-01	2023-10-31	11
40	Раннее бронирование	20	2023-03-15	2023-05-15	9
41	Серебряная Семейная скидка	40	2023-03-15	2023-05-15	18
42	Новогодний спецпредлог	50	2023-03-15	2023-05-15	7
43	Семейная скидка	50	2023-07-10	2023-08-05	8
44	Новогодний спецпредлог	30	2023-01-29	2023-02-24	18
45	Летняя скидка	15	2023-12-01	2023-12-31	18
46	Серебряная Бизнес-предложение	40	2023-09-01	2023-10-31	17
47	Летняя скидка	5	2023-09-06	2023-09-23	16
48	Семейная скидка	5	2023-09-01	2023-10-31	7
49	Специальная Зимний отдых	15	2023-03-15	2023-05-15	8
50	Зимний отдых	15	2023-09-01	2023-10-31	16
51	Серебряная Весеннее предложение	45	2023-12-01	2023-12-31	5
52	Зимний отдых	35	2023-06-01	2023-08-31	7
53	Бизнес-предложение	30	2023-09-01	2023-10-31	3
54	Новогодний спецпредлог	25	2023-03-15	2023-05-15	20
55	Золотая Зимний отдых	30	2023-12-01	2023-12-31	20
56	Раннее бронирование	15	2023-08-12	2023-09-07	5
57	Осенние каникулы	10	2023-03-15	2023-05-15	3
58	Зимний отдых	20	2023-06-01	2023-08-31	8
59	Эксклюзивная Последняя минута	15	2023-12-01	2023-12-31	2
60	Раннее бронирование	45	2023-06-01	2023-08-31	12
61	Зимний отдых	20	2023-04-24	2023-05-21	5
62	Специальная Романтический уикенд	40	2023-12-01	2023-12-31	4
63	Золотая Последняя минута	15	2023-04-23	2023-05-13	10
64	Бизнес-предложение	40	2023-06-01	2023-08-31	13
65	Летняя скидка	20	2023-09-01	2023-10-31	2
66	Золотая Весеннее предложение	35	2023-08-03	2023-08-25	6
67	Летняя скидка	30	2023-03-15	2023-05-15	9
68	Весеннее предложение	5	2023-09-01	2023-10-31	10
69	Горячая Последняя минута	45	2023-12-01	2023-12-31	19
70	Зимний отдых	45	2023-03-15	2023-05-15	12
71	Долгосрочное проживание	20	2023-12-01	2023-12-31	4
72	Последняя минута	45	2023-06-01	2023-08-31	16
73	Золотая Долгосрочное проживание	5	2023-09-01	2023-10-31	15
74	Зимний отдых	15	2023-03-15	2023-05-15	7
75	Последняя минута	30	2023-12-01	2023-12-31	14
76	Романтический уикенд	5	2023-09-01	2023-10-31	14
77	Осенние каникулы	40	2023-06-01	2023-08-31	8
78	Раннее бронирование	20	2023-03-15	2023-05-15	18
79	Скидка для постоянных клиентов	5	2023-03-09	2023-03-16	9
80	Зимний отдых	20	2023-07-25	2023-08-06	1
81	Последняя минута	50	2023-06-01	2023-08-31	6
82	Эксклюзивная Долгосрочное проживание	45	2023-12-01	2023-12-31	12
83	Серебряная Осенние каникулы	45	2023-05-26	2023-06-05	19
84	Эксклюзивная Бизнес-предложение	20	2023-09-01	2023-10-31	5
85	Золотая Новогодний спецпредлог	45	2023-03-15	2023-05-15	19
86	Раннее бронирование	20	2023-06-01	2023-08-31	4
87	Зимний отдых	5	2023-12-01	2023-12-31	2
88	Золотая Скидка для постоянных клиентов	35	2023-12-01	2023-12-31	13
89	Семейная скидка	20	2023-10-21	2023-10-31	2
90	Эксклюзивная Раннее бронирование	20	2023-05-21	2023-05-29	17
91	Серебряная Скидка для постоянных клиентов	50	2023-09-01	2023-10-31	13
92	Горячая Летняя скидка	15	2023-06-01	2023-08-31	4
93	Долгосрочное проживание	5	2023-12-01	2023-12-26	7
94	Семейная скидка	15	2023-06-01	2023-08-31	3
95	Золотая Раннее бронирование	20	2023-06-01	2023-08-31	14
96	Серебряная Весеннее предложение	35	2023-12-01	2023-12-31	12
97	Скидка для постоянных клиентов	15	2023-06-01	2023-08-31	10
98	Романтический уикенд	30	2023-12-01	2023-12-31	6
99	Летняя скидка	10	2023-12-01	2023-12-31	18
100	Раннее бронирование	50	2023-09-01	2023-10-31	11
101	Серебряная Последняя минута	5	2023-12-01	2023-12-31	16
102	Специальная Весеннее предложение	10	2023-09-01	2023-10-31	18
103	Золотая Летняя скидка	10	2023-06-01	2023-08-31	6
104	Зимний отдых	45	2023-12-01	2023-12-31	7
105	Бизнес-предложение	25	2023-06-01	2023-08-31	10
106	Бизнес-предложение	35	2023-12-01	2023-12-31	5
107	Последняя минута	10	2023-06-01	2023-08-31	9
108	Раннее бронирование	15	2023-11-11	2023-11-27	14
109	Летняя скидка	40	2023-09-04	2023-09-16	10
110	Последняя минута	45	2023-12-01	2023-12-31	10
111	Серебряная Новогодний спецпредлог	25	2023-06-01	2023-08-31	20
112	Скидка для постоянных клиентов	35	2023-03-15	2023-05-15	19
113	Новогодний спецпредлог	50	2023-12-01	2023-12-31	6
114	Романтический уикенд	15	2023-09-01	2023-10-31	14
115	Весеннее предложение	45	2023-06-01	2023-08-31	12
116	Последняя минута	45	2023-12-01	2023-12-31	4
117	Зимний отдых	50	2023-09-10	2023-10-08	13
118	Эксклюзивная Бизнес-предложение	30	2023-06-01	2023-08-31	9
119	Золотая Летняя скидка	30	2023-06-01	2023-08-31	7
120	Последняя минута	40	2023-09-01	2023-10-31	11
121	Горячая Зимний отдых	30	2023-12-01	2023-12-31	7
122	Золотая Новогодний спецпредлог	20	2023-06-01	2023-08-31	3
123	Семейная скидка	30	2023-09-01	2023-10-31	4
124	Осенние каникулы	35	2023-03-15	2023-05-15	5
125	Скидка для постоянных клиентов	15	2023-03-15	2023-05-15	5
126	Скидка для постоянных клиентов	30	2023-03-15	2023-05-15	1
127	Последняя минута	30	2023-11-01	2023-11-28	6
128	Долгосрочное проживание	25	2023-03-15	2023-05-15	5
129	Зимний отдых	40	2023-06-29	2023-07-19	2
130	Долгосрочное проживание	35	2023-10-22	2023-10-31	3
131	Долгосрочное проживание	30	2023-11-14	2023-12-12	13
132	Бизнес-предложение	25	2023-03-15	2023-05-15	11
133	Бизнес-предложение	20	2023-12-01	2023-12-31	18
134	Осенние каникулы	20	2023-01-21	2023-02-18	12
135	Долгосрочное проживание	20	2023-12-01	2023-12-31	20
136	Золотая Бизнес-предложение	30	2023-01-18	2023-02-02	7
137	Новогодний спецпредлог	15	2023-12-01	2023-12-31	9
138	Зимний отдых	45	2023-12-01	2023-12-31	3
139	Весеннее предложение	30	2023-06-01	2023-08-31	5
140	Последняя минута	15	2023-03-17	2023-04-08	20
141	Горячая Летняя скидка	30	2023-04-01	2023-04-16	18
142	Скидка для постоянных клиентов	35	2023-09-26	2023-10-24	11
143	Весеннее предложение	15	2023-01-01	2023-01-28	16
144	Золотая Романтический уикенд	30	2023-12-01	2023-12-31	4
145	Зимний отдых	25	2023-03-15	2023-05-15	15
146	Последняя минута	35	2023-11-22	2023-12-07	3
147	Зимний отдых	30	2023-11-17	2023-11-27	15
148	Горячая Скидка для постоянных клиентов	20	2023-09-01	2023-10-31	20
149	Последняя минута	35	2023-09-01	2023-10-31	4
150	Весеннее предложение	25	2023-09-01	2023-10-31	10
151	Серебряная Романтический уикенд	40	2023-06-01	2023-08-31	6
152	Специальная Новогодний спецпредлог	40	2023-06-01	2023-08-31	3
153	Горячая Раннее бронирование	10	2023-06-01	2023-08-31	1
154	Романтический уикенд	30	2023-12-01	2023-12-31	7
155	Последняя минута	50	2023-12-01	2023-12-31	16
156	Последняя минута	35	2023-12-01	2023-12-31	8
157	Специальная Бизнес-предложение	25	2023-09-01	2023-10-31	16
158	Долгосрочное проживание	10	2023-01-27	2023-02-08	13
159	Раннее бронирование	25	2023-12-01	2023-12-31	2
160	Семейная скидка	40	2023-04-05	2023-04-27	10
161	Последняя минута	45	2023-03-15	2023-05-15	16
162	Горячая Скидка для постоянных клиентов	15	2023-12-01	2023-12-31	18
163	Зимний отдых	45	2023-01-17	2023-02-12	10
164	Летняя скидка	15	2023-09-01	2023-10-31	9
165	Осенние каникулы	45	2023-09-01	2023-10-31	18
166	Осенние каникулы	30	2023-03-15	2023-05-15	17
167	Золотая Новогодний спецпредлог	15	2023-12-01	2023-12-31	11
168	Специальная Семейная скидка	40	2023-05-09	2023-06-01	10
169	Эксклюзивная Осенние каникулы	45	2023-09-01	2023-10-31	13
170	Долгосрочное проживание	20	2023-06-01	2023-08-31	19
171	Летняя скидка	25	2023-09-01	2023-10-31	11
172	Романтический уикенд	20	2023-03-15	2023-05-15	7
173	Специальная Раннее бронирование	20	2023-12-01	2023-12-31	4
174	Романтический уикенд	40	2023-05-02	2023-05-30	1
175	Скидка для постоянных клиентов	20	2023-03-15	2023-05-15	17
176	Эксклюзивная Весеннее предложение	5	2023-09-01	2023-10-31	9
177	Скидка для постоянных клиентов	35	2023-03-15	2023-05-15	1
178	Весеннее предложение	40	2023-03-15	2023-05-15	18
179	Горячая Весеннее предложение	45	2023-06-01	2023-08-31	11
180	Серебряная Долгосрочное проживание	50	2023-03-15	2023-05-15	15
181	Летняя скидка	10	2023-06-01	2023-08-31	15
182	Летняя скидка	20	2023-04-21	2023-04-30	2
183	Горячая Последняя минута	15	2023-12-01	2023-12-31	2
184	Последняя минута	45	2023-10-27	2023-11-21	12
185	Осенние каникулы	45	2023-06-01	2023-08-31	9
186	Зимний отдых	20	2023-06-01	2023-08-31	2
187	Новогодний спецпредлог	15	2023-06-01	2023-08-31	6
188	Раннее бронирование	45	2023-12-01	2023-12-31	15
189	Скидка для постоянных клиентов	40	2023-06-01	2023-08-31	18
190	Последняя минута	30	2023-06-01	2023-08-31	8
191	Романтический уикенд	5	2023-07-15	2023-08-09	16
192	Долгосрочное проживание	40	2023-03-15	2023-05-15	9
193	Новогодний спецпредлог	35	2023-03-15	2023-05-15	6
194	Семейная скидка	45	2023-03-15	2023-05-15	20
195	Горячая Осенние каникулы	20	2023-12-01	2023-12-31	4
196	Специальная Новогодний спецпредлог	35	2023-06-01	2023-08-31	6
197	Романтический уикенд	40	2023-03-15	2023-05-15	11
198	Скидка для постоянных клиентов	15	2023-09-01	2023-10-31	10
199	Зимний отдых	20	2023-06-01	2023-08-31	8
200	Золотая Новогодний спецпредлог	25	2023-08-03	2023-08-18	8
201	Специальная Летняя скидка	40	2023-03-15	2023-05-15	11
202	Горячая Романтический уикенд	35	2023-08-15	2023-08-28	17
203	Эксклюзивная Скидка для постоянных клиентов	10	2023-12-01	2023-12-31	15
204	Серебряная Раннее бронирование	35	2023-06-01	2023-08-31	6
205	Зимний отдых	10	2023-09-01	2023-10-31	5
206	Весеннее предложение	15	2023-06-01	2023-08-31	5
207	Новогодний спецпредлог	25	2023-09-01	2023-10-31	4
208	Раннее бронирование	30	2023-03-15	2023-05-15	11
209	Романтический уикенд	35	2023-12-01	2023-12-31	17
210	Раннее бронирование	15	2023-09-01	2023-10-31	9
211	Раннее бронирование	25	2023-03-15	2023-05-15	10
212	Осенние каникулы	20	2023-09-01	2023-10-31	10
213	Эксклюзивная Бизнес-предложение	30	2023-06-01	2023-08-31	8
214	Долгосрочное проживание	25	2023-03-15	2023-05-15	7
215	Специальная Бизнес-предложение	50	2023-09-01	2023-10-31	7
216	Бизнес-предложение	30	2023-03-15	2023-05-15	12
217	Романтический уикенд	10	2023-12-01	2023-12-31	16
218	Последняя минута	25	2023-08-16	2023-09-01	1
219	Эксклюзивная Семейная скидка	10	2023-09-01	2023-10-31	14
220	Осенние каникулы	20	2023-09-01	2023-10-31	6
221	Горячая Семейная скидка	15	2023-09-01	2023-10-31	11
222	Последняя минута	45	2023-09-01	2023-10-31	20
223	Последняя минута	25	2023-03-15	2023-05-15	6
224	Золотая Скидка для постоянных клиентов	30	2023-12-01	2023-12-31	14
225	Горячая Раннее бронирование	30	2023-06-01	2023-08-31	16
226	Зимний отдых	10	2023-12-01	2023-12-31	18
227	Серебряная Весеннее предложение	40	2023-06-01	2023-08-31	1
228	Семейная скидка	50	2023-03-29	2023-04-09	19
229	Летняя скидка	15	2023-12-01	2023-12-31	7
230	Скидка для постоянных клиентов	5	2023-03-15	2023-05-15	10
231	Бизнес-предложение	25	2023-03-15	2023-05-15	2
232	Горячая Долгосрочное проживание	30	2023-09-01	2023-10-31	10
233	Скидка для постоянных клиентов	20	2023-05-31	2023-06-28	14
234	Осенние каникулы	40	2023-09-01	2023-10-31	8
235	Романтический уикенд	50	2023-08-16	2023-08-26	10
236	Весеннее предложение	5	2023-06-01	2023-08-31	19
237	Летняя скидка	15	2023-03-15	2023-05-15	7
238	Бизнес-предложение	10	2023-09-01	2023-10-31	15
239	Зимний отдых	5	2023-06-01	2023-08-31	19
240	Новогодний спецпредлог	20	2023-06-01	2023-08-31	8
241	Весеннее предложение	25	2023-06-01	2023-08-31	3
242	Золотая Зимний отдых	25	2023-12-01	2023-12-31	16
243	Долгосрочное проживание	30	2023-09-01	2023-10-31	10
244	Осенние каникулы	30	2023-06-01	2023-08-31	14
245	Летняя скидка	40	2023-12-01	2023-12-31	15
246	Долгосрочное проживание	20	2023-09-22	2023-10-15	9
247	Бизнес-предложение	25	2023-09-23	2023-10-19	14
248	Серебряная Бизнес-предложение	10	2023-06-01	2023-08-31	6
249	Горячая Последняя минута	5	2023-03-15	2023-05-15	17
250	Романтический уикенд	15	2023-06-01	2023-08-31	1
251	Скидка для постоянных клиентов	10	2023-06-01	2023-08-31	11
252	Последняя минута	30	2023-09-01	2023-10-31	13
253	Скидка для постоянных клиентов	20	2023-02-24	2023-03-13	8
254	Серебряная Летняя скидка	45	2023-03-15	2023-05-15	3
255	Летняя скидка	35	2023-11-10	2023-12-03	5
256	Романтический уикенд	40	2023-07-25	2023-08-05	10
257	Золотая Романтический уикенд	50	2023-09-01	2023-10-31	13
258	Романтический уикенд	25	2023-06-01	2023-08-31	2
259	Летняя скидка	5	2023-12-01	2023-12-31	19
260	Новогодний спецпредлог	45	2023-09-01	2023-10-31	9
261	Долгосрочное проживание	45	2023-06-01	2023-08-31	10
262	Романтический уикенд	20	2023-02-09	2023-03-07	8
263	Последняя минута	35	2023-06-01	2023-08-31	1
264	Раннее бронирование	50	2023-06-01	2023-08-31	2
265	Специальная Осенние каникулы	20	2023-12-01	2023-12-31	18
266	Эксклюзивная Романтический уикенд	30	2023-06-01	2023-08-31	11
267	Золотая Семейная скидка	30	2023-12-01	2023-12-31	11
268	Горячая Зимний отдых	15	2023-09-01	2023-10-31	14
269	Эксклюзивная Зимний отдых	30	2023-08-08	2023-08-17	4
270	Романтический уикенд	5	2023-12-01	2023-12-31	11
271	Романтический уикенд	35	2023-06-01	2023-08-31	15
272	Специальная Последняя минута	40	2023-03-02	2023-03-09	4
273	Бизнес-предложение	40	2023-06-01	2023-08-31	2
274	Зимний отдых	50	2023-03-15	2023-05-15	6
275	Бизнес-предложение	15	2023-03-15	2023-05-15	17
276	Горячая Осенние каникулы	40	2023-12-01	2023-12-31	19
277	Новогодний спецпредлог	40	2023-03-15	2023-05-15	10
278	Эксклюзивная Летняя скидка	45	2023-03-15	2023-05-15	4
279	Последняя минута	10	2023-06-01	2023-08-31	6
280	Зимний отдых	5	2023-08-26	2023-09-20	13
281	Весеннее предложение	50	2023-12-01	2023-12-31	3
282	Горячая Бизнес-предложение	20	2023-03-15	2023-05-15	13
283	Бизнес-предложение	20	2023-12-01	2023-12-31	8
284	Летняя скидка	50	2023-12-01	2023-12-31	14
285	Последняя минута	5	2023-09-01	2023-10-31	6
286	Скидка для постоянных клиентов	35	2023-06-01	2023-08-31	8
287	Горячая Бизнес-предложение	10	2023-09-01	2023-10-31	18
288	Семейная скидка	20	2023-06-26	2023-07-06	17
289	Романтический уикенд	25	2023-12-01	2023-12-31	4
290	Серебряная Раннее бронирование	15	2023-09-01	2023-10-31	12
291	Скидка для постоянных клиентов	30	2023-03-15	2023-05-15	13
292	Семейная скидка	25	2023-09-01	2023-10-31	9
293	Семейная скидка	35	2023-12-01	2023-12-31	5
294	Золотая Скидка для постоянных клиентов	40	2023-06-01	2023-08-31	12
295	Бизнес-предложение	10	2023-09-01	2023-10-31	19
296	Серебряная Семейная скидка	25	2023-12-01	2023-12-31	19
297	Весеннее предложение	50	2023-12-01	2023-12-31	5
298	Специальная Летняя скидка	45	2023-06-01	2023-08-31	13
299	Летняя скидка	50	2023-03-15	2023-05-15	19
300	Романтический уикенд	45	2023-12-01	2023-12-31	3
301	Эксклюзивная Бизнес-предложение	10	2023-09-01	2023-10-31	15
302	Семейная скидка	40	2023-09-01	2023-10-31	6
303	Горячая Осенние каникулы	10	2023-06-01	2023-08-31	5
304	Новогодний спецпредлог	35	2023-12-01	2023-12-31	14
305	Романтический уикенд	5	2023-12-01	2023-12-31	14
306	Серебряная Скидка для постоянных клиентов	20	2023-06-01	2023-08-31	17
307	Скидка для постоянных клиентов	45	2023-03-15	2023-05-15	17
308	Раннее бронирование	50	2023-12-01	2023-12-31	10
309	Эксклюзивная Семейная скидка	5	2023-03-15	2023-05-15	15
310	Эксклюзивная Скидка для постоянных клиентов	10	2023-12-01	2023-12-31	14
311	Осенние каникулы	40	2023-06-01	2023-08-31	8
312	Эксклюзивная Весеннее предложение	25	2023-09-01	2023-10-31	12
313	Специальная Последняя минута	50	2023-11-06	2023-11-29	10
314	Летняя скидка	10	2023-09-01	2023-10-31	4
315	Осенние каникулы	25	2023-09-01	2023-10-31	19
316	Романтический уикенд	20	2023-09-01	2023-10-31	9
317	Горячая Весеннее предложение	40	2023-06-01	2023-08-31	12
318	Осенние каникулы	10	2023-12-01	2023-12-31	10
319	Последняя минута	40	2023-12-01	2023-12-31	20
320	Скидка для постоянных клиентов	10	2023-06-01	2023-08-31	12
321	Последняя минута	30	2023-01-01	2023-01-12	11
322	Зимний отдых	40	2023-12-01	2023-12-31	20
323	Последняя минута	20	2023-12-01	2023-12-31	12
324	Долгосрочное проживание	10	2023-03-15	2023-05-15	4
325	Горячая Долгосрочное проживание	35	2023-06-01	2023-08-31	10
326	Специальная Долгосрочное проживание	40	2023-09-01	2023-10-31	11
327	Специальная Раннее бронирование	10	2023-06-01	2023-08-31	5
328	Новогодний спецпредлог	40	2023-09-01	2023-10-31	17
329	Серебряная Зимний отдых	10	2023-06-01	2023-08-31	4
330	Летняя скидка	35	2023-12-01	2023-12-31	20
331	Летняя скидка	20	2023-06-01	2023-08-31	4
332	Серебряная Весеннее предложение	35	2023-08-19	2023-09-07	6
333	Эксклюзивная Скидка для постоянных клиентов	35	2023-06-01	2023-08-31	12
334	Горячая Романтический уикенд	35	2023-09-01	2023-10-31	1
335	Летняя скидка	30	2023-01-02	2023-01-20	17
336	Золотая Раннее бронирование	20	2023-06-01	2023-08-31	18
337	Летняя скидка	40	2023-06-11	2023-07-01	1
338	Летняя скидка	50	2023-06-01	2023-08-31	14
339	Последняя минута	30	2023-06-01	2023-08-31	11
340	Эксклюзивная Романтический уикенд	10	2023-12-01	2023-12-31	6
341	Осенние каникулы	45	2023-03-12	2023-04-03	4
342	Осенние каникулы	20	2023-03-17	2023-03-25	18
343	Специальная Скидка для постоянных клиентов	45	2023-09-01	2023-10-31	9
344	Летняя скидка	50	2023-10-10	2023-10-30	12
345	Специальная Весеннее предложение	45	2023-03-15	2023-05-15	12
346	Золотая Раннее бронирование	35	2023-10-17	2023-10-27	8
347	Горячая Новогодний спецпредлог	50	2023-12-01	2023-12-31	4
348	Семейная скидка	10	2023-03-15	2023-05-15	17
349	Бизнес-предложение	30	2023-12-01	2023-12-31	12
350	Летняя скидка	45	2023-03-15	2023-05-15	15
351	Последняя минута	30	2023-06-01	2023-08-31	6
352	Осенние каникулы	40	2023-09-01	2023-10-31	2
353	Бизнес-предложение	50	2023-09-17	2023-10-09	11
354	Долгосрочное проживание	45	2023-06-01	2023-08-31	12
355	Романтический уикенд	35	2023-10-08	2023-10-20	6
356	Специальная Раннее бронирование	35	2023-12-01	2023-12-31	6
357	Романтический уикенд	25	2023-07-05	2023-07-15	4
358	Романтический уикенд	25	2023-09-01	2023-10-31	4
359	Весеннее предложение	25	2023-09-01	2023-10-31	2
360	Романтический уикенд	5	2023-12-01	2023-12-31	7
361	Последняя минута	40	2023-06-01	2023-08-31	16
362	Осенние каникулы	20	2023-12-01	2023-12-31	5
363	Зимний отдых	20	2023-05-13	2023-05-28	12
364	Долгосрочное проживание	30	2023-06-01	2023-08-31	7
365	Новогодний спецпредлог	50	2023-08-21	2023-09-09	15
366	Горячая Новогодний спецпредлог	25	2023-12-01	2023-12-31	6
367	Бизнес-предложение	20	2023-03-15	2023-05-15	19
368	Скидка для постоянных клиентов	10	2023-06-01	2023-08-31	15
369	Скидка для постоянных клиентов	35	2023-06-01	2023-08-31	16
370	Романтический уикенд	50	2023-12-01	2023-12-31	9
371	Долгосрочное проживание	35	2023-09-01	2023-10-31	18
372	Последняя минута	15	2023-02-08	2023-03-02	14
373	Весеннее предложение	10	2023-06-16	2023-07-04	12
374	Новогодний спецпредлог	10	2023-12-01	2023-12-31	13
375	Последняя минута	50	2023-01-25	2023-02-11	20
376	Эксклюзивная Последняя минута	10	2023-03-06	2023-04-01	5
377	Бизнес-предложение	10	2023-06-01	2023-08-31	12
378	Романтический уикенд	35	2023-06-01	2023-08-31	20
379	Специальная Раннее бронирование	35	2023-03-15	2023-05-15	18
380	Специальная Скидка для постоянных клиентов	45	2023-06-01	2023-08-31	7
381	Раннее бронирование	35	2023-06-01	2023-08-31	2
382	Золотая Летняя скидка	30	2023-09-21	2023-10-16	7
383	Романтический уикенд	35	2023-03-15	2023-05-15	19
384	Горячая Летняя скидка	30	2023-12-01	2023-12-31	12
385	Специальная Зимний отдых	45	2023-11-21	2023-12-17	12
386	Новогодний спецпредлог	10	2023-09-01	2023-10-31	19
387	Семейная скидка	40	2023-12-01	2023-12-31	13
388	Новогодний спецпредлог	5	2023-01-13	2023-02-05	5
389	Золотая Раннее бронирование	10	2023-04-21	2023-05-09	16
390	Зимний отдых	25	2023-12-01	2023-12-31	2
391	Горячая Новогодний спецпредлог	15	2023-11-20	2023-12-13	6
392	Осенние каникулы	20	2023-10-08	2023-11-01	14
393	Специальная Бизнес-предложение	40	2023-12-01	2023-12-31	2
394	Раннее бронирование	40	2023-06-01	2023-08-31	14
395	Осенние каникулы	25	2023-12-01	2023-12-31	18
396	Раннее бронирование	40	2023-10-08	2023-10-22	11
397	Бизнес-предложение	40	2023-03-15	2023-05-15	5
398	Горячая Зимний отдых	20	2023-09-01	2023-10-31	6
399	Серебряная Новогодний спецпредлог	15	2023-12-01	2023-12-31	11
400	Последняя минута	10	2023-12-01	2023-12-31	19
401	Эксклюзивная Последняя минута	15	2023-06-01	2023-08-31	1
402	Эксклюзивная Долгосрочное проживание	50	2023-08-11	2023-08-30	16
403	Горячая Осенние каникулы	35	2023-09-01	2023-10-31	7
404	Новогодний спецпредлог	50	2023-06-27	2023-07-10	14
405	Романтический уикенд	10	2023-12-01	2023-12-31	15
406	Специальная Долгосрочное проживание	40	2023-03-15	2023-05-15	2
407	Романтический уикенд	30	2023-12-01	2023-12-31	12
408	Семейная скидка	25	2023-06-01	2023-08-31	13
409	Специальная Раннее бронирование	20	2023-12-01	2023-12-31	1
410	Раннее бронирование	45	2023-03-15	2023-05-15	11
411	Золотая Бизнес-предложение	30	2023-07-17	2023-08-04	18
412	Серебряная Весеннее предложение	5	2023-03-22	2023-04-19	4
413	Специальная Семейная скидка	40	2023-03-15	2023-05-15	4
414	Весеннее предложение	10	2023-06-01	2023-08-31	10
415	Последняя минута	15	2023-08-17	2023-09-02	1
416	Бизнес-предложение	15	2023-06-01	2023-08-31	16
417	Зимний отдых	35	2023-03-15	2023-05-15	4
418	Бизнес-предложение	45	2023-03-15	2023-05-15	1
419	Семейная скидка	35	2023-09-01	2023-10-31	2
420	Новогодний спецпредлог	40	2023-03-15	2023-05-15	11
421	Горячая Бизнес-предложение	5	2023-06-01	2023-08-31	6
422	Романтический уикенд	20	2023-09-22	2023-10-17	19
423	Летняя скидка	10	2023-09-01	2023-10-31	2
424	Золотая Романтический уикенд	50	2023-03-15	2023-05-15	13
425	Осенние каникулы	5	2023-12-01	2023-12-31	4
426	Горячая Весеннее предложение	30	2023-09-01	2023-10-31	2
427	Эксклюзивная Скидка для постоянных клиентов	10	2023-06-01	2023-08-31	7
428	Летняя скидка	25	2023-06-01	2023-08-31	10
429	Зимний отдых	5	2023-03-15	2023-05-15	6
430	Весеннее предложение	45	2023-09-01	2023-10-31	2
431	Долгосрочное проживание	40	2023-03-15	2023-05-15	6
432	Горячая Осенние каникулы	5	2023-12-01	2023-12-31	6
433	Горячая Долгосрочное проживание	25	2023-09-01	2023-10-31	16
434	Зимний отдых	10	2023-03-15	2023-05-15	12
435	Раннее бронирование	40	2023-03-15	2023-05-15	11
436	Серебряная Долгосрочное проживание	30	2023-03-15	2023-05-15	9
437	Горячая Осенние каникулы	35	2023-03-15	2023-05-15	7
438	Специальная Долгосрочное проживание	15	2023-06-01	2023-08-31	12
439	Долгосрочное проживание	15	2023-02-10	2023-02-27	9
440	Золотая Осенние каникулы	45	2023-09-01	2023-10-31	15
441	Бизнес-предложение	35	2023-12-01	2023-12-31	13
442	Бизнес-предложение	30	2023-03-15	2023-05-15	19
443	Горячая Последняя минута	5	2023-09-01	2023-10-31	1
444	Долгосрочное проживание	30	2023-06-01	2023-08-31	19
445	Золотая Романтический уикенд	20	2023-03-15	2023-05-15	9
446	Бизнес-предложение	45	2023-09-01	2023-10-31	15
447	Специальная Скидка для постоянных клиентов	20	2023-09-01	2023-10-31	17
448	Эксклюзивная Последняя минута	25	2023-06-01	2023-08-31	15
449	Осенние каникулы	35	2023-12-01	2023-12-31	15
450	Специальная Последняя минута	45	2023-03-15	2023-05-15	5
451	Весеннее предложение	15	2023-06-01	2023-08-31	8
452	Скидка для постоянных клиентов	15	2023-06-01	2023-08-31	7
453	Раннее бронирование	40	2023-06-01	2023-08-31	18
454	Весеннее предложение	25	2023-09-01	2023-10-31	1
455	Летняя скидка	20	2023-08-02	2023-08-17	15
456	Серебряная Зимний отдых	40	2023-06-01	2023-08-31	11
457	Последняя минута	10	2023-09-01	2023-10-31	13
458	Специальная Долгосрочное проживание	45	2023-03-15	2023-05-15	15
459	Летняя скидка	5	2023-12-01	2023-12-31	17
460	Летняя скидка	50	2023-09-01	2023-10-31	1
461	Бизнес-предложение	15	2023-12-01	2023-12-31	17
462	Зимний отдых	45	2023-06-05	2023-07-02	10
463	Последняя минута	5	2023-09-01	2023-10-31	1
464	Последняя минута	35	2023-06-01	2023-08-31	8
465	Семейная скидка	15	2023-03-16	2023-04-09	10
466	Романтический уикенд	15	2023-06-01	2023-08-31	4
467	Эксклюзивная Скидка для постоянных клиентов	10	2023-08-08	2023-09-04	2
468	Долгосрочное проживание	45	2023-05-28	2023-06-09	20
469	Золотая Зимний отдых	40	2023-06-01	2023-08-31	4
470	Зимний отдых	35	2023-01-14	2023-01-31	14
471	Скидка для постоянных клиентов	40	2023-05-14	2023-05-29	10
472	Специальная Скидка для постоянных клиентов	30	2023-03-22	2023-04-09	20
473	Специальная Последняя минута	15	2023-03-15	2023-05-15	9
474	Специальная Последняя минута	35	2023-07-25	2023-08-07	12
475	Раннее бронирование	35	2023-03-15	2023-05-15	19
476	Долгосрочное проживание	45	2023-12-01	2023-12-31	7
477	Летняя скидка	45	2023-03-15	2023-05-15	14
478	Зимний отдых	40	2023-09-01	2023-10-31	20
479	Долгосрочное проживание	10	2023-12-01	2023-12-31	3
480	Эксклюзивная Романтический уикенд	50	2023-12-01	2023-12-31	9
481	Зимний отдых	50	2023-09-01	2023-10-31	2
482	Золотая Раннее бронирование	40	2023-03-15	2023-05-15	4
483	Семейная скидка	35	2023-09-01	2023-10-31	19
484	Серебряная Летняя скидка	25	2023-09-01	2023-10-31	13
485	Весеннее предложение	25	2023-03-15	2023-05-15	10
486	Бизнес-предложение	5	2023-04-10	2023-04-17	3
487	Последняя минута	15	2023-06-01	2023-08-31	3
488	Скидка для постоянных клиентов	20	2023-03-15	2023-05-15	8
489	Семейная скидка	20	2023-12-01	2023-12-31	6
490	Золотая Романтический уикенд	10	2023-05-12	2023-05-29	9
491	Скидка для постоянных клиентов	35	2023-09-01	2023-10-31	11
492	Зимний отдых	25	2023-12-01	2023-12-31	18
493	Эксклюзивная Весеннее предложение	50	2023-12-01	2023-12-31	10
494	Последняя минута	35	2023-09-01	2023-10-31	5
495	Скидка для постоянных клиентов	45	2023-03-15	2023-05-15	15
496	Горячая Летняя скидка	5	2023-06-01	2023-08-31	19
497	Романтический уикенд	30	2023-03-15	2023-05-15	10
498	Семейная скидка	35	2023-07-12	2023-07-23	19
499	Эксклюзивная Летняя скидка	50	2023-03-15	2023-05-15	4
500	Долгосрочное проживание	20	2023-09-01	2023-10-31	11
501	Летняя скидка	45	2023-03-15	2023-05-15	19
502	Зимний отдых	20	2023-03-15	2023-05-15	19
503	Романтический уикенд	25	2023-12-01	2023-12-31	15
504	Летняя скидка	25	2023-06-01	2023-08-31	1
505	Серебряная Зимний отдых	45	2023-03-15	2023-05-15	10
506	Летняя скидка	45	2023-07-07	2023-07-28	2
507	Зимний отдых	15	2023-12-01	2023-12-31	8
508	Горячая Новогодний спецпредлог	45	2023-09-01	2023-10-31	19
509	Долгосрочное проживание	20	2023-12-01	2023-12-31	12
510	Летняя скидка	30	2023-09-01	2023-10-31	6
511	Золотая Бизнес-предложение	50	2023-09-01	2023-10-31	15
512	Эксклюзивная Зимний отдых	15	2023-03-15	2023-05-15	1
513	Бизнес-предложение	45	2023-03-15	2023-05-15	13
514	Золотая Раннее бронирование	5	2023-03-15	2023-05-15	14
515	Серебряная Осенние каникулы	20	2023-03-15	2023-05-15	19
516	Новогодний спецпредлог	40	2023-05-14	2023-06-10	8
517	Романтический уикенд	10	2023-03-15	2023-05-15	19
518	Осенние каникулы	10	2023-06-01	2023-08-31	11
519	Горячая Зимний отдых	5	2023-03-15	2023-05-15	9
520	Новогодний спецпредлог	35	2023-10-20	2023-10-28	6
521	Долгосрочное проживание	10	2023-03-15	2023-05-15	7
522	Новогодний спецпредлог	25	2023-06-01	2023-08-31	14
523	Специальная Весеннее предложение	20	2023-09-01	2023-10-31	2
524	Раннее бронирование	30	2023-08-08	2023-08-15	9
525	Осенние каникулы	10	2023-09-01	2023-10-31	7
526	Серебряная Весеннее предложение	10	2023-12-01	2023-12-31	10
527	Скидка для постоянных клиентов	25	2023-12-01	2023-12-31	13
528	Последняя минута	20	2023-12-01	2023-12-31	6
529	Серебряная Летняя скидка	10	2023-12-01	2023-12-31	7
530	Последняя минута	15	2023-03-15	2023-05-15	14
531	Летняя скидка	35	2023-08-15	2023-08-30	6
532	Раннее бронирование	40	2023-06-01	2023-08-31	11
533	Зимний отдых	20	2023-12-01	2023-12-31	7
534	Новогодний спецпредлог	15	2023-09-01	2023-10-31	4
535	Новогодний спецпредлог	15	2023-06-01	2023-08-31	10
536	Золотая Семейная скидка	30	2023-03-15	2023-05-15	8
537	Последняя минута	25	2023-09-01	2023-10-31	1
538	Бизнес-предложение	25	2023-09-01	2023-10-31	9
539	Летняя скидка	10	2023-09-01	2023-10-31	15
540	Летняя скидка	45	2023-03-15	2023-05-15	7
541	Золотая Семейная скидка	30	2023-12-01	2023-12-31	7
542	Специальная Скидка для постоянных клиентов	35	2023-09-01	2023-10-31	1
543	Долгосрочное проживание	25	2023-12-01	2023-12-31	20
544	Бизнес-предложение	45	2023-06-01	2023-08-31	15
545	Летняя скидка	5	2023-06-01	2023-08-31	9
546	Весеннее предложение	25	2023-03-15	2023-05-15	14
547	Бизнес-предложение	20	2023-06-01	2023-08-31	18
548	Весеннее предложение	35	2023-12-01	2023-12-31	17
549	Романтический уикенд	10	2023-06-01	2023-08-31	7
550	Осенние каникулы	35	2023-12-01	2023-12-31	3
551	Долгосрочное проживание	20	2023-09-01	2023-10-31	17
552	Эксклюзивная Бизнес-предложение	35	2023-12-01	2023-12-31	9
553	Последняя минута	25	2023-06-06	2023-06-22	18
554	Последняя минута	5	2023-07-13	2023-07-27	19
555	Летняя скидка	40	2023-06-01	2023-08-31	8
556	Новогодний спецпредлог	15	2023-06-01	2023-08-31	14
557	Летняя скидка	30	2023-03-15	2023-05-15	8
558	Летняя скидка	30	2023-06-01	2023-08-31	2
559	Зимний отдых	10	2023-12-01	2023-12-31	19
560	Серебряная Весеннее предложение	45	2023-12-01	2023-12-31	14
561	Золотая Раннее бронирование	15	2023-12-01	2023-12-31	7
562	Семейная скидка	15	2023-03-05	2023-03-13	12
563	Раннее бронирование	30	2023-09-01	2023-10-31	18
564	Осенние каникулы	10	2023-09-01	2023-10-31	8
565	Весеннее предложение	15	2023-03-15	2023-05-15	19
566	Весеннее предложение	25	2023-06-01	2023-08-31	8
567	Серебряная Осенние каникулы	15	2023-12-01	2023-12-31	20
568	Последняя минута	25	2023-06-01	2023-08-31	1
569	Эксклюзивная Семейная скидка	45	2023-03-15	2023-05-15	3
570	Специальная Весеннее предложение	40	2023-12-01	2023-12-31	20
571	Долгосрочное проживание	35	2023-12-01	2023-12-31	15
572	Зимний отдых	10	2023-09-01	2023-10-31	18
573	Весеннее предложение	25	2023-06-01	2023-08-31	13
574	Раннее бронирование	15	2023-09-29	2023-10-27	2
575	Специальная Раннее бронирование	30	2023-06-01	2023-08-31	7
576	Скидка для постоянных клиентов	40	2023-09-01	2023-10-31	9
577	Долгосрочное проживание	5	2023-03-15	2023-05-15	19
578	Последняя минута	10	2023-09-01	2023-10-31	9
579	Серебряная Романтический уикенд	40	2023-09-01	2023-10-31	4
580	Горячая Романтический уикенд	35	2023-09-01	2023-10-31	4
581	Зимний отдых	10	2023-03-15	2023-05-15	6
582	Горячая Весеннее предложение	15	2023-08-14	2023-08-22	3
583	Эксклюзивная Зимний отдых	30	2023-06-01	2023-08-31	15
584	Горячая Бизнес-предложение	50	2023-12-01	2023-12-31	20
585	Раннее бронирование	30	2023-09-01	2023-10-31	1
586	Золотая Осенние каникулы	30	2023-12-01	2023-12-31	13
587	Семейная скидка	10	2023-03-15	2023-05-15	19
588	Семейная скидка	40	2023-12-01	2023-12-31	10
589	Новогодний спецпредлог	35	2023-03-15	2023-05-15	10
590	Раннее бронирование	15	2023-06-01	2023-08-31	2
591	Золотая Весеннее предложение	10	2023-09-01	2023-10-31	7
592	Эксклюзивная Новогодний спецпредлог	10	2023-12-01	2023-12-31	15
593	Новогодний спецпредлог	20	2023-03-14	2023-04-02	19
594	Раннее бронирование	20	2023-08-23	2023-09-16	15
595	Новогодний спецпредлог	10	2023-09-01	2023-10-31	10
596	Серебряная Скидка для постоянных клиентов	20	2023-12-01	2023-12-31	14
597	Романтический уикенд	40	2023-06-22	2023-07-03	9
598	Новогодний спецпредлог	20	2023-12-01	2023-12-31	14
599	Специальная Долгосрочное проживание	35	2023-07-23	2023-07-30	14
600	Последняя минута	25	2023-06-01	2023-08-31	15
601	Романтический уикенд	5	2023-06-01	2023-08-31	12
602	Долгосрочное проживание	20	2023-03-15	2023-05-15	14
603	Специальная Весеннее предложение	25	2023-12-01	2023-12-31	4
604	Серебряная Семейная скидка	15	2023-10-03	2023-10-30	1
605	Летняя скидка	20	2023-01-26	2023-02-14	8
606	Весеннее предложение	30	2023-09-01	2023-10-31	1
607	Весеннее предложение	30	2023-09-01	2023-10-31	20
608	Скидка для постоянных клиентов	15	2023-08-17	2023-08-29	2
609	Весеннее предложение	10	2023-06-01	2023-08-31	8
610	Романтический уикенд	10	2023-03-15	2023-05-15	15
611	Зимний отдых	50	2023-09-01	2023-10-31	17
612	Весеннее предложение	30	2023-03-15	2023-05-15	20
613	Последняя минута	40	2023-01-15	2023-01-26	14
614	Новогодний спецпредлог	30	2023-06-01	2023-08-31	1
615	Золотая Весеннее предложение	15	2023-12-01	2023-12-25	10
616	Бизнес-предложение	50	2023-06-01	2023-08-31	15
617	Бизнес-предложение	45	2023-06-01	2023-08-31	7
618	Эксклюзивная Скидка для постоянных клиентов	20	2023-12-01	2023-12-31	5
619	Летняя скидка	25	2023-12-01	2023-12-31	14
620	Специальная Семейная скидка	35	2023-09-01	2023-10-31	7
621	Бизнес-предложение	15	2023-06-01	2023-08-31	1
622	Семейная скидка	25	2023-06-01	2023-08-31	7
623	Специальная Осенние каникулы	35	2023-06-01	2023-08-31	19
624	Золотая Зимний отдых	10	2023-09-01	2023-10-31	3
625	Последняя минута	20	2023-07-02	2023-07-11	3
626	Скидка для постоянных клиентов	35	2023-12-01	2023-12-31	2
627	Эксклюзивная Романтический уикенд	35	2023-09-28	2023-10-14	5
628	Эксклюзивная Бизнес-предложение	45	2023-08-16	2023-08-24	18
629	Последняя минута	15	2023-12-01	2023-12-31	3
630	Романтический уикенд	30	2023-06-01	2023-08-31	17
631	Скидка для постоянных клиентов	35	2023-03-15	2023-05-15	1
632	Последняя минута	10	2023-11-13	2023-12-08	12
633	Летняя скидка	20	2023-12-01	2023-12-31	4
634	Семейная скидка	25	2023-06-01	2023-08-31	16
635	Романтический уикенд	20	2023-09-01	2023-10-31	8
636	Зимний отдых	45	2023-03-15	2023-05-15	3
637	Осенние каникулы	30	2023-05-31	2023-06-18	13
638	Раннее бронирование	50	2023-01-14	2023-02-08	7
639	Романтический уикенд	40	2023-04-25	2023-05-07	10
640	Скидка для постоянных клиентов	20	2023-03-15	2023-05-15	2
641	Горячая Зимний отдых	30	2023-09-01	2023-10-31	13
642	Золотая Новогодний спецпредлог	25	2023-06-01	2023-08-31	6
643	Серебряная Бизнес-предложение	20	2023-12-01	2023-12-31	1
644	Летняя скидка	20	2023-06-01	2023-08-31	19
645	Летняя скидка	30	2023-12-01	2023-12-31	16
646	Долгосрочное проживание	45	2023-05-30	2023-06-15	6
647	Серебряная Новогодний спецпредлог	20	2023-09-01	2023-10-31	13
648	Бизнес-предложение	15	2023-06-01	2023-08-31	13
649	Скидка для постоянных клиентов	30	2023-06-01	2023-08-31	1
650	Эксклюзивная Летняя скидка	5	2023-03-15	2023-05-15	13
651	Бизнес-предложение	50	2023-05-02	2023-05-09	8
652	Летняя скидка	45	2023-06-01	2023-08-31	6
653	Серебряная Летняя скидка	45	2023-12-01	2023-12-31	19
654	Семейная скидка	40	2023-03-15	2023-05-15	15
655	Долгосрочное проживание	15	2023-03-15	2023-05-15	7
656	Раннее бронирование	10	2023-11-05	2023-11-14	17
657	Эксклюзивная Осенние каникулы	35	2023-09-01	2023-10-31	9
658	Золотая Скидка для постоянных клиентов	25	2023-05-02	2023-05-19	2
659	Романтический уикенд	25	2023-09-01	2023-10-31	11
660	Горячая Раннее бронирование	45	2023-12-01	2023-12-31	16
661	Скидка для постоянных клиентов	20	2023-03-15	2023-05-15	18
662	Осенние каникулы	35	2023-12-01	2023-12-31	20
663	Раннее бронирование	20	2023-06-01	2023-08-31	3
664	Семейная скидка	45	2023-09-01	2023-10-31	6
665	Зимний отдых	35	2023-12-01	2023-12-31	12
666	Раннее бронирование	35	2023-10-03	2023-10-26	17
667	Зимний отдых	25	2023-12-01	2023-12-31	5
668	Бизнес-предложение	10	2023-12-01	2023-12-31	13
669	Серебряная Раннее бронирование	15	2023-03-15	2023-05-15	18
670	Семейная скидка	5	2023-12-01	2023-12-31	3
671	Новогодний спецпредлог	10	2023-12-01	2023-12-31	8
672	Горячая Летняя скидка	5	2023-03-15	2023-05-15	2
673	Горячая Бизнес-предложение	35	2023-05-28	2023-06-25	11
674	Золотая Скидка для постоянных клиентов	35	2023-05-13	2023-06-09	9
675	Бизнес-предложение	40	2023-03-15	2023-05-15	11
676	Раннее бронирование	5	2023-06-01	2023-08-31	8
677	Специальная Весеннее предложение	15	2023-12-01	2023-12-31	18
678	Последняя минута	35	2023-06-01	2023-08-31	18
679	Бизнес-предложение	30	2023-06-02	2023-06-15	7
680	Долгосрочное проживание	15	2023-03-15	2023-05-15	19
681	Последняя минута	50	2023-12-01	2023-12-31	4
682	Долгосрочное проживание	5	2023-03-15	2023-05-15	4
683	Скидка для постоянных клиентов	45	2023-09-01	2023-10-31	4
684	Семейная скидка	15	2023-12-01	2023-12-31	17
685	Весеннее предложение	20	2023-03-15	2023-04-01	14
686	Серебряная Весеннее предложение	20	2023-03-15	2023-05-15	11
687	Летняя скидка	35	2023-02-16	2023-03-16	16
688	Золотая Семейная скидка	40	2023-09-01	2023-10-31	12
689	Скидка для постоянных клиентов	15	2023-03-15	2023-05-15	3
690	Долгосрочное проживание	35	2023-03-15	2023-05-15	10
691	Раннее бронирование	35	2023-12-01	2023-12-31	13
692	Золотая Зимний отдых	30	2023-03-15	2023-05-15	15
693	Новогодний спецпредлог	20	2023-06-01	2023-08-31	7
694	Весеннее предложение	10	2023-09-01	2023-10-31	16
695	Долгосрочное проживание	10	2023-12-01	2023-12-31	10
696	Семейная скидка	35	2023-09-01	2023-10-31	14
697	Осенние каникулы	40	2023-03-15	2023-05-15	8
698	Серебряная Скидка для постоянных клиентов	10	2023-09-01	2023-10-31	12
699	Бизнес-предложение	30	2023-05-22	2023-06-19	17
700	Летняя скидка	25	2023-03-15	2023-05-15	3
701	Эксклюзивная Долгосрочное проживание	45	2023-03-15	2023-05-15	10
702	Серебряная Последняя минута	15	2023-06-01	2023-08-31	8
703	Летняя скидка	50	2023-06-01	2023-08-31	14
704	Золотая Зимний отдых	25	2023-03-15	2023-05-15	19
705	Долгосрочное проживание	15	2023-12-01	2023-12-31	10
706	Последняя минута	20	2023-12-01	2023-12-31	3
707	Золотая Зимний отдых	30	2023-03-15	2023-05-15	12
708	Семейная скидка	20	2023-03-18	2023-04-15	4
709	Новогодний спецпредлог	40	2023-03-15	2023-05-15	14
710	Весеннее предложение	30	2023-09-01	2023-10-31	10
711	Скидка для постоянных клиентов	30	2023-12-01	2023-12-31	17
712	Романтический уикенд	20	2023-06-26	2023-07-19	8
713	Скидка для постоянных клиентов	5	2023-12-01	2023-12-31	9
714	Эксклюзивная Раннее бронирование	20	2023-03-15	2023-05-15	6
715	Долгосрочное проживание	10	2023-09-01	2023-10-31	16
716	Последняя минута	40	2023-12-01	2023-12-31	14
717	Зимний отдых	40	2023-12-01	2023-12-31	7
718	Новогодний спецпредлог	40	2023-09-01	2023-10-31	3
719	Эксклюзивная Семейная скидка	35	2023-12-01	2023-12-31	6
720	Новогодний спецпредлог	35	2023-12-01	2023-12-31	7
721	Семейная скидка	25	2023-05-22	2023-06-19	15
722	Горячая Семейная скидка	50	2023-04-12	2023-05-06	19
723	Золотая Весеннее предложение	15	2023-03-15	2023-05-15	5
724	Серебряная Летняя скидка	45	2023-06-01	2023-08-31	6
725	Серебряная Романтический уикенд	45	2023-03-15	2023-05-15	13
726	Золотая Последняя минута	45	2023-09-01	2023-10-31	14
727	Раннее бронирование	20	2023-03-15	2023-05-15	17
728	Семейная скидка	45	2023-01-17	2023-01-27	16
729	Долгосрочное проживание	20	2023-03-15	2023-05-15	4
730	Осенние каникулы	45	2023-09-01	2023-10-31	10
731	Скидка для постоянных клиентов	40	2023-12-01	2023-12-31	20
732	Зимний отдых	20	2023-08-05	2023-08-22	16
733	Серебряная Последняя минута	45	2023-12-01	2023-12-31	14
734	Зимний отдых	20	2023-03-15	2023-05-15	10
735	Золотая Романтический уикенд	40	2023-03-15	2023-05-15	7
736	Долгосрочное проживание	35	2023-09-01	2023-10-31	7
737	Романтический уикенд	20	2023-06-01	2023-08-31	6
738	Бизнес-предложение	10	2023-03-15	2023-05-15	16
739	Специальная Осенние каникулы	25	2023-12-01	2023-12-31	20
740	Семейная скидка	45	2023-03-15	2023-05-15	10
741	Скидка для постоянных клиентов	45	2023-09-01	2023-10-31	5
742	Эксклюзивная Бизнес-предложение	35	2023-06-01	2023-08-31	6
743	Семейная скидка	45	2023-02-14	2023-03-03	8
744	Осенние каникулы	35	2023-06-01	2023-08-31	6
745	Золотая Новогодний спецпредлог	25	2023-03-15	2023-05-15	9
746	Специальная Весеннее предложение	25	2023-06-15	2023-07-13	16
747	Зимний отдых	20	2023-09-01	2023-10-31	14
748	Романтический уикенд	45	2023-06-01	2023-08-31	10
749	Семейная скидка	5	2023-06-01	2023-08-31	17
750	Долгосрочное проживание	45	2023-06-01	2023-08-31	20
751	Скидка для постоянных клиентов	45	2023-03-15	2023-05-15	3
752	Весеннее предложение	10	2023-12-01	2023-12-31	14
753	Скидка для постоянных клиентов	50	2023-05-14	2023-06-02	18
754	Семейная скидка	35	2023-08-06	2023-08-31	10
755	Новогодний спецпредлог	45	2023-12-01	2023-12-31	14
756	Последняя минута	30	2023-12-01	2023-12-31	17
757	Романтический уикенд	25	2023-09-01	2023-10-31	6
758	Специальная Летняя скидка	45	2023-03-15	2023-05-15	6
759	Последняя минута	25	2023-12-01	2023-12-31	1
760	Скидка для постоянных клиентов	50	2023-03-15	2023-05-15	14
761	Эксклюзивная Последняя минута	30	2023-03-27	2023-04-24	18
762	Романтический уикенд	5	2023-06-01	2023-08-31	18
763	Летняя скидка	15	2023-08-21	2023-09-13	4
764	Последняя минута	5	2023-03-15	2023-05-15	5
765	Эксклюзивная Зимний отдых	40	2023-09-01	2023-10-31	7
766	Золотая Последняя минута	30	2023-06-01	2023-08-31	7
767	Последняя минута	20	2023-06-01	2023-08-31	10
768	Новогодний спецпредлог	30	2023-05-09	2023-05-17	12
769	Летняя скидка	40	2023-09-01	2023-10-31	9
770	Осенние каникулы	35	2023-09-01	2023-10-31	18
771	Семейная скидка	25	2023-09-01	2023-10-31	3
772	Романтический уикенд	30	2023-12-01	2023-12-31	3
773	Семейная скидка	35	2023-06-01	2023-08-31	3
774	Бизнес-предложение	15	2023-09-01	2023-10-31	17
775	Бизнес-предложение	5	2023-12-01	2023-12-31	14
776	Летняя скидка	35	2023-07-15	2023-08-11	19
777	Осенние каникулы	20	2023-12-01	2023-12-31	12
778	Бизнес-предложение	30	2023-09-01	2023-10-31	16
779	Раннее бронирование	10	2023-04-19	2023-05-14	2
780	Последняя минута	25	2023-03-15	2023-05-15	5
781	Последняя минута	35	2023-06-01	2023-08-31	10
782	Зимний отдых	50	2023-11-11	2023-11-26	17
783	Золотая Романтический уикенд	45	2023-09-01	2023-10-31	4
784	Скидка для постоянных клиентов	15	2023-06-01	2023-08-31	12
785	Специальная Бизнес-предложение	40	2023-09-01	2023-10-31	11
786	Семейная скидка	40	2023-12-01	2023-12-31	10
787	Летняя скидка	30	2023-08-31	2023-09-12	19
788	Бизнес-предложение	45	2023-11-26	2023-12-21	13
789	Долгосрочное проживание	45	2023-03-15	2023-05-15	17
790	Раннее бронирование	20	2023-12-01	2023-12-31	4
791	Новогодний спецпредлог	20	2023-06-01	2023-08-31	17
792	Новогодний спецпредлог	15	2023-09-01	2023-10-31	11
793	Серебряная Новогодний спецпредлог	25	2023-06-01	2023-08-31	13
794	Горячая Романтический уикенд	5	2023-03-15	2023-05-15	10
795	Последняя минута	45	2023-05-08	2023-05-31	19
796	Специальная Летняя скидка	35	2023-04-17	2023-05-02	15
797	Эксклюзивная Скидка для постоянных клиентов	20	2023-10-27	2023-11-16	15
798	Летняя скидка	25	2023-03-15	2023-05-15	20
799	Бизнес-предложение	45	2023-06-01	2023-08-31	16
800	Последняя минута	45	2023-05-22	2023-06-07	20
801	Последняя минута	10	2023-06-01	2023-08-31	2
802	Горячая Последняя минута	25	2023-09-01	2023-10-31	3
803	Специальная Весеннее предложение	10	2023-12-01	2023-12-31	18
804	Скидка для постоянных клиентов	35	2023-03-15	2023-05-15	16
805	Бизнес-предложение	10	2023-09-06	2023-09-19	6
806	Долгосрочное проживание	30	2023-01-11	2023-02-05	2
807	Золотая Последняя минута	10	2023-09-01	2023-10-31	9
808	Летняя скидка	40	2023-11-04	2023-11-27	12
809	Золотая Скидка для постоянных клиентов	35	2023-06-01	2023-08-31	6
810	Последняя минута	30	2023-12-01	2023-12-31	13
811	Осенние каникулы	10	2023-06-01	2023-08-31	9
812	Горячая Романтический уикенд	40	2023-01-29	2023-02-13	18
813	Последняя минута	10	2023-03-15	2023-05-15	4
814	Бизнес-предложение	15	2023-03-15	2023-05-15	20
815	Последняя минута	5	2023-12-01	2023-12-31	12
816	Бизнес-предложение	15	2023-10-28	2023-11-11	5
817	Летняя скидка	10	2023-06-07	2023-06-24	14
818	Золотая Бизнес-предложение	15	2023-09-01	2023-10-31	5
819	Осенние каникулы	15	2023-06-01	2023-08-31	14
820	Последняя минута	20	2023-12-01	2023-12-31	16
821	Золотая Осенние каникулы	30	2023-12-01	2023-12-31	2
822	Весеннее предложение	10	2023-03-15	2023-05-15	18
823	Серебряная Новогодний спецпредлог	45	2023-07-21	2023-07-31	17
824	Золотая Летняя скидка	15	2023-06-01	2023-08-31	6
825	Серебряная Летняя скидка	15	2023-03-15	2023-05-15	15
826	Горячая Осенние каникулы	5	2023-06-01	2023-08-31	16
827	Специальная Новогодний спецпредлог	15	2023-09-01	2023-10-31	13
828	Горячая Романтический уикенд	10	2023-09-01	2023-10-31	10
829	Раннее бронирование	25	2023-12-01	2023-12-31	5
830	Раннее бронирование	20	2023-11-30	2023-12-18	11
831	Раннее бронирование	30	2023-03-15	2023-05-15	1
832	Осенние каникулы	40	2023-03-15	2023-05-15	2
833	Новогодний спецпредлог	30	2023-12-01	2023-12-31	15
834	Весеннее предложение	30	2023-02-28	2023-03-15	11
835	Новогодний спецпредлог	15	2023-05-05	2023-05-31	17
836	Романтический уикенд	30	2023-03-15	2023-05-15	7
837	Горячая Последняя минута	45	2023-09-19	2023-10-13	3
838	Раннее бронирование	35	2023-06-01	2023-08-31	5
839	Горячая Осенние каникулы	45	2023-12-01	2023-12-31	14
840	Осенние каникулы	15	2023-12-01	2023-12-31	8
841	Новогодний спецпредлог	30	2023-12-01	2023-12-31	14
842	Новогодний спецпредлог	45	2023-09-01	2023-10-31	15
843	Бизнес-предложение	40	2023-03-15	2023-04-04	10
844	Бизнес-предложение	20	2023-09-01	2023-10-31	5
845	Скидка для постоянных клиентов	5	2023-03-15	2023-05-15	13
846	Осенние каникулы	15	2023-06-01	2023-08-31	8
847	Последняя минута	50	2023-03-15	2023-05-15	20
848	Специальная Семейная скидка	15	2023-12-01	2023-12-31	16
849	Семейная скидка	30	2023-12-01	2023-12-31	17
850	Скидка для постоянных клиентов	30	2023-06-01	2023-08-31	10
851	Семейная скидка	30	2023-03-15	2023-05-15	12
852	Весеннее предложение	10	2023-03-15	2023-05-15	10
853	Романтический уикенд	50	2023-06-01	2023-08-31	6
854	Серебряная Весеннее предложение	30	2023-09-01	2023-10-31	19
855	Горячая Долгосрочное проживание	10	2023-06-01	2023-08-31	11
856	Зимний отдых	15	2023-04-10	2023-05-08	8
857	Скидка для постоянных клиентов	35	2023-09-01	2023-10-31	12
858	Романтический уикенд	10	2023-12-01	2023-12-31	19
859	Осенние каникулы	30	2023-12-01	2023-12-31	19
860	Зимний отдых	20	2023-09-01	2023-10-31	19
861	Весеннее предложение	40	2023-12-01	2023-12-31	8
862	Зимний отдых	40	2023-03-15	2023-05-15	5
863	Специальная Романтический уикенд	40	2023-06-01	2023-08-31	11
864	Зимний отдых	5	2023-05-29	2023-06-07	4
865	Долгосрочное проживание	45	2023-12-01	2023-12-31	3
866	Новогодний спецпредлог	45	2023-06-21	2023-07-03	9
867	Весеннее предложение	50	2023-03-15	2023-05-15	19
868	Весеннее предложение	20	2023-06-01	2023-08-31	1
869	Осенние каникулы	25	2023-06-01	2023-08-31	16
870	Скидка для постоянных клиентов	35	2023-09-01	2023-10-31	15
871	Горячая Раннее бронирование	45	2023-09-01	2023-10-31	12
872	Золотая Последняя минута	45	2023-06-15	2023-07-09	9
873	Золотая Летняя скидка	30	2023-12-01	2023-12-31	19
874	Бизнес-предложение	20	2023-12-01	2023-12-31	10
875	Осенние каникулы	25	2023-12-01	2023-12-31	17
876	Специальная Скидка для постоянных клиентов	20	2023-12-01	2023-12-31	3
877	Последняя минута	20	2023-12-01	2023-12-31	13
878	Скидка для постоянных клиентов	20	2023-12-01	2023-12-31	4
879	Весеннее предложение	25	2023-12-01	2023-12-31	10
880	Бизнес-предложение	10	2023-06-01	2023-08-31	10
881	Серебряная Новогодний спецпредлог	10	2023-06-01	2023-08-31	12
882	Скидка для постоянных клиентов	50	2023-04-19	2023-05-11	17
883	Летняя скидка	40	2023-01-10	2023-01-23	1
884	Специальная Последняя минута	15	2023-09-01	2023-10-31	3
885	Горячая Осенние каникулы	25	2023-03-15	2023-05-15	14
886	Золотая Зимний отдых	20	2023-03-15	2023-05-15	4
887	Осенние каникулы	25	2023-03-15	2023-05-15	3
888	Новогодний спецпредлог	45	2023-09-01	2023-10-31	15
889	Специальная Семейная скидка	15	2023-06-01	2023-08-31	4
890	Золотая Весеннее предложение	35	2023-03-15	2023-05-15	9
891	Осенние каникулы	35	2023-12-01	2023-12-31	10
892	Последняя минута	35	2023-03-15	2023-05-15	2
893	Осенние каникулы	35	2023-12-01	2023-12-31	18
894	Осенние каникулы	20	2023-09-01	2023-10-31	10
895	Новогодний спецпредлог	45	2023-03-15	2023-05-15	3
896	Эксклюзивная Романтический уикенд	50	2023-09-01	2023-10-31	17
897	Последняя минута	10	2023-09-01	2023-10-31	4
898	Специальная Весеннее предложение	15	2023-09-01	2023-10-31	12
899	Осенние каникулы	15	2023-06-01	2023-08-31	18
900	Золотая Семейная скидка	40	2023-03-15	2023-05-15	18
901	Скидка для постоянных клиентов	40	2023-03-29	2023-04-08	9
902	Долгосрочное проживание	45	2023-03-15	2023-05-15	16
903	Серебряная Зимний отдых	25	2023-06-01	2023-08-31	20
904	Летняя скидка	10	2023-09-01	2023-10-31	11
905	Семейная скидка	25	2023-11-21	2023-12-14	17
906	Серебряная Долгосрочное проживание	40	2023-09-01	2023-10-31	19
907	Летняя скидка	45	2023-07-23	2023-08-07	14
908	Золотая Летняя скидка	40	2023-06-01	2023-08-31	10
909	Специальная Бизнес-предложение	15	2023-06-01	2023-08-31	4
910	Долгосрочное проживание	45	2023-08-31	2023-09-27	16
911	Раннее бронирование	25	2023-06-20	2023-06-27	19
912	Последняя минута	45	2023-12-01	2023-12-31	7
913	Летняя скидка	5	2023-06-01	2023-08-31	14
914	Последняя минута	30	2023-01-25	2023-02-14	14
915	Серебряная Весеннее предложение	20	2023-09-01	2023-10-31	4
916	Горячая Романтический уикенд	5	2023-05-17	2023-06-03	11
917	Романтический уикенд	20	2023-08-21	2023-09-18	10
918	Весеннее предложение	45	2023-12-01	2023-12-31	10
919	Зимний отдых	30	2023-12-01	2023-12-31	4
920	Специальная Скидка для постоянных клиентов	25	2023-03-15	2023-05-15	8
921	Летняя скидка	35	2023-02-03	2023-02-25	19
922	Скидка для постоянных клиентов	25	2023-03-15	2023-05-15	19
923	Золотая Весеннее предложение	15	2023-09-01	2023-10-31	13
924	Зимний отдых	45	2023-09-01	2023-10-31	1
925	Бизнес-предложение	15	2023-12-01	2023-12-31	16
926	Раннее бронирование	20	2023-12-01	2023-12-31	12
927	Осенние каникулы	20	2023-12-01	2023-12-31	12
928	Летняя скидка	15	2023-04-02	2023-04-09	7
929	Долгосрочное проживание	50	2023-12-01	2023-12-31	14
930	Горячая Осенние каникулы	15	2023-06-01	2023-08-31	8
931	Долгосрочное проживание	20	2023-03-15	2023-05-15	17
932	Романтический уикенд	30	2023-03-15	2023-05-15	2
933	Бизнес-предложение	45	2023-04-21	2023-05-17	17
934	Последняя минута	5	2023-09-29	2023-10-26	15
935	Осенние каникулы	40	2023-12-01	2023-12-31	11
936	Бизнес-предложение	20	2023-06-01	2023-08-31	9
937	Новогодний спецпредлог	5	2023-06-01	2023-08-31	5
938	Серебряная Скидка для постоянных клиентов	50	2023-12-01	2023-12-31	7
939	Бизнес-предложение	20	2023-12-01	2023-12-31	2
940	Эксклюзивная Осенние каникулы	45	2023-12-01	2023-12-31	5
941	Последняя минута	50	2023-09-01	2023-10-31	17
942	Летняя скидка	40	2023-09-01	2023-10-31	18
943	Горячая Весеннее предложение	25	2023-08-10	2023-08-20	1
944	Осенние каникулы	40	2023-06-01	2023-08-31	7
945	Весеннее предложение	30	2023-12-01	2023-12-31	7
946	Бизнес-предложение	15	2023-03-15	2023-05-15	16
947	Серебряная Скидка для постоянных клиентов	30	2023-06-01	2023-08-31	16
948	Зимний отдых	20	2023-01-06	2023-02-01	5
949	Романтический уикенд	35	2023-03-15	2023-05-15	20
950	Зимний отдых	25	2023-02-25	2023-03-18	8
951	Семейная скидка	40	2023-04-26	2023-05-18	6
952	Серебряная Бизнес-предложение	25	2023-03-15	2023-05-15	2
953	Последняя минута	35	2023-06-01	2023-08-31	17
954	Романтический уикенд	25	2023-03-15	2023-05-15	7
955	Зимний отдых	5	2023-11-10	2023-11-27	3
956	Специальная Летняя скидка	20	2023-03-12	2023-03-19	18
957	Горячая Долгосрочное проживание	5	2023-09-01	2023-10-31	13
958	Последняя минута	35	2023-09-01	2023-10-31	16
959	Летняя скидка	50	2023-06-01	2023-08-31	11
960	Горячая Бизнес-предложение	25	2023-03-15	2023-05-15	11
961	Весеннее предложение	40	2023-09-01	2023-10-31	18
962	Долгосрочное проживание	35	2023-02-03	2023-02-28	14
963	Золотая Романтический уикенд	20	2023-03-15	2023-05-15	2
964	Летняя скидка	45	2023-11-18	2023-12-02	3
965	Серебряная Долгосрочное проживание	25	2023-03-15	2023-05-15	17
966	Эксклюзивная Раннее бронирование	30	2023-03-11	2023-03-22	19
967	Эксклюзивная Осенние каникулы	15	2023-06-01	2023-08-31	12
968	Весеннее предложение	15	2023-09-01	2023-10-31	11
969	Серебряная Раннее бронирование	20	2023-12-01	2023-12-31	20
970	Весеннее предложение	5	2023-09-01	2023-10-31	2
971	Эксклюзивная Бизнес-предложение	40	2023-09-01	2023-10-31	7
972	Горячая Долгосрочное проживание	30	2023-03-15	2023-05-15	13
973	Раннее бронирование	20	2023-05-31	2023-06-11	16
974	Серебряная Новогодний спецпредлог	35	2023-12-01	2023-12-31	7
975	Горячая Последняя минута	5	2023-03-04	2023-03-20	7
976	Романтический уикенд	20	2023-12-01	2023-12-31	1
977	Долгосрочное проживание	20	2023-09-01	2023-10-31	1
978	Романтический уикенд	10	2023-12-01	2023-12-31	2
979	Скидка для постоянных клиентов	50	2023-06-01	2023-08-31	19
980	Раннее бронирование	40	2023-03-25	2023-04-09	14
981	Эксклюзивная Зимний отдых	30	2023-12-01	2023-12-31	1
982	Серебряная Бизнес-предложение	50	2023-09-01	2023-10-31	5
983	Зимний отдых	45	2023-04-28	2023-05-22	7
984	Весеннее предложение	50	2023-03-15	2023-05-15	11
985	Бизнес-предложение	25	2023-06-01	2023-08-31	13
986	Новогодний спецпредлог	5	2023-09-01	2023-10-31	15
987	Серебряная Бизнес-предложение	25	2023-12-01	2023-12-31	3
988	Последняя минута	10	2023-03-15	2023-05-15	17
989	Специальная Последняя минута	25	2023-10-29	2023-11-06	19
990	Специальная Скидка для постоянных клиентов	20	2023-01-30	2023-02-08	7
991	Романтический уикенд	15	2023-12-01	2023-12-31	15
992	Бизнес-предложение	10	2023-03-15	2023-05-15	1
993	Последняя минута	10	2023-07-09	2023-08-02	14
994	Осенние каникулы	35	2023-12-01	2023-12-31	17
995	Золотая Зимний отдых	45	2023-09-01	2023-10-31	8
996	Весеннее предложение	40	2023-03-15	2023-05-15	16
997	Семейная скидка	10	2023-06-01	2023-08-31	4
998	Специальная Романтический уикенд	25	2023-09-24	2023-10-01	5
999	Бизнес-предложение	15	2023-06-01	2023-08-31	6
1000	Серебряная Зимний отдых	40	2023-09-01	2023-10-31	11
\.


  4928.dat                                                                                            0000600 0004000 0002000 00000273312 14771407746 0014311 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	13	915	бессрочный	Полная занятость	Основной	2024-08-02	2020-04-27
2	10	939	бессрочный	Полная занятость	Основной	2027-08-14	2023-10-30
3	18	640	срочный	Полная занятость	Временный	2021-02-25	2020-05-01
4	14	655	бессрочный	Полная занятость	Основной	2024-03-01	2020-11-08
5	6	260	срочный	Полная занятость	Временный	2026-07-14	2025-10-24
6	19	892	ГПХ	Разовые работы	Временный	2022-10-24	2022-07-30
7	5	115	срочный	Гибкий график	Сезонный	2021-02-17	2020-06-01
8	12	33	бессрочный	Полная занятость	Основной	2024-12-10	2020-08-22
9	16	205	бессрочный	Гибкий график	Основной	2029-06-05	2025-09-22
10	6	512	срочный	Полная занятость	Временный	2024-04-05	2023-06-19
11	12	505	бессрочный	Полная занятость	Основной	2025-03-24	2022-01-15
12	20	3	ГПХ	Разовые работы	Временный	2021-12-25	2021-08-16
13	6	268	ГПХ	Разовые работы	Временный	2022-12-04	2022-08-06
14	2	881	ГПХ	Разовые работы	Временный	2023-03-06	2022-11-10
15	1	90	бессрочный	Полная занятость	Основной	2028-04-20	2024-04-22
16	18	153	бессрочный	Удаленная работа	Основной	2025-09-03	2021-04-08
17	17	345	срочный	Гибкий график	Временный	2022-06-27	2021-07-23
18	12	243	срочный	Вахтовый метод	Стажировка	2021-11-08	2020-11-26
19	9	138	срочный	Полная занятость	Временный	2025-05-25	2024-09-30
20	4	663	бессрочный	Удаленная работа	Основной	2028-03-26	2024-05-11
21	7	45	срочный	Полная занятость	Временный	2023-02-28	2022-03-28
22	3	78	ГПХ	Разовые работы	Временный	2020-09-24	2020-05-22
23	18	582	срочный	Полная занятость	Сезонный	2023-03-06	2022-04-09
24	10	91	бессрочный	Полная занятость	Основной	2026-10-21	2022-12-27
25	6	118	срочный	Гибкий график	Временный	2021-05-03	2020-07-14
26	2	659	ГПХ	Разовые работы	Временный	2021-12-11	2021-09-01
27	3	678	срочный	Гибкий график	Временный	2024-03-22	2023-10-25
28	19	815	срочный	Гибкий график	Стажировка	2020-05-28	2020-01-20
29	2	233	бессрочный	Полная занятость	Основной	2025-02-04	2020-05-17
30	20	480	срочный	Вахтовый метод	Сезонный	2025-03-20	2024-06-06
31	19	561	срочный	Полная занятость	Стажировка	2026-06-20	2025-07-31
32	3	782	ГПХ	Разовые работы	Временный	2021-03-11	2020-11-17
33	20	661	срочный	Полная занятость	Временный	2021-08-29	2021-02-16
34	10	809	бессрочный	Полная занятость	Основной	2025-07-29	2021-07-23
35	6	261	срочный	Полная занятость	Сезонный	2021-07-22	2020-10-21
36	16	167	бессрочный	Гибкий график	Основной	2027-02-25	2023-02-21
37	10	473	ГПХ	Разовые работы	Временный	2023-02-10	2022-12-24
38	16	691	срочный	Полная занятость	Сезонный	2026-02-24	2025-07-15
39	16	829	ГПХ	Разовые работы	Временный	2023-05-06	2022-12-18
40	13	912	срочный	Гибкий график	Временный	2024-09-17	2024-05-02
41	4	747	ГПХ	Разовые работы	Временный	2022-01-14	2021-08-26
42	13	859	ГПХ	Разовые работы	Временный	2024-10-27	2024-07-24
43	14	336	ГПХ	Разовые работы	Временный	2020-07-13	2020-02-29
44	14	179	бессрочный	Полная занятость	Основной	2028-01-08	2024-10-09
45	13	844	срочный	Гибкий график	Временный	2021-03-31	2020-08-17
46	16	83	срочный	Полная занятость	Сезонный	2021-04-10	2020-09-11
47	16	864	бессрочный	Полная занятость	Основной	2029-06-26	2025-01-25
48	17	2	срочный	Вахтовый метод	Временный	2021-10-18	2021-05-03
49	6	490	бессрочный	Полная занятость	Основной	2028-08-10	2025-03-02
50	8	932	срочный	Полная занятость	Сезонный	2026-07-13	2025-10-14
51	10	520	бессрочный	Полная занятость	Основной	2024-04-13	2020-05-23
52	2	896	ГПХ	Разовые работы	Временный	2021-05-05	2020-12-06
53	10	428	срочный	Гибкий график	Временный	2020-08-17	2020-05-17
54	14	962	ГПХ	Разовые работы	Временный	2022-07-07	2022-03-27
55	4	979	срочный	Полная занятость	Стажировка	2022-02-28	2021-09-26
56	6	210	срочный	Полная занятость	Сезонный	2022-04-30	2021-07-10
57	3	1000	ГПХ	Разовые работы	Временный	2024-03-25	2023-11-12
58	18	666	бессрочный	Полная занятость	Основной	2026-03-01	2021-10-27
59	11	270	ГПХ	Разовые работы	Временный	2026-05-21	2025-12-01
60	19	477	срочный	Полная занятость	Сезонный	2024-02-18	2023-04-08
61	8	420	срочный	Полная занятость	Временный	2024-12-25	2024-03-22
62	4	993	бессрочный	Полная занятость	Основной	2027-06-16	2024-06-11
63	15	174	бессрочный	Полная занятость	Основной	2024-11-06	2020-06-23
64	1	525	бессрочный	Полная занятость	Основной	2029-04-16	2024-06-02
65	10	691	бессрочный	Полная занятость	Основной	2027-04-05	2022-06-09
66	1	205	бессрочный	Полная занятость	Основной	2028-06-29	2024-04-28
67	14	52	бессрочный	Полная занятость	Основной	2025-05-04	2020-12-16
68	5	272	ГПХ	Разовые работы	Временный	2023-10-22	2023-06-26
69	19	811	срочный	Полная занятость	Сезонный	2022-08-19	2022-03-24
70	10	379	срочный	Гибкий график	Стажировка	2023-05-30	2023-01-18
71	20	646	ГПХ	Разовые работы	Временный	2025-04-29	2025-03-04
72	5	142	бессрочный	Полная занятость	Основной	2024-08-20	2020-07-13
73	7	791	ГПХ	Разовые работы	Временный	2025-07-26	2025-05-29
74	16	492	срочный	Гибкий график	Временный	2026-03-24	2025-09-14
75	1	636	бессрочный	Полная занятость	Основной	2029-02-16	2025-07-23
76	14	785	срочный	Полная занятость	Временный	2023-04-15	2022-10-02
77	2	539	бессрочный	Полная занятость	Основной	2024-12-16	2021-06-16
78	4	64	срочный	Полная занятость	Стажировка	2022-01-12	2021-08-17
79	6	462	бессрочный	Удаленная работа	Основной	2028-06-12	2023-11-12
80	9	227	ГПХ	Разовые работы	Временный	2024-01-24	2023-11-25
81	15	840	срочный	Гибкий график	Стажировка	2023-12-15	2023-06-23
82	13	831	бессрочный	Полная занятость	Основной	2025-08-28	2022-06-28
83	1	218	срочный	Гибкий график	Временный	2023-01-31	2022-10-25
84	3	414	срочный	Полная занятость	Стажировка	2021-03-03	2020-11-06
85	9	187	бессрочный	Полная занятость	Основной	2029-12-14	2025-09-12
86	6	739	срочный	Гибкий график	Стажировка	2025-10-16	2024-12-05
87	15	448	ГПХ	Разовые работы	Временный	2021-03-29	2021-01-05
88	11	801	срочный	Полная занятость	Стажировка	2020-09-22	2020-04-25
89	20	998	бессрочный	Гибкий график	Основной	2029-06-23	2025-09-27
90	12	447	бессрочный	Удаленная работа	Основной	2026-04-27	2022-06-14
91	4	213	ГПХ	Разовые работы	Временный	2021-02-11	2020-09-27
92	4	223	срочный	Вахтовый метод	Стажировка	2022-07-03	2021-07-23
93	10	110	ГПХ	Разовые работы	Временный	2021-11-04	2021-08-11
94	15	422	срочный	Гибкий график	Сезонный	2023-02-10	2022-09-22
95	10	720	срочный	Гибкий график	Стажировка	2021-03-22	2020-05-09
96	2	546	бессрочный	Гибкий график	Основной	2025-10-17	2021-01-12
97	15	321	ГПХ	Разовые работы	Временный	2023-04-25	2022-10-27
98	19	516	срочный	Полная занятость	Сезонный	2024-11-12	2024-04-11
99	2	567	ГПХ	Разовые работы	Временный	2022-11-16	2022-09-19
100	14	38	бессрочный	Полная занятость	Основной	2028-10-28	2024-10-13
101	6	701	бессрочный	Полная занятость	Основной	2025-08-11	2021-01-24
102	17	805	бессрочный	Полная занятость	Основной	2025-01-07	2020-08-16
103	14	275	бессрочный	Полная занятость	Основной	2025-10-18	2021-06-15
104	3	199	бессрочный	Полная занятость	Основной	2025-07-29	2021-07-25
105	10	909	бессрочный	Полная занятость	Основной	2023-04-09	2020-03-27
106	10	426	бессрочный	Полная занятость	Основной	2027-11-20	2024-09-01
107	11	762	бессрочный	Полная занятость	Основной	2023-06-01	2020-05-12
108	19	345	срочный	Полная занятость	Временный	2021-09-24	2021-04-06
109	12	274	ГПХ	Разовые работы	Временный	2024-07-28	2024-04-21
110	17	444	бессрочный	Гибкий график	Основной	2024-03-03	2020-06-05
111	18	528	ГПХ	Разовые работы	Временный	2022-09-20	2022-04-15
112	8	295	срочный	Вахтовый метод	Стажировка	2021-04-20	2020-08-10
113	12	360	бессрочный	Удаленная работа	Основной	2025-12-07	2022-11-21
114	5	32	срочный	Полная занятость	Сезонный	2025-11-30	2025-04-08
115	10	163	срочный	Полная занятость	Стажировка	2026-04-07	2025-05-06
116	4	900	срочный	Полная занятость	Сезонный	2025-07-08	2024-11-30
117	9	428	срочный	Полная занятость	Временный	2022-03-21	2021-09-30
118	20	929	бессрочный	Полная занятость	Основной	2026-01-30	2022-11-05
119	19	538	срочный	Полная занятость	Сезонный	2024-01-09	2023-05-29
120	10	621	бессрочный	Удаленная работа	Основной	2027-06-29	2023-06-07
121	4	694	срочный	Полная занятость	Временный	2022-12-22	2022-07-23
122	5	955	ГПХ	Разовые работы	Временный	2021-04-29	2020-11-26
123	17	25	бессрочный	Полная занятость	Основной	2026-04-11	2022-04-25
124	6	822	срочный	Вахтовый метод	Временный	2021-04-03	2020-11-02
125	11	496	бессрочный	Полная занятость	Основной	2027-03-09	2022-08-01
126	11	632	бессрочный	Удаленная работа	Основной	2028-10-20	2023-12-11
127	11	177	ГПХ	Разовые работы	Временный	2022-07-21	2022-02-12
128	14	243	ГПХ	Разовые работы	Временный	2023-10-07	2023-08-26
129	15	998	ГПХ	Разовые работы	Временный	2025-02-03	2024-10-30
130	3	601	бессрочный	Гибкий график	Основной	2025-12-08	2021-07-10
131	15	219	срочный	Гибкий график	Сезонный	2023-08-24	2023-03-09
132	17	233	бессрочный	Гибкий график	Основной	2024-07-05	2020-01-26
133	14	504	бессрочный	Полная занятость	Основной	2025-02-20	2021-02-18
134	1	140	бессрочный	Полная занятость	Основной	2024-07-25	2021-07-07
135	16	28	бессрочный	Гибкий график	Основной	2028-02-21	2024-06-25
136	8	161	бессрочный	Полная занятость	Основной	2026-06-15	2022-03-06
137	15	595	срочный	Полная занятость	Стажировка	2023-10-12	2022-12-25
138	16	722	бессрочный	Полная занятость	Основной	2025-10-14	2021-07-29
139	16	494	бессрочный	Полная занятость	Основной	2029-12-15	2025-10-18
140	17	679	бессрочный	Полная занятость	Основной	2030-05-12	2025-07-22
141	13	905	бессрочный	Полная занятость	Основной	2028-10-14	2024-06-05
142	16	513	бессрочный	Полная занятость	Основной	2023-11-20	2020-05-17
143	11	840	срочный	Гибкий график	Стажировка	2023-06-25	2022-08-18
144	17	917	ГПХ	Разовые работы	Временный	2022-02-25	2021-12-11
145	7	30	бессрочный	Удаленная работа	Основной	2028-11-30	2024-03-12
146	17	712	бессрочный	Полная занятость	Основной	2028-11-25	2024-12-22
147	1	77	ГПХ	Разовые работы	Временный	2024-09-19	2024-06-11
148	3	305	срочный	Полная занятость	Сезонный	2021-03-11	2020-04-23
149	12	537	ГПХ	Разовые работы	Временный	2020-06-29	2020-01-05
150	1	309	ГПХ	Разовые работы	Временный	2021-05-16	2021-02-13
151	5	744	бессрочный	Полная занятость	Основной	2026-02-26	2022-12-19
152	1	814	бессрочный	Гибкий график	Основной	2024-06-17	2021-04-02
153	10	88	бессрочный	Гибкий график	Основной	2029-06-03	2025-09-17
154	1	560	срочный	Гибкий график	Стажировка	2025-06-04	2025-03-01
155	9	801	срочный	Полная занятость	Сезонный	2023-02-15	2022-09-15
156	15	818	срочный	Вахтовый метод	Сезонный	2021-03-16	2020-08-14
157	10	738	бессрочный	Полная занятость	Основной	2026-09-20	2023-03-03
158	11	384	ГПХ	Разовые работы	Временный	2020-11-07	2020-09-22
159	13	324	ГПХ	Разовые работы	Временный	2022-08-28	2022-03-02
160	20	163	срочный	Гибкий график	Сезонный	2023-01-10	2022-06-14
161	13	453	ГПХ	Разовые работы	Временный	2024-06-14	2024-03-08
162	17	689	бессрочный	Гибкий график	Основной	2023-08-29	2020-08-24
163	9	848	ГПХ	Разовые работы	Временный	2024-10-12	2024-04-23
164	7	336	бессрочный	Полная занятость	Основной	2023-06-28	2020-01-22
165	1	345	срочный	Вахтовый метод	Сезонный	2023-03-13	2022-09-14
166	11	671	ГПХ	Разовые работы	Временный	2022-01-11	2021-09-29
167	7	836	бессрочный	Полная занятость	Основной	2028-07-19	2023-11-28
168	18	291	ГПХ	Разовые работы	Временный	2025-02-17	2024-12-30
169	8	923	срочный	Полная занятость	Стажировка	2024-02-22	2023-03-06
170	9	593	срочный	Гибкий график	Временный	2023-06-23	2023-03-15
171	6	653	бессрочный	Гибкий график	Основной	2030-04-02	2025-05-11
172	1	637	срочный	Полная занятость	Стажировка	2025-03-15	2024-06-21
173	13	174	бессрочный	Гибкий график	Основной	2025-08-11	2021-03-04
174	16	815	срочный	Гибкий график	Временный	2025-03-31	2024-09-02
175	3	489	срочный	Полная занятость	Временный	2022-09-21	2022-02-18
176	11	923	бессрочный	Полная занятость	Основной	2027-12-30	2023-02-11
177	19	389	бессрочный	Полная занятость	Основной	2023-07-01	2020-05-26
178	2	132	бессрочный	Полная занятость	Основной	2027-02-10	2022-02-14
179	6	203	срочный	Полная занятость	Стажировка	2024-06-03	2023-08-05
180	12	638	срочный	Полная занятость	Сезонный	2024-03-23	2023-09-03
181	1	326	бессрочный	Полная занятость	Основной	2026-09-24	2023-06-19
182	4	636	ГПХ	Разовые работы	Временный	2025-01-25	2024-11-18
183	17	13	ГПХ	Разовые работы	Временный	2020-10-30	2020-09-16
184	17	854	бессрочный	Гибкий график	Основной	2027-03-07	2023-01-20
185	1	954	бессрочный	Гибкий график	Основной	2027-05-01	2023-06-16
186	4	938	бессрочный	Полная занятость	Основной	2028-11-17	2024-02-04
187	10	227	ГПХ	Разовые работы	Временный	2026-01-19	2025-10-04
188	8	958	срочный	Полная занятость	Стажировка	2022-06-08	2022-02-21
189	9	667	срочный	Гибкий график	Сезонный	2021-09-27	2021-03-02
190	14	65	бессрочный	Полная занятость	Основной	2027-12-01	2023-03-22
191	15	987	ГПХ	Разовые работы	Временный	2024-01-06	2023-09-06
192	12	226	бессрочный	Полная занятость	Основной	2024-01-26	2020-06-04
193	17	140	срочный	Гибкий график	Временный	2023-12-22	2023-07-20
194	5	321	срочный	Полная занятость	Сезонный	2025-06-21	2024-07-28
195	11	247	бессрочный	Полная занятость	Основной	2025-11-20	2022-06-06
196	18	285	срочный	Полная занятость	Стажировка	2020-09-09	2020-02-01
197	20	138	срочный	Полная занятость	Сезонный	2023-11-27	2023-05-03
198	9	452	срочный	Гибкий график	Временный	2023-04-04	2022-06-08
199	6	818	срочный	Полная занятость	Стажировка	2024-06-09	2024-03-01
200	5	971	срочный	Гибкий график	Стажировка	2023-05-26	2022-10-10
201	18	414	срочный	Полная занятость	Стажировка	2023-05-12	2023-01-22
202	8	569	срочный	Полная занятость	Сезонный	2025-09-19	2024-12-20
203	1	383	срочный	Гибкий график	Сезонный	2025-05-16	2024-09-21
204	8	97	срочный	Полная занятость	Стажировка	2022-05-30	2021-07-22
205	20	159	бессрочный	Полная занятость	Основной	2028-03-24	2025-03-16
206	16	304	срочный	Гибкий график	Временный	2022-08-13	2022-04-02
207	6	433	срочный	Полная занятость	Стажировка	2025-05-21	2025-01-08
208	14	653	срочный	Полная занятость	Временный	2025-04-01	2024-05-05
209	5	854	ГПХ	Разовые работы	Временный	2022-05-06	2021-12-01
210	13	224	бессрочный	Полная занятость	Основной	2026-03-15	2021-12-26
211	20	742	срочный	Гибкий график	Стажировка	2026-03-05	2025-10-16
212	3	521	ГПХ	Разовые работы	Временный	2023-06-11	2023-02-13
213	14	468	срочный	Полная занятость	Сезонный	2021-02-12	2020-09-28
214	4	877	бессрочный	Гибкий график	Основной	2027-08-20	2023-11-19
215	8	459	срочный	Полная занятость	Сезонный	2023-09-16	2023-04-09
216	15	92	бессрочный	Гибкий график	Основной	2026-01-11	2022-11-05
217	3	261	бессрочный	Удаленная работа	Основной	2024-06-29	2020-08-16
218	1	369	ГПХ	Разовые работы	Временный	2020-07-08	2020-03-17
219	3	331	ГПХ	Разовые работы	Временный	2025-08-13	2025-04-26
220	4	631	бессрочный	Полная занятость	Основной	2029-10-20	2025-02-06
221	15	751	бессрочный	Удаленная работа	Основной	2024-07-25	2021-04-08
222	18	999	срочный	Вахтовый метод	Сезонный	2024-02-10	2023-03-01
223	8	717	срочный	Гибкий график	Временный	2024-10-08	2024-02-05
224	2	800	бессрочный	Полная занятость	Основной	2024-10-09	2020-01-15
225	8	317	ГПХ	Разовые работы	Временный	2022-09-20	2022-04-23
226	10	716	бессрочный	Полная занятость	Основной	2024-04-02	2020-05-20
227	5	156	ГПХ	Разовые работы	Временный	2025-05-07	2024-12-12
228	12	80	срочный	Гибкий график	Стажировка	2021-12-28	2021-01-15
229	8	350	срочный	Гибкий график	Стажировка	2022-11-02	2021-12-22
230	13	42	бессрочный	Гибкий график	Основной	2026-03-12	2022-09-20
231	18	583	ГПХ	Разовые работы	Временный	2021-01-14	2020-09-08
232	15	179	бессрочный	Полная занятость	Основной	2026-07-11	2022-08-24
233	6	10	бессрочный	Полная занятость	Основной	2024-11-26	2021-11-03
234	7	538	бессрочный	Полная занятость	Основной	2026-10-20	2023-05-01
235	19	729	ГПХ	Разовые работы	Временный	2021-07-05	2021-01-17
236	10	69	бессрочный	Гибкий график	Основной	2026-08-23	2022-03-06
237	20	626	бессрочный	Полная занятость	Основной	2024-04-09	2021-03-02
238	2	121	срочный	Вахтовый метод	Временный	2020-10-22	2020-05-26
239	13	404	срочный	Гибкий график	Временный	2024-01-17	2023-07-19
240	11	878	ГПХ	Разовые работы	Временный	2023-11-19	2023-10-15
241	5	768	ГПХ	Разовые работы	Временный	2022-03-22	2021-11-11
242	20	385	срочный	Полная занятость	Сезонный	2024-11-12	2024-03-21
243	20	908	срочный	Полная занятость	Стажировка	2025-11-26	2025-01-01
244	11	270	ГПХ	Разовые работы	Временный	2025-04-30	2024-12-16
245	7	521	бессрочный	Гибкий график	Основной	2026-10-15	2022-03-25
246	19	158	ГПХ	Разовые работы	Временный	2024-12-18	2024-07-28
247	10	842	бессрочный	Полная занятость	Основной	2028-01-30	2024-10-13
248	8	806	бессрочный	Полная занятость	Основной	2027-05-10	2023-07-24
249	16	935	срочный	Гибкий график	Стажировка	2024-02-05	2023-02-17
250	7	20	ГПХ	Разовые работы	Временный	2022-01-02	2021-09-12
251	10	135	бессрочный	Удаленная работа	Основной	2028-09-29	2025-01-27
252	20	848	срочный	Полная занятость	Временный	2024-12-12	2024-02-19
253	13	335	бессрочный	Гибкий график	Основной	2026-12-13	2023-10-09
254	6	83	срочный	Вахтовый метод	Сезонный	2023-07-28	2022-10-24
255	19	188	срочный	Вахтовый метод	Стажировка	2022-01-19	2021-08-26
256	1	668	бессрочный	Удаленная работа	Основной	2027-09-04	2023-12-02
257	19	479	ГПХ	Разовые работы	Временный	2025-07-31	2025-06-07
258	1	411	ГПХ	Разовые работы	Временный	2022-02-05	2021-09-23
259	12	23	ГПХ	Разовые работы	Временный	2022-07-18	2022-05-05
260	17	92	ГПХ	Разовые работы	Временный	2022-05-25	2022-03-09
261	20	883	бессрочный	Полная занятость	Основной	2028-01-10	2024-02-13
262	18	591	бессрочный	Удаленная работа	Основной	2026-11-01	2023-01-23
263	18	610	ГПХ	Разовые работы	Временный	2023-04-08	2023-01-14
264	15	248	срочный	Гибкий график	Стажировка	2020-12-13	2020-06-27
265	7	148	ГПХ	Разовые работы	Временный	2020-10-02	2020-06-17
266	1	703	бессрочный	Полная занятость	Основной	2029-05-19	2024-08-01
267	13	146	бессрочный	Полная занятость	Основной	2024-07-13	2020-01-30
268	18	83	бессрочный	Гибкий график	Основной	2027-01-24	2022-04-26
269	4	71	ГПХ	Разовые работы	Временный	2021-01-22	2020-10-04
270	20	141	бессрочный	Гибкий график	Основной	2028-03-07	2024-04-03
271	2	560	срочный	Вахтовый метод	Сезонный	2022-06-29	2021-08-11
272	16	977	срочный	Полная занятость	Сезонный	2025-11-04	2025-04-19
273	19	308	срочный	Вахтовый метод	Стажировка	2026-08-13	2025-11-27
274	12	197	бессрочный	Полная занятость	Основной	2026-05-21	2022-09-03
275	14	690	бессрочный	Удаленная работа	Основной	2027-02-12	2022-10-08
276	8	259	бессрочный	Полная занятость	Основной	2029-10-21	2025-08-23
277	20	986	ГПХ	Разовые работы	Временный	2025-10-25	2025-05-22
278	15	862	бессрочный	Гибкий график	Основной	2026-01-18	2021-04-28
279	1	359	бессрочный	Полная занятость	Основной	2029-05-25	2024-12-04
280	9	547	ГПХ	Разовые работы	Временный	2024-03-27	2023-12-07
281	10	809	срочный	Полная занятость	Стажировка	2025-10-10	2024-10-18
282	5	644	срочный	Полная занятость	Временный	2024-07-26	2024-02-09
283	17	991	бессрочный	Полная занятость	Основной	2028-07-16	2025-07-03
284	8	196	бессрочный	Гибкий график	Основной	2026-04-04	2022-08-16
285	15	472	срочный	Вахтовый метод	Сезонный	2024-12-02	2024-02-07
286	19	374	срочный	Гибкий график	Стажировка	2024-12-31	2024-04-01
287	5	748	срочный	Гибкий график	Временный	2021-04-25	2021-01-01
288	1	289	срочный	Полная занятость	Стажировка	2025-04-15	2024-12-23
289	16	863	срочный	Полная занятость	Сезонный	2026-02-20	2025-10-24
290	6	565	ГПХ	Разовые работы	Временный	2022-05-25	2022-04-18
291	2	849	срочный	Полная занятость	Стажировка	2021-10-31	2021-01-12
292	17	522	бессрочный	Полная занятость	Основной	2025-01-19	2021-12-14
293	13	672	срочный	Гибкий график	Сезонный	2024-08-14	2024-04-04
294	2	696	срочный	Полная занятость	Временный	2023-03-19	2022-09-20
295	16	116	срочный	Полная занятость	Временный	2026-02-03	2025-03-26
296	12	806	бессрочный	Удаленная работа	Основной	2026-01-07	2022-08-04
297	12	883	ГПХ	Разовые работы	Временный	2020-09-10	2020-07-17
298	20	449	ГПХ	Разовые работы	Временный	2022-08-13	2022-06-10
299	17	336	срочный	Полная занятость	Сезонный	2022-04-08	2021-04-08
300	14	374	срочный	Полная занятость	Временный	2024-05-05	2023-10-19
301	18	960	бессрочный	Гибкий график	Основной	2028-12-03	2025-07-11
302	13	614	бессрочный	Полная занятость	Основной	2030-08-03	2025-10-14
303	20	81	срочный	Полная занятость	Сезонный	2021-03-01	2020-08-29
304	12	664	срочный	Полная занятость	Стажировка	2021-03-01	2020-03-08
305	19	488	срочный	Полная занятость	Стажировка	2022-08-08	2021-09-16
306	14	351	срочный	Полная занятость	Сезонный	2026-05-14	2025-07-08
307	16	534	бессрочный	Гибкий график	Основной	2026-10-30	2022-05-26
308	13	281	срочный	Полная занятость	Временный	2024-08-17	2023-12-11
309	12	490	бессрочный	Удаленная работа	Основной	2028-04-03	2023-08-23
310	3	32	ГПХ	Разовые работы	Временный	2021-07-16	2021-05-18
311	16	499	срочный	Вахтовый метод	Стажировка	2025-01-07	2024-08-12
312	18	957	срочный	Полная занятость	Временный	2024-08-28	2023-12-12
313	19	355	ГПХ	Разовые работы	Временный	2020-09-30	2020-08-10
314	18	772	бессрочный	Удаленная работа	Основной	2026-11-08	2022-02-25
315	12	4	срочный	Гибкий график	Сезонный	2021-07-28	2021-03-14
316	15	36	бессрочный	Гибкий график	Основной	2025-07-18	2021-12-21
317	7	381	срочный	Полная занятость	Стажировка	2021-09-27	2020-10-10
318	3	501	срочный	Гибкий график	Временный	2021-07-20	2020-08-13
319	2	720	бессрочный	Гибкий график	Основной	2028-02-16	2024-12-04
320	16	155	ГПХ	Разовые работы	Временный	2024-01-27	2023-08-25
321	19	181	срочный	Гибкий график	Стажировка	2020-10-14	2020-02-01
322	17	178	бессрочный	Полная занятость	Основной	2026-05-09	2022-06-18
323	17	116	срочный	Полная занятость	Сезонный	2025-11-13	2025-05-20
324	5	925	бессрочный	Полная занятость	Основной	2027-08-08	2024-07-22
325	5	366	ГПХ	Разовые работы	Временный	2025-02-24	2025-01-01
326	9	939	ГПХ	Разовые работы	Временный	2022-09-20	2022-07-13
327	6	521	бессрочный	Полная занятость	Основной	2027-01-10	2022-04-21
328	12	55	ГПХ	Разовые работы	Временный	2020-11-15	2020-07-22
329	10	90	ГПХ	Разовые работы	Временный	2022-06-30	2022-03-28
330	4	107	ГПХ	Разовые работы	Временный	2020-08-18	2020-03-15
331	12	376	ГПХ	Разовые работы	Временный	2022-09-28	2022-06-01
332	17	354	срочный	Полная занятость	Сезонный	2024-09-30	2024-05-10
333	15	593	ГПХ	Разовые работы	Временный	2023-05-20	2023-03-31
334	17	552	срочный	Полная занятость	Стажировка	2024-11-12	2024-02-01
335	3	706	бессрочный	Полная занятость	Основной	2029-01-24	2025-01-31
336	4	844	ГПХ	Разовые работы	Временный	2022-07-16	2022-03-04
337	14	541	бессрочный	Полная занятость	Основной	2025-04-24	2022-03-06
338	7	302	бессрочный	Полная занятость	Основной	2027-06-11	2023-04-05
339	3	757	срочный	Полная занятость	Временный	2025-09-22	2025-05-20
340	19	670	ГПХ	Разовые работы	Временный	2022-06-26	2022-03-20
341	18	189	срочный	Полная занятость	Временный	2024-12-04	2024-01-11
342	7	348	ГПХ	Разовые работы	Временный	2025-12-07	2025-08-26
343	10	901	ГПХ	Разовые работы	Временный	2023-08-25	2023-06-19
344	19	786	бессрочный	Полная занятость	Основной	2024-09-14	2020-12-05
345	11	679	ГПХ	Разовые работы	Временный	2022-03-05	2021-10-21
346	15	345	бессрочный	Полная занятость	Основной	2025-04-28	2020-06-03
347	19	938	ГПХ	Разовые работы	Временный	2021-02-15	2020-09-06
348	19	450	срочный	Гибкий график	Временный	2021-09-22	2021-05-11
349	15	494	бессрочный	Гибкий график	Основной	2028-03-17	2024-09-23
350	16	953	ГПХ	Разовые работы	Временный	2021-10-20	2021-07-24
351	5	299	срочный	Полная занятость	Временный	2025-05-31	2024-09-28
352	18	29	бессрочный	Полная занятость	Основной	2029-03-16	2025-06-17
353	5	801	бессрочный	Полная занятость	Основной	2024-06-29	2021-02-14
354	18	654	бессрочный	Гибкий график	Основной	2028-11-27	2024-04-26
355	14	533	бессрочный	Полная занятость	Основной	2027-08-22	2024-08-21
356	10	969	бессрочный	Полная занятость	Основной	2023-02-07	2020-01-30
357	20	112	срочный	Полная занятость	Временный	2021-04-05	2020-12-21
358	18	157	срочный	Гибкий график	Сезонный	2025-09-20	2025-02-25
359	17	768	срочный	Полная занятость	Стажировка	2024-06-19	2023-11-30
360	12	240	срочный	Полная занятость	Сезонный	2021-11-24	2021-03-01
361	8	80	бессрочный	Полная занятость	Основной	2028-11-18	2025-03-03
362	18	851	срочный	Полная занятость	Стажировка	2025-11-17	2025-03-14
363	7	975	срочный	Полная занятость	Сезонный	2023-01-23	2022-03-22
364	19	681	ГПХ	Разовые работы	Временный	2025-10-10	2025-05-24
365	4	359	срочный	Полная занятость	Сезонный	2024-04-14	2023-11-28
366	3	419	ГПХ	Разовые работы	Временный	2021-03-04	2020-12-27
367	20	26	ГПХ	Разовые работы	Временный	2021-06-13	2021-02-22
368	4	923	бессрочный	Гибкий график	Основной	2025-09-11	2021-09-04
369	13	482	бессрочный	Удаленная работа	Основной	2029-06-28	2025-04-03
370	9	27	ГПХ	Разовые работы	Временный	2025-03-11	2025-01-30
371	6	349	срочный	Полная занятость	Стажировка	2022-06-29	2021-09-20
372	11	899	срочный	Вахтовый метод	Стажировка	2026-05-18	2025-10-28
373	16	385	срочный	Вахтовый метод	Сезонный	2023-09-21	2022-10-15
374	13	49	срочный	Вахтовый метод	Сезонный	2026-06-08	2025-06-17
375	4	208	бессрочный	Полная занятость	Основной	2028-07-31	2024-10-23
376	6	273	бессрочный	Удаленная работа	Основной	2028-04-02	2024-07-01
377	20	384	срочный	Полная занятость	Временный	2022-08-22	2021-08-22
378	18	145	бессрочный	Удаленная работа	Основной	2024-09-26	2021-03-09
379	10	202	ГПХ	Разовые работы	Временный	2021-11-18	2021-09-12
380	14	773	бессрочный	Полная занятость	Основной	2028-01-11	2024-05-06
381	9	826	ГПХ	Разовые работы	Временный	2024-01-03	2023-11-23
382	13	518	ГПХ	Разовые работы	Временный	2025-11-17	2025-09-06
383	13	337	ГПХ	Разовые работы	Временный	2020-08-28	2020-07-29
384	19	167	ГПХ	Разовые работы	Временный	2023-10-23	2023-08-28
385	18	586	срочный	Полная занятость	Временный	2022-02-06	2021-10-08
386	14	320	бессрочный	Гибкий график	Основной	2024-07-07	2021-03-14
387	15	564	бессрочный	Гибкий график	Основной	2025-12-28	2021-03-08
388	7	466	бессрочный	Полная занятость	Основной	2026-01-23	2022-05-16
389	9	324	срочный	Гибкий график	Стажировка	2023-12-28	2023-02-11
390	13	465	ГПХ	Разовые работы	Временный	2023-08-19	2023-02-27
391	19	931	срочный	Полная занятость	Сезонный	2024-05-06	2023-06-24
392	18	912	ГПХ	Разовые работы	Временный	2023-09-30	2023-04-06
393	4	353	срочный	Полная занятость	Сезонный	2026-01-02	2025-01-29
394	7	74	срочный	Полная занятость	Стажировка	2021-08-17	2021-04-12
395	6	422	бессрочный	Полная занятость	Основной	2026-01-30	2021-09-07
396	16	642	ГПХ	Разовые работы	Временный	2022-03-14	2021-10-28
397	6	992	срочный	Полная занятость	Сезонный	2023-08-11	2022-09-29
398	15	793	ГПХ	Разовые работы	Временный	2025-06-08	2025-05-01
399	14	729	срочный	Полная занятость	Временный	2023-06-29	2022-08-30
400	2	258	бессрочный	Гибкий график	Основной	2029-11-03	2025-03-05
401	4	428	срочный	Полная занятость	Стажировка	2021-12-23	2021-06-09
402	6	742	срочный	Полная занятость	Стажировка	2023-12-06	2023-02-11
403	9	4	срочный	Полная занятость	Стажировка	2021-05-30	2020-08-23
404	4	87	срочный	Гибкий график	Стажировка	2021-11-20	2020-11-30
405	1	169	бессрочный	Полная занятость	Основной	2029-12-06	2025-03-28
406	3	285	ГПХ	Разовые работы	Временный	2023-11-17	2023-09-18
407	17	76	бессрочный	Гибкий график	Основной	2028-07-15	2023-09-08
408	7	407	срочный	Гибкий график	Стажировка	2025-12-18	2025-02-06
409	15	220	бессрочный	Гибкий график	Основной	2028-04-18	2023-08-10
410	19	928	бессрочный	Полная занятость	Основной	2026-10-11	2022-11-06
411	12	689	срочный	Полная занятость	Стажировка	2022-11-01	2022-02-27
412	6	370	срочный	Гибкий график	Сезонный	2024-08-03	2024-04-02
413	10	962	бессрочный	Удаленная работа	Основной	2027-09-12	2023-08-19
414	2	412	ГПХ	Разовые работы	Временный	2025-09-07	2025-08-03
415	1	10	ГПХ	Разовые работы	Временный	2024-04-29	2023-12-08
416	6	83	срочный	Полная занятость	Временный	2021-08-21	2020-10-28
417	14	533	ГПХ	Разовые работы	Временный	2022-09-02	2022-05-29
418	20	691	ГПХ	Разовые работы	Временный	2021-08-05	2021-04-15
419	4	24	ГПХ	Разовые работы	Временный	2021-01-06	2020-07-22
420	2	147	ГПХ	Разовые работы	Временный	2024-07-14	2024-04-01
421	6	806	срочный	Полная занятость	Стажировка	2021-10-04	2021-04-09
422	11	806	бессрочный	Полная занятость	Основной	2029-10-29	2025-11-19
423	8	316	срочный	Гибкий график	Временный	2026-06-15	2025-10-28
424	1	174	бессрочный	Гибкий график	Основной	2025-10-31	2022-07-27
425	2	189	срочный	Полная занятость	Временный	2023-12-02	2023-01-01
426	16	413	ГПХ	Разовые работы	Временный	2022-06-05	2022-04-18
427	7	856	бессрочный	Полная занятость	Основной	2028-03-10	2024-05-12
428	11	4	срочный	Полная занятость	Сезонный	2021-01-30	2020-07-29
429	12	449	срочный	Полная занятость	Сезонный	2021-08-07	2021-04-29
430	15	615	срочный	Полная занятость	Сезонный	2025-06-10	2024-12-09
431	4	629	срочный	Полная занятость	Сезонный	2022-11-16	2022-04-06
432	14	538	бессрочный	Полная занятость	Основной	2027-07-01	2022-08-05
433	17	321	срочный	Полная занятость	Сезонный	2025-02-25	2024-03-20
434	16	393	срочный	Гибкий график	Сезонный	2025-03-30	2024-07-31
435	20	382	срочный	Полная занятость	Стажировка	2026-09-14	2025-11-07
436	18	787	бессрочный	Полная занятость	Основной	2029-04-26	2025-04-23
437	16	865	бессрочный	Полная занятость	Основной	2029-04-11	2024-11-17
438	15	952	срочный	Полная занятость	Временный	2026-04-17	2025-07-18
439	2	330	бессрочный	Полная занятость	Основной	2025-07-03	2020-07-24
440	18	763	срочный	Гибкий график	Стажировка	2023-08-21	2023-05-06
441	2	577	ГПХ	Разовые работы	Временный	2024-02-19	2023-12-22
442	4	126	бессрочный	Гибкий график	Основной	2024-10-13	2020-12-01
443	2	523	бессрочный	Полная занятость	Основной	2026-04-04	2022-05-20
444	10	952	срочный	Полная занятость	Временный	2025-10-11	2025-02-06
445	14	470	ГПХ	Разовые работы	Временный	2023-06-14	2023-05-02
446	7	761	срочный	Гибкий график	Стажировка	2023-06-14	2022-09-02
447	4	337	бессрочный	Полная занятость	Основной	2026-04-24	2022-11-20
448	19	613	бессрочный	Полная занятость	Основной	2025-11-20	2021-04-29
449	4	590	срочный	Полная занятость	Временный	2022-02-18	2021-04-15
450	2	566	ГПХ	Разовые работы	Временный	2020-10-28	2020-09-23
451	13	667	ГПХ	Разовые работы	Временный	2020-03-13	2020-01-25
452	20	543	бессрочный	Полная занятость	Основной	2026-03-08	2021-06-10
453	10	258	срочный	Полная занятость	Временный	2024-10-13	2023-11-22
454	19	656	бессрочный	Удаленная работа	Основной	2025-02-25	2021-12-17
455	15	470	бессрочный	Гибкий график	Основной	2029-09-07	2025-03-10
456	8	220	бессрочный	Полная занятость	Основной	2024-07-25	2021-07-04
457	3	508	срочный	Полная занятость	Стажировка	2022-05-21	2022-02-01
458	5	865	срочный	Гибкий график	Временный	2026-06-30	2025-10-04
459	9	738	ГПХ	Разовые работы	Временный	2021-12-18	2021-10-10
460	9	163	срочный	Вахтовый метод	Сезонный	2026-04-11	2025-10-03
461	19	612	бессрочный	Полная занятость	Основной	2029-05-22	2024-12-06
462	16	792	бессрочный	Полная занятость	Основной	2029-02-04	2025-01-19
463	16	439	ГПХ	Разовые работы	Временный	2024-06-19	2024-03-11
464	5	824	срочный	Полная занятость	Сезонный	2025-12-27	2025-07-19
465	10	406	бессрочный	Удаленная работа	Основной	2025-08-01	2020-11-20
466	8	925	срочный	Вахтовый метод	Сезонный	2023-11-20	2023-08-17
467	19	149	бессрочный	Полная занятость	Основной	2027-04-23	2022-09-19
468	20	372	ГПХ	Разовые работы	Временный	2025-07-21	2025-06-04
469	8	169	срочный	Полная занятость	Временный	2024-08-18	2024-05-04
470	12	570	бессрочный	Полная занятость	Основной	2028-06-04	2023-07-26
471	8	774	бессрочный	Гибкий график	Основной	2030-07-18	2025-08-24
472	7	389	ГПХ	Разовые работы	Временный	2020-07-11	2020-02-01
473	19	610	бессрочный	Полная занятость	Основной	2024-10-17	2020-09-25
474	10	951	бессрочный	Полная занятость	Основной	2028-11-05	2024-05-11
475	12	849	ГПХ	Разовые работы	Временный	2022-07-06	2022-02-11
476	17	474	срочный	Полная занятость	Сезонный	2021-06-23	2020-12-20
477	2	831	бессрочный	Гибкий график	Основной	2027-04-27	2024-01-01
478	19	756	срочный	Полная занятость	Стажировка	2021-08-07	2020-09-08
479	17	217	ГПХ	Разовые работы	Временный	2024-07-07	2024-04-03
480	9	990	срочный	Полная занятость	Стажировка	2026-02-02	2025-10-09
481	3	649	бессрочный	Удаленная работа	Основной	2023-09-19	2020-09-14
482	4	672	бессрочный	Удаленная работа	Основной	2027-12-25	2024-06-05
483	12	953	бессрочный	Гибкий график	Основной	2026-09-12	2022-11-04
484	18	128	бессрочный	Гибкий график	Основной	2027-11-19	2023-11-10
485	12	358	ГПХ	Разовые работы	Временный	2023-02-10	2022-08-29
486	6	194	ГПХ	Разовые работы	Временный	2023-05-23	2023-01-06
487	15	185	срочный	Вахтовый метод	Стажировка	2026-09-06	2025-10-20
488	15	470	срочный	Полная занятость	Временный	2026-03-29	2025-05-23
489	17	302	бессрочный	Полная занятость	Основной	2025-04-06	2021-10-29
490	19	934	срочный	Гибкий график	Временный	2024-05-05	2023-12-20
491	17	703	срочный	Гибкий график	Стажировка	2022-08-20	2021-10-19
492	9	814	бессрочный	Полная занятость	Основной	2030-06-16	2025-10-16
493	14	486	ГПХ	Разовые работы	Временный	2024-06-24	2024-03-27
494	11	700	бессрочный	Полная занятость	Основной	2028-12-24	2024-01-25
495	1	527	срочный	Полная занятость	Временный	2021-07-18	2021-04-11
496	5	924	бессрочный	Полная занятость	Основной	2024-03-25	2020-08-30
497	17	809	срочный	Гибкий график	Стажировка	2024-04-20	2023-07-14
498	14	119	бессрочный	Полная занятость	Основной	2027-03-01	2022-12-14
499	10	842	бессрочный	Удаленная работа	Основной	2027-05-16	2023-02-14
500	16	332	срочный	Гибкий график	Стажировка	2021-11-03	2021-05-11
501	7	551	срочный	Полная занятость	Временный	2021-09-14	2021-03-31
502	17	716	бессрочный	Полная занятость	Основной	2027-04-03	2022-08-07
503	5	254	срочный	Полная занятость	Стажировка	2024-11-24	2024-07-18
504	4	358	ГПХ	Разовые работы	Временный	2025-02-12	2024-12-04
505	7	932	ГПХ	Разовые работы	Временный	2020-04-29	2020-01-03
506	2	98	срочный	Гибкий график	Временный	2021-04-18	2020-05-03
507	19	142	бессрочный	Полная занятость	Основной	2028-08-06	2023-12-29
508	9	177	срочный	Полная занятость	Временный	2025-06-09	2025-01-27
509	16	224	ГПХ	Разовые работы	Временный	2022-03-10	2022-01-18
510	7	778	бессрочный	Гибкий график	Основной	2023-08-20	2020-01-09
511	8	195	бессрочный	Полная занятость	Основной	2023-09-06	2020-06-24
512	14	26	бессрочный	Полная занятость	Основной	2029-01-11	2024-08-19
513	12	232	срочный	Полная занятость	Стажировка	2023-08-30	2022-09-08
514	5	468	срочный	Полная занятость	Сезонный	2024-07-17	2023-10-04
515	2	771	срочный	Вахтовый метод	Стажировка	2022-08-22	2021-11-04
516	2	327	срочный	Гибкий график	Стажировка	2023-11-29	2023-01-19
517	18	574	бессрочный	Полная занятость	Основной	2028-04-20	2025-03-24
518	20	177	срочный	Полная занятость	Временный	2023-09-14	2022-10-11
519	1	812	срочный	Гибкий график	Сезонный	2022-05-07	2021-08-14
520	3	241	бессрочный	Удаленная работа	Основной	2025-04-06	2020-08-31
521	20	745	бессрочный	Гибкий график	Основной	2028-04-07	2024-09-06
522	12	538	ГПХ	Разовые работы	Временный	2026-02-01	2025-08-15
523	7	610	бессрочный	Полная занятость	Основной	2025-02-03	2021-08-09
524	18	53	ГПХ	Разовые работы	Временный	2021-08-13	2021-05-16
525	6	636	ГПХ	Разовые работы	Временный	2021-03-24	2021-02-09
526	3	366	ГПХ	Разовые работы	Временный	2020-06-08	2020-02-24
527	10	412	бессрочный	Полная занятость	Основной	2025-01-02	2020-01-22
528	5	569	срочный	Полная занятость	Временный	2021-01-29	2020-07-03
529	19	959	срочный	Гибкий график	Временный	2023-08-16	2023-05-13
530	9	323	бессрочный	Гибкий график	Основной	2025-05-14	2020-12-25
531	6	917	ГПХ	Разовые работы	Временный	2021-10-15	2021-07-26
532	12	111	срочный	Полная занятость	Временный	2023-06-01	2022-10-14
533	16	66	бессрочный	Полная занятость	Основной	2026-08-24	2023-07-30
534	15	520	бессрочный	Гибкий график	Основной	2025-03-14	2021-01-23
535	18	567	бессрочный	Удаленная работа	Основной	2024-02-02	2020-12-25
536	10	429	срочный	Вахтовый метод	Сезонный	2022-09-19	2022-04-28
537	13	341	срочный	Полная занятость	Временный	2025-07-31	2025-01-13
538	19	483	срочный	Полная занятость	Временный	2022-09-30	2022-01-02
539	13	565	бессрочный	Полная занятость	Основной	2029-08-31	2025-05-01
540	1	398	срочный	Гибкий график	Сезонный	2023-09-29	2023-02-24
541	16	742	бессрочный	Полная занятость	Основной	2025-10-22	2021-04-16
542	4	233	ГПХ	Разовые работы	Временный	2022-10-06	2022-08-20
543	19	340	срочный	Полная занятость	Стажировка	2026-03-31	2025-05-16
544	8	868	ГПХ	Разовые работы	Временный	2023-10-07	2023-06-27
545	16	516	бессрочный	Гибкий график	Основной	2026-07-14	2022-06-13
546	7	553	ГПХ	Разовые работы	Временный	2025-03-28	2024-11-20
547	20	988	бессрочный	Полная занятость	Основной	2026-08-17	2022-05-02
548	15	647	ГПХ	Разовые работы	Временный	2022-06-10	2022-02-14
549	16	309	ГПХ	Разовые работы	Временный	2024-01-03	2023-09-10
550	15	558	срочный	Полная занятость	Сезонный	2025-11-25	2025-02-14
551	8	522	ГПХ	Разовые работы	Временный	2024-09-01	2024-06-25
552	10	558	ГПХ	Разовые работы	Временный	2023-11-07	2023-05-11
553	1	544	срочный	Полная занятость	Стажировка	2022-03-25	2021-12-01
554	1	301	бессрочный	Полная занятость	Основной	2024-12-10	2020-11-23
555	3	644	срочный	Полная занятость	Стажировка	2025-04-16	2024-12-26
556	6	840	срочный	Полная занятость	Стажировка	2023-08-29	2023-02-28
557	1	459	бессрочный	Гибкий график	Основной	2029-07-10	2025-03-03
558	9	561	бессрочный	Полная занятость	Основной	2023-07-17	2020-01-19
559	13	974	бессрочный	Гибкий график	Основной	2025-06-15	2021-05-05
560	19	9	срочный	Полная занятость	Стажировка	2025-07-12	2024-08-05
561	18	810	ГПХ	Разовые работы	Временный	2021-01-08	2020-11-08
562	3	53	бессрочный	Гибкий график	Основной	2027-03-27	2023-05-12
563	13	999	срочный	Гибкий график	Временный	2026-01-07	2025-08-11
564	4	879	срочный	Полная занятость	Стажировка	2021-04-04	2020-11-25
565	20	522	бессрочный	Полная занятость	Основной	2028-11-04	2024-10-02
566	6	957	бессрочный	Полная занятость	Основной	2025-12-05	2021-07-25
567	5	579	бессрочный	Гибкий график	Основной	2027-08-11	2024-03-22
568	12	47	бессрочный	Полная занятость	Основной	2025-12-19	2021-01-16
569	15	462	ГПХ	Разовые работы	Временный	2023-02-05	2022-09-21
570	11	342	срочный	Полная занятость	Временный	2020-08-19	2020-04-10
571	1	784	бессрочный	Гибкий график	Основной	2025-06-10	2020-11-16
572	16	70	срочный	Полная занятость	Временный	2020-06-14	2020-01-08
573	3	996	срочный	Полная занятость	Временный	2024-02-12	2023-07-08
574	12	374	срочный	Полная занятость	Стажировка	2020-05-26	2020-02-26
575	17	137	бессрочный	Полная занятость	Основной	2030-05-30	2025-06-18
576	14	625	срочный	Гибкий график	Стажировка	2022-12-09	2022-05-26
577	5	208	срочный	Гибкий график	Стажировка	2023-01-24	2022-05-04
578	2	445	срочный	Полная занятость	Временный	2025-07-01	2024-08-01
579	15	313	срочный	Полная занятость	Сезонный	2025-08-11	2024-11-25
580	13	530	срочный	Полная занятость	Стажировка	2023-02-21	2022-04-16
581	19	942	срочный	Полная занятость	Стажировка	2022-12-01	2021-12-09
582	1	899	срочный	Полная занятость	Стажировка	2023-03-04	2022-05-10
583	11	783	бессрочный	Гибкий график	Основной	2026-08-04	2022-04-29
584	1	515	срочный	Вахтовый метод	Сезонный	2023-10-19	2023-03-02
585	10	510	срочный	Полная занятость	Стажировка	2021-09-16	2020-09-17
586	10	261	срочный	Полная занятость	Стажировка	2023-01-31	2022-05-22
587	5	369	бессрочный	Полная занятость	Основной	2028-12-27	2024-03-06
588	10	933	ГПХ	Разовые работы	Временный	2022-01-14	2021-10-25
589	17	61	срочный	Полная занятость	Временный	2020-10-19	2020-03-28
590	8	275	срочный	Полная занятость	Стажировка	2022-01-16	2021-06-27
591	19	892	бессрочный	Удаленная работа	Основной	2024-10-14	2020-05-04
592	7	793	ГПХ	Разовые работы	Временный	2026-02-28	2025-10-13
593	15	17	бессрочный	Полная занятость	Основной	2026-06-06	2023-01-27
594	10	15	бессрочный	Полная занятость	Основной	2028-06-11	2024-04-13
595	3	508	бессрочный	Полная занятость	Основной	2027-08-12	2024-04-02
596	19	464	срочный	Полная занятость	Сезонный	2025-04-09	2024-09-19
597	8	132	срочный	Полная занятость	Временный	2020-11-10	2020-05-02
598	17	213	срочный	Гибкий график	Сезонный	2023-11-16	2023-04-18
599	5	964	срочный	Гибкий график	Сезонный	2021-05-05	2020-12-11
600	9	872	ГПХ	Разовые работы	Временный	2023-04-28	2022-11-26
601	20	799	бессрочный	Полная занятость	Основной	2028-11-19	2025-11-20
602	16	427	бессрочный	Удаленная работа	Основной	2029-02-09	2024-02-19
603	11	415	срочный	Вахтовый метод	Стажировка	2024-01-12	2023-05-04
604	16	436	срочный	Гибкий график	Стажировка	2025-02-07	2024-06-30
605	14	104	бессрочный	Полная занятость	Основной	2029-06-13	2024-06-24
606	8	482	бессрочный	Полная занятость	Основной	2025-04-11	2022-01-24
607	7	717	срочный	Вахтовый метод	Стажировка	2025-04-18	2024-06-11
608	11	926	бессрочный	Полная занятость	Основной	2024-09-20	2020-03-31
609	19	753	срочный	Полная занятость	Стажировка	2025-08-30	2024-09-14
610	17	790	срочный	Гибкий график	Сезонный	2021-04-08	2020-08-16
611	15	541	бессрочный	Гибкий график	Основной	2026-02-25	2021-12-30
612	18	720	срочный	Вахтовый метод	Временный	2024-10-30	2024-04-13
613	10	146	ГПХ	Разовые работы	Временный	2025-05-24	2025-03-29
614	17	184	бессрочный	Полная занятость	Основной	2025-03-26	2021-05-22
615	6	160	бессрочный	Полная занятость	Основной	2024-12-17	2020-12-17
616	20	968	срочный	Вахтовый метод	Временный	2021-12-06	2021-02-02
617	8	481	бессрочный	Полная занятость	Основной	2029-04-03	2024-09-11
618	1	53	бессрочный	Удаленная работа	Основной	2024-07-15	2020-08-30
619	2	800	срочный	Гибкий график	Стажировка	2022-07-13	2022-03-29
620	17	745	бессрочный	Полная занятость	Основной	2026-08-09	2022-03-12
621	20	66	срочный	Полная занятость	Сезонный	2023-12-02	2022-12-18
622	20	998	бессрочный	Гибкий график	Основной	2029-10-12	2025-11-12
623	11	688	бессрочный	Гибкий график	Основной	2026-09-11	2022-10-09
624	1	388	срочный	Полная занятость	Сезонный	2026-08-21	2025-10-18
625	18	419	ГПХ	Разовые работы	Временный	2023-10-10	2023-05-30
626	11	550	бессрочный	Полная занятость	Основной	2024-10-14	2021-01-30
627	18	73	бессрочный	Удаленная работа	Основной	2025-07-10	2020-07-21
628	12	686	бессрочный	Полная занятость	Основной	2026-01-24	2022-12-10
629	15	866	бессрочный	Полная занятость	Основной	2029-01-19	2025-10-05
630	6	874	ГПХ	Разовые работы	Временный	2022-03-13	2022-01-24
631	12	942	срочный	Полная занятость	Временный	2023-11-08	2022-11-23
632	14	376	ГПХ	Разовые работы	Временный	2023-08-19	2023-07-08
633	11	893	ГПХ	Разовые работы	Временный	2025-09-24	2025-07-15
634	10	96	бессрочный	Полная занятость	Основной	2028-05-17	2024-01-27
635	12	108	бессрочный	Полная занятость	Основной	2027-05-29	2022-11-25
636	1	728	бессрочный	Удаленная работа	Основной	2027-02-22	2022-12-01
637	11	848	срочный	Гибкий график	Временный	2021-12-28	2021-02-28
638	19	677	бессрочный	Гибкий график	Основной	2027-12-30	2024-01-11
639	4	953	бессрочный	Полная занятость	Основной	2027-12-09	2024-03-07
640	9	863	бессрочный	Гибкий график	Основной	2025-07-07	2022-03-25
641	10	750	срочный	Полная занятость	Стажировка	2024-02-27	2023-04-08
642	17	320	срочный	Вахтовый метод	Сезонный	2023-11-08	2023-01-03
643	5	830	бессрочный	Полная занятость	Основной	2030-04-07	2025-05-11
644	11	622	срочный	Полная занятость	Сезонный	2023-12-30	2023-09-23
645	12	583	срочный	Полная занятость	Стажировка	2021-07-18	2020-10-12
646	20	201	бессрочный	Полная занятость	Основной	2025-04-04	2021-06-21
647	8	968	ГПХ	Разовые работы	Временный	2023-07-04	2023-04-01
648	8	44	срочный	Полная занятость	Сезонный	2025-02-10	2024-05-19
649	17	961	срочный	Полная занятость	Стажировка	2022-11-26	2022-05-09
650	4	320	ГПХ	Разовые работы	Временный	2022-12-12	2022-10-23
651	2	183	ГПХ	Разовые работы	Временный	2021-03-09	2021-01-15
652	8	999	срочный	Гибкий график	Временный	2024-07-16	2023-10-09
653	6	536	срочный	Вахтовый метод	Временный	2023-09-17	2023-01-16
654	2	858	бессрочный	Полная занятость	Основной	2029-09-27	2025-04-27
655	3	695	срочный	Полная занятость	Стажировка	2020-09-28	2020-02-17
656	7	241	ГПХ	Разовые работы	Временный	2021-12-02	2021-08-14
657	5	202	срочный	Полная занятость	Стажировка	2024-01-25	2023-07-07
658	18	32	срочный	Полная занятость	Временный	2024-08-05	2023-09-05
659	8	845	бессрочный	Полная занятость	Основной	2028-12-22	2024-12-14
660	20	330	бессрочный	Полная занятость	Основной	2027-08-21	2024-05-09
661	4	431	срочный	Полная занятость	Стажировка	2020-09-05	2020-03-23
662	3	586	срочный	Полная занятость	Сезонный	2023-05-30	2022-08-18
663	4	950	срочный	Полная занятость	Временный	2026-05-25	2025-07-27
664	15	316	бессрочный	Полная занятость	Основной	2028-08-08	2024-07-31
665	20	232	бессрочный	Полная занятость	Основной	2024-03-29	2020-12-16
666	9	636	бессрочный	Гибкий график	Основной	2023-12-30	2020-11-25
667	8	571	бессрочный	Полная занятость	Основной	2025-04-30	2021-02-23
668	9	305	срочный	Полная занятость	Стажировка	2026-07-03	2025-09-26
669	3	527	срочный	Полная занятость	Сезонный	2023-01-29	2022-04-24
670	15	447	срочный	Полная занятость	Стажировка	2026-02-27	2025-03-11
671	5	34	срочный	Полная занятость	Временный	2023-11-16	2023-08-05
672	7	501	бессрочный	Удаленная работа	Основной	2024-01-01	2020-03-29
673	16	853	ГПХ	Разовые работы	Временный	2024-06-09	2024-01-08
674	4	156	срочный	Полная занятость	Временный	2022-04-19	2021-10-27
675	4	533	срочный	Вахтовый метод	Временный	2023-03-12	2022-04-05
676	4	615	срочный	Полная занятость	Временный	2023-06-03	2022-09-16
677	19	207	ГПХ	Разовые работы	Временный	2022-07-17	2022-05-07
678	8	969	ГПХ	Разовые работы	Временный	2023-03-13	2022-12-24
679	17	975	ГПХ	Разовые работы	Временный	2023-02-28	2022-11-30
680	10	386	срочный	Полная занятость	Стажировка	2021-12-28	2021-02-10
681	13	792	ГПХ	Разовые работы	Временный	2023-11-12	2023-09-29
682	12	177	срочный	Полная занятость	Временный	2023-12-18	2023-07-04
683	20	451	срочный	Полная занятость	Сезонный	2021-01-30	2020-10-01
684	18	168	ГПХ	Разовые работы	Временный	2022-10-19	2022-07-16
685	8	923	ГПХ	Разовые работы	Временный	2020-08-24	2020-07-05
686	1	361	срочный	Полная занятость	Стажировка	2023-12-25	2023-06-08
687	18	194	срочный	Полная занятость	Временный	2026-08-10	2025-10-20
688	9	65	бессрочный	Гибкий график	Основной	2027-09-14	2023-08-05
689	20	594	ГПХ	Разовые работы	Временный	2024-10-27	2024-06-29
690	16	451	бессрочный	Полная занятость	Основной	2028-02-03	2024-05-21
691	20	28	ГПХ	Разовые работы	Временный	2020-11-26	2020-10-20
692	16	323	ГПХ	Разовые работы	Временный	2022-05-24	2022-02-04
693	7	581	бессрочный	Полная занятость	Основной	2026-07-24	2022-10-19
694	20	601	бессрочный	Полная занятость	Основной	2029-11-12	2024-12-05
695	18	482	срочный	Полная занятость	Временный	2023-11-26	2023-04-13
696	17	694	ГПХ	Разовые работы	Временный	2024-06-29	2024-04-18
697	14	507	бессрочный	Гибкий график	Основной	2024-01-23	2020-12-13
698	11	538	срочный	Полная занятость	Сезонный	2024-12-16	2024-04-24
699	3	146	срочный	Полная занятость	Временный	2021-01-02	2020-04-08
700	14	694	бессрочный	Полная занятость	Основной	2025-03-27	2021-05-28
701	7	120	бессрочный	Полная занятость	Основной	2027-11-29	2023-04-06
702	19	386	бессрочный	Гибкий график	Основной	2026-06-26	2022-09-01
703	11	513	ГПХ	Разовые работы	Временный	2022-07-19	2022-04-17
704	14	878	ГПХ	Разовые работы	Временный	2024-03-30	2024-02-12
705	13	98	бессрочный	Полная занятость	Основной	2023-03-22	2020-01-16
706	2	853	срочный	Полная занятость	Временный	2022-01-20	2021-09-09
707	9	208	срочный	Полная занятость	Сезонный	2024-09-14	2023-09-22
708	11	971	срочный	Гибкий график	Временный	2023-08-12	2022-10-13
709	17	499	срочный	Вахтовый метод	Стажировка	2022-09-20	2022-02-24
710	3	141	ГПХ	Разовые работы	Временный	2021-02-15	2021-01-13
711	15	585	ГПХ	Разовые работы	Временный	2025-08-23	2025-05-26
712	18	577	бессрочный	Полная занятость	Основной	2026-07-22	2022-10-15
713	6	457	срочный	Гибкий график	Временный	2025-11-13	2025-02-11
714	19	830	бессрочный	Полная занятость	Основной	2026-04-23	2022-03-27
715	10	712	срочный	Полная занятость	Стажировка	2021-05-02	2020-11-15
716	17	146	бессрочный	Полная занятость	Основной	2026-02-25	2022-06-16
717	4	612	срочный	Вахтовый метод	Стажировка	2021-08-20	2021-03-24
718	19	843	бессрочный	Полная занятость	Основной	2027-03-23	2022-05-15
719	18	298	бессрочный	Полная занятость	Основной	2026-08-14	2022-03-13
720	15	448	срочный	Полная занятость	Временный	2020-11-15	2020-07-29
721	10	631	срочный	Гибкий график	Стажировка	2026-04-26	2025-09-02
722	19	154	срочный	Гибкий график	Сезонный	2021-04-16	2020-08-23
723	12	654	срочный	Полная занятость	Стажировка	2023-09-15	2023-04-17
724	19	503	ГПХ	Разовые работы	Временный	2024-10-30	2024-06-27
725	18	49	бессрочный	Полная занятость	Основной	2026-12-24	2022-01-23
726	17	366	ГПХ	Разовые работы	Временный	2020-08-11	2020-04-01
727	3	926	бессрочный	Гибкий график	Основной	2025-11-09	2022-03-26
728	4	778	срочный	Вахтовый метод	Временный	2024-12-22	2024-01-12
729	14	622	бессрочный	Полная занятость	Основной	2030-05-22	2025-11-07
730	2	760	ГПХ	Разовые работы	Временный	2021-04-12	2021-03-03
731	16	850	бессрочный	Полная занятость	Основной	2027-02-10	2023-11-16
732	7	788	бессрочный	Полная занятость	Основной	2030-08-05	2025-11-17
733	13	980	бессрочный	Полная занятость	Основной	2029-10-15	2025-06-28
734	2	452	срочный	Гибкий график	Временный	2023-09-22	2023-03-06
735	9	952	ГПХ	Разовые работы	Временный	2025-05-01	2024-12-17
736	13	650	ГПХ	Разовые работы	Временный	2022-01-24	2021-09-01
737	7	591	срочный	Гибкий график	Сезонный	2024-01-27	2023-06-10
738	11	754	бессрочный	Полная занятость	Основной	2024-07-09	2020-06-23
739	5	76	срочный	Вахтовый метод	Сезонный	2023-04-05	2022-04-21
740	10	400	срочный	Полная занятость	Временный	2024-08-14	2023-11-24
741	2	361	бессрочный	Полная занятость	Основной	2024-06-22	2020-07-04
742	16	363	бессрочный	Полная занятость	Основной	2025-08-16	2021-01-07
743	13	568	ГПХ	Разовые работы	Временный	2021-01-20	2020-11-18
744	7	325	бессрочный	Гибкий график	Основной	2027-03-19	2024-01-23
745	4	489	срочный	Полная занятость	Временный	2023-11-18	2023-06-14
746	14	306	ГПХ	Разовые работы	Временный	2022-02-21	2021-08-27
747	3	99	срочный	Полная занятость	Стажировка	2021-10-23	2020-10-25
748	12	892	бессрочный	Полная занятость	Основной	2024-11-21	2021-07-16
749	17	366	бессрочный	Полная занятость	Основной	2024-10-22	2020-10-04
750	9	595	бессрочный	Удаленная работа	Основной	2028-12-13	2025-04-26
751	6	945	ГПХ	Разовые работы	Временный	2023-11-02	2023-08-28
752	4	568	ГПХ	Разовые работы	Временный	2024-07-10	2024-05-12
753	4	110	срочный	Полная занятость	Временный	2021-12-26	2021-09-04
754	7	502	срочный	Полная занятость	Временный	2026-02-09	2025-09-27
755	2	605	срочный	Гибкий график	Сезонный	2025-11-15	2025-04-16
756	8	762	бессрочный	Полная занятость	Основной	2023-11-19	2020-02-20
757	9	526	ГПХ	Разовые работы	Временный	2020-07-22	2020-04-01
758	4	201	срочный	Полная занятость	Временный	2020-10-15	2020-02-11
759	2	863	ГПХ	Разовые работы	Временный	2024-09-26	2024-08-07
760	6	942	бессрочный	Полная занятость	Основной	2028-07-25	2024-03-28
761	9	434	срочный	Полная занятость	Временный	2023-04-27	2023-01-24
762	10	211	бессрочный	Полная занятость	Основной	2025-02-16	2021-03-11
763	8	698	бессрочный	Полная занятость	Основной	2026-03-16	2022-10-13
764	16	171	бессрочный	Полная занятость	Основной	2028-10-22	2025-04-09
765	5	229	срочный	Гибкий график	Стажировка	2025-10-24	2024-10-28
766	18	407	бессрочный	Полная занятость	Основной	2027-10-12	2023-06-04
767	4	925	срочный	Полная занятость	Стажировка	2024-03-09	2023-10-30
768	7	989	бессрочный	Полная занятость	Основной	2027-02-21	2023-02-22
769	15	46	бессрочный	Полная занятость	Основной	2025-03-05	2021-12-27
770	11	830	срочный	Полная занятость	Сезонный	2023-08-02	2022-10-16
771	20	910	ГПХ	Разовые работы	Временный	2024-09-26	2024-08-08
772	1	927	бессрочный	Полная занятость	Основной	2025-07-21	2020-08-30
773	1	598	срочный	Полная занятость	Сезонный	2022-03-06	2021-10-01
774	11	113	срочный	Полная занятость	Сезонный	2026-07-23	2025-08-01
775	4	796	срочный	Гибкий график	Сезонный	2020-11-24	2020-04-14
776	9	795	срочный	Полная занятость	Стажировка	2023-04-04	2022-05-22
777	15	584	ГПХ	Разовые работы	Временный	2023-08-24	2023-03-03
778	4	748	срочный	Полная занятость	Стажировка	2024-06-06	2023-06-28
779	20	411	срочный	Полная занятость	Стажировка	2021-05-16	2021-01-18
780	9	316	ГПХ	Разовые работы	Временный	2024-02-03	2023-10-28
781	5	559	срочный	Полная занятость	Временный	2022-06-27	2021-12-14
782	16	699	срочный	Полная занятость	Сезонный	2024-01-19	2023-10-12
783	15	198	бессрочный	Полная занятость	Основной	2025-05-04	2020-06-14
784	10	688	бессрочный	Полная занятость	Основной	2029-12-08	2025-10-31
785	4	541	срочный	Гибкий график	Стажировка	2022-01-30	2021-09-19
786	14	80	ГПХ	Разовые работы	Временный	2025-06-15	2025-05-06
787	13	454	ГПХ	Разовые работы	Временный	2021-11-30	2021-07-02
788	1	729	срочный	Гибкий график	Временный	2020-08-27	2020-01-03
789	12	811	бессрочный	Гибкий график	Основной	2024-10-02	2020-11-14
790	20	186	ГПХ	Разовые работы	Временный	2022-09-08	2022-05-20
791	11	340	ГПХ	Разовые работы	Временный	2023-07-15	2023-04-23
792	18	184	бессрочный	Полная занятость	Основной	2026-11-28	2023-04-25
793	19	348	ГПХ	Разовые работы	Временный	2025-07-19	2025-02-20
794	1	326	бессрочный	Полная занятость	Основной	2025-11-08	2020-12-23
795	3	897	срочный	Полная занятость	Стажировка	2026-03-08	2025-07-31
796	4	815	срочный	Полная занятость	Временный	2021-09-30	2020-10-13
797	7	170	бессрочный	Полная занятость	Основной	2025-01-20	2021-10-28
798	5	6	срочный	Полная занятость	Сезонный	2025-04-05	2025-01-05
799	1	85	срочный	Полная занятость	Временный	2025-07-27	2024-11-19
800	1	1000	срочный	Вахтовый метод	Временный	2023-03-09	2022-07-09
801	8	778	бессрочный	Полная занятость	Основной	2025-11-08	2021-08-02
802	3	759	срочный	Полная занятость	Временный	2023-06-27	2022-08-04
803	1	328	бессрочный	Полная занятость	Основной	2026-04-14	2022-08-02
804	5	705	бессрочный	Полная занятость	Основной	2024-02-25	2020-03-13
805	4	843	бессрочный	Полная занятость	Основной	2028-07-02	2024-08-09
806	1	320	бессрочный	Полная занятость	Основной	2027-07-16	2023-09-08
807	12	831	ГПХ	Разовые работы	Временный	2024-11-19	2024-10-14
808	15	909	срочный	Гибкий график	Временный	2023-11-10	2023-02-19
809	6	873	бессрочный	Полная занятость	Основной	2024-07-01	2020-05-04
810	6	215	бессрочный	Гибкий график	Основной	2027-11-28	2023-08-24
811	12	602	срочный	Полная занятость	Сезонный	2023-10-21	2023-03-20
812	4	754	бессрочный	Полная занятость	Основной	2024-09-30	2020-03-09
813	5	746	ГПХ	Разовые работы	Временный	2025-09-06	2025-03-31
814	1	710	бессрочный	Полная занятость	Основной	2028-08-08	2024-09-17
815	15	567	срочный	Полная занятость	Временный	2024-08-15	2024-03-27
816	15	727	бессрочный	Полная занятость	Основной	2027-12-30	2023-07-17
817	18	253	бессрочный	Полная занятость	Основной	2024-12-13	2020-05-02
818	7	995	ГПХ	Разовые работы	Временный	2023-02-22	2022-10-24
819	9	736	бессрочный	Гибкий график	Основной	2026-01-31	2022-01-31
820	18	559	срочный	Гибкий график	Временный	2026-03-07	2025-04-08
821	10	207	срочный	Гибкий график	Стажировка	2024-05-17	2023-11-16
822	20	256	срочный	Полная занятость	Временный	2026-04-10	2025-07-01
823	3	43	бессрочный	Полная занятость	Основной	2028-11-12	2024-05-15
824	11	16	бессрочный	Полная занятость	Основной	2029-07-30	2025-09-10
825	16	927	срочный	Полная занятость	Сезонный	2025-02-11	2024-07-18
826	12	640	ГПХ	Разовые работы	Временный	2021-09-09	2021-07-01
827	13	820	срочный	Гибкий график	Сезонный	2023-09-10	2023-01-25
828	17	726	ГПХ	Разовые работы	Временный	2022-06-09	2022-01-02
829	3	857	бессрочный	Полная занятость	Основной	2028-04-20	2023-10-15
830	11	757	срочный	Полная занятость	Сезонный	2023-09-25	2023-05-24
831	19	622	срочный	Гибкий график	Стажировка	2022-05-03	2021-08-11
832	7	736	бессрочный	Полная занятость	Основной	2024-06-08	2020-09-27
833	6	758	срочный	Полная занятость	Стажировка	2022-03-10	2021-06-14
834	7	175	срочный	Гибкий график	Сезонный	2025-05-22	2025-01-23
835	16	480	срочный	Вахтовый метод	Стажировка	2022-05-21	2021-12-09
836	19	668	бессрочный	Гибкий график	Основной	2028-10-29	2025-05-25
837	5	615	бессрочный	Полная занятость	Основной	2027-12-18	2024-02-12
838	17	82	срочный	Гибкий график	Сезонный	2021-09-05	2020-11-23
839	4	415	бессрочный	Полная занятость	Основной	2028-06-13	2024-11-20
840	2	306	ГПХ	Разовые работы	Временный	2020-02-27	2020-01-16
841	7	576	бессрочный	Полная занятость	Основной	2028-01-06	2023-10-25
842	5	131	ГПХ	Разовые работы	Временный	2022-12-06	2022-07-28
843	3	124	ГПХ	Разовые работы	Временный	2023-06-09	2023-04-27
844	18	905	срочный	Полная занятость	Стажировка	2026-01-26	2025-08-30
845	2	847	ГПХ	Разовые работы	Временный	2022-12-08	2022-06-25
846	3	347	бессрочный	Удаленная работа	Основной	2025-09-13	2021-09-27
847	1	957	бессрочный	Полная занятость	Основной	2025-10-03	2022-02-16
848	11	945	срочный	Полная занятость	Сезонный	2026-08-20	2025-08-26
849	3	559	срочный	Гибкий график	Стажировка	2021-03-21	2020-10-08
850	19	770	срочный	Полная занятость	Временный	2025-02-01	2024-05-26
851	15	808	бессрочный	Полная занятость	Основной	2026-09-12	2023-09-03
852	16	814	бессрочный	Полная занятость	Основной	2024-06-09	2020-12-03
853	19	183	бессрочный	Полная занятость	Основной	2026-06-12	2023-03-26
854	6	908	ГПХ	Разовые работы	Временный	2022-12-08	2022-06-14
855	1	406	срочный	Гибкий график	Сезонный	2025-01-16	2024-08-27
856	15	548	бессрочный	Полная занятость	Основной	2029-08-05	2024-11-18
857	11	385	срочный	Полная занятость	Стажировка	2024-08-13	2024-04-13
858	19	704	бессрочный	Полная занятость	Основной	2023-12-05	2020-05-18
859	18	842	ГПХ	Разовые работы	Временный	2024-02-23	2023-09-26
860	5	515	бессрочный	Полная занятость	Основной	2025-04-30	2022-05-01
861	2	260	срочный	Гибкий график	Стажировка	2021-11-04	2021-07-02
862	16	355	срочный	Полная занятость	Стажировка	2026-01-03	2025-05-15
863	15	783	бессрочный	Полная занятость	Основной	2025-10-22	2022-08-16
864	7	474	ГПХ	Разовые работы	Временный	2025-03-16	2024-11-14
865	4	558	ГПХ	Разовые работы	Временный	2022-12-04	2022-10-27
866	2	510	ГПХ	Разовые работы	Временный	2021-12-18	2021-07-06
867	18	135	срочный	Полная занятость	Сезонный	2021-12-05	2021-07-03
868	20	617	срочный	Полная занятость	Сезонный	2023-09-14	2022-09-26
869	12	1	срочный	Гибкий график	Стажировка	2025-12-08	2025-02-17
870	11	672	бессрочный	Гибкий график	Основной	2026-04-06	2023-02-13
871	3	704	ГПХ	Разовые работы	Временный	2020-07-27	2020-02-29
872	7	53	бессрочный	Гибкий график	Основной	2026-03-06	2022-03-01
873	8	871	бессрочный	Полная занятость	Основной	2026-01-01	2021-11-22
874	2	347	срочный	Гибкий график	Сезонный	2025-09-08	2025-04-21
875	7	480	бессрочный	Полная занятость	Основной	2026-08-30	2022-12-11
876	16	828	бессрочный	Полная занятость	Основной	2026-01-23	2021-07-24
877	20	699	срочный	Полная занятость	Временный	2023-03-11	2022-06-27
878	11	358	ГПХ	Разовые работы	Временный	2021-10-08	2021-05-09
879	12	883	бессрочный	Гибкий график	Основной	2024-10-23	2020-02-17
880	17	985	бессрочный	Полная занятость	Основной	2024-07-02	2020-02-17
881	12	630	ГПХ	Разовые работы	Временный	2024-07-11	2024-01-24
882	2	671	ГПХ	Разовые работы	Временный	2024-07-13	2024-03-15
883	11	148	ГПХ	Разовые работы	Временный	2022-01-02	2021-07-07
884	13	328	срочный	Гибкий график	Стажировка	2025-06-10	2024-12-15
885	2	316	срочный	Гибкий график	Временный	2020-06-17	2020-01-29
886	19	904	бессрочный	Полная занятость	Основной	2026-08-15	2022-12-11
887	13	806	срочный	Вахтовый метод	Сезонный	2024-05-02	2023-05-18
888	9	954	срочный	Полная занятость	Временный	2023-09-19	2022-12-22
889	5	431	срочный	Полная занятость	Сезонный	2023-10-17	2022-12-15
890	11	217	бессрочный	Полная занятость	Основной	2023-05-23	2020-04-06
891	16	868	срочный	Полная занятость	Временный	2023-05-06	2022-10-09
892	6	227	ГПХ	Разовые работы	Временный	2025-03-20	2025-01-14
893	4	854	срочный	Гибкий график	Стажировка	2022-09-26	2021-10-12
894	16	821	ГПХ	Разовые работы	Временный	2021-07-31	2021-04-25
895	1	826	бессрочный	Гибкий график	Основной	2024-08-24	2021-08-24
896	2	635	срочный	Гибкий график	Временный	2022-01-24	2021-08-03
897	7	164	бессрочный	Полная занятость	Основной	2027-12-11	2024-03-19
898	10	770	бессрочный	Полная занятость	Основной	2024-03-13	2020-12-05
899	11	166	ГПХ	Разовые работы	Временный	2021-11-19	2021-08-18
900	2	760	ГПХ	Разовые работы	Временный	2024-02-09	2023-10-29
901	14	953	срочный	Полная занятость	Временный	2023-05-12	2022-10-29
902	11	473	бессрочный	Полная занятость	Основной	2025-10-20	2021-02-05
903	9	313	срочный	Полная занятость	Сезонный	2023-05-23	2022-07-31
904	18	748	ГПХ	Разовые работы	Временный	2021-03-14	2020-11-25
905	12	920	бессрочный	Удаленная работа	Основной	2027-07-10	2024-03-06
906	3	87	срочный	Гибкий график	Стажировка	2022-01-09	2021-04-27
907	1	799	бессрочный	Гибкий график	Основной	2027-12-08	2023-08-06
908	17	634	срочный	Полная занятость	Сезонный	2023-10-16	2023-02-24
909	9	950	срочный	Полная занятость	Стажировка	2024-10-31	2024-03-26
910	1	156	срочный	Полная занятость	Временный	2020-06-04	2020-01-03
911	4	342	срочный	Полная занятость	Стажировка	2025-10-02	2025-01-05
912	18	510	бессрочный	Полная занятость	Основной	2025-12-22	2022-04-22
913	12	505	бессрочный	Полная занятость	Основной	2027-01-29	2023-04-22
914	3	574	бессрочный	Полная занятость	Основной	2028-07-20	2024-06-02
915	6	56	бессрочный	Полная занятость	Основной	2030-03-02	2025-10-15
916	3	812	бессрочный	Полная занятость	Основной	2024-06-04	2020-03-22
917	17	766	бессрочный	Полная занятость	Основной	2024-06-30	2020-11-10
918	15	664	бессрочный	Полная занятость	Основной	2026-09-27	2022-11-15
919	14	618	срочный	Полная занятость	Стажировка	2025-07-02	2025-01-26
920	19	738	срочный	Полная занятость	Стажировка	2023-05-02	2022-12-20
921	10	434	ГПХ	Разовые работы	Временный	2024-10-26	2024-09-19
922	20	810	срочный	Полная занятость	Стажировка	2020-10-08	2020-01-20
923	7	823	срочный	Гибкий график	Сезонный	2026-04-20	2025-08-18
924	6	318	срочный	Полная занятость	Стажировка	2026-02-24	2025-08-25
925	1	633	бессрочный	Полная занятость	Основной	2024-05-13	2020-08-16
926	14	222	срочный	Гибкий график	Временный	2021-06-23	2020-12-13
927	20	418	срочный	Вахтовый метод	Временный	2021-02-03	2020-03-29
928	10	716	бессрочный	Полная занятость	Основной	2027-12-14	2023-06-08
929	1	667	бессрочный	Гибкий график	Основной	2026-01-06	2023-01-06
930	18	13	срочный	Полная занятость	Стажировка	2023-09-29	2023-07-01
931	16	384	срочный	Полная занятость	Временный	2023-06-24	2023-03-15
932	20	894	ГПХ	Разовые работы	Временный	2020-11-07	2020-06-27
933	1	318	срочный	Гибкий график	Временный	2025-03-03	2024-03-23
934	8	819	бессрочный	Полная занятость	Основной	2024-02-16	2020-09-06
935	14	234	бессрочный	Полная занятость	Основной	2029-08-22	2025-04-08
936	2	529	срочный	Гибкий график	Сезонный	2025-08-03	2024-12-13
937	20	781	бессрочный	Гибкий график	Основной	2028-07-28	2023-12-21
938	12	50	срочный	Полная занятость	Временный	2026-05-02	2025-05-10
939	14	29	бессрочный	Полная занятость	Основной	2024-01-07	2020-09-04
940	15	902	бессрочный	Полная занятость	Основной	2024-10-08	2021-05-17
941	8	19	ГПХ	Разовые работы	Временный	2024-08-31	2024-07-18
942	17	109	срочный	Полная занятость	Стажировка	2024-09-15	2024-02-17
943	15	422	ГПХ	Разовые работы	Временный	2024-11-23	2024-07-30
944	5	370	срочный	Гибкий график	Временный	2024-12-05	2024-04-29
945	17	904	срочный	Полная занятость	Стажировка	2021-12-06	2020-12-23
946	1	581	бессрочный	Удаленная работа	Основной	2027-01-17	2022-04-02
947	12	136	бессрочный	Полная занятость	Основной	2024-10-26	2020-06-08
948	16	554	срочный	Полная занятость	Сезонный	2022-02-04	2021-04-07
949	6	714	бессрочный	Гибкий график	Основной	2029-10-28	2025-09-25
950	11	121	срочный	Полная занятость	Сезонный	2022-09-16	2021-12-24
951	20	910	бессрочный	Полная занятость	Основной	2027-06-19	2023-01-23
952	13	950	бессрочный	Гибкий график	Основной	2025-10-12	2022-08-22
953	5	771	ГПХ	Разовые работы	Временный	2024-03-20	2023-10-18
954	17	748	бессрочный	Гибкий график	Основной	2024-06-24	2020-12-08
955	6	267	срочный	Полная занятость	Сезонный	2026-05-10	2025-11-09
956	4	986	ГПХ	Разовые работы	Временный	2025-03-28	2024-12-18
957	6	200	срочный	Полная занятость	Временный	2024-03-25	2023-08-23
958	16	741	срочный	Полная занятость	Стажировка	2021-03-21	2020-12-07
959	10	838	бессрочный	Полная занятость	Основной	2029-03-05	2025-04-21
960	17	80	срочный	Гибкий график	Стажировка	2020-10-26	2020-02-07
961	14	380	бессрочный	Полная занятость	Основной	2027-04-05	2024-01-23
962	12	608	срочный	Полная занятость	Временный	2022-11-11	2021-11-29
963	14	470	срочный	Полная занятость	Стажировка	2021-04-15	2020-11-08
964	2	121	бессрочный	Полная занятость	Основной	2024-04-20	2021-03-27
965	12	846	срочный	Полная занятость	Временный	2026-06-15	2025-09-23
966	7	456	срочный	Полная занятость	Стажировка	2021-06-24	2020-07-05
967	14	328	бессрочный	Полная занятость	Основной	2023-04-01	2020-03-19
968	3	50	срочный	Вахтовый метод	Временный	2024-06-25	2023-07-31
969	5	26	ГПХ	Разовые работы	Временный	2022-08-29	2022-04-13
970	4	619	срочный	Полная занятость	Стажировка	2021-11-18	2021-07-26
971	16	478	ГПХ	Разовые работы	Временный	2022-08-24	2022-02-28
972	19	690	бессрочный	Полная занятость	Основной	2025-10-25	2022-02-15
973	20	860	срочный	Вахтовый метод	Стажировка	2025-10-03	2025-02-15
974	19	809	срочный	Вахтовый метод	Сезонный	2025-12-12	2025-08-02
975	10	827	срочный	Гибкий график	Сезонный	2026-02-19	2025-10-27
976	9	411	бессрочный	Полная занятость	Основной	2027-12-03	2023-02-19
977	15	412	бессрочный	Гибкий график	Основной	2028-11-01	2025-06-11
978	19	85	бессрочный	Полная занятость	Основной	2029-01-14	2024-11-13
979	15	205	бессрочный	Полная занятость	Основной	2028-04-22	2024-01-14
980	18	725	срочный	Полная занятость	Стажировка	2026-10-01	2025-11-02
981	16	31	ГПХ	Разовые работы	Временный	2025-10-01	2025-07-23
982	9	741	бессрочный	Полная занятость	Основной	2024-02-28	2020-03-22
983	19	755	ГПХ	Разовые работы	Временный	2021-04-15	2020-12-02
984	18	387	бессрочный	Полная занятость	Основной	2027-08-15	2022-12-11
985	16	919	бессрочный	Полная занятость	Основной	2026-07-14	2022-08-08
986	19	536	ГПХ	Разовые работы	Временный	2023-09-11	2023-06-29
987	12	157	срочный	Полная занятость	Временный	2022-01-08	2021-01-19
988	14	968	срочный	Гибкий график	Сезонный	2026-04-26	2025-09-18
989	15	79	срочный	Полная занятость	Стажировка	2025-12-28	2025-01-28
990	2	498	бессрочный	Гибкий график	Основной	2025-06-17	2022-05-10
991	15	844	ГПХ	Разовые работы	Временный	2022-01-01	2021-10-02
992	3	704	срочный	Полная занятость	Сезонный	2020-09-20	2020-05-09
993	7	583	срочный	Полная занятость	Временный	2021-08-16	2021-05-06
994	3	502	ГПХ	Разовые работы	Временный	2020-03-17	2020-02-10
995	10	692	ГПХ	Разовые работы	Временный	2023-07-05	2023-03-27
996	3	783	срочный	Гибкий график	Сезонный	2025-12-18	2025-03-22
997	12	212	срочный	Гибкий график	Сезонный	2024-10-14	2024-06-23
998	16	619	срочный	Полная занятость	Сезонный	2023-07-05	2022-11-29
999	11	418	срочный	Полная занятость	Сезонный	2025-10-15	2025-05-05
1000	2	63	бессрочный	Полная занятость	Основной	2028-01-20	2023-08-10
\.


                                                                                                                                                                                                                                                                                                                      4924.dat                                                                                            0000600 0004000 0002000 00000072273 14771407746 0014310 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	младший Техник	1
2	младший Менеджер	1
3	Ресепшионист	1
4	Водитель	1
5	Повар	1
6	Горничная	2
7	Аниматор	1
8	Повар	1
9	ночной Охранник	2
10	Бармен	1
11	Водитель	1
12	младший Шеф-повар	1
13	дневной Бармен	1
14	Спа-терапевт	1
15	Сомелье	1
16	Кадровик	1
17	Кадровик	1
18	Консьерж	2
19	Ресепшионист	2
20	Сомелье (конференц-залы)	1
21	младший Директор	1
22	Бармен	1
23	Водитель	2
24	Техник	1
25	сменный Шеф-повар (бизнес-зал)	1
26	Аниматор	2
27	старший Повар	2
28	Аниматор	2
29	старший Горничная	2
30	Консьерж	1
31	Консьерж	2
32	Техник	1
33	дневной Менеджер	2
34	Аниматор	2
35	Портье	2
36	Водитель	1
37	Водитель	1
38	Горничная	1
39	Консьерж	1
40	Охранник	2
41	Администратор	1
42	Шеф-повар (конференц-залы)	1
43	ночной Бухгалтер	1
44	Портье	1
45	Администратор	2
46	ночной Шеф-повар	1
47	главный Бармен (бизнес-зал)	1
48	Портье	1
49	ведущий Портье	1
50	Горничная	2
51	ночной Водитель	1
52	дежурный Горничная	1
53	Шеф-повар	1
54	ночной Бухгалтер	2
55	Кадровик	2
56	Охранник	2
57	Консьерж	1
58	Консьерж	1
59	Портье	1
60	Техник	1
61	Бухгалтер	1
62	дежурный Спа-терапевт	2
63	Администратор	2
64	Консьерж	1
65	младший Администратор	1
66	Консьерж	1
67	Бармен (ресторан)	2
68	Аниматор	1
69	Охранник	1
70	Сомелье	1
71	дневной Бармен	1
72	ночной Кадровик	2
73	Шеф-повар	1
74	главный Техник	2
75	Ресепшионист	1
76	ночной Водитель	1
77	Аниматор	1
78	дневной Охранник	2
79	Шеф-повар	1
80	Техник	1
81	дежурный Сомелье	2
82	дежурный Бармен	1
83	Ресепшионист	2
84	Спа-терапевт	2
85	дежурный Бармен	1
86	младший Спа-терапевт	1
87	Аниматор	1
88	Техник	1
89	Повар (номерной фонд)	1
90	ведущий Охранник	2
91	Консьерж	1
92	дежурный Аниматор	1
93	Директор	1
94	Бармен	1
95	дневной Повар (ресторан)	1
96	Ресепшионист	1
97	Повар	1
98	Техник	1
99	старший Горничная	1
100	Менеджер	1
101	ночной Менеджер	1
102	Ресепшионист	1
103	Шеф-повар	1
104	Портье	1
105	Повар	2
106	ведущий Портье	1
107	Бармен	1
108	Директор	1
109	Ресепшионист	1
110	Техник	1
111	младший Консьерж	1
112	сменный Охранник	1
113	Директор	1
114	Шеф-повар	1
115	ночной Портье	1
116	Аниматор	1
117	Директор (SPA)	1
118	Директор	1
119	Сомелье	2
120	Директор	1
121	старший Директор	1
122	Ресепшионист	1
123	Повар	2
124	Охранник	2
125	Бармен	1
126	сменный Охранник	2
127	Аниматор	1
128	Горничная (ресторан)	2
129	младший Техник	1
130	Бармен	1
131	Горничная	1
132	Горничная	2
133	Водитель	1
134	ведущий Бухгалтер	1
135	Техник	2
136	Спа-терапевт	1
137	Ресепшионист	2
138	Бухгалтер (номерной фонд)	2
139	Портье	1
140	сменный Техник (бизнес-зал)	2
141	Бармен	2
142	дневной Кадровик	1
143	Бухгалтер	1
144	Сомелье (SPA)	2
145	Бухгалтер	1
146	Повар	2
147	Уборщик	2
148	Спа-терапевт	1
149	Консьерж	2
150	Уборщик	2
151	Аниматор	1
152	ночной Менеджер (SPA)	1
153	сменный Менеджер	1
154	Техник	1
155	Шеф-повар	1
156	ночной Кадровик	2
157	Директор (конференц-залы)	1
158	Спа-терапевт	2
159	Повар	2
160	Бармен	2
161	сменный Администратор	1
162	дневной Портье	1
163	дневной Бухгалтер (бизнес-зал)	1
164	Аниматор	1
165	Уборщик	2
166	сменный Повар	1
167	дневной Аниматор	2
168	Аниматор	1
169	младший Администратор	1
170	Сомелье	1
171	Бармен	1
172	Уборщик	1
173	ночной Повар	1
174	Шеф-повар	1
175	старший Администратор	1
176	младший Менеджер	2
177	Бармен	1
178	Горничная	1
179	Портье (SPA)	1
180	Аниматор	2
181	Шеф-повар	1
182	Водитель	1
183	Сомелье	2
184	Спа-терапевт	1
185	Администратор (ресторан)	2
186	главный Горничная (SPA)	2
187	Водитель	2
188	Шеф-повар	1
189	Бармен	2
190	Аниматор	1
191	дежурный Бармен	1
192	Шеф-повар	1
193	ведущий Портье	2
194	Шеф-повар	1
195	ведущий Директор	1
196	Водитель	1
197	Водитель	1
198	сменный Повар	2
199	Ресепшионист	1
200	Кадровик	2
201	Бармен	1
202	дежурный Спа-терапевт (номерной фонд)	1
203	старший Ресепшионист	1
204	главный Директор (бизнес-зал)	1
205	Техник	1
206	Шеф-повар	1
207	Шеф-повар	1
208	Бармен	1
209	сменный Охранник	2
210	Аниматор	1
211	Шеф-повар (SPA)	1
212	Директор	1
213	Ресепшионист	1
214	Сомелье	2
215	Уборщик	1
216	старший Кадровик	1
217	дежурный Водитель	2
218	Бармен	1
219	Директор	1
220	ведущий Директор	1
221	ведущий Повар	2
222	главный Техник	1
223	Директор	1
224	сменный Охранник	1
225	Портье	1
226	Бухгалтер	2
227	Бармен	1
228	главный Водитель	1
229	Уборщик	2
230	Портье	1
231	Менеджер	1
232	младший Уборщик	2
233	дежурный Менеджер	1
234	старший Шеф-повар (SPA)	1
235	Консьерж	1
236	Менеджер	1
237	Бармен	2
238	дежурный Аниматор	1
239	Консьерж	1
240	Консьерж	2
241	дневной Портье	1
242	ведущий Менеджер	1
243	Консьерж	1
244	старший Аниматор	1
245	ведущий Техник	1
246	сменный Консьерж	1
247	главный Портье	1
248	главный Администратор	1
249	Ресепшионист	1
250	главный Сомелье	1
251	Водитель	1
252	Водитель	1
253	Аниматор	1
254	Менеджер (ресторан)	1
255	Администратор	1
256	Администратор	1
257	Директор (ресторан)	1
258	Консьерж	1
259	дежурный Консьерж	2
260	дежурный Бармен	1
261	Консьерж	1
262	старший Техник	1
263	сменный Техник	1
264	старший Директор	1
265	главный Техник (ресторан)	1
266	Шеф-повар (номерной фонд)	1
267	Шеф-повар	1
268	главный Портье	1
269	Спа-терапевт	1
270	Менеджер (номерной фонд)	2
271	Аниматор (конференц-залы)	1
272	Повар (бизнес-зал)	2
273	Ресепшионист	2
274	Горничная	2
275	Шеф-повар	1
276	Бармен	1
277	Повар (SPA)	1
278	Спа-терапевт	2
279	Директор	1
280	Шеф-повар	1
281	Сомелье (конференц-залы)	1
282	главный Сомелье	2
283	ведущий Менеджер	1
284	Техник	1
285	Шеф-повар	1
286	Бухгалтер	1
287	Администратор (SPA)	1
288	Бухгалтер (ресторан)	1
289	Бармен	1
290	Горничная	2
291	дневной Бармен	1
292	Горничная	1
293	Ресепшионист	1
294	Бармен	2
295	Бармен (бизнес-зал)	1
296	сменный Бармен	2
297	Бухгалтер	2
298	Бухгалтер	2
299	Сомелье	1
300	Менеджер	1
301	Уборщик	2
302	Менеджер	1
303	младший Менеджер	1
304	Шеф-повар	1
305	Охранник	2
306	ведущий Директор	1
307	младший Повар	1
308	Охранник	2
309	дежурный Администратор	2
310	Техник	2
311	дежурный Техник	1
312	Повар	1
313	Менеджер	1
314	Администратор	1
315	младший Кадровик	1
316	Спа-терапевт	1
317	старший Охранник (бизнес-зал)	2
318	Менеджер	2
319	Администратор (номерной фонд)	2
320	Охранник	2
321	Сомелье	2
322	Директор	1
323	Бухгалтер (бизнес-зал)	1
324	Техник	1
325	ночной Водитель	1
326	Администратор	2
327	старший Горничная	2
328	Директор	1
329	Сомелье	1
330	Консьерж	1
331	Ресепшионист	1
332	Кадровик	2
333	Консьерж	1
334	Водитель	2
335	дневной Техник	1
336	младший Шеф-повар	1
337	Бармен	1
338	Портье	1
339	ведущий Горничная	2
340	Администратор	1
341	Менеджер	1
342	Уборщик	2
343	Спа-терапевт	1
344	Бармен	1
345	Бухгалтер (бизнес-зал)	1
346	Бармен	1
347	сменный Бармен	1
348	Бухгалтер (бизнес-зал)	1
349	Сомелье	1
350	младший Техник	1
351	Портье	2
352	Консьерж	1
353	Спа-терапевт	1
354	главный Менеджер	1
355	Администратор	1
356	Уборщик	1
357	старший Администратор (бизнес-зал)	2
358	дежурный Водитель	2
359	Бармен (ресторан)	1
360	Водитель	1
361	Консьерж	1
362	Шеф-повар	1
363	Бармен	1
364	Кадровик	1
365	Горничная	2
366	Уборщик (номерной фонд)	2
367	Сомелье (номерной фонд)	1
368	Охранник	2
369	Бармен	1
370	главный Техник	1
371	Ресепшионист	2
372	старший Охранник	1
373	старший Бармен	1
374	Аниматор (бизнес-зал)	1
375	главный Уборщик	2
376	главный Бухгалтер	1
377	ведущий Спа-терапевт	1
378	Аниматор	1
379	Повар	1
380	Бармен	1
381	Горничная	2
382	Портье	1
383	старший Водитель	1
384	Уборщик	2
385	Бармен	1
386	младший Водитель	1
387	Уборщик	1
388	Бухгалтер	2
389	Портье	1
390	ведущий Сомелье	2
391	ведущий Бармен	1
392	Менеджер	1
393	Администратор	2
394	ночной Сомелье	1
395	Уборщик	2
396	Водитель	2
397	младший Бухгалтер	1
398	Охранник	2
399	Аниматор	2
400	дневной Консьерж	2
401	Администратор	1
402	главный Менеджер	2
403	ночной Шеф-повар (номерной фонд)	1
404	Сомелье	1
405	Шеф-повар	1
406	Шеф-повар	1
407	Бармен	1
408	Директор	1
409	Техник	1
410	Повар	2
411	Уборщик	2
412	младший Уборщик	1
413	Повар	1
414	Охранник	1
415	Консьерж	1
416	главный Бухгалтер (конференц-залы)	2
417	сменный Горничная	2
418	старший Администратор	1
419	Горничная	2
420	Уборщик	2
421	Шеф-повар	1
422	Консьерж	1
423	Бармен	1
424	Шеф-повар (ресторан)	1
425	сменный Спа-терапевт	2
426	дежурный Администратор	1
427	Консьерж	1
428	младший Техник	1
429	младший Спа-терапевт	1
430	Повар	1
431	Аниматор	1
432	Повар	1
433	дневной Повар	1
434	Директор	1
435	Бармен	1
436	дневной Бухгалтер	1
437	Ресепшионист	1
438	Спа-терапевт	2
439	младший Администратор	1
440	Консьерж	1
441	Аниматор (ресторан)	1
442	Шеф-повар (SPA)	1
443	Шеф-повар	1
444	Консьерж	2
445	ночной Директор	1
446	старший Шеф-повар (конференц-залы)	1
447	Сомелье	1
448	Охранник	2
449	дежурный Портье	2
450	дежурный Администратор	2
451	Водитель	2
452	Директор	1
453	Повар	2
454	Аниматор	1
455	ночной Уборщик	2
456	главный Портье	1
457	Портье	1
458	главный Консьерж	2
459	Администратор	2
460	Портье	2
461	Сомелье	1
462	Менеджер	1
463	Повар	2
464	Охранник	1
465	Шеф-повар	1
466	ночной Портье	1
467	Шеф-повар	1
468	младший Бухгалтер (конференц-залы)	1
469	Бармен	1
470	Консьерж	1
471	Охранник	1
472	Директор (конференц-залы)	1
473	Бармен	1
474	Кадровик	2
475	Сомелье (ресторан)	1
476	Техник (ресторан)	2
477	Техник	1
478	Водитель	1
479	сменный Бармен	1
480	дневной Техник	2
481	Охранник	1
482	дневной Повар	1
483	Техник	1
484	ночной Горничная	2
485	Администратор	1
486	ведущий Аниматор	1
487	Техник	1
488	ведущий Бармен	1
489	Портье	2
490	Портье	1
491	Бармен	1
492	Портье	1
493	сменный Бармен	2
494	Кадровик	1
495	старший Спа-терапевт (бизнес-зал)	1
496	Аниматор	1
497	Сомелье	2
498	Администратор	1
499	сменный Бухгалтер	1
500	Спа-терапевт	1
501	Бармен	1
502	дневной Повар	1
503	Бармен	2
504	ночной Водитель	2
505	старший Сомелье (номерной фонд)	1
506	Аниматор (конференц-залы)	1
507	Горничная	2
508	Сомелье	1
509	Кадровик	2
510	Менеджер	1
511	ночной Аниматор	2
512	Бармен	1
513	Консьерж	1
514	Бухгалтер	2
515	ведущий Администратор	1
516	Шеф-повар	1
517	старший Спа-терапевт	2
518	дневной Бухгалтер	2
519	сменный Сомелье	1
520	Уборщик	2
521	Портье	1
522	Водитель	1
523	младший Сомелье (номерной фонд)	1
524	Ресепшионист	1
525	Менеджер	1
526	Менеджер	1
527	Директор	1
528	старший Бармен	1
529	главный Менеджер	1
530	Шеф-повар	1
531	Администратор (SPA)	1
532	Водитель	2
533	младший Спа-терапевт	1
534	Водитель	1
535	сменный Водитель	1
536	Повар	2
537	Аниматор (SPA)	1
538	Горничная	1
539	младший Охранник	2
540	младший Директор	1
541	Охранник (SPA)	2
542	главный Техник	1
543	Бухгалтер	2
544	Водитель	1
545	главный Сомелье	1
546	Директор (конференц-залы)	1
547	Бухгалтер	1
548	Горничная	1
549	сменный Техник (конференц-залы)	1
550	Бухгалтер	2
551	Менеджер (бизнес-зал)	1
552	Портье	1
553	Водитель	1
554	Кадровик	1
555	Техник (конференц-залы)	1
556	Консьерж	2
557	дневной Бармен	1
558	Консьерж	1
559	Бармен	1
560	старший Консьерж	2
561	ведущий Охранник	2
562	Ресепшионист	1
563	Техник (номерной фонд)	1
564	Бармен	1
565	Директор	1
566	дежурный Бухгалтер	1
567	Техник (SPA)	1
568	ведущий Спа-терапевт	1
569	Сомелье	1
570	Техник	1
571	Портье	1
572	Бухгалтер	1
573	Охранник	2
574	дежурный Аниматор	2
575	Техник	1
576	Горничная	2
577	Консьерж (ресторан)	1
578	Уборщик (бизнес-зал)	1
579	Охранник	2
580	Горничная	2
581	Кадровик (ресторан)	2
582	ночной Администратор	2
583	главный Аниматор	2
584	Водитель	2
585	Консьерж	1
586	Кадровик	1
587	Администратор	1
588	Бармен	1
589	Бухгалтер	1
590	дневной Кадровик	1
591	Повар	1
592	дежурный Бармен	1
593	Администратор (бизнес-зал)	1
594	младший Горничная	2
595	ночной Сомелье	1
596	Кадровик (SPA)	1
597	Спа-терапевт	1
598	ведущий Аниматор (бизнес-зал)	1
599	Администратор	2
600	Ресепшионист	1
601	Менеджер	1
602	Кадровик	1
603	старший Спа-терапевт	1
604	Менеджер	1
605	дневной Бармен	1
606	дневной Уборщик (бизнес-зал)	2
607	главный Кадровик	1
608	старший Охранник	1
609	Портье	1
610	Директор	1
611	Повар (номерной фонд)	1
612	Портье	2
613	Директор	1
614	дежурный Администратор	2
615	дневной Аниматор	1
616	Консьерж	2
617	Портье	2
618	дневной Техник	1
619	Аниматор	1
620	ночной Повар	1
621	ведущий Портье	2
622	Бармен	1
623	Портье	1
624	старший Водитель	1
625	Консьерж (номерной фонд)	1
626	сменный Шеф-повар	1
627	ведущий Аниматор	2
628	старший Портье	2
629	Техник	1
630	Техник (бизнес-зал)	2
631	дежурный Администратор	2
632	дежурный Шеф-повар	1
633	дежурный Водитель	2
634	Менеджер	1
635	Повар	1
636	Администратор	1
637	Бухгалтер	1
638	Сомелье	1
639	Сомелье	1
640	Консьерж	2
641	Сомелье	1
642	дежурный Спа-терапевт	1
643	Менеджер	1
644	Бармен	2
645	Ресепшионист	1
646	Техник	1
647	младший Директор	1
648	Аниматор	1
649	младший Сомелье	1
650	Портье	2
651	Ресепшионист	1
652	Аниматор	1
653	Портье	1
654	Кадровик	2
655	Бармен	1
656	Ресепшионист	1
657	младший Бармен	2
658	младший Бармен (SPA)	1
659	Ресепшионист	2
660	Менеджер	1
661	сменный Бухгалтер	1
662	Портье	1
663	Бармен	1
664	Повар	2
665	Охранник	2
666	Кадровик	1
667	Охранник	2
668	Повар	1
669	Консьерж	1
670	Аниматор	1
671	ведущий Бармен (конференц-залы)	1
672	Уборщик	2
673	дежурный Аниматор	2
674	Бухгалтер	2
675	дневной Менеджер	1
676	Администратор	2
677	Техник (бизнес-зал)	2
678	Сомелье	2
679	Уборщик	1
680	Техник	1
681	Бухгалтер	2
682	Кадровик (бизнес-зал)	2
683	ночной Повар	2
684	Директор (конференц-залы)	1
685	Директор	1
686	Сомелье	1
687	ведущий Бармен	1
688	дневной Шеф-повар	1
689	Бармен	1
690	Уборщик	2
691	главный Сомелье	1
692	Бармен	1
693	Администратор	1
694	Бармен	1
695	Администратор	1
696	Кадровик	1
697	Охранник	1
698	Уборщик	2
699	дежурный Спа-терапевт	2
700	сменный Бухгалтер	2
701	Портье	1
702	Портье	1
703	Повар (номерной фонд)	1
704	Директор	1
705	Консьерж	1
706	Кадровик	1
707	Портье	1
708	Администратор	1
709	Консьерж	1
710	Ресепшионист	1
711	сменный Водитель	1
712	старший Аниматор	1
713	Администратор	1
714	младший Бармен	2
715	Горничная	2
716	главный Портье	1
717	Бармен	2
718	Аниматор	2
719	Кадровик	1
720	Бармен (номерной фонд)	2
721	Бухгалтер (SPA)	2
722	Консьерж	1
723	Сомелье	2
724	Спа-терапевт	1
725	Техник (номерной фонд)	2
726	Ресепшионист	2
727	Бухгалтер	1
728	Повар	1
729	Водитель	1
730	Ресепшионист	2
731	Уборщик (бизнес-зал)	2
732	Администратор	1
733	сменный Техник	1
734	главный Консьерж	1
735	Уборщик	1
736	Кадровик	1
737	Охранник (SPA)	2
738	Сомелье	1
739	Ресепшионист	1
740	ночной Горничная	2
741	ведущий Менеджер	2
742	ночной Водитель	1
743	сменный Бармен	2
744	Директор	1
745	ночной Консьерж	1
746	Портье	1
747	Повар (SPA)	1
748	младший Администратор	1
749	Спа-терапевт	1
750	дневной Водитель	1
751	Администратор	2
752	Директор	1
753	Бармен	1
754	старший Консьерж	1
755	Охранник	1
756	Бухгалтер	1
757	сменный Охранник	2
758	Директор	1
759	Шеф-повар	1
760	Повар	2
761	Техник	2
762	младший Техник	1
763	Сомелье	2
764	Бармен	1
765	Уборщик	2
766	Портье	1
767	Шеф-повар	1
768	Водитель	1
769	Охранник	2
770	Администратор (номерной фонд)	1
771	Бармен	1
772	Бармен	2
773	Повар (конференц-залы)	1
774	Спа-терапевт	2
775	Кадровик	2
776	Портье	2
777	Спа-терапевт	2
778	Бармен	1
779	Уборщик	2
780	Кадровик	1
781	Консьерж	1
782	Кадровик	2
783	Горничная	1
784	сменный Директор	1
785	младший Бармен	1
786	сменный Ресепшионист	1
787	младший Горничная	2
788	дежурный Бармен	2
789	Ресепшионист	1
790	Шеф-повар	1
791	Кадровик	1
792	младший Сомелье	1
793	младший Охранник	1
794	Ресепшионист	1
795	главный Техник	1
796	Техник	2
797	ведущий Бармен	2
798	старший Менеджер	1
799	Сомелье	1
800	Техник	1
801	Сомелье	1
802	дневной Охранник	2
803	старший Аниматор	1
804	Менеджер	1
805	ночной Директор	1
806	Уборщик	2
807	младший Горничная	2
808	дежурный Водитель	1
809	Уборщик	2
810	Кадровик	2
811	Повар	1
812	дежурный Горничная (бизнес-зал)	1
813	Бармен	1
814	Спа-терапевт	2
815	Ресепшионист	1
816	Аниматор	2
817	младший Кадровик (конференц-залы)	1
818	Кадровик	2
819	Техник (ресторан)	1
820	главный Бармен	1
821	главный Бармен	2
822	Кадровик	1
823	Техник	1
824	Директор	1
825	Ресепшионист	1
826	Уборщик	2
827	Бухгалтер	1
828	Менеджер	1
829	Портье (ресторан)	1
830	Бухгалтер	2
831	дежурный Водитель	1
832	Охранник	2
833	Консьерж (номерной фонд)	2
834	Администратор	1
835	дежурный Кадровик	2
836	Бухгалтер	2
837	Аниматор	1
838	Консьерж	1
839	Водитель	2
840	Охранник	2
841	ведущий Администратор	1
842	Бармен	2
843	дежурный Водитель	1
844	Шеф-повар	1
845	Аниматор	2
846	Сомелье	2
847	Аниматор	2
848	младший Директор	1
849	Сомелье	2
850	дневной Бармен (конференц-залы)	2
851	Шеф-повар	1
852	Портье	1
853	Директор	1
854	Аниматор	1
855	Повар (конференц-залы)	1
856	Повар	1
857	Бухгалтер	2
858	ведущий Кадровик (ресторан)	1
859	Горничная	2
860	старший Водитель	1
861	Бухгалтер	1
862	ночной Портье	1
863	старший Бармен	1
864	младший Бармен (бизнес-зал)	1
865	Бармен	1
866	Охранник	1
867	дежурный Горничная	2
868	Администратор	1
869	дневной Бармен	1
870	дневной Консьерж	2
871	Консьерж	1
872	главный Ресепшионист	2
873	Кадровик (номерной фонд)	1
874	Бармен (бизнес-зал)	1
875	Директор	1
876	Водитель (SPA)	2
877	дежурный Администратор	1
878	Ресепшионист	1
879	Сомелье	1
880	дневной Бухгалтер (ресторан)	2
881	дежурный Повар	2
882	Бармен	1
883	Администратор	1
884	Шеф-повар	1
885	Бухгалтер	2
886	Шеф-повар	1
887	Менеджер	1
888	Директор	1
889	Портье	1
890	Директор	1
891	Администратор	1
892	сменный Техник	2
893	Шеф-повар	1
894	дневной Директор	1
895	Повар	1
896	Техник	2
897	ведущий Уборщик	2
898	Повар	1
899	Портье	1
900	младший Бармен	1
901	Портье	1
902	Спа-терапевт	1
903	Шеф-повар	1
904	Спа-терапевт	1
905	Администратор	1
906	дневной Администратор	1
907	Охранник	1
908	главный Ресепшионист	1
909	Бухгалтер	1
910	младший Водитель	1
911	младший Повар	2
912	Бармен	2
913	Портье	2
914	Горничная	2
915	Охранник	2
916	дневной Повар	2
917	Спа-терапевт	1
918	Спа-терапевт	1
919	ведущий Горничная (бизнес-зал)	2
920	Портье	1
921	Консьерж	1
922	Аниматор	1
923	старший Администратор	1
924	Портье	1
925	младший Спа-терапевт (конференц-залы)	1
926	Повар	2
927	сменный Уборщик	1
928	главный Бухгалтер	1
929	Охранник	2
930	Ресепшионист	1
931	Бармен	1
932	Бармен	1
933	Повар	1
934	Сомелье	1
935	Аниматор	1
936	ночной Менеджер	2
937	Консьерж	2
938	Водитель	2
939	Портье	2
940	Аниматор	1
941	Портье	2
942	Сомелье	2
943	Директор (номерной фонд)	1
944	Ресепшионист	2
945	Уборщик	2
946	главный Консьерж	2
947	Менеджер	1
948	Бармен (конференц-залы)	1
949	Менеджер	1
950	Уборщик	2
951	Уборщик	2
952	Портье	1
953	Повар	1
954	Директор	1
955	Директор	1
956	Бухгалтер	1
957	младший Кадровик	1
958	Уборщик	2
959	Уборщик	2
960	Директор (номерной фонд)	1
961	Уборщик	2
962	дежурный Ресепшионист	1
963	главный Уборщик	2
964	Водитель	1
965	Администратор	1
966	младший Шеф-повар	1
967	Водитель	2
968	Уборщик	2
969	ночной Повар	2
970	Повар (номерной фонд)	2
971	Бармен	2
972	Портье	1
973	старший Техник (SPA)	1
974	Администратор	1
975	Сомелье	1
976	дежурный Уборщик	1
977	Водитель	1
978	Бухгалтер	1
979	Водитель	2
980	Шеф-повар	1
981	Кадровик (ресторан)	1
982	Администратор	1
983	дневной Уборщик (номерной фонд)	1
984	Уборщик	1
985	старший Шеф-повар	1
986	Менеджер	2
987	ведущий Аниматор	1
988	Повар	2
989	Аниматор (ресторан)	1
990	Кадровик	1
991	старший Администратор	2
992	Менеджер	1
993	Горничная (SPA)	2
994	Бармен (SPA)	1
995	ведущий Сомелье	2
996	Кадровик	2
997	Кадровик	2
998	главный Бухгалтер	2
999	Техник	2
1000	старший Охранник (номерной фонд)	1
\.


                                                                                                                                                                                                                                                                                                                                     4931.dat                                                                                            0000600 0004000 0002000 00000176267 14771407746 0014316 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2023-01-27	2023-02-16	2023-03-09	26500	t	937	344	2518 365664
2	2023-04-25	2023-06-05	2023-06-13	65000	t	386	704	4487 223473
3	2023-08-03	2023-09-03	2023-09-17	11500	t	265	428	4870 936719
4	2023-10-28	2023-12-14	2023-12-17	89000	t	942	680	7005 217801
5	2023-03-17	2023-04-06	2023-04-08	82000	t	957	280	2518 365664
6	2023-09-19	2023-11-08	2023-11-11	87500	t	340	188	4487 223473
7	2023-10-18	2023-11-06	2023-11-19	24000	t	425	709	4870 936719
8	2023-12-31	2024-01-08	2024-01-25	20500	t	570	276	7005 217801
9	2023-03-01	2023-04-26	2023-05-03	46000	t	279	860	2518 365664
10	2023-10-26	2023-11-27	2023-12-10	86000	t	941	197	4487 223473
11	2023-07-04	2023-08-29	2023-09-11	46000	t	469	467	4870 936719
12	2023-05-30	2023-07-07	2023-07-17	49500	t	664	891	7005 217801
13	2023-01-30	2023-03-24	2023-04-08	55500	t	991	190	2518 365664
14	2023-10-02	2023-10-22	2023-11-07	10500	t	228	916	4487 223473
15	2023-02-25	2023-03-05	2023-03-07	94000	t	424	266	4870 936719
16	2023-07-22	2023-07-31	2023-08-02	68500	t	697	888	7005 217801
17	2023-08-26	2023-08-29	2023-09-05	63000	t	234	935	2518 365664
18	2023-07-02	2023-07-28	2023-08-11	74500	t	823	659	4487 223473
19	2023-09-24	2023-10-11	2023-10-26	97500	t	348	541	4870 936719
20	2023-11-08	2023-12-04	2023-12-19	89500	t	882	35	7005 217801
21	2023-04-02	2023-05-02	2023-05-09	97500	t	757	5	2518 365664
22	2023-07-16	2023-09-06	2023-09-10	64000	t	58	36	4487 223473
23	2023-01-07	2023-03-03	2023-03-22	99000	t	683	119	4870 936719
24	2023-04-29	2023-05-12	2023-05-23	41500	t	294	333	7005 217801
25	2023-05-28	2023-07-02	2023-07-16	86500	t	794	331	2518 365664
26	2023-11-14	2023-11-20	2023-11-24	19500	t	42	658	4487 223473
27	2023-07-31	2023-08-31	2023-09-20	28000	t	741	861	4870 936719
28	2023-11-24	2024-01-17	2024-02-03	14000	t	989	779	7005 217801
29	2023-03-10	2023-04-10	2023-04-21	20500	t	385	398	2518 365664
30	2023-08-03	2023-08-17	2023-09-06	31500	t	293	139	4487 223473
31	2023-04-24	2023-05-12	2023-05-26	38000	t	946	361	4870 936719
32	2023-01-30	2023-02-08	2023-02-25	52500	t	313	307	7005 217801
33	2023-12-17	2024-01-09	2024-01-10	49000	t	195	260	2518 365664
34	2023-01-20	2023-01-27	2023-02-01	39000	t	879	249	4487 223473
35	2023-09-07	2023-09-23	2023-10-06	67500	t	726	672	4870 936719
36	2023-12-24	2023-12-26	2024-01-13	90000	t	312	28	7005 217801
37	2023-08-23	2023-09-10	2023-09-19	37500	t	645	890	2518 365664
38	2023-12-28	2024-02-07	2024-02-25	92500	t	280	699	4487 223473
39	2023-12-02	2023-12-23	2024-01-08	21000	t	60	279	4870 936719
40	2023-11-14	2023-11-18	2023-12-01	78500	t	111	299	7005 217801
41	2023-07-26	2023-08-20	2023-08-26	85000	t	370	612	2518 365664
42	2023-07-09	2023-09-07	2023-09-10	72000	t	74	504	4487 223473
43	2023-01-27	2023-02-04	2023-02-14	84000	t	36	191	4870 936719
44	2023-09-09	2023-10-29	2023-11-15	16500	t	782	126	7005 217801
45	2023-08-05	2023-09-11	2023-09-23	85000	t	654	791	2518 365664
46	2023-07-06	2023-07-24	2023-08-06	15500	t	445	931	4487 223473
47	2023-01-24	2023-03-14	2023-03-20	54000	t	345	499	4870 936719
48	2023-04-29	2023-05-15	2023-06-01	83000	t	722	750	7005 217801
49	2023-01-15	2023-01-22	2023-01-24	81500	t	880	932	2518 365664
50	2023-07-05	2023-07-30	2023-08-15	31500	t	390	531	4487 223473
51	2023-07-08	2023-08-05	2023-08-06	86500	t	586	573	4870 936719
52	2023-04-04	2023-05-11	2023-05-22	98000	t	682	406	7005 217801
53	2023-05-14	2023-07-09	2023-07-26	88000	t	187	13	2518 365664
54	2023-07-16	2023-08-29	2023-08-31	39000	t	601	437	4487 223473
55	2023-02-03	2023-02-17	2023-03-01	89000	t	927	556	4870 936719
56	2023-08-04	2023-08-19	2023-09-01	67500	t	670	164	7005 217801
57	2023-10-26	2023-12-14	2023-12-28	62500	t	348	964	2518 365664
58	2023-09-24	2023-11-10	2023-11-16	22000	t	634	793	4487 223473
59	2023-12-17	2024-01-31	2024-02-14	44500	t	362	13	4870 936719
60	2023-02-05	2023-02-20	2023-02-23	82500	t	964	763	7005 217801
61	2023-06-25	2023-08-03	2023-08-14	18000	t	67	96	2518 365664
62	2023-08-29	2023-08-31	2023-09-04	20500	t	505	624	4487 223473
63	2023-07-27	2023-09-23	2023-10-05	84500	t	947	922	4870 936719
64	2023-12-27	2024-02-03	2024-02-16	32500	t	22	924	7005 217801
65	2023-09-05	2023-09-13	2023-09-20	72000	t	661	808	2518 365664
66	2023-10-07	2023-10-12	2023-10-27	85000	t	692	178	4487 223473
67	2023-02-06	2023-03-14	2023-03-24	86500	t	691	744	4870 936719
68	2023-09-14	2023-11-13	2023-11-22	34500	t	62	909	7005 217801
69	2023-03-16	2023-05-10	2023-05-18	84500	t	604	130	2518 365664
70	2023-04-01	2023-04-24	2023-05-08	67500	t	558	669	4487 223473
71	2023-01-31	2023-02-19	2023-02-23	60500	t	874	785	4870 936719
72	2023-02-12	2023-03-03	2023-03-22	49000	t	199	842	7005 217801
73	2023-03-22	2023-04-28	2023-05-10	10000	t	240	380	2518 365664
74	2023-10-27	2023-12-10	2023-12-19	39000	t	554	278	4487 223473
75	2023-05-23	2023-07-22	2023-08-02	61500	t	611	446	4870 936719
76	2023-01-24	2023-03-10	2023-03-11	39500	t	656	136	7005 217801
77	2023-08-15	2023-09-14	2023-10-01	71500	t	896	871	2518 365664
78	2023-07-10	2023-08-28	2023-09-15	93500	t	232	386	4487 223473
79	2023-06-02	2023-06-15	2023-06-16	61500	t	149	809	4870 936719
80	2023-11-06	2023-11-25	2023-12-02	48000	t	89	136	7005 217801
81	2023-12-02	2023-12-17	2024-01-05	41000	t	20	453	2518 365664
82	2023-06-02	2023-06-13	2023-06-28	32500	t	678	842	4487 223473
83	2023-01-20	2023-02-27	2023-03-05	79000	t	416	252	4870 936719
84	2023-06-18	2023-08-01	2023-08-09	29500	t	836	391	7005 217801
85	2023-11-15	2024-01-10	2024-01-27	19000	t	88	239	2518 365664
86	2023-02-24	2023-04-16	2023-04-23	69500	t	38	978	4487 223473
87	2023-08-30	2023-09-05	2023-09-25	93000	t	68	280	4870 936719
88	2023-02-26	2023-04-15	2023-04-18	44500	t	801	912	7005 217801
89	2023-02-23	2023-04-07	2023-04-14	93500	t	971	8	2518 365664
90	2023-02-20	2023-04-15	2023-04-25	93500	t	316	654	4487 223473
91	2023-06-03	2023-07-08	2023-07-20	28000	t	302	391	4870 936719
92	2023-07-10	2023-08-31	2023-09-21	88500	t	319	870	7005 217801
93	2023-05-05	2023-05-16	2023-06-06	25000	t	610	392	2518 365664
94	2023-02-15	2023-03-17	2023-04-03	88500	t	96	289	4487 223473
95	2023-02-17	2023-04-10	2023-04-22	97500	t	276	212	4870 936719
96	2023-01-28	2023-02-13	2023-02-26	76500	t	294	527	7005 217801
97	2023-04-04	2023-04-22	2023-05-04	50500	t	856	641	2518 365664
98	2023-08-31	2023-10-08	2023-10-13	69000	t	305	797	4487 223473
99	2023-10-31	2023-11-08	2023-11-10	86000	t	306	137	4870 936719
100	2023-12-03	2024-01-26	2024-02-01	76000	t	496	266	7005 217801
101	2023-09-29	2023-10-19	2023-10-21	71000	t	558	505	2518 365664
102	2023-01-09	2023-02-21	2023-03-01	83000	t	389	964	4487 223473
103	2023-08-23	2023-08-24	2023-08-30	57000	t	548	53	4870 936719
104	2023-06-05	2023-07-01	2023-07-11	66000	t	782	986	7005 217801
105	2023-05-26	2023-05-28	2023-06-18	92500	t	788	738	2518 365664
106	2023-01-07	2023-02-18	2023-03-08	77500	t	733	23	4487 223473
107	2023-11-27	2024-01-07	2024-01-14	53000	t	30	242	4870 936719
108	2023-07-12	2023-08-24	2023-09-03	98000	t	329	539	7005 217801
109	2023-01-02	2023-02-20	2023-03-03	93000	t	156	637	2518 365664
110	2023-09-13	2023-10-04	2023-10-20	57500	t	300	178	4487 223473
111	2023-03-09	2023-04-15	2023-04-26	98000	t	375	128	4870 936719
112	2023-12-21	2024-01-01	2024-01-20	86000	t	386	944	7005 217801
113	2023-03-18	2023-04-25	2023-05-16	82000	t	443	124	2518 365664
114	2023-04-29	2023-06-05	2023-06-07	76500	t	714	310	4487 223473
115	2023-01-21	2023-02-17	2023-02-21	56500	t	637	555	4870 936719
116	2023-01-20	2023-02-08	2023-02-15	88000	t	353	298	7005 217801
117	2023-08-12	2023-08-26	2023-09-11	68000	t	372	425	2518 365664
118	2023-04-20	2023-04-27	2023-05-08	30500	t	277	254	4487 223473
119	2023-03-28	2023-05-02	2023-05-12	50000	t	768	69	4870 936719
120	2023-05-29	2023-07-07	2023-07-19	71500	t	561	260	7005 217801
121	2023-10-19	2023-10-27	2023-11-08	89500	t	263	433	2518 365664
122	2023-07-18	2023-08-03	2023-08-10	41500	t	123	980	4487 223473
123	2023-06-01	2023-07-04	2023-07-17	56500	t	749	442	4870 936719
124	2023-03-16	2023-04-16	2023-04-27	32500	t	816	49	7005 217801
125	2023-11-12	2023-12-26	2024-01-05	45500	t	694	444	2518 365664
126	2023-09-29	2023-10-24	2023-10-27	57500	t	279	961	4487 223473
127	2023-05-20	2023-07-19	2023-08-09	57500	t	423	799	4870 936719
128	2023-05-19	2023-06-27	2023-07-08	50500	t	80	591	7005 217801
129	2023-03-10	2023-03-24	2023-04-05	22500	t	460	540	2518 365664
130	2023-04-20	2023-05-22	2023-06-10	78000	t	952	654	4487 223473
131	2023-03-17	2023-05-16	2023-06-01	48500	t	771	608	4870 936719
132	2023-01-18	2023-01-28	2023-02-10	17500	t	247	672	7005 217801
133	2023-07-06	2023-07-07	2023-07-26	50000	t	345	14	2518 365664
134	2023-07-05	2023-07-19	2023-08-06	68500	t	170	628	4487 223473
135	2023-02-14	2023-02-17	2023-02-18	45500	t	464	587	4870 936719
136	2023-04-28	2023-05-22	2023-06-03	61000	t	655	172	7005 217801
137	2023-05-19	2023-06-30	2023-07-11	81000	t	562	624	2518 365664
138	2023-03-07	2023-05-04	2023-05-13	48000	t	101	827	4487 223473
139	2023-03-17	2023-03-29	2023-04-14	86000	t	34	714	4870 936719
140	2023-06-24	2023-07-06	2023-07-22	34000	t	369	309	7005 217801
141	2023-04-20	2023-05-18	2023-06-05	43500	t	431	342	2518 365664
142	2023-06-24	2023-07-08	2023-07-23	74000	t	417	543	4487 223473
143	2023-11-03	2023-11-25	2023-12-12	70500	t	939	396	4870 936719
144	2023-05-31	2023-07-09	2023-07-18	63000	t	268	839	7005 217801
145	2023-01-18	2023-03-16	2023-03-18	93000	t	700	930	2518 365664
146	2023-05-06	2023-05-07	2023-05-25	82500	t	718	259	4487 223473
147	2023-08-22	2023-09-23	2023-10-12	50000	t	544	269	4870 936719
148	2023-10-26	2023-12-01	2023-12-08	16500	t	185	453	7005 217801
149	2023-01-09	2023-02-21	2023-03-03	45000	t	969	826	2518 365664
150	2023-08-17	2023-10-13	2023-10-18	27000	t	220	730	4487 223473
151	2023-11-23	2023-12-02	2023-12-23	31500	t	981	411	4870 936719
152	2023-03-06	2023-05-01	2023-05-08	30000	t	170	357	7005 217801
153	2023-11-20	2024-01-11	2024-01-22	71500	t	887	975	2518 365664
154	2023-12-19	2024-02-13	2024-03-01	21000	t	264	452	4487 223473
155	2023-09-05	2023-11-01	2023-11-10	59500	t	157	223	4870 936719
156	2023-10-06	2023-10-20	2023-11-02	32000	t	218	27	7005 217801
157	2023-03-23	2023-04-13	2023-04-29	63000	t	895	561	2518 365664
158	2023-04-02	2023-05-15	2023-05-25	47500	t	823	962	4487 223473
159	2023-12-14	2024-02-04	2024-02-25	95500	t	687	745	4870 936719
160	2023-06-02	2023-06-05	2023-06-10	95000	t	493	768	7005 217801
161	2023-11-26	2023-12-24	2023-12-30	14500	t	837	960	2518 365664
162	2023-06-04	2023-07-11	2023-07-17	86000	t	68	531	4487 223473
163	2023-08-31	2023-09-30	2023-10-13	58000	t	436	120	4870 936719
164	2023-11-26	2023-12-22	2023-12-23	15000	t	527	269	7005 217801
165	2023-08-28	2023-10-14	2023-10-15	84500	t	506	495	2518 365664
166	2023-04-10	2023-04-24	2023-05-09	87500	t	151	681	4487 223473
167	2023-07-23	2023-09-09	2023-09-29	25500	t	222	966	4870 936719
168	2023-03-20	2023-04-30	2023-05-20	31500	t	629	557	7005 217801
169	2023-03-24	2023-04-04	2023-04-07	85500	t	216	796	2518 365664
170	2023-05-28	2023-07-03	2023-07-06	58000	t	518	393	4487 223473
171	2023-11-04	2023-12-18	2023-12-28	28000	t	548	278	4870 936719
172	2023-12-26	2024-01-06	2024-01-16	65500	t	708	791	7005 217801
173	2023-02-07	2023-03-11	2023-03-13	64500	t	392	929	2518 365664
174	2023-12-30	2024-01-14	2024-02-01	40500	t	68	491	4487 223473
175	2023-10-19	2023-10-21	2023-11-03	75500	t	261	525	4870 936719
176	2023-01-25	2023-02-09	2023-02-27	17000	t	688	756	7005 217801
177	2023-12-28	2024-02-18	2024-02-19	14500	t	725	70	2518 365664
178	2023-05-17	2023-06-03	2023-06-12	95500	t	315	470	4487 223473
179	2023-02-03	2023-03-14	2023-03-24	57000	t	965	340	4870 936719
180	2023-01-07	2023-02-09	2023-02-23	81000	t	688	713	7005 217801
181	2023-05-29	2023-06-05	2023-06-20	30500	t	904	452	2518 365664
182	2023-09-11	2023-11-08	2023-11-25	22500	t	515	757	4487 223473
183	2023-11-28	2024-01-12	2024-02-02	84500	t	611	885	4870 936719
184	2023-02-23	2023-04-01	2023-04-03	11500	t	339	48	7005 217801
185	2023-06-05	2023-06-15	2023-07-06	30000	t	68	528	2518 365664
186	2023-03-21	2023-03-23	2023-04-07	44000	t	207	170	4487 223473
187	2023-10-21	2023-11-11	2023-11-25	46000	t	212	952	4870 936719
188	2023-07-09	2023-08-23	2023-08-28	18000	t	338	185	7005 217801
189	2023-04-16	2023-05-14	2023-05-27	87500	t	169	427	2518 365664
190	2023-06-05	2023-06-14	2023-06-27	34500	t	801	705	4487 223473
191	2023-02-19	2023-04-18	2023-04-27	31000	t	376	802	4870 936719
192	2023-02-23	2023-03-30	2023-04-13	56000	t	855	813	7005 217801
193	2023-08-04	2023-08-21	2023-08-27	68500	t	269	356	2518 365664
194	2023-10-27	2023-12-05	2023-12-20	31500	t	71	910	4487 223473
195	2023-06-06	2023-07-05	2023-07-11	97500	t	325	415	4870 936719
196	2023-08-29	2023-10-11	2023-10-27	68500	t	678	584	7005 217801
197	2023-02-23	2023-03-21	2023-04-02	12500	t	771	303	2518 365664
198	2023-07-21	2023-07-29	2023-08-06	41000	t	371	582	4487 223473
199	2023-01-28	2023-02-19	2023-03-08	73500	t	369	145	4870 936719
200	2023-06-05	2023-07-19	2023-08-05	97000	t	607	99	7005 217801
201	2023-05-10	2023-07-01	2023-07-16	11000	t	236	174	2518 365664
202	2023-05-21	2023-06-03	2023-06-10	81500	t	842	397	4487 223473
203	2023-09-01	2023-10-06	2023-10-10	20000	t	11	686	4870 936719
204	2023-10-16	2023-11-28	2023-11-29	52500	t	751	4	7005 217801
205	2023-09-23	2023-11-15	2023-12-03	35000	t	3	187	2518 365664
206	2023-03-07	2023-04-21	2023-04-23	32500	t	636	13	4487 223473
207	2023-05-02	2023-05-12	2023-05-30	19500	t	27	765	4870 936719
208	2023-09-06	2023-09-12	2023-09-27	63000	t	184	852	7005 217801
209	2023-10-21	2023-12-10	2023-12-15	15000	t	648	53	2518 365664
210	2023-08-05	2023-10-03	2023-10-16	91000	t	31	87	4487 223473
211	2023-03-27	2023-04-12	2023-04-16	17500	t	348	526	4870 936719
212	2023-01-21	2023-02-05	2023-02-24	43500	t	948	474	7005 217801
213	2023-03-03	2023-03-17	2023-03-22	57000	t	406	839	2518 365664
214	2023-02-18	2023-02-28	2023-03-02	57500	t	692	424	4487 223473
215	2023-06-13	2023-06-28	2023-07-11	45000	t	993	883	4870 936719
216	2023-09-27	2023-10-02	2023-10-08	12000	t	241	429	7005 217801
217	2023-04-12	2023-05-18	2023-06-02	57500	t	317	520	2518 365664
218	2023-07-02	2023-08-27	2023-09-14	55000	t	851	433	4487 223473
219	2023-08-20	2023-09-12	2023-09-15	35500	t	443	671	4870 936719
220	2023-12-01	2024-01-28	2024-02-06	90000	t	612	443	7005 217801
221	2023-01-03	2023-02-08	2023-02-12	94000	t	234	605	2518 365664
222	2023-01-22	2023-03-15	2023-03-25	33000	t	879	268	4487 223473
223	2023-12-09	2024-01-07	2024-01-10	89500	t	257	104	4870 936719
224	2023-07-15	2023-08-08	2023-08-18	26500	t	881	293	7005 217801
225	2023-07-10	2023-08-27	2023-09-07	21500	t	445	802	2518 365664
226	2023-06-20	2023-06-27	2023-06-29	14500	t	416	120	4487 223473
227	2023-03-09	2023-04-20	2023-05-01	33500	t	51	308	4870 936719
228	2023-09-01	2023-09-03	2023-09-10	60000	t	92	241	7005 217801
229	2023-06-09	2023-06-25	2023-07-16	90500	t	85	60	2518 365664
230	2023-03-29	2023-04-08	2023-04-16	87500	t	69	78	4487 223473
231	2023-10-18	2023-12-11	2023-12-23	23500	t	819	260	4870 936719
232	2023-01-01	2023-02-15	2023-02-16	11000	t	836	55	7005 217801
233	2023-01-05	2023-01-27	2023-01-29	32000	t	791	555	2518 365664
234	2023-05-06	2023-07-04	2023-07-12	29000	t	278	47	4487 223473
235	2023-12-31	2024-01-06	2024-01-24	44500	t	811	211	4870 936719
236	2023-12-28	2024-01-09	2024-01-25	25500	t	199	478	7005 217801
237	2023-06-20	2023-08-15	2023-08-21	17000	t	588	155	2518 365664
238	2023-08-15	2023-09-27	2023-10-02	71000	t	503	349	4487 223473
239	2023-12-17	2024-01-31	2024-02-01	55000	t	708	842	4870 936719
240	2023-05-25	2023-06-13	2023-07-03	27000	t	568	375	7005 217801
241	2023-08-07	2023-09-16	2023-09-23	57000	t	406	441	2518 365664
242	2023-01-03	2023-02-11	2023-02-27	39000	t	467	113	4487 223473
243	2023-05-19	2023-07-09	2023-07-23	77500	t	414	118	4870 936719
244	2023-12-11	2024-02-03	2024-02-06	94000	t	423	886	7005 217801
245	2023-03-10	2023-03-22	2023-04-04	50000	t	752	177	2518 365664
246	2023-06-12	2023-07-18	2023-07-22	10500	t	575	173	4487 223473
247	2023-01-28	2023-02-20	2023-03-01	70000	t	428	855	4870 936719
248	2023-10-25	2023-12-09	2023-12-19	90000	t	737	565	7005 217801
249	2023-08-17	2023-10-16	2023-10-19	41000	t	708	753	2518 365664
250	2023-02-28	2023-03-27	2023-04-16	77000	t	642	147	4487 223473
251	2023-11-20	2024-01-12	2024-01-18	13000	t	107	86	4870 936719
252	2023-02-13	2023-02-14	2023-02-18	99000	t	532	969	7005 217801
253	2023-01-02	2023-01-14	2023-01-18	76000	t	192	642	2518 365664
254	2023-07-10	2023-07-24	2023-08-05	79500	t	301	547	4487 223473
255	2023-04-29	2023-05-29	2023-06-09	41000	t	543	313	4870 936719
256	2023-08-30	2023-09-19	2023-09-28	42000	t	393	901	7005 217801
257	2023-02-04	2023-02-23	2023-03-07	85000	t	31	364	2518 365664
258	2023-06-18	2023-07-28	2023-08-07	30000	t	224	38	4487 223473
259	2023-07-11	2023-08-30	2023-09-17	48000	t	201	9	4870 936719
260	2023-10-23	2023-12-05	2023-12-09	74500	t	313	512	7005 217801
261	2023-12-25	2024-01-27	2024-01-28	48500	t	676	447	2518 365664
262	2023-08-21	2023-09-20	2023-10-04	67000	t	484	285	4487 223473
263	2023-12-02	2023-12-21	2023-12-24	94000	t	25	679	4870 936719
264	2023-09-11	2023-10-28	2023-10-31	86000	t	964	21	7005 217801
265	2023-05-08	2023-06-18	2023-06-30	40500	t	496	484	2518 365664
266	2023-08-19	2023-09-09	2023-09-10	39000	t	195	11	4487 223473
267	2023-01-26	2023-02-21	2023-02-24	11000	t	132	989	4870 936719
268	2023-10-31	2023-12-07	2023-12-18	28000	t	220	582	7005 217801
269	2023-09-25	2023-09-28	2023-10-13	35500	t	399	798	2518 365664
270	2023-05-01	2023-05-05	2023-05-09	77000	t	315	993	4487 223473
271	2023-05-25	2023-06-05	2023-06-09	33000	t	392	803	4870 936719
272	2023-01-18	2023-01-27	2023-02-05	15000	t	843	79	7005 217801
273	2023-12-05	2023-12-28	2024-01-02	65500	t	175	282	2518 365664
274	2023-02-22	2023-03-10	2023-03-14	78000	t	300	747	4487 223473
275	2023-12-01	2023-12-04	2023-12-22	89000	t	610	619	4870 936719
276	2023-03-01	2023-04-07	2023-04-09	43000	t	395	616	7005 217801
277	2023-10-27	2023-12-03	2023-12-22	81500	t	321	891	2518 365664
278	2023-03-12	2023-04-19	2023-05-06	29000	t	841	827	4487 223473
279	2023-12-18	2023-12-23	2024-01-11	15500	t	290	543	4870 936719
280	2023-04-04	2023-04-15	2023-05-06	52500	t	849	591	7005 217801
281	2023-07-14	2023-08-16	2023-08-18	19500	t	248	413	2518 365664
282	2023-11-04	2023-12-10	2023-12-17	43000	t	683	949	4487 223473
283	2023-11-19	2023-12-31	2024-01-05	25500	t	207	349	4870 936719
284	2023-12-30	2024-02-06	2024-02-11	13500	t	331	42	7005 217801
285	2023-07-28	2023-08-16	2023-09-03	13000	t	675	580	2518 365664
286	2023-12-29	2024-02-06	2024-02-22	79000	t	779	592	4487 223473
287	2023-08-04	2023-09-07	2023-09-23	91500	t	978	165	4870 936719
288	2023-05-15	2023-05-25	2023-06-10	77000	t	442	500	7005 217801
289	2023-07-15	2023-07-26	2023-08-02	10500	t	236	96	2518 365664
290	2023-05-09	2023-06-11	2023-06-15	28000	t	843	618	4487 223473
291	2023-01-07	2023-01-31	2023-02-14	70500	t	769	568	4870 936719
292	2023-04-14	2023-06-01	2023-06-19	64500	t	1	268	7005 217801
293	2023-03-15	2023-04-01	2023-04-15	87500	t	599	996	2518 365664
294	2023-07-08	2023-07-25	2023-07-27	26500	t	200	624	4487 223473
295	2023-06-06	2023-08-02	2023-08-16	75000	t	901	502	4870 936719
296	2023-12-15	2024-02-13	2024-02-22	46500	t	111	922	7005 217801
297	2023-10-27	2023-11-19	2023-11-21	74500	t	683	69	2518 365664
298	2023-01-11	2023-03-09	2023-03-28	28000	t	764	939	4487 223473
299	2023-08-14	2023-09-22	2023-09-26	84500	t	676	642	4870 936719
300	2023-04-21	2023-06-06	2023-06-20	46500	t	606	619	7005 217801
301	2023-05-14	2023-06-20	2023-06-29	46000	t	442	210	2518 365664
302	2023-05-05	2023-06-19	2023-06-23	59000	t	123	783	4487 223473
303	2023-06-06	2023-07-26	2023-08-14	36000	t	797	726	4870 936719
304	2023-11-27	2024-01-23	2024-02-03	26500	t	299	558	7005 217801
305	2023-10-16	2023-11-22	2023-12-01	50000	t	162	610	2518 365664
306	2023-06-10	2023-06-16	2023-06-25	95500	t	632	576	4487 223473
307	2023-09-03	2023-10-18	2023-11-08	26500	t	964	683	4870 936719
308	2023-06-15	2023-08-03	2023-08-12	12000	t	899	4	7005 217801
309	2023-09-22	2023-09-27	2023-10-18	20000	t	280	965	2518 365664
310	2023-06-26	2023-07-23	2023-07-27	48000	t	837	528	4487 223473
311	2023-04-18	2023-06-04	2023-06-18	96000	t	638	930	4870 936719
312	2023-06-16	2023-07-16	2023-08-05	48500	t	328	365	7005 217801
313	2023-07-28	2023-09-02	2023-09-14	81000	t	253	535	2518 365664
314	2023-01-22	2023-03-23	2023-04-06	28500	t	229	596	4487 223473
315	2023-10-11	2023-10-13	2023-10-29	60000	t	251	656	4870 936719
316	2023-06-09	2023-07-27	2023-08-07	59000	t	929	44	7005 217801
317	2023-03-14	2023-04-03	2023-04-10	32500	t	23	301	2518 365664
318	2023-04-24	2023-04-28	2023-05-03	54500	t	246	57	4487 223473
319	2023-10-07	2023-10-28	2023-11-03	76000	t	823	460	4870 936719
320	2023-12-25	2024-01-08	2024-01-15	25000	t	654	978	7005 217801
321	2023-04-03	2023-06-01	2023-06-04	34000	t	794	188	2518 365664
322	2023-12-07	2023-12-19	2023-12-21	88500	t	331	716	4487 223473
323	2023-05-01	2023-05-04	2023-05-15	91500	t	532	313	4870 936719
324	2023-09-05	2023-10-12	2023-10-19	13500	t	265	63	7005 217801
325	2023-11-09	2023-11-22	2023-12-11	61500	t	891	824	2518 365664
326	2023-08-24	2023-08-28	2023-09-09	85500	t	435	290	4487 223473
327	2023-05-18	2023-06-08	2023-06-29	73000	t	718	129	4870 936719
328	2023-01-31	2023-03-28	2023-04-03	68500	t	842	136	7005 217801
329	2023-01-23	2023-03-22	2023-04-05	11000	t	423	301	2518 365664
330	2023-02-25	2023-04-07	2023-04-15	83000	t	665	887	4487 223473
331	2023-12-12	2023-12-22	2023-12-31	13500	t	514	771	4870 936719
332	2023-08-07	2023-08-15	2023-08-27	68000	t	732	817	7005 217801
333	2023-12-06	2024-01-06	2024-01-10	64000	t	286	709	2518 365664
334	2023-11-15	2023-12-02	2023-12-11	21000	t	150	162	4487 223473
335	2023-03-06	2023-04-25	2023-04-26	68500	t	100	282	4870 936719
336	2023-09-04	2023-10-26	2023-11-06	67500	t	690	856	7005 217801
337	2023-08-22	2023-09-21	2023-10-07	25500	t	134	314	2518 365664
338	2023-01-04	2023-02-18	2023-02-23	18000	t	256	302	4487 223473
339	2023-04-14	2023-05-20	2023-06-01	92500	t	648	575	4870 936719
340	2023-02-02	2023-03-16	2023-03-25	18000	t	243	828	7005 217801
341	2023-03-28	2023-04-13	2023-05-03	76000	t	106	501	2518 365664
342	2023-05-29	2023-07-13	2023-07-29	91000	t	76	16	4487 223473
343	2023-05-14	2023-06-26	2023-07-08	60000	t	872	610	4870 936719
344	2023-02-11	2023-02-28	2023-03-18	30500	t	497	624	7005 217801
345	2023-11-03	2023-11-26	2023-12-17	85000	t	415	705	2518 365664
346	2023-11-04	2023-11-13	2023-11-18	40500	t	882	290	4487 223473
347	2023-05-10	2023-07-09	2023-07-19	30000	t	218	184	4870 936719
348	2023-10-02	2023-11-10	2023-11-24	54000	t	341	729	7005 217801
349	2023-09-06	2023-10-05	2023-10-25	91500	t	792	553	2518 365664
350	2023-04-20	2023-05-05	2023-05-14	18000	t	948	793	4487 223473
351	2023-05-31	2023-07-03	2023-07-08	78500	t	494	278	4870 936719
352	2023-11-03	2023-12-10	2023-12-12	15500	t	174	847	7005 217801
353	2023-04-16	2023-05-31	2023-06-08	23500	t	142	398	2518 365664
354	2023-03-28	2023-04-05	2023-04-26	64000	t	605	476	4487 223473
355	2023-11-06	2023-11-29	2023-12-17	87000	t	831	444	4870 936719
356	2023-05-03	2023-06-28	2023-07-04	44500	t	23	706	7005 217801
357	2023-02-02	2023-02-14	2023-03-01	42500	t	415	197	2518 365664
358	2023-09-08	2023-11-05	2023-11-07	79000	t	255	931	4487 223473
359	2023-03-01	2023-04-01	2023-04-18	91500	t	222	43	4870 936719
360	2023-06-25	2023-07-21	2023-07-22	27500	t	503	540	7005 217801
361	2023-03-18	2023-03-21	2023-03-29	19000	t	558	881	2518 365664
362	2023-09-06	2023-10-19	2023-11-07	52000	t	878	284	4487 223473
363	2023-09-30	2023-11-07	2023-11-23	82000	t	396	456	4870 936719
364	2023-04-11	2023-04-29	2023-05-08	80000	t	689	728	7005 217801
365	2023-08-14	2023-08-31	2023-09-02	42500	t	697	163	2518 365664
366	2023-09-03	2023-10-21	2023-10-26	27000	t	387	622	4487 223473
367	2023-03-12	2023-05-02	2023-05-21	35000	t	535	655	4870 936719
368	2023-10-08	2023-11-27	2023-12-17	42000	t	259	952	7005 217801
369	2023-09-29	2023-10-07	2023-10-19	25500	t	930	829	2518 365664
370	2023-04-28	2023-06-14	2023-06-22	99000	t	20	551	4487 223473
371	2023-01-17	2023-02-03	2023-02-17	86000	t	109	81	4870 936719
372	2023-01-06	2023-01-15	2023-01-31	22000	t	436	95	7005 217801
373	2023-01-04	2023-01-18	2023-02-05	49000	t	446	204	2518 365664
374	2023-04-01	2023-05-06	2023-05-24	94500	t	507	794	4487 223473
375	2023-01-28	2023-03-21	2023-04-06	28000	t	617	820	4870 936719
376	2023-02-17	2023-02-25	2023-03-04	58000	t	885	900	7005 217801
377	2023-05-20	2023-07-17	2023-07-24	51000	t	999	790	2518 365664
378	2023-08-30	2023-09-30	2023-10-11	20000	t	654	650	4487 223473
379	2023-06-02	2023-06-27	2023-07-12	83000	t	783	319	4870 936719
380	2023-05-20	2023-06-29	2023-07-01	36500	t	33	161	7005 217801
381	2023-03-26	2023-04-22	2023-05-12	34500	t	686	608	2518 365664
382	2023-03-07	2023-03-23	2023-03-24	86500	t	4	432	4487 223473
383	2023-01-02	2023-02-06	2023-02-26	99000	t	90	971	4870 936719
384	2023-10-11	2023-11-22	2023-11-30	80500	t	176	642	7005 217801
385	2023-02-09	2023-03-29	2023-04-13	80000	t	370	638	2518 365664
386	2023-03-30	2023-04-23	2023-05-04	62500	t	924	471	4487 223473
387	2023-05-28	2023-07-23	2023-07-27	97000	t	817	739	4870 936719
388	2023-12-23	2024-02-14	2024-03-05	87500	t	358	130	7005 217801
389	2023-10-22	2023-11-03	2023-11-14	16500	t	856	170	2518 365664
390	2023-08-12	2023-08-25	2023-09-06	43500	t	161	294	4487 223473
391	2023-02-07	2023-03-30	2023-04-17	88500	t	865	748	4870 936719
392	2023-08-24	2023-09-30	2023-10-10	42000	t	163	806	7005 217801
393	2023-05-21	2023-05-23	2023-06-13	81500	t	499	900	2518 365664
394	2023-04-13	2023-06-07	2023-06-21	16500	t	326	546	4487 223473
395	2023-11-10	2023-12-21	2024-01-06	56000	t	532	282	4870 936719
396	2023-04-05	2023-05-15	2023-05-21	63500	t	699	605	7005 217801
397	2023-09-28	2023-10-12	2023-10-18	97500	t	390	253	2518 365664
398	2023-06-06	2023-07-26	2023-08-07	63000	t	995	635	4487 223473
399	2023-03-30	2023-05-23	2023-05-25	25000	t	127	177	4870 936719
400	2023-05-17	2023-07-04	2023-07-16	76500	t	394	611	7005 217801
401	2023-08-04	2023-09-19	2023-09-27	41000	t	576	646	2518 365664
402	2023-06-23	2023-07-24	2023-07-27	77500	t	15	990	4487 223473
403	2023-11-17	2024-01-05	2024-01-07	11500	t	832	551	4870 936719
404	2023-01-16	2023-02-16	2023-02-18	12000	t	666	22	7005 217801
405	2023-08-13	2023-09-28	2023-10-17	83000	t	187	508	2518 365664
406	2023-05-26	2023-06-02	2023-06-10	62500	t	234	572	4487 223473
407	2023-02-24	2023-03-04	2023-03-20	33000	t	352	862	4870 936719
408	2023-08-11	2023-09-10	2023-09-23	29500	t	642	741	7005 217801
409	2023-10-22	2023-11-01	2023-11-18	25000	t	409	31	2518 365664
410	2023-03-10	2023-05-06	2023-05-07	86000	t	76	903	4487 223473
411	2023-03-26	2023-04-07	2023-04-19	32500	t	383	547	4870 936719
412	2023-07-24	2023-08-27	2023-09-15	83500	t	635	55	7005 217801
413	2023-12-21	2024-02-12	2024-02-16	49500	t	668	107	2518 365664
414	2023-10-05	2023-10-24	2023-10-25	42000	t	422	275	4487 223473
415	2023-07-13	2023-07-22	2023-08-01	42500	t	190	533	4870 936719
416	2023-04-15	2023-04-21	2023-04-24	37000	t	516	387	7005 217801
417	2023-04-30	2023-05-07	2023-05-10	67000	t	149	188	2518 365664
418	2023-10-26	2023-11-12	2023-11-15	35500	t	65	709	4487 223473
419	2023-05-02	2023-05-11	2023-05-20	62000	t	463	616	4870 936719
420	2023-11-22	2024-01-03	2024-01-18	64500	t	7	806	7005 217801
421	2023-10-10	2023-10-13	2023-10-22	24500	t	113	276	2518 365664
422	2023-05-22	2023-06-01	2023-06-13	51000	t	871	227	4487 223473
423	2023-07-26	2023-08-01	2023-08-17	38500	t	399	846	4870 936719
424	2023-12-18	2024-02-11	2024-03-01	46000	t	347	914	7005 217801
425	2023-02-15	2023-03-22	2023-04-07	33000	t	194	302	2518 365664
426	2023-12-06	2023-12-30	2024-01-19	66000	t	752	216	4487 223473
427	2023-03-12	2023-04-08	2023-04-22	97500	t	517	872	4870 936719
428	2023-10-01	2023-10-08	2023-10-15	53000	t	398	433	7005 217801
429	2023-09-15	2023-10-29	2023-11-05	78000	t	828	961	2518 365664
430	2023-08-19	2023-09-30	2023-10-09	42000	t	598	847	4487 223473
431	2023-08-31	2023-09-15	2023-09-26	68500	t	343	253	4870 936719
432	2023-09-19	2023-11-07	2023-11-28	16500	t	470	100	7005 217801
433	2023-01-17	2023-03-17	2023-04-04	15500	t	835	184	2518 365664
434	2023-05-21	2023-06-02	2023-06-11	23500	t	864	402	4487 223473
435	2023-04-07	2023-05-01	2023-05-02	54000	t	122	827	4870 936719
436	2023-02-26	2023-03-11	2023-03-16	67500	t	616	292	7005 217801
437	2023-02-12	2023-04-08	2023-04-11	30500	t	764	553	2518 365664
438	2023-09-21	2023-11-19	2023-12-08	46500	t	116	594	4487 223473
439	2023-02-20	2023-04-03	2023-04-20	93500	t	628	449	4870 936719
440	2023-02-21	2023-04-22	2023-05-10	78500	t	504	495	7005 217801
441	2023-06-01	2023-07-17	2023-07-27	43000	t	472	884	2518 365664
442	2023-04-26	2023-05-29	2023-06-11	29000	t	639	870	4487 223473
443	2023-08-29	2023-10-27	2023-10-28	66000	t	273	29	4870 936719
444	2023-03-16	2023-04-11	2023-04-26	52500	t	521	895	7005 217801
445	2023-06-28	2023-08-12	2023-08-22	11000	t	724	606	2518 365664
446	2023-05-04	2023-06-14	2023-06-19	97000	t	289	736	4487 223473
447	2023-08-15	2023-08-20	2023-09-10	88000	t	114	475	4870 936719
448	2023-10-15	2023-12-04	2023-12-10	79500	t	317	74	7005 217801
449	2023-09-19	2023-10-14	2023-10-30	81500	t	951	557	2518 365664
450	2023-12-27	2024-01-16	2024-02-04	90500	t	754	985	4487 223473
451	2023-10-19	2023-10-21	2023-10-23	11000	t	812	612	4870 936719
452	2023-04-06	2023-04-22	2023-04-24	57500	t	838	517	7005 217801
453	2023-01-24	2023-03-04	2023-03-10	66000	t	626	621	2518 365664
454	2023-12-12	2023-12-19	2023-12-27	48500	t	771	991	4487 223473
455	2023-04-19	2023-05-07	2023-05-12	52500	t	644	744	4870 936719
456	2023-10-09	2023-11-04	2023-11-10	14000	t	896	511	7005 217801
457	2023-12-13	2024-01-29	2024-02-18	42500	t	880	235	2518 365664
458	2023-07-31	2023-08-17	2023-09-05	54500	t	290	422	4487 223473
459	2023-06-13	2023-06-29	2023-07-12	69000	t	413	439	4870 936719
460	2023-11-07	2023-12-06	2023-12-12	27000	t	792	308	7005 217801
461	2023-08-06	2023-08-16	2023-08-30	31500	t	624	279	2518 365664
462	2023-05-14	2023-06-21	2023-07-04	66500	t	433	76	4487 223473
463	2023-04-08	2023-05-24	2023-06-06	20000	t	655	990	4870 936719
464	2023-12-19	2024-01-02	2024-01-19	91000	t	621	555	7005 217801
465	2023-02-22	2023-03-19	2023-03-24	67500	t	386	926	2518 365664
466	2023-07-17	2023-09-04	2023-09-14	30000	t	657	253	4487 223473
467	2023-04-23	2023-05-24	2023-06-01	32000	t	356	650	4870 936719
468	2023-11-11	2023-11-26	2023-12-02	91500	t	291	843	7005 217801
469	2023-08-23	2023-10-10	2023-10-17	41000	t	429	594	2518 365664
470	2023-08-25	2023-08-27	2023-08-28	27000	t	977	664	4487 223473
471	2023-10-02	2023-10-19	2023-10-24	30000	t	379	300	4870 936719
472	2023-07-07	2023-08-01	2023-08-17	17000	t	147	802	7005 217801
473	2023-08-21	2023-09-07	2023-09-25	11500	t	538	1000	2518 365664
474	2023-05-09	2023-07-07	2023-07-17	89000	t	744	562	4487 223473
475	2023-02-27	2023-03-09	2023-03-11	89000	t	7	612	4870 936719
476	2023-07-08	2023-09-03	2023-09-24	95500	t	442	578	7005 217801
477	2023-11-12	2023-12-25	2024-01-15	83000	t	626	258	2518 365664
478	2023-07-06	2023-08-26	2023-09-03	84500	t	61	146	4487 223473
479	2023-12-06	2023-12-30	2024-01-15	50000	t	96	131	4870 936719
480	2023-08-04	2023-08-27	2023-09-10	94500	t	76	874	7005 217801
481	2023-03-27	2023-04-03	2023-04-12	94500	t	575	949	2518 365664
482	2023-11-17	2023-11-18	2023-12-05	60000	t	231	64	4487 223473
483	2023-11-02	2023-12-31	2024-01-02	81500	t	250	162	4870 936719
484	2023-08-12	2023-09-28	2023-10-03	93000	t	568	33	7005 217801
485	2023-04-05	2023-06-02	2023-06-09	12500	t	59	400	2518 365664
486	2023-05-09	2023-05-23	2023-06-11	87500	t	225	334	4487 223473
487	2023-07-07	2023-07-21	2023-07-26	46500	t	959	257	4870 936719
488	2023-03-31	2023-04-24	2023-05-07	23000	t	364	810	7005 217801
489	2023-05-18	2023-05-23	2023-06-12	32000	t	468	619	2518 365664
490	2023-03-05	2023-04-01	2023-04-03	50500	t	179	831	4487 223473
491	2023-10-07	2023-12-01	2023-12-09	50000	t	264	765	4870 936719
492	2023-10-17	2023-10-29	2023-11-08	92000	t	52	401	7005 217801
493	2023-12-20	2024-01-09	2024-01-12	30500	t	260	134	2518 365664
494	2023-06-05	2023-07-13	2023-07-27	92500	t	844	39	4487 223473
495	2023-07-29	2023-08-01	2023-08-07	49000	t	866	202	4870 936719
496	2023-05-23	2023-05-31	2023-06-18	74500	t	523	280	7005 217801
497	2023-01-30	2023-03-14	2023-03-21	54500	t	597	402	2518 365664
498	2023-05-29	2023-06-23	2023-07-01	43000	t	659	483	4487 223473
499	2023-08-09	2023-08-21	2023-09-01	73500	t	999	935	4870 936719
500	2023-09-13	2023-09-22	2023-09-28	94500	t	666	235	7005 217801
501	2023-04-17	2023-04-18	2023-05-07	50500	t	909	253	2518 365664
502	2023-04-03	2023-05-30	2023-06-12	29500	t	657	206	4487 223473
503	2023-04-25	2023-06-07	2023-06-13	57000	t	730	232	4870 936719
504	2023-12-22	2024-01-11	2024-02-01	27500	t	961	19	7005 217801
505	2023-11-11	2023-12-08	2023-12-09	14500	t	628	380	2518 365664
506	2023-08-28	2023-09-03	2023-09-05	95000	t	562	936	4487 223473
507	2023-08-07	2023-09-07	2023-09-20	40500	t	987	121	4870 936719
508	2023-12-23	2024-01-19	2024-02-09	10500	t	934	819	7005 217801
509	2023-04-08	2023-05-25	2023-06-08	46500	t	56	678	2518 365664
510	2023-05-08	2023-05-31	2023-06-03	34500	t	175	483	4487 223473
511	2023-05-03	2023-05-07	2023-05-22	81000	t	786	14	4870 936719
512	2023-07-25	2023-09-11	2023-09-17	34500	t	527	722	7005 217801
513	2023-09-14	2023-09-26	2023-10-05	34000	t	209	850	2518 365664
514	2023-10-24	2023-11-10	2023-11-22	17500	t	467	902	4487 223473
515	2023-09-09	2023-10-16	2023-11-03	27500	t	823	640	4870 936719
516	2023-09-17	2023-11-06	2023-11-27	66500	t	54	899	7005 217801
517	2023-05-26	2023-07-05	2023-07-22	82000	t	479	823	2518 365664
518	2023-05-05	2023-05-18	2023-05-27	95500	t	712	699	4487 223473
519	2023-07-03	2023-07-23	2023-08-07	98500	t	499	978	4870 936719
520	2023-09-29	2023-11-13	2023-12-03	12000	t	783	119	7005 217801
521	2023-07-19	2023-09-05	2023-09-21	66000	t	564	484	2518 365664
522	2023-11-21	2023-12-14	2024-01-02	45500	t	422	560	4487 223473
523	2023-07-08	2023-08-25	2023-08-26	63000	t	955	727	4870 936719
524	2023-11-22	2023-12-20	2024-01-03	44500	t	634	352	7005 217801
525	2023-10-25	2023-12-03	2023-12-18	30500	t	874	258	2518 365664
526	2023-09-19	2023-09-27	2023-10-03	44000	t	281	668	4487 223473
527	2023-06-16	2023-08-08	2023-08-22	72500	t	578	644	4870 936719
528	2023-03-03	2023-03-04	2023-03-22	48500	t	318	290	7005 217801
529	2023-06-17	2023-07-02	2023-07-12	36500	t	895	415	2518 365664
530	2023-10-02	2023-12-01	2023-12-10	34000	t	669	785	4487 223473
531	2023-10-03	2023-12-01	2023-12-03	41000	t	23	627	4870 936719
532	2023-11-18	2023-11-28	2023-11-30	38000	t	711	356	7005 217801
533	2023-06-22	2023-07-17	2023-07-30	70000	t	379	649	2518 365664
534	2023-02-19	2023-03-15	2023-04-03	47500	t	189	271	4487 223473
535	2023-06-25	2023-08-22	2023-08-25	17000	t	77	854	4870 936719
536	2023-01-16	2023-01-19	2023-01-26	56500	t	287	673	7005 217801
537	2023-02-28	2023-03-06	2023-03-14	12000	t	76	806	2518 365664
538	2023-07-25	2023-08-08	2023-08-17	45500	t	693	781	4487 223473
539	2023-02-18	2023-03-04	2023-03-22	41000	t	765	433	4870 936719
540	2023-10-20	2023-12-15	2023-12-19	98500	t	472	774	7005 217801
541	2023-02-14	2023-02-20	2023-02-22	82500	t	52	309	2518 365664
542	2023-03-08	2023-03-22	2023-03-25	87500	t	985	501	4487 223473
543	2023-10-19	2023-12-02	2023-12-04	47000	t	428	595	4870 936719
544	2023-10-29	2023-12-19	2023-12-23	72500	t	579	534	7005 217801
545	2023-10-03	2023-10-06	2023-10-10	40000	t	616	56	2518 365664
546	2023-07-11	2023-08-08	2023-08-15	53500	t	329	577	4487 223473
547	2023-07-30	2023-09-22	2023-10-01	55000	t	436	81	4870 936719
548	2023-11-21	2024-01-06	2024-01-18	40500	t	603	341	7005 217801
549	2023-04-17	2023-04-25	2023-05-11	19500	t	602	681	2518 365664
550	2023-02-24	2023-03-07	2023-03-08	80500	t	810	436	4487 223473
551	2023-04-08	2023-06-06	2023-06-13	31500	t	442	487	4870 936719
552	2023-04-13	2023-05-31	2023-06-15	11000	t	890	720	7005 217801
553	2023-05-10	2023-06-17	2023-06-26	58500	t	257	213	2518 365664
554	2023-05-25	2023-07-21	2023-07-29	47500	t	826	815	4487 223473
555	2023-07-12	2023-08-13	2023-08-24	48000	t	683	528	4870 936719
556	2023-08-06	2023-09-20	2023-10-09	12000	t	689	451	7005 217801
557	2023-04-23	2023-06-18	2023-07-03	29500	t	522	320	2518 365664
558	2023-12-31	2024-01-23	2024-02-09	77000	t	46	729	4487 223473
559	2023-08-04	2023-09-16	2023-09-25	99500	t	683	443	4870 936719
560	2023-06-16	2023-08-07	2023-08-12	51000	t	403	150	7005 217801
561	2023-11-22	2023-11-27	2023-12-17	68000	t	135	356	2518 365664
562	2023-12-18	2024-02-05	2024-02-24	92000	t	501	429	4487 223473
563	2023-12-27	2024-02-18	2024-02-25	80000	t	309	620	4870 936719
564	2023-02-11	2023-03-06	2023-03-14	75500	t	618	659	7005 217801
565	2023-09-19	2023-10-22	2023-10-25	96000	t	517	475	2518 365664
566	2023-09-17	2023-09-18	2023-09-28	35000	t	416	775	4487 223473
567	2023-04-04	2023-04-23	2023-04-28	73500	t	293	826	4870 936719
568	2023-07-15	2023-09-07	2023-09-12	89500	t	833	327	7005 217801
569	2023-04-11	2023-05-16	2023-05-25	91000	t	638	204	2518 365664
570	2023-10-13	2023-10-14	2023-11-04	69000	t	870	605	4487 223473
571	2023-04-23	2023-06-21	2023-06-25	34500	t	913	358	4870 936719
572	2023-11-26	2024-01-21	2024-01-29	20000	t	453	748	7005 217801
573	2023-02-01	2023-02-08	2023-02-22	12000	t	472	78	2518 365664
574	2023-08-23	2023-10-06	2023-10-16	94500	t	705	211	4487 223473
575	2023-10-26	2023-12-14	2024-01-02	48000	t	380	851	4870 936719
576	2023-07-25	2023-09-12	2023-09-25	39000	t	924	413	7005 217801
577	2023-03-28	2023-04-22	2023-05-07	21000	t	567	589	2518 365664
578	2023-10-01	2023-10-06	2023-10-20	85500	t	263	642	4487 223473
579	2023-04-14	2023-05-07	2023-05-19	58500	t	429	831	4870 936719
580	2023-05-03	2023-06-18	2023-06-26	66000	t	975	209	7005 217801
581	2023-12-10	2024-01-04	2024-01-25	11500	t	486	904	2518 365664
582	2023-06-01	2023-07-16	2023-07-29	89500	t	410	145	4487 223473
583	2023-09-07	2023-10-10	2023-10-12	30000	t	896	295	4870 936719
584	2023-06-09	2023-06-17	2023-07-02	93000	t	346	926	7005 217801
585	2023-07-01	2023-07-30	2023-08-13	65500	t	266	472	2518 365664
586	2023-06-30	2023-07-26	2023-07-29	60500	t	106	270	4487 223473
587	2023-10-20	2023-12-10	2023-12-19	67500	t	556	298	4870 936719
588	2023-11-06	2023-12-03	2023-12-11	66000	t	536	952	7005 217801
589	2023-12-14	2024-02-07	2024-02-22	26500	t	223	385	2518 365664
590	2023-05-28	2023-06-07	2023-06-16	71000	t	903	12	4487 223473
591	2023-11-07	2023-12-26	2024-01-12	29000	t	184	226	4870 936719
592	2023-02-02	2023-02-20	2023-03-04	24000	t	146	242	7005 217801
593	2023-08-05	2023-09-23	2023-10-02	18500	t	475	826	2518 365664
594	2023-02-13	2023-02-21	2023-02-25	84500	t	885	280	4487 223473
595	2023-06-16	2023-07-22	2023-08-07	27000	t	212	862	4870 936719
596	2023-01-02	2023-02-02	2023-02-17	56500	t	825	564	7005 217801
597	2023-04-30	2023-05-01	2023-05-04	57000	t	699	947	2518 365664
598	2023-01-09	2023-02-08	2023-02-09	82000	t	890	874	4487 223473
599	2023-04-03	2023-05-30	2023-06-02	81000	t	583	84	4870 936719
600	2023-09-30	2023-11-28	2023-12-04	14500	t	813	134	7005 217801
601	2023-01-14	2023-02-17	2023-03-05	94000	t	724	902	2518 365664
602	2023-02-14	2023-02-21	2023-03-02	74000	t	20	515	4487 223473
603	2023-09-08	2023-10-03	2023-10-08	100000	t	821	811	4870 936719
604	2023-06-09	2023-07-18	2023-07-24	95500	t	670	706	7005 217801
605	2023-08-01	2023-09-19	2023-10-07	37500	t	281	331	2518 365664
606	2023-11-05	2023-11-16	2023-12-07	62000	t	438	817	4487 223473
607	2023-08-04	2023-09-15	2023-09-22	42000	t	596	684	4870 936719
608	2023-10-05	2023-10-12	2023-10-13	86000	t	341	422	7005 217801
609	2023-04-23	2023-05-16	2023-05-18	87500	t	563	871	2518 365664
610	2023-02-08	2023-03-23	2023-04-03	21500	t	8	935	4487 223473
611	2023-04-14	2023-06-05	2023-06-25	13500	t	144	472	4870 936719
612	2023-09-21	2023-11-19	2023-11-24	15000	t	794	558	7005 217801
613	2023-01-11	2023-01-23	2023-02-12	54500	t	803	722	2518 365664
614	2023-08-25	2023-09-11	2023-09-24	33500	t	430	595	4487 223473
615	2023-02-15	2023-03-25	2023-04-07	89000	t	830	91	4870 936719
616	2023-10-12	2023-11-21	2023-12-12	89500	t	228	994	7005 217801
617	2023-08-18	2023-09-08	2023-09-24	58500	t	346	89	2518 365664
618	2023-10-22	2023-12-10	2023-12-14	76000	t	333	265	4487 223473
619	2023-06-07	2023-06-29	2023-07-14	79500	t	900	980	4870 936719
620	2023-06-07	2023-07-30	2023-08-19	82500	t	554	328	7005 217801
621	2023-01-25	2023-02-20	2023-02-26	66500	t	722	114	2518 365664
622	2023-12-12	2024-01-04	2024-01-12	45500	t	232	755	4487 223473
623	2023-08-23	2023-08-31	2023-09-19	19000	t	712	429	4870 936719
624	2023-03-29	2023-04-05	2023-04-21	37000	t	904	419	7005 217801
625	2023-10-24	2023-10-27	2023-11-03	76000	t	740	638	2518 365664
626	2023-12-17	2023-12-25	2024-01-13	95500	t	30	368	4487 223473
627	2023-09-29	2023-11-02	2023-11-11	12000	t	909	466	4870 936719
628	2023-12-22	2024-02-20	2024-02-29	74500	t	955	521	7005 217801
629	2023-03-03	2023-04-14	2023-05-01	30500	t	16	890	2518 365664
630	2023-10-19	2023-11-05	2023-11-18	47500	t	656	376	4487 223473
631	2023-09-28	2023-10-08	2023-10-25	13500	t	713	346	4870 936719
632	2023-09-13	2023-11-12	2023-11-15	74500	t	741	697	7005 217801
633	2023-07-25	2023-07-27	2023-08-16	37000	t	147	283	2518 365664
634	2023-07-13	2023-07-17	2023-08-07	96500	t	71	454	4487 223473
635	2023-06-14	2023-07-03	2023-07-05	45000	t	751	711	4870 936719
636	2023-07-12	2023-09-06	2023-09-26	29000	t	156	864	7005 217801
637	2023-03-01	2023-03-14	2023-04-03	75000	t	646	550	2518 365664
638	2023-06-12	2023-08-11	2023-08-15	97500	t	724	481	4487 223473
639	2023-06-03	2023-06-13	2023-06-14	64000	t	302	924	4870 936719
640	2023-03-16	2023-03-17	2023-03-24	21500	t	375	467	7005 217801
641	2023-02-09	2023-03-03	2023-03-12	55500	t	448	364	2518 365664
642	2023-04-19	2023-05-19	2023-05-25	76000	t	288	567	4487 223473
643	2023-05-26	2023-06-27	2023-07-15	68000	t	480	975	4870 936719
644	2023-01-08	2023-02-11	2023-02-18	73500	t	628	715	7005 217801
645	2023-03-26	2023-04-02	2023-04-20	32500	t	717	994	2518 365664
646	2023-11-23	2023-12-29	2024-01-09	27000	t	895	214	4487 223473
647	2023-09-08	2023-10-06	2023-10-24	40500	t	818	954	4870 936719
648	2023-11-17	2023-12-01	2023-12-10	67500	t	275	529	7005 217801
649	2023-08-30	2023-09-12	2023-09-26	54500	t	601	273	2518 365664
650	2023-10-17	2023-12-14	2023-12-15	83000	t	895	730	4487 223473
651	2023-04-24	2023-06-19	2023-06-21	14000	t	291	592	4870 936719
652	2023-03-11	2023-04-03	2023-04-14	56500	t	780	557	7005 217801
653	2023-06-22	2023-06-25	2023-07-06	33500	t	360	981	2518 365664
654	2023-03-25	2023-03-26	2023-03-29	54000	t	466	321	4487 223473
655	2023-10-15	2023-11-26	2023-12-10	34000	t	924	808	4870 936719
656	2023-03-22	2023-04-13	2023-05-01	21500	t	106	609	7005 217801
657	2023-08-11	2023-09-28	2023-10-04	52500	t	776	942	2518 365664
658	2023-01-10	2023-02-02	2023-02-04	21000	t	898	781	4487 223473
659	2023-01-19	2023-03-11	2023-03-30	91500	t	452	506	4870 936719
660	2023-02-20	2023-03-11	2023-03-29	87000	t	231	284	7005 217801
661	2023-01-02	2023-01-06	2023-01-21	83000	t	805	517	2518 365664
662	2023-07-05	2023-08-17	2023-08-31	30000	t	85	12	4487 223473
663	2023-06-11	2023-06-16	2023-06-27	25500	t	506	974	4870 936719
664	2023-04-06	2023-05-11	2023-05-24	41000	t	274	576	7005 217801
665	2023-09-27	2023-11-12	2023-11-15	45500	t	614	420	2518 365664
666	2023-12-19	2024-01-28	2024-02-09	99000	t	337	512	4487 223473
667	2023-01-16	2023-03-01	2023-03-16	27000	t	753	623	4870 936719
668	2023-06-10	2023-06-17	2023-07-05	44500	t	947	289	7005 217801
669	2023-02-12	2023-03-04	2023-03-05	62000	t	598	23	2518 365664
670	2023-03-21	2023-05-16	2023-06-04	52500	t	511	116	4487 223473
671	2023-01-14	2023-02-08	2023-02-24	72000	t	829	294	4870 936719
672	2023-06-21	2023-07-25	2023-08-11	87500	t	503	789	7005 217801
673	2023-12-27	2024-02-24	2024-02-26	90500	t	593	98	2518 365664
674	2023-12-04	2024-01-09	2024-01-15	84000	t	970	363	4487 223473
675	2023-03-10	2023-03-19	2023-03-24	19500	t	136	892	4870 936719
676	2023-01-06	2023-03-03	2023-03-14	69000	t	390	626	7005 217801
677	2023-08-18	2023-09-22	2023-10-02	89500	t	988	752	2518 365664
678	2023-01-22	2023-02-18	2023-03-07	71000	t	669	414	4487 223473
679	2023-09-28	2023-10-12	2023-10-19	95000	t	229	933	4870 936719
680	2023-02-25	2023-03-08	2023-03-12	18000	t	567	902	7005 217801
681	2023-12-30	2024-01-11	2024-01-22	93500	t	737	571	2518 365664
682	2023-01-01	2023-01-28	2023-02-12	23000	t	32	981	4487 223473
683	2023-02-05	2023-02-13	2023-02-25	81000	t	689	725	4870 936719
684	2023-12-29	2024-01-15	2024-02-04	67000	t	256	127	7005 217801
685	2023-05-02	2023-05-10	2023-05-15	63000	t	585	849	2518 365664
686	2023-08-15	2023-10-06	2023-10-11	72500	t	413	780	4487 223473
687	2023-06-11	2023-06-18	2023-06-21	96500	t	458	98	4870 936719
688	2023-05-14	2023-06-05	2023-06-12	92500	t	750	753	7005 217801
689	2023-04-13	2023-06-06	2023-06-08	41500	t	728	688	2518 365664
690	2023-03-13	2023-03-25	2023-04-15	29500	t	5	366	4487 223473
691	2023-07-19	2023-07-26	2023-07-28	72500	t	184	860	4870 936719
692	2023-02-16	2023-03-06	2023-03-26	37500	t	522	616	7005 217801
693	2023-02-16	2023-04-14	2023-05-04	74500	t	638	895	2518 365664
694	2023-01-01	2023-02-02	2023-02-04	16000	t	948	273	4487 223473
695	2023-05-06	2023-07-01	2023-07-02	74000	t	826	858	4870 936719
696	2023-02-23	2023-02-25	2023-03-07	13000	t	718	296	7005 217801
697	2023-08-25	2023-10-04	2023-10-22	34000	t	524	628	2518 365664
698	2023-12-20	2024-01-05	2024-01-11	65000	t	724	611	4487 223473
699	2023-08-04	2023-09-16	2023-10-07	69500	t	755	778	4870 936719
700	2023-11-16	2023-12-24	2024-01-11	58000	t	344	198	7005 217801
701	2023-03-21	2023-05-20	2023-05-28	32000	t	895	693	2518 365664
702	2023-10-22	2023-12-02	2023-12-08	72500	t	268	485	4487 223473
703	2023-08-04	2023-08-05	2023-08-18	46000	t	149	276	4870 936719
704	2023-05-30	2023-07-21	2023-07-29	93500	t	850	63	7005 217801
705	2023-10-16	2023-11-20	2023-11-27	73500	t	968	862	2518 365664
706	2023-10-13	2023-11-23	2023-12-02	24000	t	359	135	4487 223473
707	2023-07-16	2023-07-31	2023-08-15	30500	t	810	996	4870 936719
708	2023-02-01	2023-03-28	2023-04-14	22000	t	514	449	7005 217801
709	2023-09-15	2023-09-30	2023-10-08	25000	t	364	601	2518 365664
710	2023-12-30	2024-01-16	2024-01-21	59000	t	303	558	4487 223473
711	2023-01-21	2023-02-07	2023-02-23	35500	t	778	775	4870 936719
712	2023-02-10	2023-02-19	2023-03-08	52000	t	893	816	7005 217801
713	2023-02-12	2023-02-27	2023-03-14	70500	t	194	141	2518 365664
714	2023-09-05	2023-10-08	2023-10-12	52500	t	332	194	4487 223473
715	2023-06-12	2023-07-24	2023-08-08	34500	t	42	39	4870 936719
716	2023-02-21	2023-03-07	2023-03-20	29500	t	166	38	7005 217801
717	2023-08-02	2023-09-21	2023-10-08	39000	t	599	69	2518 365664
718	2023-11-24	2023-12-16	2023-12-17	28500	t	999	865	4487 223473
719	2023-01-31	2023-03-14	2023-03-30	27000	t	321	632	4870 936719
720	2023-06-25	2023-07-05	2023-07-13	75500	t	671	530	7005 217801
721	2023-02-08	2023-03-12	2023-03-19	90500	t	360	539	2518 365664
722	2023-12-19	2024-02-17	2024-02-28	29000	t	298	88	4487 223473
723	2023-08-16	2023-08-21	2023-08-22	90000	t	28	670	4870 936719
724	2023-01-26	2023-01-30	2023-02-05	17000	t	708	696	7005 217801
725	2023-02-06	2023-02-10	2023-02-20	53000	t	613	736	2518 365664
726	2023-05-22	2023-06-12	2023-06-19	22000	t	1000	627	4487 223473
727	2023-06-18	2023-07-08	2023-07-20	17500	t	170	412	4870 936719
728	2023-09-11	2023-09-17	2023-09-18	94500	t	328	898	7005 217801
729	2023-09-01	2023-09-02	2023-09-12	41500	t	33	248	2518 365664
730	2023-07-12	2023-07-21	2023-08-04	59500	t	725	6	4487 223473
731	2023-06-10	2023-06-14	2023-06-17	31500	t	887	1000	4870 936719
732	2023-07-20	2023-08-16	2023-08-18	18000	t	597	717	7005 217801
733	2023-07-28	2023-08-19	2023-08-28	66000	t	126	588	2518 365664
734	2023-09-13	2023-09-14	2023-09-26	77000	t	115	759	4487 223473
735	2023-11-30	2024-01-10	2024-01-16	30500	t	944	599	4870 936719
736	2023-06-08	2023-06-21	2023-06-30	36000	t	337	914	7005 217801
737	2023-04-17	2023-04-22	2023-05-05	76500	t	586	771	2518 365664
738	2023-11-03	2023-11-28	2023-12-06	82000	t	602	596	4487 223473
739	2023-10-09	2023-11-30	2023-12-03	17000	t	323	468	4870 936719
740	2023-01-31	2023-03-18	2023-04-01	87500	t	149	456	7005 217801
741	2023-06-16	2023-08-02	2023-08-20	75500	t	515	882	2518 365664
742	2023-12-14	2024-02-12	2024-02-29	34500	t	237	903	4487 223473
743	2023-03-05	2023-05-03	2023-05-04	96000	t	494	781	4870 936719
744	2023-12-23	2023-12-25	2024-01-10	88000	t	589	95	7005 217801
745	2023-07-09	2023-08-29	2023-08-31	15500	t	563	825	2518 365664
746	2023-03-24	2023-05-17	2023-05-24	41000	t	184	364	4487 223473
747	2023-05-14	2023-06-30	2023-07-10	76500	t	782	356	4870 936719
748	2023-10-11	2023-11-21	2023-12-06	82000	t	179	259	7005 217801
749	2023-06-14	2023-07-10	2023-07-27	56500	t	334	237	2518 365664
750	2023-11-30	2024-01-10	2024-01-26	75500	t	879	726	4487 223473
751	2023-01-18	2023-02-03	2023-02-11	27500	t	252	953	4870 936719
752	2023-02-25	2023-03-27	2023-04-17	95000	t	437	490	7005 217801
753	2023-08-14	2023-09-07	2023-09-20	30500	t	14	117	2518 365664
754	2023-07-04	2023-08-21	2023-08-29	17000	t	207	746	4487 223473
755	2023-07-19	2023-08-28	2023-09-05	86500	t	287	525	4870 936719
756	2023-12-21	2023-12-31	2024-01-08	79000	t	866	505	7005 217801
757	2023-03-09	2023-04-28	2023-04-29	88000	t	627	40	2518 365664
758	2023-08-15	2023-09-05	2023-09-09	18500	t	400	943	4487 223473
759	2023-12-18	2023-12-23	2024-01-05	77500	t	649	827	4870 936719
760	2023-08-21	2023-10-20	2023-11-10	84000	t	3	889	7005 217801
761	2023-09-30	2023-10-29	2023-11-15	17500	t	141	25	2518 365664
762	2023-12-22	2024-01-02	2024-01-05	64500	t	568	454	4487 223473
763	2023-03-01	2023-03-25	2023-03-26	31500	t	424	889	4870 936719
764	2023-02-16	2023-04-09	2023-04-12	66000	t	525	904	7005 217801
765	2023-04-07	2023-05-15	2023-05-26	85000	t	667	902	2518 365664
766	2023-10-22	2023-11-10	2023-11-14	56000	t	328	284	4487 223473
767	2023-10-22	2023-12-01	2023-12-16	93000	t	460	132	4870 936719
768	2023-09-11	2023-10-06	2023-10-20	74500	t	512	444	7005 217801
769	2023-03-20	2023-03-28	2023-04-04	24500	t	662	759	2518 365664
770	2023-04-05	2023-05-29	2023-06-13	97000	t	999	473	4487 223473
771	2023-11-13	2023-11-30	2023-12-15	68500	t	233	287	4870 936719
772	2023-09-20	2023-10-30	2023-11-06	70000	t	118	14	7005 217801
773	2023-02-23	2023-03-06	2023-03-10	25500	t	853	835	2518 365664
774	2023-09-13	2023-10-04	2023-10-21	43000	t	447	685	4487 223473
775	2023-03-02	2023-04-29	2023-05-11	90000	t	954	901	4870 936719
776	2023-07-01	2023-08-23	2023-09-12	62000	t	700	541	7005 217801
777	2023-04-04	2023-05-20	2023-05-29	50000	t	104	823	2518 365664
778	2023-10-20	2023-11-05	2023-11-15	31000	t	321	940	4487 223473
779	2023-07-19	2023-08-12	2023-08-16	98500	t	238	546	4870 936719
780	2023-03-07	2023-04-28	2023-05-05	85000	t	27	874	7005 217801
781	2023-03-15	2023-03-17	2023-03-28	52000	t	337	411	2518 365664
782	2023-04-25	2023-05-21	2023-06-05	62000	t	464	517	4487 223473
783	2023-08-23	2023-10-11	2023-10-16	54000	t	105	844	4870 936719
784	2023-06-20	2023-07-18	2023-07-21	64000	t	828	940	7005 217801
785	2023-08-01	2023-09-04	2023-09-17	14500	t	142	78	2518 365664
786	2023-12-18	2024-01-10	2024-01-21	14000	t	425	496	4487 223473
787	2023-12-18	2024-01-22	2024-01-31	34000	t	872	438	4870 936719
788	2023-02-12	2023-04-12	2023-04-16	35000	t	927	787	7005 217801
789	2023-06-04	2023-07-07	2023-07-21	20000	t	508	945	2518 365664
790	2023-08-03	2023-09-19	2023-10-07	98500	t	324	79	4487 223473
791	2023-05-31	2023-06-17	2023-06-27	89500	t	698	292	4870 936719
792	2023-04-21	2023-05-26	2023-06-03	78000	t	695	640	7005 217801
793	2023-01-11	2023-03-03	2023-03-08	88000	t	483	779	2518 365664
794	2023-04-08	2023-05-29	2023-06-16	33500	t	34	79	4487 223473
795	2023-04-02	2023-05-06	2023-05-11	70000	t	218	655	4870 936719
796	2023-10-10	2023-10-22	2023-11-01	71500	t	36	531	7005 217801
797	2023-03-13	2023-05-07	2023-05-09	53000	t	9	989	2518 365664
798	2023-05-19	2023-06-26	2023-07-06	34000	t	166	975	4487 223473
799	2023-10-22	2023-11-08	2023-11-17	54500	t	315	43	4870 936719
800	2023-01-26	2023-02-09	2023-02-20	99000	t	477	522	7005 217801
801	2023-12-25	2024-01-30	2024-02-03	39500	t	361	329	2518 365664
802	2023-11-01	2023-12-11	2023-12-15	40000	t	984	432	4487 223473
803	2023-11-22	2023-12-26	2024-01-05	56500	t	662	949	4870 936719
804	2023-11-28	2024-01-14	2024-01-25	34000	t	384	356	7005 217801
805	2023-08-23	2023-08-31	2023-09-06	58000	t	284	777	2518 365664
806	2023-03-07	2023-04-18	2023-04-29	56500	t	971	770	4487 223473
807	2023-12-09	2023-12-31	2024-01-19	28500	t	742	993	4870 936719
808	2023-05-14	2023-05-24	2023-06-11	84500	t	992	906	7005 217801
809	2023-11-28	2024-01-01	2024-01-12	87500	t	451	633	2518 365664
810	2023-12-24	2024-02-11	2024-02-24	92500	t	812	299	4487 223473
811	2023-02-21	2023-03-26	2023-04-15	23000	t	327	933	4870 936719
812	2023-09-14	2023-10-26	2023-10-27	13500	t	137	241	7005 217801
813	2023-01-14	2023-02-23	2023-03-07	89000	t	11	232	2518 365664
814	2023-11-26	2024-01-17	2024-01-27	51500	t	610	615	4487 223473
815	2023-01-16	2023-02-25	2023-02-26	93000	t	826	7	4870 936719
816	2023-06-02	2023-06-18	2023-07-02	33000	t	244	228	7005 217801
817	2023-02-05	2023-03-18	2023-03-21	39500	t	833	645	2518 365664
818	2023-02-01	2023-02-17	2023-02-28	25500	t	799	36	4487 223473
819	2023-11-09	2023-12-19	2023-12-29	22500	t	418	601	4870 936719
820	2023-02-10	2023-03-09	2023-03-28	44000	t	978	231	7005 217801
821	2023-07-14	2023-08-05	2023-08-16	59000	t	653	482	2518 365664
822	2023-06-07	2023-08-03	2023-08-19	90000	t	460	425	4487 223473
823	2023-12-15	2024-02-06	2024-02-09	95500	t	601	98	4870 936719
824	2023-08-20	2023-09-20	2023-09-29	71500	t	587	290	7005 217801
825	2023-01-18	2023-02-19	2023-03-07	79500	t	155	937	2518 365664
826	2023-05-30	2023-06-21	2023-07-04	11500	t	719	787	4487 223473
827	2023-03-06	2023-04-26	2023-05-17	71000	t	849	263	4870 936719
828	2023-08-04	2023-09-17	2023-09-21	61500	t	133	88	7005 217801
829	2023-07-05	2023-07-15	2023-08-05	75500	t	515	798	2518 365664
830	2023-11-30	2024-01-06	2024-01-17	58500	t	596	468	4487 223473
831	2023-10-22	2023-10-25	2023-11-10	94500	t	53	160	4870 936719
832	2023-09-18	2023-10-02	2023-10-20	39500	t	714	690	7005 217801
833	2023-03-01	2023-04-01	2023-04-13	12000	t	511	266	2518 365664
834	2023-09-03	2023-11-02	2023-11-19	36000	t	2	813	4487 223473
835	2023-02-19	2023-03-02	2023-03-14	93500	t	431	629	4870 936719
836	2023-01-17	2023-02-07	2023-02-20	54000	t	82	714	7005 217801
837	2023-08-28	2023-10-12	2023-10-26	49500	t	262	43	2518 365664
838	2023-12-26	2024-01-20	2024-02-08	12500	t	499	642	4487 223473
839	2023-11-04	2023-12-23	2023-12-25	71000	t	446	859	4870 936719
840	2023-03-02	2023-04-22	2023-05-10	13500	t	545	137	7005 217801
841	2023-12-05	2024-01-17	2024-02-07	95000	t	213	348	2518 365664
842	2023-10-17	2023-11-13	2023-11-28	69500	t	475	360	4487 223473
843	2023-01-20	2023-03-14	2023-03-29	85000	t	556	261	4870 936719
844	2023-02-20	2023-03-08	2023-03-21	79500	t	276	323	7005 217801
845	2023-08-01	2023-08-17	2023-08-31	28500	t	555	404	2518 365664
846	2023-01-20	2023-03-13	2023-03-31	94000	t	829	386	4487 223473
847	2023-12-06	2023-12-22	2024-01-11	96000	t	365	463	4870 936719
848	2023-01-24	2023-03-05	2023-03-20	13000	t	450	670	7005 217801
849	2023-07-10	2023-08-30	2023-09-05	87500	t	504	506	2518 365664
850	2023-11-05	2023-11-13	2023-11-28	59000	t	610	294	4487 223473
851	2023-05-06	2023-06-09	2023-06-29	11000	t	79	348	4870 936719
852	2023-06-28	2023-07-22	2023-07-28	87500	t	218	619	7005 217801
853	2023-01-18	2023-02-17	2023-02-24	18500	t	454	240	2518 365664
854	2023-08-17	2023-09-13	2023-09-16	91000	t	647	415	4487 223473
855	2023-05-06	2023-05-18	2023-05-27	20000	t	569	562	4870 936719
856	2023-04-06	2023-05-27	2023-06-08	48500	t	153	497	7005 217801
857	2023-09-13	2023-10-07	2023-10-08	53500	t	47	490	2518 365664
858	2023-07-25	2023-09-07	2023-09-18	21000	t	744	137	4487 223473
859	2023-11-20	2023-12-18	2023-12-30	65000	t	177	679	4870 936719
860	2023-09-03	2023-10-07	2023-10-27	11500	t	149	649	7005 217801
861	2023-12-20	2024-01-03	2024-01-09	21500	t	863	275	2518 365664
862	2023-10-10	2023-11-19	2023-11-20	38000	t	74	710	4487 223473
863	2023-04-06	2023-04-13	2023-05-04	70000	t	656	458	4870 936719
864	2023-01-29	2023-03-25	2023-03-28	35500	t	273	946	7005 217801
865	2023-03-09	2023-04-27	2023-04-28	65500	t	882	518	2518 365664
866	2023-04-23	2023-06-19	2023-07-08	18000	t	178	599	4487 223473
867	2023-04-30	2023-05-04	2023-05-12	41500	t	466	116	4870 936719
868	2023-05-13	2023-07-01	2023-07-16	16000	t	307	1000	7005 217801
869	2023-10-03	2023-11-24	2023-11-28	40000	t	193	969	2518 365664
870	2023-10-31	2023-12-01	2023-12-09	90000	t	655	611	4487 223473
871	2023-12-30	2024-02-23	2024-02-24	21500	t	17	597	4870 936719
872	2023-04-21	2023-05-23	2023-06-02	10500	t	461	104	7005 217801
873	2023-12-10	2024-01-16	2024-01-17	25500	t	54	382	2518 365664
874	2023-08-18	2023-09-12	2023-09-23	25000	t	942	302	4487 223473
875	2023-11-29	2023-12-07	2023-12-11	28500	t	623	429	4870 936719
876	2023-02-26	2023-03-12	2023-03-24	57000	t	275	839	7005 217801
877	2023-06-17	2023-06-26	2023-06-27	73500	t	317	545	2518 365664
878	2023-05-03	2023-05-21	2023-06-07	17500	t	123	430	4487 223473
879	2023-06-18	2023-08-02	2023-08-11	85500	t	499	406	4870 936719
880	2023-08-22	2023-09-05	2023-09-17	43000	t	159	59	7005 217801
881	2023-01-30	2023-02-27	2023-03-11	23500	t	43	361	2518 365664
882	2023-06-18	2023-07-09	2023-07-20	68500	t	995	951	4487 223473
883	2023-08-04	2023-08-30	2023-09-11	54000	t	744	324	4870 936719
884	2023-01-20	2023-02-09	2023-02-13	46500	t	354	674	7005 217801
885	2023-12-07	2023-12-24	2024-01-08	85500	t	72	343	2518 365664
886	2023-01-17	2023-02-17	2023-02-27	91500	t	674	758	4487 223473
887	2023-05-15	2023-06-09	2023-06-23	39000	t	438	42	4870 936719
888	2023-12-10	2023-12-19	2024-01-03	59500	t	914	39	7005 217801
889	2023-01-11	2023-01-27	2023-02-02	17000	t	225	481	2518 365664
890	2023-07-19	2023-08-21	2023-08-30	63000	t	32	908	4487 223473
891	2023-03-22	2023-04-17	2023-04-27	62000	t	438	594	4870 936719
892	2023-06-19	2023-08-13	2023-09-02	60500	t	776	601	7005 217801
893	2023-01-18	2023-02-11	2023-02-19	74000	t	548	913	2518 365664
894	2023-07-29	2023-08-11	2023-08-21	51500	t	954	53	4487 223473
895	2023-08-26	2023-09-16	2023-09-25	92000	t	981	799	4870 936719
896	2023-12-11	2024-01-31	2024-02-09	85500	t	894	755	7005 217801
897	2023-04-17	2023-05-07	2023-05-28	22000	t	373	675	2518 365664
898	2023-01-21	2023-02-05	2023-02-24	49000	t	653	761	4487 223473
899	2023-11-05	2023-11-11	2023-12-02	84000	t	1000	266	4870 936719
900	2023-05-26	2023-05-27	2023-05-28	66000	t	1	767	7005 217801
901	2023-05-18	2023-06-26	2023-07-05	67500	t	871	544	2518 365664
902	2023-11-17	2024-01-07	2024-01-24	52000	t	732	316	4487 223473
903	2023-03-17	2023-04-28	2023-05-13	45500	t	566	475	4870 936719
904	2023-03-22	2023-04-24	2023-04-26	77000	t	552	657	7005 217801
905	2023-06-14	2023-06-28	2023-07-03	14000	t	49	509	2518 365664
906	2023-04-05	2023-04-30	2023-05-10	13500	t	574	870	4487 223473
907	2023-06-03	2023-06-13	2023-06-20	90500	t	423	976	4870 936719
908	2023-12-08	2023-12-26	2024-01-08	16500	t	411	367	7005 217801
909	2023-08-15	2023-08-28	2023-09-05	74000	t	705	639	2518 365664
910	2023-09-05	2023-11-02	2023-11-11	70000	t	134	259	4487 223473
911	2023-03-24	2023-05-17	2023-05-27	36000	t	447	958	4870 936719
912	2023-01-17	2023-01-24	2023-02-03	59000	t	866	139	7005 217801
913	2023-11-03	2023-12-04	2023-12-07	68000	t	408	318	2518 365664
914	2023-12-14	2024-02-11	2024-02-13	59000	t	377	869	4487 223473
915	2023-07-21	2023-09-01	2023-09-11	14500	t	770	980	4870 936719
916	2023-02-25	2023-03-21	2023-03-31	92000	t	728	869	7005 217801
917	2023-06-26	2023-08-06	2023-08-13	25000	t	686	927	2518 365664
918	2023-04-29	2023-05-17	2023-05-31	99500	t	431	792	4487 223473
919	2023-11-21	2024-01-06	2024-01-26	82000	t	579	246	4870 936719
920	2023-02-03	2023-02-12	2023-02-19	47500	t	567	959	7005 217801
921	2023-09-25	2023-10-13	2023-10-25	89000	t	721	423	2518 365664
922	2023-05-14	2023-05-20	2023-05-21	47500	t	119	886	4487 223473
923	2023-07-14	2023-08-25	2023-08-31	69000	t	496	213	4870 936719
924	2023-10-26	2023-11-09	2023-11-27	25500	t	622	214	7005 217801
925	2023-03-30	2023-05-11	2023-05-21	47000	t	482	516	2518 365664
926	2023-06-20	2023-07-14	2023-08-04	27000	t	499	646	4487 223473
927	2023-06-02	2023-06-29	2023-07-06	97500	t	341	671	4870 936719
928	2023-03-02	2023-03-31	2023-04-09	33500	t	405	807	7005 217801
929	2023-06-11	2023-07-16	2023-07-24	48000	t	22	485	2518 365664
930	2023-07-03	2023-08-04	2023-08-22	79000	t	564	471	4487 223473
931	2023-07-23	2023-09-19	2023-10-03	80000	t	897	665	4870 936719
932	2023-11-07	2024-01-05	2024-01-26	86000	t	347	845	7005 217801
933	2023-05-13	2023-07-08	2023-07-12	39500	t	310	443	2518 365664
934	2023-05-13	2023-06-28	2023-07-02	70500	t	236	539	4487 223473
935	2023-12-26	2024-01-26	2024-01-31	99500	t	69	879	4870 936719
936	2023-06-07	2023-06-23	2023-07-11	87500	t	46	374	7005 217801
937	2023-04-19	2023-06-15	2023-06-30	67000	t	415	383	2518 365664
938	2023-06-26	2023-07-19	2023-08-05	60500	t	135	560	4487 223473
939	2023-06-10	2023-06-22	2023-07-04	56500	t	189	990	4870 936719
940	2023-12-18	2024-01-06	2024-01-12	65500	t	35	277	7005 217801
941	2023-02-26	2023-04-02	2023-04-06	96500	t	739	28	2518 365664
942	2023-11-18	2023-12-03	2023-12-06	46500	t	879	635	4487 223473
943	2023-10-02	2023-11-16	2023-11-21	28500	t	287	200	4870 936719
944	2023-05-12	2023-07-05	2023-07-15	60000	t	222	941	7005 217801
945	2023-03-30	2023-05-12	2023-05-22	15500	t	973	743	2518 365664
946	2023-10-22	2023-12-16	2024-01-02	20500	t	680	911	4487 223473
947	2023-01-08	2023-01-21	2023-01-29	70000	t	274	10	4870 936719
948	2023-11-21	2024-01-06	2024-01-27	50500	t	306	249	7005 217801
949	2023-12-18	2023-12-29	2024-01-05	31000	t	483	234	2518 365664
950	2023-08-25	2023-09-26	2023-10-07	26000	t	735	138	4487 223473
951	2023-08-12	2023-09-06	2023-09-21	71500	t	393	501	4870 936719
952	2023-05-29	2023-07-20	2023-08-07	86000	t	455	921	7005 217801
953	2023-11-19	2023-12-03	2023-12-07	67000	t	675	120	2518 365664
954	2023-07-02	2023-07-30	2023-08-05	58500	t	753	168	4487 223473
955	2023-06-21	2023-08-08	2023-08-15	62500	t	601	159	4870 936719
956	2023-05-18	2023-06-12	2023-06-15	49000	t	93	867	7005 217801
957	2023-06-29	2023-07-04	2023-07-14	54500	t	58	430	2518 365664
958	2023-07-27	2023-08-09	2023-08-10	98500	t	870	132	4487 223473
959	2023-02-27	2023-03-29	2023-04-06	61500	t	640	173	4870 936719
960	2023-01-26	2023-02-06	2023-02-25	31000	t	699	640	7005 217801
961	2023-12-02	2024-01-27	2024-02-15	57500	t	335	226	2518 365664
962	2023-05-09	2023-05-18	2023-06-07	34500	t	123	522	4487 223473
963	2023-09-18	2023-10-08	2023-10-25	71500	t	611	824	4870 936719
964	2023-10-30	2023-12-01	2023-12-04	36500	t	399	211	7005 217801
965	2023-04-20	2023-05-06	2023-05-25	71500	t	527	402	2518 365664
966	2023-11-03	2023-11-10	2023-11-13	51500	t	172	404	4487 223473
967	2023-11-24	2023-11-29	2023-12-10	62500	t	313	985	4870 936719
968	2023-03-18	2023-05-12	2023-05-18	36500	t	21	726	7005 217801
969	2023-12-29	2024-02-01	2024-02-04	88500	t	556	22	2518 365664
970	2023-02-20	2023-04-02	2023-04-16	49500	t	2	348	4487 223473
971	2023-03-15	2023-05-07	2023-05-15	94500	t	628	88	4870 936719
972	2023-01-15	2023-03-06	2023-03-16	41500	t	962	252	7005 217801
973	2023-03-03	2023-04-20	2023-04-23	86000	t	900	215	2518 365664
974	2023-10-29	2023-11-02	2023-11-16	23000	t	551	705	4487 223473
975	2023-05-16	2023-07-14	2023-07-31	84500	t	575	388	4870 936719
976	2023-05-02	2023-06-14	2023-06-17	58500	t	676	652	7005 217801
977	2023-08-03	2023-09-28	2023-10-18	56500	t	298	86	2518 365664
978	2023-07-24	2023-09-18	2023-09-29	95500	t	59	577	4487 223473
979	2023-03-07	2023-04-07	2023-04-28	65000	t	479	770	4870 936719
980	2023-09-28	2023-10-19	2023-10-24	31500	t	717	315	7005 217801
981	2023-09-14	2023-10-30	2023-11-06	59500	t	803	555	2518 365664
982	2023-01-08	2023-01-31	2023-02-05	38500	t	486	984	4487 223473
983	2023-12-27	2024-01-12	2024-02-02	72000	t	605	819	4870 936719
984	2023-05-19	2023-06-09	2023-06-13	68500	t	752	323	7005 217801
985	2023-04-17	2023-04-20	2023-04-28	15000	t	777	498	2518 365664
986	2023-01-24	2023-02-18	2023-03-06	75500	t	524	696	4487 223473
987	2023-09-30	2023-10-14	2023-10-27	85000	t	535	13	4870 936719
988	2023-04-25	2023-05-13	2023-05-28	79500	t	189	982	7005 217801
989	2023-10-15	2023-11-21	2023-12-06	98500	t	457	954	2518 365664
990	2023-04-24	2023-05-03	2023-05-22	72500	t	771	664	4487 223473
991	2023-05-10	2023-05-11	2023-05-15	22000	t	929	828	4870 936719
992	2023-08-09	2023-08-28	2023-09-17	13000	t	191	378	7005 217801
993	2023-12-21	2024-01-28	2024-02-12	78500	t	688	578	2518 365664
994	2023-08-05	2023-09-19	2023-10-05	25000	t	996	841	4487 223473
995	2023-08-05	2023-09-04	2023-09-05	28000	t	815	392	4870 936719
996	2023-11-23	2023-11-30	2023-12-09	40000	t	49	365	7005 217801
997	2023-04-02	2023-05-23	2023-06-06	71500	t	250	169	2518 365664
998	2023-06-04	2023-07-01	2023-07-17	43000	t	470	610	4487 223473
999	2023-02-04	2023-03-22	2023-03-29	40500	t	979	417	4870 936719
1000	2023-05-25	2023-05-28	2023-06-02	22500	t	246	970	7005 217801
\.


                                                                                                                                                                                                                                                                                                                                         4922.dat                                                                                            0000600 0004000 0002000 00000125567 14771407746 0014313 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	9	17	f	f	Тихое расположение	107
2	6	19	f	t	Большая ванная комната	706
3	2	18	f	t	Просторная	226
4	7	6	f	t	Просторная	817
5	1	12	f	t	Большая ванная комната	919
6	8	7	t	f	Гардеробная	317
7	7	11	f	t	Просторная	729
8	4	14	f	t	Тихое расположение	324
9	4	12	f	f	На высоком этаже	715
10	5	18	f	t	Тихое расположение	607
11	10	20	f	f	Просторная	607
12	3	6	f	t	Джакузи	224
13	8	17	f	f	Балкон, вид на море	406
14	3	8	t	t	Новая мебель	419
15	4	5	f	t	Свежий ремонт	720
16	4	3	t	t	Окно во двор	812
17	3	17	f	f	Мини-кухня	218
18	8	13	f	t	Окно во двор	903
19	4	13	f	f	Большая ванная комната	215
20	3	11	f	t	Гардеробная	306
21	9	2	t	f	Джакузи	720
22	1	1	t	t	Свежий ремонт	330
23	6	16	f	f	Джакузи	205
24	4	3	t	f	Джакузи	102
25	1	6	f	t	Балкон, вид на море	103
26	5	4	f	f	Вид на город	920
27	4	6	f	t	Мини-кухня	505
28	8	11	f	f	Вид на город	206
29	6	7	f	t	На высоком этаже	625
30	9	14	f	t	Гардеробная	508
31	9	11	f	t	Окно на улицу	817
32	4	3	f	f	Джакузи	117
33	1	13	f	f	Вид на город	120
34	3	13	f	f	Свежий ремонт	529
35	2	20	f	t	Окно на улицу	104
36	5	1	f	f	Балкон, вид на море	628
37	8	15	f	t	Вид на город	515
38	9	13	f	t	Тихое расположение	425
39	9	17	f	f	Новая мебель	807
40	2	10	f	f	Окно на улицу	726
41	2	19	f	f	Вид на город	227
42	8	5	t	f	Мини-кухня	917
43	8	6	f	t	Джакузи	918
44	6	19	f	t	На высоком этаже	404
45	9	9	f	t	На высоком этаже	528
46	10	20	f	t	Балкон, вид на море	501
47	9	16	f	t	Новая мебель	226
48	9	13	f	t	Балкон, вид на море	401
49	5	9	f	t	Тихое расположение	711
50	4	17	f	f	Джакузи	608
51	1	3	f	t	Джакузи	325
52	3	4	t	t	На высоком этаже	814
53	8	5	t	t	Гардеробная	814
54	1	1	f	t	Вид на город	313
55	2	1	f	t	Свежий ремонт	811
56	5	15	t	f	Балкон, вид на море	104
57	2	18	t	f	Свежий ремонт	927
58	4	10	t	f	Балкон, вид на море	116
59	5	13	t	t	Окно на улицу	415
60	10	19	f	t	Гардеробная	317
61	8	19	f	t	Тихое расположение	104
62	7	18	f	t	Кондиционер	206
63	1	5	f	f	Окно на улицу	207
64	8	18	t	t	Окно во двор	712
65	6	17	t	f	Окно во двор	425
66	5	13	f	t	Большая ванная комната	609
67	1	14	f	t	Тихое расположение	607
68	1	6	t	f	Недавно отремонтирована	804
69	4	3	f	t	Балкон, вид на море	510
70	8	15	f	f	Мини-кухня	801
71	9	7	f	f	Большая ванная комната	113
72	9	13	f	f	Мини-кухня	602
73	5	3	f	f	Новая мебель	322
74	4	18	f	f	На высоком этаже	704
75	6	12	t	t	Просторная	913
76	9	18	f	t	Свежий ремонт	821
77	8	20	t	f	Свежий ремонт	221
78	8	15	f	f	Недавно отремонтирована	109
79	5	9	f	f	Свежий ремонт	327
80	6	20	f	f	Большая ванная комната	528
81	4	6	f	f	Недавно отремонтирована	126
82	8	12	f	f	Большая ванная комната	812
83	6	19	f	t	Вид на город	721
84	7	18	f	f	Недавно отремонтирована	115
85	9	19	f	t	Джакузи	819
86	4	2	t	f	Тихое расположение	303
87	1	16	f	f	Большая ванная комната	306
88	1	20	f	t	Балкон, вид на море	726
89	1	16	t	t	Вид на город	504
90	7	13	t	f	Мини-кухня	523
91	4	8	t	f	Гардеробная	807
92	7	1	f	t	Новая мебель	922
93	7	18	t	t	Балкон, вид на море	114
94	6	6	f	t	Тихое расположение	216
95	8	1	f	t	Недавно отремонтирована	429
96	10	11	t	f	Гардеробная	320
97	5	8	f	t	Окно во двор	829
98	1	5	f	t	Вид на город	107
99	8	5	f	t	Окно во двор	727
100	1	8	f	t	Джакузи	503
101	2	12	f	f	Новая мебель	621
102	5	7	t	f	Новая мебель	901
103	4	7	f	t	Балкон, вид на море	309
104	5	10	f	t	Свежий ремонт	618
105	9	5	f	f	Окно на улицу	620
106	4	14	f	t	Большая ванная комната	904
107	7	5	f	f	Просторная	811
108	8	9	f	f	Недавно отремонтирована	730
109	1	19	f	f	Вид на город	823
110	7	18	f	t	Гардеробная	401
111	8	6	f	t	Балкон, вид на море	710
112	3	13	t	f	На высоком этаже	126
113	8	4	f	t	Новая мебель	421
114	10	7	f	t	Тихое расположение	827
115	8	9	t	f	Кондиционер	723
116	9	4	f	t	Гардеробная	421
117	1	3	f	f	Недавно отремонтирована	828
118	9	18	f	t	Гардеробная	107
119	1	13	f	t	Джакузи	419
120	6	16	f	t	Недавно отремонтирована	213
121	1	8	f	t	Мини-кухня	219
122	7	7	t	f	Окно на улицу	623
123	3	15	t	f	Недавно отремонтирована	722
124	9	2	f	t	Тихое расположение	816
125	8	6	f	t	Просторная	722
126	2	4	f	t	Свежий ремонт	116
127	4	15	f	t	Вид на город	323
128	2	10	f	f	Балкон, вид на море	626
129	8	15	f	t	Гардеробная	528
130	3	10	f	f	Свежий ремонт	110
131	5	12	f	f	Тихое расположение	729
132	6	13	f	t	Балкон, вид на море	919
133	1	11	f	t	Тихое расположение	206
134	5	14	f	f	Тихое расположение	503
135	1	6	f	t	Балкон, вид на море	213
136	6	3	f	f	Просторная	921
137	10	7	f	t	Тихое расположение	920
138	6	10	f	t	Тихое расположение	810
139	9	17	f	f	Окно во двор	108
140	9	10	f	t	Гардеробная	229
141	2	20	f	t	Свежий ремонт	402
142	6	13	f	t	Просторная	918
143	6	6	f	t	Большая ванная комната	203
144	2	12	t	f	На высоком этаже	117
145	7	20	f	t	Вид на город	619
146	7	9	f	t	Гардеробная	715
147	2	4	f	t	Тихое расположение	923
148	10	14	f	t	Кондиционер	219
149	2	18	f	f	Вид на город	424
150	2	15	f	t	Балкон, вид на море	322
151	3	2	f	t	Тихое расположение	518
152	5	12	f	t	Кондиционер	828
153	9	13	f	t	Балкон, вид на море	812
154	2	14	f	f	Мини-кухня	803
155	7	3	f	f	Просторная	917
156	8	7	t	t	Недавно отремонтирована	419
157	4	7	f	t	Большая ванная комната	208
158	9	15	f	t	Балкон, вид на море	316
159	5	20	f	t	Большая ванная комната	612
160	1	9	f	f	Недавно отремонтирована	518
161	6	6	f	t	Вид на город	903
162	7	10	f	t	Вид на город	702
163	7	1	t	f	Недавно отремонтирована	806
164	5	15	f	f	Просторная	601
165	10	10	f	f	Свежий ремонт	706
166	9	17	f	t	Тихое расположение	205
167	8	1	f	f	Просторная	918
168	10	3	f	t	На высоком этаже	613
169	9	18	t	f	Просторная	127
170	8	11	f	t	Гардеробная	218
171	2	10	f	t	Большая ванная комната	224
172	8	10	f	t	Окно на улицу	304
173	10	19	f	t	Окно на улицу	110
174	7	20	f	t	Недавно отремонтирована	501
175	9	19	f	t	Свежий ремонт	215
176	1	2	f	t	Кондиционер	709
177	5	13	f	f	Тихое расположение	921
178	6	1	f	t	Гардеробная	227
179	1	19	f	t	Тихое расположение	902
180	9	2	t	f	Джакузи	205
181	10	10	f	t	Новая мебель	619
182	2	6	f	t	Джакузи	709
183	4	15	f	t	Большая ванная комната	508
184	4	9	t	t	Гардеробная	927
185	1	15	f	f	Кондиционер	528
186	8	5	f	t	Вид на город	622
187	9	3	f	t	Свежий ремонт	515
188	1	20	f	t	Окно на улицу	813
189	7	7	f	f	Просторная	120
190	9	16	f	t	Гардеробная	712
191	8	20	f	f	Окно на улицу	709
192	2	20	t	t	Окно на улицу	316
193	3	12	t	f	Свежий ремонт	923
194	3	5	f	t	Джакузи	504
195	7	4	f	t	Новая мебель	922
196	2	3	t	t	Недавно отремонтирована	707
197	5	1	f	t	Балкон, вид на море	612
198	9	15	f	t	Гардеробная	425
199	1	12	f	t	Вид на город	930
200	1	14	f	t	Джакузи	523
201	6	16	f	t	Новая мебель	720
202	9	9	f	f	Джакузи	601
203	10	8	t	f	Большая ванная комната	512
204	2	4	f	t	Гардеробная	921
205	10	12	f	t	Недавно отремонтирована	522
206	9	3	f	t	Просторная	719
207	7	15	f	f	Просторная	108
208	4	15	f	t	Окно во двор	821
209	9	6	f	t	Тихое расположение	911
210	2	14	t	f	Вид на город	320
211	9	14	t	f	Окно на улицу	509
212	10	17	f	f	Вид на город	625
213	2	16	t	f	На высоком этаже	227
214	7	4	f	f	Гардеробная	410
215	4	10	f	t	Джакузи	230
216	5	20	f	t	Вид на город	215
217	5	13	t	t	Джакузи	929
218	4	16	f	f	Тихое расположение	918
219	10	2	t	t	Мини-кухня	115
220	1	19	f	t	Новая мебель	601
221	4	5	f	t	Окно во двор	810
222	9	13	f	f	Мини-кухня	804
223	4	7	f	t	Тихое расположение	712
224	9	13	f	t	Окно на улицу	230
225	4	14	f	t	Просторная	708
226	10	2	f	f	Мини-кухня	430
227	3	11	f	f	Вид на город	418
228	9	17	f	t	Гардеробная	902
229	8	5	f	t	Большая ванная комната	712
230	10	19	f	f	Окно на улицу	202
231	6	15	f	t	Просторная	708
232	6	9	t	f	Окно во двор	326
233	3	18	f	t	Джакузи	722
234	9	2	f	t	Джакузи	230
235	2	16	f	t	Балкон, вид на море	229
236	6	6	t	f	Просторная	729
237	4	15	t	f	Джакузи	117
238	1	19	f	f	Вид на город	129
239	8	8	f	t	Окно на улицу	928
240	3	19	f	t	Тихое расположение	830
241	10	5	f	f	Окно на улицу	205
242	8	18	f	t	Мини-кухня	825
243	9	18	f	t	Недавно отремонтирована	305
244	10	9	f	t	Гардеробная	201
245	9	14	t	f	Гардеробная	607
246	7	20	f	f	Просторная	114
247	8	19	f	t	На высоком этаже	318
248	7	11	f	f	Джакузи	827
249	9	1	f	t	Балкон, вид на море	529
250	5	2	f	t	Большая ванная комната	409
251	3	12	t	f	Мини-кухня	213
252	7	5	f	f	Недавно отремонтирована	225
253	1	12	t	f	Большая ванная комната	413
254	4	17	f	t	Новая мебель	616
255	6	17	f	t	Недавно отремонтирована	617
256	6	12	t	f	Джакузи	516
257	1	14	f	f	Джакузи	711
258	7	18	f	f	На высоком этаже	213
259	3	18	f	t	Окно на улицу	823
260	6	14	f	t	Джакузи	801
261	1	2	t	f	Недавно отремонтирована	109
262	10	7	f	f	Новая мебель	523
263	4	18	t	f	На высоком этаже	501
264	5	13	f	t	Мини-кухня	105
265	6	1	f	t	Джакузи	101
266	5	18	f	t	Тихое расположение	503
267	6	1	f	t	Кондиционер	423
268	5	5	f	t	Балкон, вид на море	520
269	6	2	f	f	Мини-кухня	729
270	1	5	f	f	Окно на улицу	605
271	9	3	f	t	Гардеробная	815
272	4	20	f	f	Кондиционер	316
273	3	5	t	t	Большая ванная комната	920
274	10	5	f	t	Мини-кухня	201
275	10	10	f	f	Джакузи	125
276	9	4	f	f	Балкон, вид на море	827
277	8	20	t	f	Кондиционер	210
278	2	17	f	t	Окно на улицу	327
279	10	12	f	t	Окно во двор	511
280	5	15	f	t	Кондиционер	612
281	1	16	t	f	Джакузи	212
282	3	20	f	t	На высоком этаже	309
283	9	17	f	f	На высоком этаже	724
284	7	19	t	f	Новая мебель	901
285	2	12	f	t	Новая мебель	808
286	2	3	f	t	Недавно отремонтирована	129
287	4	13	f	f	Новая мебель	803
288	8	6	t	f	Окно на улицу	722
289	6	1	t	f	Кондиционер	502
290	5	9	f	f	Вид на город	903
291	10	13	f	t	Мини-кухня	120
292	6	17	f	t	Недавно отремонтирована	212
293	6	18	f	t	Окно во двор	716
294	3	13	f	t	Свежий ремонт	119
295	6	7	f	t	Гардеробная	620
296	6	14	f	f	Свежий ремонт	925
297	5	1	f	f	Окно во двор	524
298	4	8	f	f	Тихое расположение	215
299	10	3	f	t	Свежий ремонт	323
300	1	16	f	f	Недавно отремонтирована	913
301	4	3	f	t	Вид на город	415
302	4	3	t	t	Гардеробная	226
303	10	6	f	t	На высоком этаже	712
304	9	2	f	f	Гардеробная	208
305	3	8	f	t	Вид на город	129
306	4	16	f	t	Мини-кухня	318
307	3	12	f	t	Джакузи	514
308	3	10	f	t	Недавно отремонтирована	427
309	7	4	f	t	Окно во двор	902
310	9	8	f	t	Новая мебель	420
311	2	13	t	f	Кондиционер	324
312	6	10	f	f	Большая ванная комната	920
313	10	5	f	t	Джакузи	409
314	3	8	t	f	Вид на город	626
315	2	5	f	t	Окно на улицу	824
316	1	11	f	t	Окно во двор	210
317	5	14	f	t	Просторная	715
318	3	9	t	f	Вид на город	425
319	6	15	f	t	Окно во двор	309
320	5	14	f	t	Балкон, вид на море	126
321	1	20	f	t	Кондиционер	829
322	1	11	f	t	Балкон, вид на море	628
323	6	15	f	t	Окно во двор	613
324	3	2	t	f	На высоком этаже	405
325	9	2	f	f	Окно во двор	129
326	4	15	t	f	Гардеробная	206
327	8	9	f	f	Балкон, вид на море	314
328	4	3	f	t	Гардеробная	724
329	9	6	f	t	Недавно отремонтирована	111
330	6	2	t	f	Гардеробная	729
331	5	12	t	t	Мини-кухня	715
332	5	18	f	t	Новая мебель	217
333	3	12	f	f	Джакузи	526
334	1	15	f	t	Свежий ремонт	405
335	10	1	t	f	Окно на улицу	427
336	7	10	t	f	Балкон, вид на море	630
337	7	2	f	t	Большая ванная комната	819
338	3	7	f	f	Вид на город	214
339	1	18	f	t	Тихое расположение	630
340	4	14	f	t	На высоком этаже	106
341	6	11	f	t	Просторная	607
342	8	14	f	t	Кондиционер	504
343	10	3	f	f	Балкон, вид на море	414
344	4	20	f	t	На высоком этаже	112
345	9	10	t	f	Кондиционер	529
346	4	10	f	t	Окно на улицу	712
347	4	17	f	t	Окно во двор	507
348	1	12	t	f	Большая ванная комната	314
349	4	10	f	t	Джакузи	716
350	10	9	f	t	Окно во двор	221
351	8	13	f	f	Новая мебель	904
352	2	18	f	f	Джакузи	228
353	2	17	f	t	Балкон, вид на море	109
354	6	14	f	t	Недавно отремонтирована	214
355	9	3	f	f	Вид на город	805
356	7	1	f	t	Недавно отремонтирована	818
357	6	7	f	f	Большая ванная комната	930
358	10	1	t	f	Вид на город	404
359	8	5	f	t	Недавно отремонтирована	505
360	8	11	f	t	Джакузи	227
361	1	17	f	t	Окно на улицу	707
362	8	5	f	t	Балкон, вид на море	609
363	10	7	f	t	Окно во двор	110
364	1	9	f	t	Мини-кухня	904
365	6	9	f	t	Недавно отремонтирована	901
366	6	20	f	t	Просторная	908
367	8	20	f	t	Новая мебель	302
368	1	7	f	f	Большая ванная комната	825
369	6	10	f	f	Балкон, вид на море	109
370	5	7	f	t	Окно на улицу	802
371	2	5	f	f	Мини-кухня	209
372	3	9	f	t	Просторная	912
373	10	20	f	t	Джакузи	514
374	8	6	f	t	Недавно отремонтирована	409
375	8	2	f	t	Новая мебель	129
376	10	6	f	t	Тихое расположение	908
377	4	9	f	t	Джакузи	914
378	3	6	f	t	Свежий ремонт	925
379	5	5	f	f	На высоком этаже	107
380	1	1	f	t	Окно на улицу	208
381	6	2	f	t	Недавно отремонтирована	606
382	6	1	f	t	Просторная	201
383	1	1	f	t	Окно на улицу	802
384	10	19	f	t	Вид на город	109
385	7	12	f	t	На высоком этаже	323
386	2	16	f	t	Свежий ремонт	419
387	2	3	f	t	Тихое расположение	809
388	3	18	f	f	Новая мебель	725
389	6	20	f	f	Мини-кухня	724
390	9	19	f	t	Большая ванная комната	510
391	10	16	f	t	Окно на улицу	830
392	8	3	f	t	Мини-кухня	522
393	7	19	f	t	Мини-кухня	801
394	1	14	f	t	Недавно отремонтирована	602
395	6	5	f	f	Окно на улицу	716
396	6	9	f	f	Вид на город	921
397	10	15	t	f	На высоком этаже	715
398	9	4	f	t	Просторная	318
399	2	12	t	t	Новая мебель	413
400	2	13	f	t	Гардеробная	924
401	10	13	f	t	Свежий ремонт	713
402	3	1	t	t	Недавно отремонтирована	922
403	6	20	f	t	Новая мебель	326
404	8	6	f	f	Свежий ремонт	925
405	6	20	t	f	Балкон, вид на море	827
406	1	18	f	t	Мини-кухня	923
407	5	19	f	f	Мини-кухня	929
408	3	1	f	f	Джакузи	517
409	4	13	t	f	Гардеробная	726
410	6	14	f	t	Большая ванная комната	111
411	1	3	f	f	Мини-кухня	203
412	7	9	f	t	Окно на улицу	328
413	3	10	f	f	Свежий ремонт	230
414	4	17	f	t	Джакузи	812
415	9	17	f	t	Вид на город	825
416	10	10	f	t	Балкон, вид на море	320
417	3	13	f	t	Гардеробная	310
418	10	13	t	f	Тихое расположение	708
419	1	7	f	t	Мини-кухня	905
420	5	9	f	f	Недавно отремонтирована	925
421	3	5	f	f	Свежий ремонт	708
422	10	5	f	t	Гардеробная	812
423	4	17	f	t	Просторная	202
424	8	5	f	f	Мини-кухня	903
425	5	18	f	t	Джакузи	213
426	7	16	f	t	Просторная	912
427	5	1	f	t	Мини-кухня	425
428	4	1	f	t	Окно во двор	806
429	6	3	t	f	Гардеробная	328
430	5	12	f	t	Тихое расположение	219
431	6	3	f	t	На высоком этаже	417
432	2	2	f	t	Новая мебель	118
433	10	7	f	f	Недавно отремонтирована	602
434	9	16	f	t	Тихое расположение	928
435	4	17	f	t	Окно во двор	621
436	5	3	t	f	Балкон, вид на море	422
437	6	16	f	f	Новая мебель	921
438	9	18	t	f	Просторная	817
439	3	1	f	t	На высоком этаже	108
440	10	12	f	f	Балкон, вид на море	614
441	5	19	f	t	Кондиционер	510
442	8	17	t	f	Свежий ремонт	427
443	10	7	f	t	На высоком этаже	602
444	4	14	f	t	На высоком этаже	521
445	2	19	f	t	Недавно отремонтирована	220
446	7	8	f	t	Окно на улицу	111
447	2	5	f	t	Джакузи	301
448	1	3	f	t	Тихое расположение	721
449	5	18	f	f	Просторная	425
450	5	3	f	t	Окно на улицу	228
451	4	9	f	t	Новая мебель	119
452	2	11	t	f	Новая мебель	112
453	1	14	f	t	Вид на город	325
454	9	19	f	f	Тихое расположение	612
455	6	9	f	f	Большая ванная комната	815
456	8	1	f	f	Большая ванная комната	615
457	3	20	f	f	Недавно отремонтирована	208
458	7	14	f	f	Недавно отремонтирована	817
459	9	20	f	t	Недавно отремонтирована	121
460	9	11	f	t	Свежий ремонт	107
461	5	15	t	f	Вид на город	714
462	1	19	f	t	На высоком этаже	122
463	4	1	t	f	Новая мебель	525
464	9	5	t	f	Джакузи	423
465	1	13	f	f	Просторная	824
466	1	4	f	t	Новая мебель	408
467	6	17	f	f	Новая мебель	320
468	4	17	f	f	Балкон, вид на море	621
469	7	3	f	t	Большая ванная комната	423
470	9	8	f	t	Джакузи	503
471	2	17	f	t	Гардеробная	815
472	8	16	f	t	Свежий ремонт	404
473	8	15	f	t	Свежий ремонт	423
474	2	1	f	f	Недавно отремонтирована	514
475	10	16	f	t	Гардеробная	427
476	7	10	f	f	Балкон, вид на море	109
477	1	6	f	t	Окно на улицу	529
478	1	10	t	t	Недавно отремонтирована	208
479	1	3	f	t	Окно во двор	316
480	4	5	f	t	Гардеробная	510
481	6	1	f	t	Джакузи	909
482	2	3	f	t	Недавно отремонтирована	709
483	9	18	f	t	Окно на улицу	407
484	4	20	t	f	Свежий ремонт	309
485	5	9	t	f	Просторная	803
486	3	19	f	t	Недавно отремонтирована	920
487	4	14	f	t	Недавно отремонтирована	425
488	10	6	f	t	Джакузи	427
489	10	14	f	t	Джакузи	423
490	1	17	f	t	Окно на улицу	817
491	10	11	f	f	Новая мебель	915
492	6	20	f	t	Большая ванная комната	113
493	9	2	f	t	Новая мебель	823
494	7	5	f	f	Балкон, вид на море	301
495	2	10	f	t	Новая мебель	602
496	3	11	t	f	Вид на город	411
497	1	2	f	f	Балкон, вид на море	807
498	5	9	f	t	Недавно отремонтирована	724
499	3	7	f	t	Окно во двор	610
500	8	13	f	f	Гардеробная	503
501	9	14	f	t	Окно во двор	302
502	3	14	f	t	Окно во двор	604
503	3	2	f	f	Гардеробная	726
504	2	2	f	t	Гардеробная	728
505	6	20	f	t	Свежий ремонт	511
506	5	6	f	f	Свежий ремонт	323
507	9	6	f	t	Кондиционер	916
508	3	4	f	t	Гардеробная	930
509	1	14	t	f	Новая мебель	219
510	5	13	f	t	Мини-кухня	127
511	9	3	t	f	Мини-кухня	120
512	3	10	t	t	Свежий ремонт	716
513	4	5	f	t	Окно во двор	102
514	2	5	f	t	Свежий ремонт	323
515	5	11	f	f	На высоком этаже	209
516	2	17	f	f	Кондиционер	710
517	1	14	f	f	Вид на город	728
518	4	20	f	t	На высоком этаже	113
519	9	7	f	t	Просторная	310
520	9	8	f	t	Свежий ремонт	826
521	7	10	f	t	Джакузи	428
522	7	2	f	t	Окно во двор	929
523	5	19	t	f	Гардеробная	209
524	4	11	f	t	Окно на улицу	829
525	6	17	f	t	Просторная	922
526	6	17	f	f	Тихое расположение	913
527	4	15	f	t	Тихое расположение	328
528	8	6	t	t	Джакузи	418
529	2	3	f	t	Большая ванная комната	909
530	3	6	f	f	Свежий ремонт	515
531	7	17	f	t	Балкон, вид на море	519
532	3	8	f	t	Новая мебель	512
533	10	5	f	t	Мини-кухня	806
534	10	8	t	t	Просторная	812
535	4	17	f	t	Новая мебель	628
536	5	11	f	f	Тихое расположение	222
537	1	10	f	t	На высоком этаже	105
538	10	8	f	t	Балкон, вид на море	223
539	5	19	f	t	Просторная	914
540	5	5	f	t	Окно на улицу	907
541	8	19	f	t	Свежий ремонт	728
542	3	16	f	t	Кондиционер	527
543	9	8	f	t	Большая ванная комната	830
544	6	14	f	t	Окно во двор	927
545	9	5	t	f	Балкон, вид на море	115
546	5	2	f	f	Гардеробная	816
547	5	14	f	t	На высоком этаже	103
548	3	19	f	t	Свежий ремонт	908
549	9	16	f	t	Тихое расположение	406
550	4	12	f	f	Окно на улицу	725
551	3	14	f	t	Недавно отремонтирована	111
552	10	17	f	t	Просторная	725
553	6	11	t	f	Просторная	926
554	2	20	f	t	Кондиционер	114
555	1	14	f	t	Просторная	114
556	3	17	f	t	Окно во двор	416
557	2	11	f	t	Балкон, вид на море	512
558	8	18	t	f	Джакузи	415
559	4	12	f	t	Просторная	806
560	3	18	f	t	Тихое расположение	912
561	2	7	f	t	Недавно отремонтирована	212
562	9	19	f	t	Джакузи	725
563	9	10	f	t	Джакузи	923
564	8	3	f	t	Недавно отремонтирована	301
565	9	19	t	t	Свежий ремонт	227
566	2	7	f	t	Окно во двор	825
567	10	5	f	t	Свежий ремонт	607
568	10	18	f	f	Просторная	201
569	9	9	t	t	Большая ванная комната	219
570	10	1	f	t	Мини-кухня	723
571	7	18	f	t	Недавно отремонтирована	408
572	8	15	f	t	Балкон, вид на море	714
573	6	11	f	f	Окно во двор	102
574	1	20	t	f	Мини-кухня	827
575	1	18	f	t	Джакузи	520
576	4	14	f	f	Мини-кухня	709
577	9	1	f	t	Новая мебель	703
578	1	18	t	f	Большая ванная комната	401
579	4	12	f	t	На высоком этаже	202
580	7	12	t	f	Свежий ремонт	729
581	1	4	f	t	Просторная	405
582	10	10	f	t	Новая мебель	728
583	6	14	f	t	Балкон, вид на море	129
584	5	17	f	f	Джакузи	805
585	8	3	f	t	Просторная	625
586	7	13	t	f	Окно на улицу	925
587	8	4	f	t	Кондиционер	421
588	2	3	f	f	Кондиционер	125
589	10	2	f	f	На высоком этаже	120
590	4	11	f	t	Окно на улицу	206
591	4	9	f	f	Балкон, вид на море	310
592	10	11	f	t	Свежий ремонт	412
593	8	20	t	f	Свежий ремонт	207
594	5	17	f	f	Джакузи	724
595	9	18	f	f	Окно на улицу	719
596	1	4	f	t	Окно на улицу	928
597	10	6	f	f	Просторная	822
598	8	17	f	t	Балкон, вид на море	812
599	3	10	f	t	Окно на улицу	921
600	2	7	f	t	Окно во двор	908
601	8	4	t	f	На высоком этаже	224
602	5	3	f	f	Окно на улицу	915
603	9	16	f	t	Джакузи	524
604	4	5	f	f	Новая мебель	827
605	7	9	t	t	Просторная	704
606	4	6	f	f	Тихое расположение	402
607	9	3	t	f	Тихое расположение	714
608	8	19	f	t	Окно во двор	614
609	6	6	f	t	Недавно отремонтирована	929
610	5	13	t	t	Свежий ремонт	801
611	1	14	f	t	Окно на улицу	113
612	4	15	f	t	Свежий ремонт	229
613	8	6	f	t	Тихое расположение	123
614	7	6	f	t	Гардеробная	312
615	2	18	f	t	Джакузи	409
616	8	9	t	f	Вид на город	918
617	8	16	f	f	Тихое расположение	608
618	6	9	f	t	Свежий ремонт	421
619	3	5	f	t	На высоком этаже	608
620	5	12	t	f	Новая мебель	625
621	5	12	f	t	Вид на город	613
622	2	9	f	t	Мини-кухня	218
623	3	6	f	t	Гардеробная	706
624	9	13	t	f	Новая мебель	130
625	4	20	f	f	Просторная	118
626	7	13	f	t	Балкон, вид на море	223
627	3	12	t	t	Тихое расположение	607
628	4	13	t	t	Кондиционер	319
629	5	2	t	f	Большая ванная комната	701
630	8	14	f	t	Мини-кухня	105
631	7	14	f	t	Окно во двор	114
632	6	15	f	f	Свежий ремонт	403
633	8	20	f	f	Просторная	909
634	5	10	f	f	Окно на улицу	602
635	8	3	f	t	Балкон, вид на море	525
636	8	6	f	f	Просторная	228
637	1	11	f	t	Новая мебель	129
638	6	17	t	t	Кондиционер	410
639	9	10	f	t	Балкон, вид на море	107
640	10	20	f	t	Свежий ремонт	421
641	8	10	t	f	Кондиционер	813
642	2	17	f	t	Просторная	107
643	6	9	f	t	Тихое расположение	420
644	9	19	f	t	Новая мебель	809
645	5	13	f	t	Просторная	609
646	4	20	f	f	Мини-кухня	519
647	2	11	f	t	Свежий ремонт	430
648	5	10	f	t	Джакузи	312
649	6	13	f	t	Окно на улицу	305
650	8	16	f	t	Гардеробная	923
651	9	5	t	f	На высоком этаже	929
652	8	5	f	f	Свежий ремонт	919
653	4	13	t	f	Новая мебель	107
654	9	12	f	t	Недавно отремонтирована	202
655	5	14	f	t	Просторная	623
656	7	8	f	f	Просторная	112
657	5	6	f	t	Вид на город	316
658	8	12	f	t	Джакузи	125
659	2	3	f	t	Мини-кухня	511
660	5	18	f	f	Тихое расположение	914
661	5	4	f	t	Тихое расположение	806
662	4	14	f	t	Тихое расположение	228
663	6	12	f	t	Кондиционер	226
664	10	11	f	f	Окно во двор	922
665	8	18	f	t	Просторная	722
666	2	18	f	t	Окно во двор	303
667	7	7	f	t	Окно во двор	919
668	1	2	f	t	Вид на город	121
669	7	10	t	f	Новая мебель	224
670	8	6	f	f	Окно во двор	318
671	9	12	f	f	Джакузи	808
672	10	9	f	t	Недавно отремонтирована	214
673	3	12	t	f	Тихое расположение	325
674	8	13	f	t	Гардеробная	208
675	2	16	f	t	Тихое расположение	919
676	6	5	f	f	Мини-кухня	115
677	10	12	t	f	Свежий ремонт	611
678	5	10	f	t	Кондиционер	603
679	3	2	f	f	Кондиционер	319
680	5	3	f	t	Тихое расположение	904
681	4	8	t	f	Джакузи	715
682	9	2	f	t	Окно на улицу	816
683	9	3	f	t	Недавно отремонтирована	209
684	3	4	f	f	Окно на улицу	704
685	3	8	t	f	Новая мебель	626
686	1	5	f	f	Гардеробная	310
687	9	11	f	t	Окно во двор	126
688	10	4	f	t	Балкон, вид на море	502
689	7	19	f	t	Мини-кухня	810
690	1	20	f	t	Мини-кухня	713
691	7	16	f	t	Свежий ремонт	926
692	10	2	t	f	Вид на город	924
693	10	8	f	t	Тихое расположение	824
694	8	18	f	f	Гардеробная	906
695	6	13	f	t	Окно во двор	910
696	8	3	f	f	Просторная	523
697	5	9	f	t	Тихое расположение	106
698	1	14	t	f	Мини-кухня	530
699	9	14	f	t	Просторная	521
700	4	3	f	f	Кондиционер	926
701	6	20	f	f	Балкон, вид на море	427
702	9	18	f	t	Окно во двор	610
703	1	11	t	f	Большая ванная комната	912
704	5	1	f	f	На высоком этаже	818
705	3	5	f	t	Джакузи	508
706	9	13	f	t	Балкон, вид на море	904
707	7	8	f	t	Окно на улицу	724
708	8	13	t	t	На высоком этаже	514
709	6	12	t	t	Новая мебель	108
710	5	10	f	f	Вид на город	129
711	8	11	f	t	Окно на улицу	522
712	6	6	f	t	Окно во двор	218
713	6	13	f	f	Вид на город	614
714	1	3	f	t	Вид на город	103
715	1	5	f	t	Большая ванная комната	817
716	5	3	f	t	Гардеробная	904
717	10	8	f	t	Новая мебель	612
718	5	8	f	f	Кондиционер	520
719	3	12	f	f	Джакузи	308
720	7	14	t	f	Окно на улицу	204
721	6	13	f	t	Просторная	312
722	4	5	f	t	Вид на город	811
723	6	14	f	f	Недавно отремонтирована	629
724	9	8	f	t	Балкон, вид на море	929
725	6	16	t	f	Свежий ремонт	709
726	6	10	t	f	Новая мебель	103
727	6	6	f	t	Недавно отремонтирована	520
728	6	20	t	f	Тихое расположение	215
729	7	18	f	t	На высоком этаже	317
730	2	8	f	t	Гардеробная	508
731	8	20	f	t	Тихое расположение	827
732	6	13	f	t	Гардеробная	728
733	4	12	t	f	Окно во двор	202
734	9	2	f	t	На высоком этаже	703
735	2	15	t	f	Окно во двор	528
736	10	13	f	t	Балкон, вид на море	519
737	5	20	f	f	Окно на улицу	223
738	4	4	t	f	Окно на улицу	723
739	2	16	f	f	Просторная	804
740	8	15	f	f	Мини-кухня	323
741	1	9	f	t	Кондиционер	818
742	2	18	f	f	Балкон, вид на море	530
743	9	6	f	t	Кондиционер	605
744	8	11	f	t	Окно во двор	204
745	1	7	f	f	Кондиционер	514
746	2	9	f	t	Джакузи	607
747	8	19	t	f	Новая мебель	829
748	8	17	f	t	На высоком этаже	508
749	8	8	f	t	Тихое расположение	112
750	3	9	f	t	Окно на улицу	919
751	2	4	f	t	Новая мебель	225
752	9	15	f	f	Новая мебель	528
753	9	20	f	t	Новая мебель	807
754	6	5	f	t	Большая ванная комната	127
755	1	11	f	t	Кондиционер	425
756	4	18	f	t	Мини-кухня	729
757	4	13	f	f	Балкон, вид на море	803
758	1	18	f	t	На высоком этаже	325
759	5	4	f	t	Гардеробная	407
760	9	15	f	f	На высоком этаже	120
761	1	5	f	t	Недавно отремонтирована	910
762	7	9	f	t	Недавно отремонтирована	603
763	2	12	f	t	Новая мебель	910
764	1	14	f	t	Окно на улицу	907
765	10	19	f	t	Новая мебель	104
766	7	11	f	f	Окно во двор	502
767	10	3	f	f	Тихое расположение	429
768	5	16	f	f	Свежий ремонт	826
769	5	13	f	t	Большая ванная комната	214
770	2	16	f	f	Окно во двор	921
771	1	2	f	f	Кондиционер	619
772	2	12	f	t	Новая мебель	424
773	2	5	f	t	Окно на улицу	115
774	6	2	f	t	На высоком этаже	819
775	6	16	f	t	Кондиционер	425
776	7	19	f	t	Новая мебель	230
777	10	3	t	f	Мини-кухня	914
778	2	20	f	t	Мини-кухня	623
779	3	19	f	t	Окно во двор	804
780	8	2	f	f	Мини-кухня	109
781	2	4	f	t	На высоком этаже	426
782	1	12	f	t	Новая мебель	929
783	7	2	t	f	Окно на улицу	417
784	9	19	f	t	Тихое расположение	427
785	1	13	f	t	Кондиционер	728
786	4	17	f	f	Окно во двор	606
787	8	1	t	f	Просторная	405
788	5	4	f	t	Балкон, вид на море	501
789	1	2	t	f	Просторная	515
790	6	20	t	f	Окно во двор	117
791	8	20	f	f	На высоком этаже	111
792	8	9	f	t	Джакузи	520
793	1	4	f	t	Недавно отремонтирована	524
794	1	8	f	f	Свежий ремонт	310
795	7	13	f	t	Вид на город	420
796	3	15	f	t	Просторная	815
797	7	2	f	t	Свежий ремонт	811
798	10	12	t	f	Новая мебель	625
799	10	12	f	t	На высоком этаже	504
800	1	3	f	t	Свежий ремонт	621
801	2	16	f	t	Вид на город	710
802	7	8	f	f	Недавно отремонтирована	325
803	9	2	t	t	Новая мебель	715
804	3	19	t	f	Большая ванная комната	903
805	5	8	f	t	Просторная	430
806	1	5	f	t	Недавно отремонтирована	330
807	10	6	f	f	Тихое расположение	919
808	1	4	t	t	Балкон, вид на море	218
809	6	3	f	t	Гардеробная	613
810	10	20	f	t	Балкон, вид на море	125
811	5	5	f	t	Кондиционер	909
812	8	11	f	t	Тихое расположение	417
813	8	7	t	f	Гардеробная	422
814	5	1	t	t	Окно на улицу	116
815	1	1	f	t	На высоком этаже	704
816	4	18	f	t	Вид на город	818
817	7	5	f	t	Недавно отремонтирована	817
818	9	7	f	t	Балкон, вид на море	502
819	4	10	f	t	Свежий ремонт	911
820	2	6	f	t	Мини-кухня	227
821	2	10	t	t	Гардеробная	606
822	7	15	f	t	Гардеробная	427
823	1	1	f	f	Недавно отремонтирована	230
824	6	18	f	f	Окно во двор	215
825	8	12	f	t	Окно во двор	724
826	10	6	f	t	Окно на улицу	725
827	3	14	f	f	Окно во двор	716
828	7	10	f	t	Джакузи	604
829	10	9	f	t	Новая мебель	812
830	3	8	f	f	Свежий ремонт	725
831	9	11	f	t	Свежий ремонт	123
832	4	14	f	t	На высоком этаже	920
833	3	19	f	t	Джакузи	911
834	10	8	f	t	Тихое расположение	611
835	2	6	f	f	Окно во двор	925
836	4	11	t	f	Балкон, вид на море	405
837	6	19	f	f	Мини-кухня	906
838	7	12	f	f	Недавно отремонтирована	528
839	3	11	f	t	Вид на город	105
840	6	2	f	f	Тихое расположение	228
841	6	4	f	t	Мини-кухня	224
842	2	18	f	t	Большая ванная комната	403
843	7	2	t	f	Новая мебель	615
844	3	20	f	t	Новая мебель	918
845	5	6	f	t	Недавно отремонтирована	709
846	4	18	f	t	Свежий ремонт	125
847	3	5	t	f	Гардеробная	118
848	10	8	t	t	Вид на город	620
849	3	9	f	t	Джакузи	807
850	5	14	t	t	Мини-кухня	308
851	10	12	f	t	Мини-кухня	330
852	7	1	t	f	Джакузи	322
853	1	15	f	t	Новая мебель	402
854	8	18	f	f	Мини-кухня	913
855	2	12	f	f	Кондиционер	601
856	1	14	f	f	Мини-кухня	822
857	8	6	f	t	Балкон, вид на море	902
858	8	1	f	f	Окно во двор	628
859	4	4	f	f	Большая ванная комната	701
860	10	13	f	f	На высоком этаже	905
861	7	12	f	t	Балкон, вид на море	803
862	10	12	t	f	Мини-кухня	207
863	10	9	f	t	Вид на город	719
864	6	17	f	t	На высоком этаже	602
865	8	6	f	t	Окно на улицу	401
866	6	19	f	t	Джакузи	901
867	9	5	f	t	Просторная	705
868	9	6	f	f	Гардеробная	908
869	4	14	f	f	Недавно отремонтирована	318
870	3	16	t	f	Новая мебель	105
871	7	19	t	t	Окно во двор	919
872	5	19	f	t	Окно на улицу	112
873	3	8	f	t	Гардеробная	604
874	10	7	t	f	Гардеробная	803
875	2	6	f	t	Новая мебель	409
876	7	8	f	t	Новая мебель	122
877	8	20	t	f	Джакузи	914
878	9	7	t	f	Кондиционер	110
879	5	17	f	t	Балкон, вид на море	906
880	7	10	f	t	На высоком этаже	302
881	6	18	t	t	На высоком этаже	516
882	5	11	f	f	Просторная	929
883	3	10	f	t	Просторная	522
884	9	4	f	t	Недавно отремонтирована	213
885	3	3	f	t	Кондиционер	509
886	3	2	f	f	На высоком этаже	328
887	1	18	f	t	Вид на город	121
888	3	12	f	t	Свежий ремонт	628
889	4	5	f	t	Новая мебель	419
890	3	5	t	f	Гардеробная	425
891	5	17	t	f	Окно на улицу	919
892	10	12	f	t	Тихое расположение	211
893	6	6	f	t	Окно на улицу	712
894	4	4	t	f	Новая мебель	209
895	8	1	f	t	Балкон, вид на море	708
896	7	12	t	f	На высоком этаже	907
897	1	3	f	t	Балкон, вид на море	305
898	2	11	f	t	Просторная	721
899	8	1	t	f	Вид на город	628
900	8	2	f	t	Окно на улицу	501
901	3	12	f	t	Окно на улицу	618
902	8	3	f	f	На высоком этаже	825
903	1	18	f	t	Тихое расположение	428
904	5	13	f	t	Свежий ремонт	130
905	3	2	f	f	Балкон, вид на море	114
906	4	17	f	f	Тихое расположение	307
907	9	13	f	f	Окно на улицу	911
908	2	5	f	f	Вид на город	108
909	8	10	f	f	Гардеробная	703
910	1	16	f	t	Вид на город	610
911	7	14	f	f	Окно на улицу	802
912	3	2	t	t	Кондиционер	302
913	6	12	f	t	Окно на улицу	102
914	7	9	f	t	Свежий ремонт	529
915	1	9	f	t	Гардеробная	228
916	4	19	f	f	На высоком этаже	227
917	5	11	f	f	Свежий ремонт	301
918	2	14	f	f	Окно на улицу	914
919	4	6	f	f	Окно на улицу	425
920	4	19	t	t	Гардеробная	215
921	8	1	f	t	Новая мебель	523
922	3	15	f	t	Балкон, вид на море	710
923	5	18	f	f	На высоком этаже	406
924	1	13	f	t	Балкон, вид на море	329
925	5	16	t	f	Окно во двор	614
926	7	20	f	t	Большая ванная комната	602
927	8	17	t	f	Гардеробная	627
928	6	8	f	f	Кондиционер	901
929	9	4	f	t	Гардеробная	410
930	3	9	f	t	Недавно отремонтирована	213
931	3	6	f	t	Недавно отремонтирована	506
932	8	9	f	f	Кондиционер	207
933	8	17	f	f	Джакузи	305
934	7	7	f	t	Свежий ремонт	522
935	5	15	f	f	Свежий ремонт	704
936	3	17	f	f	Свежий ремонт	526
937	3	9	f	t	Окно во двор	206
938	10	12	f	f	Окно на улицу	508
939	4	16	f	t	Просторная	101
940	6	9	f	t	На высоком этаже	908
941	3	2	f	f	Свежий ремонт	602
942	5	17	f	t	Свежий ремонт	722
943	8	15	f	t	Гардеробная	213
944	3	17	f	t	Окно во двор	606
945	5	14	f	t	Свежий ремонт	506
946	3	6	f	f	Новая мебель	825
947	5	11	f	t	Вид на город	512
948	10	3	f	t	Окно на улицу	222
949	9	5	f	f	Джакузи	328
950	2	1	f	f	Новая мебель	214
951	7	4	f	t	Джакузи	918
952	7	18	f	t	Просторная	810
953	2	10	f	f	Мини-кухня	326
954	2	7	f	t	Окно на улицу	609
955	6	8	f	t	Свежий ремонт	525
956	7	18	f	t	Окно во двор	302
957	2	4	f	t	На высоком этаже	407
958	4	10	f	t	Большая ванная комната	928
959	5	20	f	t	Свежий ремонт	806
960	2	13	f	t	Новая мебель	410
961	4	7	t	t	Балкон, вид на море	130
962	9	1	t	t	Большая ванная комната	329
963	5	6	f	f	Свежий ремонт	714
964	9	16	f	t	Гардеробная	314
965	4	4	f	f	Большая ванная комната	315
966	5	10	f	f	Тихое расположение	824
967	2	5	f	t	Балкон, вид на море	527
968	10	17	f	f	Гардеробная	419
969	5	14	t	f	Большая ванная комната	920
970	7	15	f	t	Просторная	721
971	6	20	f	f	Большая ванная комната	702
972	6	11	f	t	На высоком этаже	613
973	8	7	f	f	Тихое расположение	725
974	3	20	f	t	Окно во двор	616
975	8	1	f	t	Просторная	907
976	9	8	f	f	Балкон, вид на море	617
977	6	16	f	f	Просторная	409
978	4	16	f	t	Кондиционер	425
979	8	2	f	t	Вид на город	913
980	6	17	f	t	Кондиционер	609
981	4	19	f	f	Гардеробная	503
982	1	3	t	f	Недавно отремонтирована	407
983	1	15	f	t	Свежий ремонт	114
984	6	5	f	t	Новая мебель	222
985	1	7	f	t	Тихое расположение	829
986	1	5	f	t	Вид на город	415
987	2	12	f	t	Окно на улицу	801
988	3	13	t	f	На высоком этаже	309
989	9	3	f	t	Новая мебель	816
990	9	4	f	t	Новая мебель	728
991	4	7	t	f	Окно во двор	911
992	5	5	t	t	Мини-кухня	810
993	6	4	f	f	Джакузи	902
994	1	12	f	t	Джакузи	811
995	3	18	f	f	Джакузи	427
996	9	13	f	f	Гардеробная	918
997	1	18	t	f	Окно во двор	527
998	2	9	f	f	Вид на город	211
999	6	7	f	f	Тихое расположение	708
1000	5	15	f	t	Мини-кухня	516
\.


                                                                                                                                         4933.dat                                                                                            0000600 0004000 0002000 00000114371 14771407746 0014304 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	215	2023-11-24	51300	t	СБП
2	63	2023-04-09	39200	t	СБП
3	248	2023-03-07	72800	t	карта
4	987	2023-08-30	3600	t	наличные
5	184	2023-04-17	63600	t	наличные
6	297	2023-01-01	97700	f	СБП
7	862	2023-06-21	94900	t	карта
8	875	2023-04-08	6800	t	наличные
9	828	2023-09-28	27100	t	наличные
10	928	2023-09-01	51600	f	наличные
11	398	2023-11-03	39300	f	карта
12	212	2023-04-27	3500	t	наличные
13	71	2023-11-18	25200	t	карта
14	919	2023-12-28	74900	t	наличные
15	850	2023-02-08	63200	t	карта
16	195	2023-12-04	17700	t	СБП
17	551	2023-04-14	72200	t	наличные
18	741	2023-10-26	6900	t	карта
19	491	2023-08-26	13500	t	наличные
20	924	2023-08-26	63800	t	наличные
21	258	2023-02-22	72400	f	карта
22	165	2023-12-08	72800	t	СБП
23	170	2023-11-15	36000	t	карта
24	573	2023-11-13	31400	t	карта
25	768	2023-07-16	49400	t	наличные
26	56	2023-11-29	20300	t	карта
27	313	2023-08-05	88500	t	карта
28	574	2023-07-19	30100	t	карта
29	559	2023-12-28	91000	t	СБП
30	85	2023-02-08	19700	t	наличные
31	236	2023-05-23	8700	t	карта
32	797	2023-01-12	58400	t	карта
33	243	2023-05-16	50200	t	карта
34	437	2023-09-08	55900	t	карта
35	722	2023-06-24	11200	f	карта
36	845	2023-10-08	57400	f	наличные
37	898	2023-03-16	47800	t	карта
38	588	2023-02-22	33100	t	карта
39	199	2023-08-30	96200	t	карта
40	49	2023-01-24	58000	t	карта
41	892	2023-04-07	64300	t	карта
42	146	2023-09-27	29300	f	СБП
43	831	2023-12-31	44800	t	карта
44	549	2023-05-13	84600	t	карта
45	849	2023-09-27	76600	t	СБП
46	4	2023-03-03	92300	t	карта
47	119	2023-01-29	78800	f	наличные
48	290	2023-07-06	79200	f	наличные
49	214	2023-04-19	45700	t	СБП
50	889	2023-09-20	84500	t	карта
51	552	2023-03-27	59500	t	наличные
52	330	2023-03-06	38200	t	карта
53	951	2023-10-05	71100	t	криптовалюта
54	57	2023-06-26	34900	t	карта
55	920	2023-10-05	76700	f	карта
56	90	2023-10-20	94400	t	карта
57	223	2023-12-27	67800	t	карта
58	240	2023-07-08	72700	t	наличные
59	506	2023-04-08	44800	t	наличные
60	707	2023-01-07	84200	t	наличные
61	338	2023-09-17	80400	t	криптовалюта
62	974	2023-03-28	41900	t	карта
63	350	2023-10-17	49700	t	карта
64	688	2023-08-27	39000	t	СБП
65	658	2023-11-27	98500	t	карта
66	813	2023-09-24	58600	t	наличные
67	768	2023-08-03	35100	t	карта
68	580	2023-08-27	42000	f	карта
69	474	2023-10-17	62900	t	наличные
70	312	2023-06-12	96700	f	карта
71	762	2023-01-10	52600	t	карта
72	398	2023-07-21	24100	t	карта
73	250	2023-02-23	46400	t	карта
74	839	2023-08-24	10400	t	СБП
75	681	2023-09-19	2300	t	СБП
76	23	2023-11-24	24700	t	карта
77	40	2023-07-11	30100	t	СБП
78	178	2023-10-28	3000	t	карта
79	94	2023-01-17	50500	t	СБП
80	134	2023-06-03	55100	t	карта
81	735	2023-02-28	78200	t	карта
82	934	2023-09-14	8300	f	карта
83	797	2023-03-19	60900	t	СБП
84	741	2023-09-22	14800	t	карта
85	204	2023-10-09	26400	t	карта
86	103	2023-12-26	83300	t	карта
87	668	2023-07-24	48800	f	перевод
88	689	2023-09-04	87700	t	карта
89	487	2023-07-01	39700	t	карта
90	357	2023-01-29	50200	t	карта
91	49	2023-02-02	93100	t	СБП
92	175	2023-02-17	28700	f	карта
93	606	2023-05-28	66100	t	карта
94	98	2023-08-29	50700	f	карта
95	646	2023-04-27	32500	t	карта
96	549	2023-07-10	18300	t	карта
97	149	2023-02-09	60100	t	СБП
98	558	2023-05-04	47800	t	СБП
99	199	2023-10-18	96600	t	карта
100	450	2023-07-19	6800	t	наличные
101	988	2023-10-20	77600	t	карта
102	823	2023-09-23	48200	t	наличные
103	772	2023-11-03	70500	t	СБП
104	823	2023-10-21	56300	t	карта
105	12	2023-05-31	12500	t	наличные
106	177	2023-06-17	47000	t	карта
107	114	2023-10-29	19100	t	криптовалюта
108	137	2023-10-01	34000	t	карта
109	290	2023-07-17	61100	t	перевод
110	244	2023-06-14	81300	t	наличные
111	18	2023-06-03	96600	f	карта
112	189	2023-03-19	49700	t	наличные
113	70	2023-09-09	61400	t	наличные
114	790	2023-12-24	6700	t	карта
115	371	2023-09-20	94200	t	наличные
116	721	2023-12-22	93800	t	карта
117	777	2023-10-08	81800	t	наличные
118	810	2023-01-27	52600	t	наличные
119	312	2023-10-05	49400	t	карта
120	512	2023-01-14	93400	t	СБП
121	126	2023-06-14	95700	t	наличные
122	516	2023-07-10	48600	t	карта
123	108	2023-09-24	22500	t	наличные
124	460	2023-08-25	5000	t	наличные
125	611	2023-11-18	35100	t	карта
126	29	2023-10-31	92700	t	карта
127	392	2023-11-19	12300	t	СБП
128	666	2023-11-08	69500	t	карта
129	23	2023-07-21	65000	t	карта
130	146	2023-09-09	60900	t	карта
131	51	2023-12-02	5700	t	наличные
132	576	2023-04-27	22600	f	наличные
133	980	2023-09-04	66000	t	СБП
134	978	2023-09-20	28200	t	карта
135	792	2023-01-12	53400	t	карта
136	259	2023-01-04	76300	t	наличные
137	588	2023-06-14	43000	f	СБП
138	566	2023-06-21	17800	t	наличные
139	360	2023-05-21	90200	f	карта
140	865	2023-05-07	56600	t	карта
141	743	2023-04-15	84800	t	карта
142	844	2023-05-18	54600	f	карта
143	377	2023-11-01	59200	f	карта
144	259	2023-08-05	66900	t	наличные
145	828	2023-10-28	35700	t	карта
146	382	2023-11-22	26600	f	карта
147	794	2023-12-31	54300	t	карта
148	502	2023-02-27	19900	f	наличные
149	101	2023-09-24	63700	t	СБП
150	89	2023-04-03	17800	t	наличные
151	686	2023-01-07	20700	t	карта
152	681	2023-01-30	90900	f	карта
153	204	2023-06-16	67800	t	карта
154	604	2023-09-28	63000	t	карта
155	189	2023-05-04	34600	t	наличные
156	672	2023-09-09	1000	t	карта
157	707	2023-03-15	70200	t	карта
158	371	2023-10-20	63200	t	наличные
159	85	2023-08-16	51000	t	карта
160	371	2023-10-15	30800	t	карта
161	315	2023-04-27	14400	t	перевод
162	941	2023-09-28	39900	t	СБП
163	979	2023-12-15	81800	t	карта
164	27	2023-02-07	4100	t	карта
165	382	2023-08-13	37700	t	СБП
166	207	2023-01-07	55300	t	наличные
167	628	2023-07-10	49600	t	наличные
168	463	2023-08-05	15600	t	карта
169	966	2023-03-14	61900	t	карта
170	251	2023-10-31	29300	t	карта
171	188	2023-03-09	95800	t	карта
172	519	2023-03-24	37800	f	карта
173	633	2023-03-14	54100	f	карта
174	31	2023-09-05	64600	f	СБП
175	172	2023-10-16	16700	t	карта
176	823	2023-04-13	59800	t	карта
177	679	2023-06-28	23800	t	карта
178	709	2023-08-14	43800	t	карта
179	422	2023-09-11	29600	t	карта
180	85	2023-12-05	50700	t	карта
181	598	2023-02-11	53400	t	карта
182	590	2023-06-26	89900	f	СБП
183	504	2023-03-17	37400	f	СБП
184	708	2023-05-26	10900	t	карта
185	88	2023-03-24	76800	t	карта
186	917	2023-02-18	25600	f	карта
187	803	2023-06-29	56300	t	карта
188	219	2023-10-18	76100	t	карта
189	269	2023-01-27	76500	t	наличные
190	526	2023-02-02	5600	t	карта
191	889	2023-03-28	60900	t	карта
192	225	2023-07-30	51900	t	карта
193	686	2023-04-17	59900	f	карта
194	872	2023-04-12	3100	t	наличные
195	699	2023-08-07	65300	t	наличные
196	959	2023-04-07	88500	f	карта
197	909	2023-08-03	97000	t	наличные
198	881	2023-12-02	34800	t	карта
199	513	2023-01-10	32400	t	наличные
200	308	2023-02-16	70200	f	карта
201	865	2023-12-31	74800	t	карта
202	126	2023-04-17	11900	t	карта
203	315	2023-01-24	84300	t	криптовалюта
204	335	2023-01-24	66800	t	карта
205	451	2023-01-20	25200	t	СБП
206	595	2023-10-17	75000	t	карта
207	324	2023-05-26	15800	t	карта
208	748	2023-09-04	27500	t	карта
209	624	2023-10-13	95900	t	СБП
210	164	2023-05-06	45300	t	карта
211	156	2023-10-09	80700	t	карта
212	295	2023-07-27	78500	t	наличные
213	609	2023-04-18	80700	f	карта
214	57	2023-04-01	98000	t	СБП
215	544	2023-11-16	11600	t	карта
216	737	2023-08-15	33300	t	карта
217	41	2023-04-17	64200	t	карта
218	547	2023-11-30	16200	t	криптовалюта
219	380	2023-01-14	23900	t	карта
220	424	2023-01-03	89900	f	карта
221	595	2023-09-10	41300	t	карта
222	790	2023-11-26	44200	t	карта
223	875	2023-07-14	58800	t	наличные
224	50	2023-12-24	43200	t	карта
225	10	2023-10-29	68200	t	карта
226	728	2023-03-22	83600	t	карта
227	458	2023-07-03	96000	t	карта
228	321	2023-09-20	19200	t	наличные
229	501	2023-04-29	62500	t	карта
230	466	2023-11-23	25900	t	карта
231	760	2023-09-06	76300	t	карта
232	511	2023-12-20	35000	t	карта
233	121	2023-07-14	65100	t	карта
234	920	2023-03-07	77400	t	карта
235	374	2023-12-05	13300	f	наличные
236	940	2023-07-29	3600	t	наличные
237	90	2023-06-24	62500	t	наличные
238	947	2023-06-23	13300	f	криптовалюта
239	387	2023-05-23	85900	t	наличные
240	576	2023-01-23	49200	t	карта
241	653	2023-07-23	39800	t	наличные
242	882	2023-09-08	1900	t	карта
243	744	2023-12-07	30200	f	карта
244	500	2023-04-13	33900	t	СБП
245	914	2023-12-31	30200	t	наличные
246	234	2023-07-01	24900	t	наличные
247	986	2023-06-20	47400	f	наличные
248	504	2023-07-26	31100	t	карта
249	695	2023-05-10	28600	f	наличные
250	504	2023-05-16	45500	f	наличные
251	528	2023-04-03	83800	t	карта
252	930	2023-01-26	70000	t	наличные
253	259	2023-01-08	73400	t	СБП
254	557	2023-10-14	81400	t	карта
255	57	2023-01-10	4800	t	СБП
256	450	2023-12-01	80900	t	наличные
257	881	2023-02-12	74900	t	карта
258	624	2023-01-30	40100	t	карта
259	946	2023-06-08	89900	t	перевод
260	301	2023-02-22	17700	t	криптовалюта
261	751	2023-02-01	53400	t	карта
262	488	2023-12-07	85800	t	наличные
263	584	2023-07-15	70600	t	наличные
264	161	2023-03-23	81600	t	карта
265	532	2023-08-09	86600	t	карта
266	268	2023-09-06	73200	t	наличные
267	854	2023-03-15	18300	f	карта
268	1000	2023-03-08	69200	t	наличные
269	114	2023-11-28	97900	t	карта
270	519	2023-09-02	6100	t	карта
271	620	2023-08-28	32200	t	карта
272	727	2023-07-28	69700	t	карта
273	167	2023-09-20	15300	t	карта
274	473	2023-05-03	84800	t	карта
275	727	2023-12-22	79200	t	карта
276	60	2023-09-03	66000	t	карта
277	383	2023-11-15	98700	f	наличные
278	968	2023-11-08	28700	t	наличные
279	711	2023-06-13	14300	t	карта
280	814	2023-05-06	94400	t	наличные
281	555	2023-08-10	14800	t	карта
282	135	2023-11-16	76300	f	карта
283	85	2023-07-18	34800	t	криптовалюта
284	347	2023-07-20	21000	f	карта
285	290	2023-08-15	10200	t	карта
286	596	2023-11-05	47300	t	перевод
287	681	2023-02-15	85100	t	карта
288	92	2023-06-06	66300	t	карта
289	358	2023-02-25	46500	t	наличные
290	388	2023-11-01	52000	t	карта
291	954	2023-02-06	4800	t	карта
292	931	2023-07-06	56900	t	карта
293	268	2023-03-11	47000	t	карта
294	803	2023-03-22	30800	t	карта
295	658	2023-06-09	60100	t	наличные
296	847	2023-03-24	38000	t	карта
297	394	2023-11-23	24000	f	карта
298	336	2023-06-05	88500	t	карта
299	230	2023-10-06	8300	t	карта
300	832	2023-09-21	18100	t	карта
301	101	2023-07-17	53600	t	СБП
302	839	2023-01-11	60500	t	наличные
303	4	2023-02-10	14300	t	карта
304	580	2023-07-15	79700	t	карта
305	615	2023-04-24	41700	t	карта
306	544	2023-07-05	39100	t	СБП
307	633	2023-12-19	94400	t	карта
308	140	2023-02-20	50100	t	карта
309	852	2023-02-09	84300	t	СБП
310	789	2023-01-06	41900	t	карта
311	592	2023-04-04	17700	t	наличные
312	508	2023-01-05	76000	f	наличные
313	343	2023-03-13	8700	t	наличные
314	320	2023-01-17	47700	f	наличные
315	86	2023-09-08	63600	t	наличные
316	309	2023-11-09	89000	t	наличные
317	248	2023-09-08	10200	f	карта
318	666	2023-09-23	58400	t	СБП
319	716	2023-11-19	26100	f	СБП
320	529	2023-05-04	57900	f	карта
321	269	2023-11-03	76200	t	карта
322	585	2023-07-10	60800	t	карта
323	807	2023-07-28	91300	t	карта
324	1000	2023-10-24	59000	t	наличные
325	847	2023-07-25	8800	t	карта
326	337	2023-07-21	61300	t	карта
327	155	2023-03-06	45500	t	карта
328	91	2023-08-18	6900	t	карта
329	320	2023-03-08	26000	t	карта
330	138	2023-09-12	24700	t	карта
331	708	2023-09-02	40100	t	СБП
332	399	2023-05-02	35800	t	карта
333	262	2023-08-17	41300	t	карта
334	858	2023-04-20	68900	t	карта
335	772	2023-04-18	92100	t	СБП
336	375	2023-11-27	26000	t	карта
337	948	2023-05-07	33700	f	наличные
338	969	2023-09-19	54200	t	карта
339	349	2023-11-04	54300	t	карта
340	713	2023-09-17	87000	t	криптовалюта
341	305	2023-05-09	2900	t	наличные
342	18	2023-06-28	90700	t	карта
343	177	2023-06-07	69700	f	карта
344	233	2023-08-29	88700	t	карта
345	692	2023-06-29	59200	t	карта
346	198	2023-06-05	85400	f	карта
347	775	2023-05-12	81000	t	карта
348	769	2023-06-09	55500	t	наличные
349	577	2023-06-14	72300	t	наличные
350	285	2023-10-27	95800	t	карта
351	426	2023-10-11	27100	t	наличные
352	960	2023-04-17	43200	t	карта
353	646	2023-01-02	48300	t	наличные
354	885	2023-02-19	77900	f	наличные
355	210	2023-02-25	65600	t	СБП
356	960	2023-05-11	16100	t	карта
357	25	2023-10-15	57700	t	СБП
358	873	2023-04-24	30300	t	карта
359	947	2023-06-09	12900	t	наличные
360	321	2023-01-02	8700	f	наличные
361	762	2023-12-17	20500	t	карта
362	34	2023-02-04	86300	t	карта
363	963	2023-10-22	81600	t	карта
364	852	2023-01-04	81200	t	карта
365	618	2023-12-30	22500	t	наличные
366	716	2023-08-05	52500	t	карта
367	216	2023-12-15	10200	f	карта
368	734	2023-01-18	35400	t	карта
369	514	2023-05-24	58600	t	карта
370	968	2023-04-18	75200	t	карта
371	790	2023-06-11	37800	t	СБП
372	310	2023-08-26	27500	t	карта
373	376	2023-02-25	72600	t	СБП
374	998	2023-01-11	87000	t	карта
375	802	2023-01-06	35300	t	карта
376	682	2023-10-03	48800	t	карта
377	187	2023-05-31	800	f	карта
378	424	2023-05-12	71500	t	карта
379	804	2023-05-18	86200	t	СБП
380	543	2023-04-02	4700	t	карта
381	341	2023-12-09	69900	t	карта
382	697	2023-01-25	63400	t	карта
383	298	2023-09-13	22800	t	наличные
384	258	2023-01-07	19100	t	криптовалюта
385	18	2023-02-11	74100	t	карта
386	829	2023-09-01	26900	t	карта
387	567	2023-11-23	50600	t	карта
388	589	2023-01-20	80600	t	наличные
389	500	2023-03-06	79000	t	карта
390	610	2023-01-24	89000	t	наличные
391	860	2023-10-07	37900	t	СБП
392	981	2023-02-11	11700	t	карта
393	542	2023-04-19	74300	t	карта
394	503	2023-04-05	73900	f	карта
395	995	2023-10-09	17800	t	карта
396	413	2023-12-23	36800	t	СБП
397	832	2023-02-16	19200	t	наличные
398	306	2023-07-04	6400	t	наличные
399	338	2023-07-16	69500	t	наличные
400	314	2023-11-09	50300	t	карта
401	697	2023-07-04	48200	f	карта
402	793	2023-12-01	49300	t	перевод
403	537	2023-02-24	69500	t	карта
404	552	2023-02-02	32700	f	карта
405	27	2023-11-08	28000	t	наличные
406	446	2023-05-31	98900	t	карта
407	852	2023-06-19	13000	t	карта
408	610	2023-05-15	25500	t	карта
409	733	2023-11-01	81400	t	карта
410	315	2023-03-20	86500	t	карта
411	48	2023-12-11	33100	t	карта
412	285	2023-07-27	84000	t	карта
413	956	2023-10-07	93400	t	карта
414	822	2023-06-20	53800	t	карта
415	121	2023-03-04	25600	t	карта
416	777	2023-10-04	27100	t	перевод
417	301	2023-08-20	81400	t	наличные
418	112	2023-06-18	89000	t	наличные
419	423	2023-05-24	30000	t	карта
420	127	2023-10-29	12600	f	карта
421	893	2023-08-09	58500	t	карта
422	276	2023-10-04	27700	t	наличные
423	397	2023-07-28	57600	t	карта
424	210	2023-07-28	70100	t	карта
425	229	2023-02-21	59900	t	СБП
426	403	2023-07-17	26900	t	карта
427	816	2023-12-30	23900	t	наличные
428	84	2023-10-06	41300	t	карта
429	935	2023-05-16	54800	t	карта
430	763	2023-08-04	80400	t	СБП
431	145	2023-05-08	1500	t	карта
432	880	2023-02-11	84700	t	наличные
433	883	2023-05-02	92000	t	карта
434	863	2023-08-07	41400	t	СБП
435	507	2023-11-12	94900	t	карта
436	621	2023-03-03	23200	t	перевод
437	947	2023-10-01	82600	t	карта
438	100	2023-07-06	68000	t	карта
439	523	2023-12-11	72300	t	карта
440	744	2023-01-21	40200	f	карта
441	799	2023-12-09	67100	t	наличные
442	367	2023-01-04	46000	t	карта
443	714	2023-10-04	6700	t	карта
444	762	2023-02-11	92200	t	карта
445	955	2023-06-04	79400	t	карта
446	688	2023-12-07	80100	t	карта
447	800	2023-07-05	53400	t	карта
448	30	2023-09-23	74700	f	перевод
449	990	2023-04-18	19600	t	наличные
450	507	2023-07-28	87600	t	СБП
451	6	2023-01-10	70800	f	карта
452	787	2023-08-16	96000	t	карта
453	301	2023-10-08	62000	t	карта
454	242	2023-10-27	85200	t	наличные
455	89	2023-03-11	31900	t	наличные
456	446	2023-08-30	28500	f	карта
457	1	2023-07-05	83800	t	наличные
458	297	2023-12-01	76200	f	наличные
459	611	2023-12-02	58500	t	наличные
460	383	2023-07-22	33200	t	карта
461	576	2023-03-02	24400	t	наличные
462	509	2023-10-28	12200	f	наличные
463	363	2023-11-28	43000	t	карта
464	945	2023-07-15	96700	t	карта
465	22	2023-07-25	31000	t	карта
466	336	2023-04-24	66600	f	СБП
467	269	2023-10-21	74500	t	СБП
468	204	2023-03-22	10100	f	СБП
469	800	2023-09-26	33700	t	наличные
470	928	2023-09-11	81200	t	карта
471	19	2023-09-27	34600	t	карта
472	890	2023-02-07	80300	t	наличные
473	191	2023-08-19	5900	t	карта
474	795	2023-09-17	71000	f	карта
475	374	2023-11-23	84800	t	карта
476	186	2023-05-23	41800	t	карта
477	289	2023-12-24	77800	t	карта
478	527	2023-03-15	45700	f	наличные
479	875	2023-11-03	8500	t	карта
480	821	2023-08-25	66100	t	карта
481	958	2023-03-28	43200	t	наличные
482	973	2023-10-05	15100	t	карта
483	625	2023-10-18	80100	t	наличные
484	676	2023-06-19	69700	t	карта
485	300	2023-11-10	70300	t	карта
486	528	2023-12-26	51600	t	наличные
487	593	2023-01-31	60700	t	карта
488	991	2023-05-18	2800	t	карта
489	953	2023-06-26	80400	t	перевод
490	354	2023-02-08	78100	t	карта
491	225	2023-09-29	27200	f	карта
492	348	2023-09-26	39500	t	наличные
493	929	2023-05-18	89400	t	наличные
494	930	2023-09-15	71700	t	карта
495	37	2023-11-26	64500	f	карта
496	270	2023-01-13	8500	t	наличные
497	7	2023-01-01	10200	t	наличные
498	193	2023-11-01	81600	t	наличные
499	725	2023-11-05	81200	t	криптовалюта
500	237	2023-07-18	61700	f	наличные
501	332	2023-01-25	37100	f	наличные
502	841	2023-10-10	88500	t	карта
503	802	2023-01-12	39500	t	карта
504	363	2023-12-01	94900	f	СБП
505	84	2023-09-17	68200	t	карта
506	848	2023-07-18	51000	f	наличные
507	64	2023-01-20	78300	t	карта
508	675	2023-06-14	73700	f	карта
509	824	2023-05-17	81900	t	карта
510	533	2023-06-05	28900	t	карта
511	949	2023-01-03	54000	f	наличные
512	69	2023-03-28	48800	f	наличные
513	311	2023-06-23	57100	t	СБП
514	29	2023-11-30	19500	t	карта
515	666	2023-06-12	12800	t	наличные
516	751	2023-04-21	62900	f	наличные
517	192	2023-02-19	89300	t	наличные
518	493	2023-11-02	11400	t	наличные
519	785	2023-06-15	50500	f	карта
520	801	2023-12-20	24000	f	наличные
521	777	2023-07-11	61200	f	карта
522	297	2023-12-16	89400	f	СБП
523	158	2023-12-19	91200	t	криптовалюта
524	301	2023-10-30	39800	t	карта
525	993	2023-09-07	61400	t	карта
526	250	2023-02-20	47300	t	карта
527	762	2023-08-11	94200	t	наличные
528	477	2023-03-12	39300	f	наличные
529	94	2023-07-20	5300	f	карта
530	460	2023-09-01	90500	f	наличные
531	387	2023-12-07	75000	f	карта
532	555	2023-02-09	94100	f	наличные
533	995	2023-09-02	60600	t	карта
534	30	2023-07-30	26800	f	карта
535	19	2023-02-02	66000	t	карта
536	708	2023-06-26	12700	t	наличные
537	605	2023-06-20	99800	t	наличные
538	521	2023-09-14	61400	t	перевод
539	972	2023-04-29	36000	t	СБП
540	270	2023-09-18	4400	t	карта
541	562	2023-08-28	1700	t	наличные
542	570	2023-01-18	11500	t	наличные
543	480	2023-06-05	47300	t	карта
544	613	2023-09-29	39900	f	карта
545	664	2023-10-24	78100	t	карта
546	437	2023-09-06	53000	t	наличные
547	729	2023-09-27	91100	t	карта
548	26	2023-08-16	89200	t	карта
549	968	2023-07-17	98300	t	карта
550	769	2023-08-02	62600	t	карта
551	234	2023-05-05	18000	f	карта
552	352	2023-07-05	35600	t	карта
553	87	2023-07-10	26200	t	наличные
554	574	2023-09-01	45300	t	карта
555	859	2023-06-02	19900	t	наличные
556	160	2023-01-02	85700	t	карта
557	993	2023-09-28	8100	t	карта
558	910	2023-03-22	87500	t	СБП
559	77	2023-07-29	77900	f	наличные
560	260	2023-10-11	97200	f	наличные
561	573	2023-10-09	41400	t	наличные
562	898	2023-11-29	16400	t	наличные
563	892	2023-05-10	49300	t	карта
564	210	2023-06-27	32600	t	наличные
565	981	2023-05-18	42200	t	карта
566	112	2023-10-21	8300	t	наличные
567	210	2023-07-14	87600	f	карта
568	539	2023-06-20	32900	t	наличные
569	118	2023-06-25	76900	t	карта
570	907	2023-02-24	44500	t	карта
571	142	2023-09-10	32100	t	карта
572	127	2023-04-12	81800	t	наличные
573	836	2023-04-11	28100	t	наличные
574	60	2023-11-22	9600	t	карта
575	119	2023-10-24	54900	t	карта
576	676	2023-10-24	700	t	карта
577	479	2023-12-15	89800	t	карта
578	977	2023-12-26	24300	t	карта
579	921	2023-11-19	39500	t	карта
580	284	2023-10-12	42700	t	карта
581	679	2023-01-05	97200	t	карта
582	440	2023-11-21	91000	t	карта
583	931	2023-10-21	6000	t	карта
584	358	2023-03-27	38800	t	карта
585	771	2023-12-17	33100	t	карта
586	286	2023-03-10	69500	t	СБП
587	940	2023-10-06	6100	t	карта
588	578	2023-03-23	15600	t	СБП
589	567	2023-03-09	75800	t	наличные
590	85	2023-10-23	6800	t	карта
591	325	2023-01-26	16200	t	карта
592	315	2023-08-24	95600	t	наличные
593	719	2023-02-19	22500	t	наличные
594	31	2023-08-28	35000	t	наличные
595	935	2023-09-13	88900	t	карта
596	385	2023-05-06	59300	t	СБП
597	63	2023-10-16	51500	t	наличные
598	767	2023-03-19	12000	t	СБП
599	933	2023-03-14	3600	t	карта
600	300	2023-07-14	33100	t	наличные
601	135	2023-05-03	57000	t	карта
602	498	2023-05-07	98800	t	наличные
603	77	2023-01-20	20000	t	карта
604	705	2023-06-08	80500	f	карта
605	606	2023-08-04	17300	t	наличные
606	755	2023-10-21	89600	t	СБП
607	348	2023-04-24	45300	f	карта
608	579	2023-01-17	19100	t	СБП
609	399	2023-04-20	63900	t	карта
610	807	2023-04-04	56700	t	карта
611	479	2023-04-09	7700	t	СБП
612	394	2023-03-08	74800	t	карта
613	453	2023-02-25	70800	t	карта
614	918	2023-03-24	58000	t	СБП
615	313	2023-08-03	91500	t	карта
616	648	2023-11-26	82000	t	наличные
617	606	2023-03-07	13100	f	наличные
618	910	2023-09-14	6300	t	наличные
619	972	2023-02-11	69700	t	карта
620	919	2023-07-03	98900	t	наличные
621	435	2023-11-30	42900	t	СБП
622	635	2023-02-03	61600	f	наличные
623	942	2023-09-09	87700	t	карта
624	86	2023-05-15	39200	t	наличные
625	82	2023-06-24	48500	t	карта
626	233	2023-04-29	89900	t	наличные
627	452	2023-10-23	89100	t	наличные
628	902	2023-11-19	24700	f	карта
629	317	2023-11-29	91600	t	карта
630	525	2023-06-04	87800	t	СБП
631	599	2023-04-11	88200	t	карта
632	326	2023-04-05	85700	t	карта
633	369	2023-03-10	19100	t	карта
634	494	2023-05-06	87200	t	карта
635	412	2023-04-29	54000	f	карта
636	282	2023-02-19	28400	f	перевод
637	875	2023-07-04	14700	t	СБП
638	137	2023-08-15	82400	t	карта
639	663	2023-12-19	9000	t	карта
640	230	2023-12-02	10700	t	карта
641	750	2023-10-30	9700	t	СБП
642	684	2023-08-23	40800	f	карта
643	756	2023-01-12	74200	t	карта
644	435	2023-05-30	41700	f	карта
645	677	2023-08-08	80700	t	наличные
646	122	2023-04-26	22100	t	наличные
647	350	2023-07-05	66400	t	СБП
648	333	2023-10-08	33500	t	карта
649	413	2023-03-17	93500	t	наличные
650	518	2023-01-23	11900	f	карта
651	184	2023-09-08	96600	t	СБП
652	275	2023-04-15	22000	t	наличные
653	287	2023-05-09	78400	t	карта
654	323	2023-06-05	26800	t	наличные
655	810	2023-10-12	2000	f	карта
656	492	2023-04-20	73200	t	карта
657	594	2023-03-06	73400	f	карта
658	184	2023-12-22	55900	f	карта
659	630	2023-06-12	50000	t	карта
660	321	2023-03-07	71700	t	карта
661	508	2023-01-16	27400	t	карта
662	37	2023-09-11	10200	t	СБП
663	96	2023-07-16	41900	t	карта
664	755	2023-06-22	2000	f	карта
665	484	2023-07-04	79000	t	карта
666	960	2023-03-02	12300	t	карта
667	64	2023-01-02	54100	t	карта
668	803	2023-01-31	51200	t	карта
669	743	2023-11-26	26600	f	карта
670	599	2023-12-28	47200	t	СБП
671	670	2023-12-29	2400	t	карта
672	948	2023-05-26	59800	t	карта
673	619	2023-03-15	78900	t	СБП
674	36	2023-09-11	66000	t	наличные
675	720	2023-02-10	46100	t	карта
676	384	2023-04-03	78800	f	наличные
677	827	2023-01-02	75400	f	карта
678	956	2023-10-05	26100	t	карта
679	252	2023-12-21	78600	t	карта
680	706	2023-06-20	53000	t	карта
681	860	2023-11-06	19100	t	перевод
682	76	2023-11-01	97300	t	карта
683	471	2023-01-16	70100	t	карта
684	27	2023-09-17	68000	t	карта
685	716	2023-10-07	3200	t	наличные
686	862	2023-12-23	70200	t	СБП
687	660	2023-11-14	51700	t	карта
688	106	2023-01-17	48100	t	наличные
689	299	2023-09-11	79900	f	карта
690	208	2023-09-04	37000	t	наличные
691	69	2023-02-04	89600	t	наличные
692	361	2023-08-08	69100	t	карта
693	988	2023-12-26	69000	t	карта
694	179	2023-06-11	76600	t	карта
695	60	2023-06-05	51300	t	карта
696	893	2023-06-25	94500	t	карта
697	246	2023-07-17	11200	t	наличные
698	303	2023-05-16	15800	t	карта
699	564	2023-04-26	85500	t	карта
700	159	2023-08-25	49700	t	наличные
701	402	2023-12-18	1100	f	наличные
702	678	2023-11-23	5000	t	карта
703	566	2023-02-18	21000	t	карта
704	149	2023-10-31	52600	t	СБП
705	773	2023-12-22	53800	t	карта
706	500	2023-05-27	68900	t	наличные
707	712	2023-04-08	42000	t	наличные
708	942	2023-04-24	27100	t	наличные
709	751	2023-07-15	5900	f	карта
710	697	2023-05-20	22700	f	карта
711	144	2023-12-05	39400	t	карта
712	26	2023-02-14	34600	t	наличные
713	567	2023-03-30	41300	t	карта
714	75	2023-02-03	19300	t	карта
715	373	2023-03-23	99100	t	карта
716	290	2023-08-26	16500	f	карта
717	818	2023-09-14	3000	f	наличные
718	713	2023-11-04	72700	t	карта
719	677	2023-10-27	23500	t	наличные
720	628	2023-01-31	71600	t	карта
721	594	2023-07-28	56800	t	карта
722	497	2023-05-24	46500	t	наличные
723	110	2023-04-29	60000	t	наличные
724	280	2023-03-09	35900	t	криптовалюта
725	817	2023-10-02	53100	f	наличные
726	346	2023-05-29	32300	t	СБП
727	563	2023-05-20	63300	t	криптовалюта
728	49	2023-06-22	76300	f	карта
729	727	2023-07-05	42500	t	карта
730	92	2023-08-11	60800	f	карта
731	570	2023-02-16	47100	t	наличные
732	263	2023-10-18	19700	f	карта
733	51	2023-05-08	46600	t	карта
734	381	2023-06-08	600	t	СБП
735	252	2023-07-17	75100	f	карта
736	884	2023-05-01	34700	t	наличные
737	706	2023-10-13	48400	t	СБП
738	858	2023-08-18	49400	t	СБП
739	826	2023-02-01	23100	f	карта
740	197	2023-05-02	78600	f	карта
741	221	2023-08-24	82100	f	наличные
742	642	2023-05-05	9300	t	карта
743	620	2023-11-28	57900	t	карта
744	511	2023-11-15	79700	t	наличные
745	609	2023-09-12	1400	t	наличные
746	88	2023-11-24	52900	t	криптовалюта
747	955	2023-01-08	22400	t	наличные
748	860	2023-07-17	58000	t	наличные
749	689	2023-11-15	83200	t	перевод
750	338	2023-03-12	12000	f	карта
751	830	2023-06-28	9200	t	наличные
752	12	2023-11-04	22500	t	карта
753	134	2023-11-19	33300	t	СБП
754	87	2023-01-19	75400	t	карта
755	438	2023-02-24	64600	t	карта
756	870	2023-11-05	17500	t	карта
757	372	2023-04-07	43600	t	карта
758	623	2023-11-28	38800	t	наличные
759	581	2023-03-30	4800	t	карта
760	545	2023-10-20	61400	t	карта
761	760	2023-08-24	31800	t	карта
762	54	2023-12-10	36100	t	карта
763	676	2023-04-24	6800	t	СБП
764	630	2023-10-04	66600	t	наличные
765	866	2023-06-09	93000	t	перевод
766	258	2023-12-31	17800	t	карта
767	797	2023-12-01	89300	t	карта
768	514	2023-04-30	44000	t	СБП
769	398	2023-08-11	30000	t	наличные
770	501	2023-06-18	15300	t	карта
771	731	2023-01-11	74300	t	криптовалюта
772	589	2023-09-19	79600	t	карта
773	528	2023-11-27	51200	t	карта
774	256	2023-02-08	87400	f	карта
775	150	2023-07-08	49100	t	карта
776	224	2023-03-22	70800	t	наличные
777	177	2023-09-21	17600	t	карта
778	290	2023-07-15	49000	t	наличные
779	581	2023-11-12	67100	t	карта
780	417	2023-06-02	89400	t	криптовалюта
781	32	2023-07-21	69600	t	СБП
782	901	2023-05-20	94800	f	карта
783	726	2023-09-05	38900	t	карта
784	235	2023-02-15	18600	t	наличные
785	840	2023-02-26	92000	t	наличные
786	389	2023-08-06	44200	f	карта
787	183	2023-01-21	62700	t	наличные
788	907	2023-12-15	53800	t	карта
789	155	2023-06-01	65800	f	СБП
790	947	2023-04-30	83300	t	карта
791	868	2023-08-28	58500	t	карта
792	476	2023-06-15	32800	t	наличные
793	303	2023-09-13	63300	t	карта
794	573	2023-05-28	59700	t	карта
795	545	2023-12-23	40700	t	наличные
796	311	2023-07-26	67400	t	карта
797	523	2023-02-08	99200	t	карта
798	497	2023-09-13	65700	t	криптовалюта
799	942	2023-06-25	45100	t	карта
800	797	2023-02-15	33500	f	карта
801	742	2023-04-18	26000	t	карта
802	912	2023-01-22	63300	t	наличные
803	873	2023-04-16	31400	t	карта
804	296	2023-07-05	1600	t	карта
805	294	2023-11-26	19000	f	карта
806	469	2023-11-23	36700	f	карта
807	732	2023-09-27	18900	t	наличные
808	876	2023-03-04	63300	t	карта
809	784	2023-06-17	26400	t	карта
810	777	2023-11-09	69700	f	наличные
811	911	2023-06-30	90400	t	СБП
812	884	2023-12-23	40900	t	карта
813	17	2023-02-26	26100	f	карта
814	334	2023-09-24	92400	f	карта
815	61	2023-07-08	75900	t	карта
816	904	2023-02-24	61000	t	СБП
817	174	2023-02-22	23300	t	наличные
818	878	2023-11-23	64300	t	наличные
819	758	2023-05-28	41300	f	наличные
820	791	2023-12-27	49200	t	криптовалюта
821	803	2023-12-17	89300	t	карта
822	60	2023-10-13	14700	t	карта
823	695	2023-04-13	47900	t	наличные
824	563	2023-07-18	28300	t	карта
825	565	2023-02-23	39100	t	карта
826	235	2023-12-30	81700	t	карта
827	144	2023-06-18	22200	t	карта
828	148	2023-09-01	40300	t	СБП
829	882	2023-01-23	35600	f	карта
830	129	2023-01-12	3100	t	карта
831	535	2023-07-28	79900	f	карта
832	648	2023-10-25	32800	t	СБП
833	635	2023-04-23	67900	t	карта
834	517	2023-03-16	32600	t	карта
835	353	2023-04-19	15500	t	наличные
836	748	2023-06-28	54600	t	карта
837	779	2023-04-26	79900	t	карта
838	246	2023-11-09	58400	t	карта
839	373	2023-07-23	42300	t	карта
840	896	2023-10-17	23300	t	карта
841	598	2023-05-28	85700	t	карта
842	66	2023-10-22	84800	t	карта
843	811	2023-01-29	85700	t	карта
844	988	2023-11-09	43200	t	перевод
845	629	2023-07-16	37000	t	карта
846	239	2023-03-26	40800	t	наличные
847	793	2023-03-18	95800	t	СБП
848	34	2023-08-16	90400	t	карта
849	801	2023-10-21	73400	t	наличные
850	400	2023-02-20	27000	t	карта
851	282	2023-09-04	94400	t	карта
852	732	2023-09-11	40700	t	карта
853	813	2023-10-01	16500	t	СБП
854	911	2023-12-12	98600	t	карта
855	952	2023-10-13	82100	t	карта
856	195	2023-04-28	49100	t	карта
857	503	2023-12-07	63300	t	СБП
858	55	2023-11-01	34800	t	наличные
859	923	2023-07-12	92400	t	карта
860	757	2023-07-04	32900	f	карта
861	987	2023-03-23	94100	t	карта
862	822	2023-05-29	59000	t	карта
863	272	2023-01-25	73800	t	карта
864	978	2023-01-30	23900	t	карта
865	710	2023-08-15	8900	t	карта
866	525	2023-10-02	95600	t	СБП
867	64	2023-01-25	68500	t	карта
868	568	2023-02-14	87300	t	СБП
869	947	2023-01-17	86700	t	карта
870	491	2023-10-09	78600	t	карта
871	930	2023-09-04	75500	t	карта
872	276	2023-08-18	89100	t	СБП
873	152	2023-02-11	16200	f	карта
874	899	2023-09-26	72200	t	карта
875	944	2023-06-08	59400	f	карта
876	759	2023-08-10	5500	f	карта
877	17	2023-02-04	77700	t	карта
878	520	2023-05-30	33200	t	наличные
879	482	2023-10-08	79300	t	карта
880	323	2023-11-16	58200	t	карта
881	571	2023-07-22	98000	t	карта
882	924	2023-07-22	91800	t	карта
883	289	2023-09-06	8000	t	карта
884	879	2023-07-16	82200	f	наличные
885	103	2023-01-11	28400	t	наличные
886	981	2023-09-23	23800	t	наличные
887	632	2023-06-26	27100	t	наличные
888	888	2023-10-15	3000	f	карта
889	32	2023-08-30	94200	t	карта
890	195	2023-10-28	47700	t	наличные
891	419	2023-12-08	66300	t	наличные
892	506	2023-01-12	98300	t	карта
893	924	2023-09-30	96700	t	карта
894	235	2023-09-14	49400	f	СБП
895	118	2023-09-29	29000	f	карта
896	519	2023-03-21	23700	t	карта
897	651	2023-03-26	83300	f	наличные
898	43	2023-12-22	22300	t	наличные
899	640	2023-05-12	70000	t	карта
900	84	2023-05-06	25300	t	наличные
901	624	2023-10-27	61600	t	карта
902	409	2023-03-12	83300	t	СБП
903	513	2023-04-14	29300	t	карта
904	262	2023-04-10	9900	t	наличные
905	782	2023-03-11	35300	t	наличные
906	705	2023-09-11	79400	f	наличные
907	926	2023-10-27	56300	t	наличные
908	256	2023-07-31	69300	t	карта
909	600	2023-07-02	46300	t	карта
910	532	2023-04-05	25000	f	карта
911	629	2023-03-11	49800	t	карта
912	249	2023-10-05	21100	t	карта
913	534	2023-10-05	54500	t	наличные
914	843	2023-10-08	5000	t	карта
915	510	2023-06-26	22000	t	карта
916	529	2023-04-11	97900	t	карта
917	682	2023-02-14	35700	t	карта
918	206	2023-10-27	82300	t	карта
919	393	2023-11-05	11100	t	наличные
920	241	2023-07-21	91200	t	карта
921	797	2023-08-20	52100	t	наличные
922	92	2023-04-13	58600	t	наличные
923	512	2023-11-02	41700	t	карта
924	256	2023-10-21	83000	t	СБП
925	506	2023-11-13	20100	t	наличные
926	93	2023-08-02	8600	t	криптовалюта
927	821	2023-04-01	49700	t	карта
928	204	2023-07-13	50100	t	карта
929	226	2023-07-25	9500	t	карта
930	558	2023-11-22	59900	t	наличные
931	834	2023-07-05	21400	t	карта
932	697	2023-07-14	30400	t	криптовалюта
933	122	2023-10-06	57400	t	карта
934	658	2023-05-02	73400	t	карта
935	279	2023-11-06	64400	t	карта
936	671	2023-12-02	27600	t	наличные
937	920	2023-09-15	5400	t	наличные
938	383	2023-02-25	37500	t	карта
939	685	2023-03-12	68000	t	наличные
940	592	2023-01-04	7800	t	карта
941	976	2023-10-21	71900	t	карта
942	853	2023-02-26	66200	f	карта
943	663	2023-04-08	67000	t	карта
944	163	2023-09-16	90700	t	карта
945	661	2023-06-23	54400	t	карта
946	557	2023-01-12	10700	t	наличные
947	32	2023-06-14	62800	t	карта
948	395	2023-09-11	36300	t	карта
949	313	2023-05-31	89500	t	карта
950	834	2023-10-26	3900	t	карта
951	396	2023-04-18	46100	t	карта
952	145	2023-12-28	61800	t	СБП
953	226	2023-10-14	52200	t	карта
954	542	2023-05-31	90800	t	карта
955	773	2023-08-14	600	t	СБП
956	663	2023-10-11	40900	t	карта
957	293	2023-05-08	14800	t	карта
958	414	2023-10-21	61000	t	карта
959	794	2023-12-11	74200	f	СБП
960	253	2023-03-20	72200	t	наличные
961	674	2023-09-04	46600	t	карта
962	609	2023-05-09	54200	t	карта
963	872	2023-07-09	27700	t	карта
964	777	2023-01-06	81700	f	СБП
965	766	2023-04-10	26500	t	карта
966	444	2023-04-21	55400	t	карта
967	468	2023-07-23	69800	t	наличные
968	18	2023-08-23	50900	t	СБП
969	563	2023-10-18	33600	t	наличные
970	736	2023-01-30	58300	t	карта
971	650	2023-05-01	46200	t	карта
972	295	2023-04-01	68700	t	карта
973	399	2023-03-12	84300	t	наличные
974	35	2023-06-17	48100	f	наличные
975	900	2023-10-23	13600	t	наличные
976	239	2023-07-25	30000	t	карта
977	582	2023-10-23	58000	t	карта
978	426	2023-04-30	2900	t	карта
979	59	2023-04-16	45900	t	карта
980	841	2023-01-31	5900	t	наличные
981	943	2023-06-05	77800	t	карта
982	630	2023-10-22	17600	f	карта
983	654	2023-01-03	85400	t	карта
984	607	2023-01-27	95900	t	наличные
985	859	2023-04-13	66200	t	СБП
986	847	2023-09-18	35200	t	наличные
987	380	2023-07-05	26300	t	карта
988	733	2023-05-08	68200	t	карта
989	558	2023-05-30	8400	t	наличные
990	942	2023-11-15	2800	t	наличные
991	62	2023-12-17	29100	t	СБП
992	486	2023-10-23	31700	f	карта
993	823	2023-04-30	63000	f	карта
994	418	2023-07-03	10000	t	карта
995	540	2023-02-06	39700	f	карта
996	310	2023-03-31	47300	t	наличные
997	22	2023-10-15	2000	t	карта
998	420	2023-03-15	42500	f	СБП
999	477	2023-08-24	21800	t	карта
1000	741	2023-12-17	55000	t	карта
\.


                                                                                                                                                                                                                                                                       4918.dat                                                                                            0000600 0004000 0002000 00000240613 14771407746 0014306 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Царский Плаза	ул. Центральная, 85	Владивосток
2	Деловой Лодж Элит	наб. Центральная, 34	Краснодар
3	Лесная Курорт	пл. Горная, 100	Краснодар
4	Императорский Дом	пер. Горная, 81	Краснодар
5	Приморский Дом Резиденс	пер. Лесная, 54	Екатеринбург
6	Царский Лодж	пл. Горная, 17	Краснодар
7	Золотой Палас	пер. Курортная, 66	Владивосток
8	Исторический Отель	ул. Морская, 8	Екатеринбург
9	Деловой Лодж Элит	ул. Садовая, 56	Владивосток
10	Исторический Курорт	ул. Набережная, 1	Казань
11	Лесная Дворец	ул. Морская, 67	Новосибирск
12	Лесная Палас	ул. Набережная, 18	Владивосток
13	Царский Резорт Резиденс	ул. Парковая, 32	Москва
14	Императорский Палас	пр. Морская, 3	Казань
15	Исторический Дворец	ул. Речная, 20	Краснодар
16	Серебряный Дом	ул. Садовая, 92	Крым
17	Императорский Дом Де Люкс	пр. Горная, 5	Екатеринбург
18	Лесная Плаза	пр. Лесная, 95	Владивосток
19	Императорский Отель Резиденс	пр. Набережная, 89	Казань
20	Золотой Дворец	ул. Центральная, 41	Казань
21	Исторический Палас Премиум	пр. Лесная, 37	Сочи
22	Исторический Дворец	ул. Набережная, 33	Екатеринбург
23	Деловой Дворец	пер. Горная, 23	Казань
24	Императорский Дворец Элит	ул. Лесная, 50	Москва
25	Императорский Палас	пл. Речная, 32	Сочи
26	Исторический Дворец	пер. Горная, 64	Краснодар
27	Серебряный Дворец	пр. Набережная, 51	Новосибирск
28	Царский Отель Резиденс	ул. Парковая, 63	Владивосток
29	Лесная Плаза	пр. Речная, 84	Краснодар
30	Царский Плаза	ул. Морская, 24	Новосибирск
31	Серебряный Лодж	пл. Лесная, 3	Краснодар
32	Императорский Отель	пл. Главная, 90	Владивосток
33	Гранд Отель Де Люкс	ул. Центральная, 17	Москва
34	Гранд Отель	наб. Морская, 63	Новосибирск
35	Золотой Отель	ул. Парковая, 14	Краснодар
36	Золотой Резорт	пл. Набережная, 51	Краснодар
37	Деловой Отель	пр. Набережная, 50	Краснодар
38	Гранд Клуб Элит	пр. Горная, 55	Краснодар
39	Гранд Дом	наб. Лесная, 24	Новосибирск
40	Лесная Плаза	пр. Центральная, 69	Краснодар
41	Золотой Хаус Элит	пер. Парковая, 9	Калининград
42	Серебряный Хаус Премиум	пр. Набережная, 81	Санкт-Петербург
43	Лесная Лодж Элит	ул. Лесная, 87	Краснодар
44	Лесная Клуб	ул. Главная, 72	Новосибирск
45	Приморский Плаза	пер. Набережная, 91	Екатеринбург
46	Лесная Клуб	ул. Главная, 16	Москва
47	Гранд Клуб	наб. Центральная, 68	Казань
48	Деловой Отель Премиум	пр. Лесная, 21	Москва
49	Исторический Лодж Элит	пер. Речная, 25	Казань
50	Гранд Клуб	ул. Садовая, 11	Екатеринбург
51	Гранд Дом	пр. Главная, 93	Новосибирск
52	Деловой Курорт	ул. Горная, 83	Екатеринбург
53	Царский Дворец	пр. Горная, 60	Владивосток
54	Царский Курорт Де Люкс	пл. Курортная, 35	Калининград
55	Золотой Плаза	наб. Центральная, 93	Екатеринбург
56	Серебряный Клуб Резиденс	пер. Центральная, 43	Краснодар
57	Исторический Отель Премиум	ул. Садовая, 65	Санкт-Петербург
58	Лесная Лодж	ул. Набережная, 22	Калининград
59	Деловой Лодж	наб. Главная, 32	Калининград
60	Исторический Лодж Элит	ул. Речная, 76	Сочи
61	Исторический Дворец Премиум	ул. Морская, 4	Крым
62	Царский Палас	ул. Главная, 89	Владивосток
63	Деловой Клуб	наб. Садовая, 17	Санкт-Петербург
64	Серебряный Отель	ул. Садовая, 9	Калининград
65	Гранд Отель	пер. Центральная, 12	Крым
66	Исторический Дворец	ул. Парковая, 65	Краснодар
67	Лесная Лодж Резиденс	пр. Курортная, 16	Казань
68	Исторический Клуб Де Люкс	наб. Парковая, 63	Екатеринбург
69	Императорский Отель Де Люкс	ул. Главная, 91	Калининград
70	Золотой Резорт	наб. Центральная, 19	Екатеринбург
71	Царский Клуб Элит	пер. Главная, 97	Казань
72	Императорский Лодж	наб. Набережная, 36	Екатеринбург
73	Лесная Дворец Элит	ул. Садовая, 11	Калининград
74	Лесная Лодж Элит	ул. Садовая, 80	Сочи
75	Гранд Клуб Де Люкс	пер. Горная, 64	Санкт-Петербург
76	Царский Резорт	пл. Набережная, 84	Санкт-Петербург
77	Золотой Клуб	ул. Курортная, 34	Москва
78	Деловой Клуб	наб. Главная, 51	Сочи
79	Деловой Резорт	пер. Набережная, 74	Крым
80	Деловой Плаза	ул. Садовая, 12	Калининград
81	Деловой Хаус	ул. Садовая, 20	Сочи
82	Серебряный Отель	наб. Центральная, 8	Новосибирск
83	Гранд Клуб	наб. Парковая, 66	Краснодар
84	Лесная Резорт	ул. Центральная, 85	Казань
85	Лесная Резорт	ул. Садовая, 38	Сочи
86	Императорский Резорт Де Люкс	наб. Морская, 37	Крым
87	Приморский Резорт	пл. Парковая, 1	Новосибирск
88	Золотой Дворец Де Люкс	ул. Морская, 91	Краснодар
89	Царский Отель	ул. Курортная, 91	Екатеринбург
90	Императорский Палас	пл. Горная, 9	Новосибирск
91	Гранд Отель	ул. Парковая, 22	Новосибирск
92	Императорский Хаус Премиум	пр. Речная, 16	Краснодар
93	Золотой Лодж	наб. Садовая, 18	Сочи
94	Деловой Плаза Де Люкс	наб. Парковая, 53	Крым
95	Исторический Плаза	наб. Парковая, 70	Сочи
96	Императорский Плаза	пл. Морская, 53	Казань
97	Императорский Хаус	ул. Центральная, 69	Москва
98	Гранд Курорт Де Люкс	пер. Лесная, 86	Новосибирск
99	Серебряный Отель Резиденс	наб. Морская, 27	Владивосток
100	Царский Дворец	пл. Центральная, 13	Сочи
101	Царский Лодж Премиум	ул. Речная, 43	Екатеринбург
102	Приморский Отель Премиум	наб. Лесная, 63	Владивосток
103	Золотой Палас	пер. Горная, 7	Крым
104	Серебряный Резорт	ул. Курортная, 16	Казань
105	Приморский Палас	ул. Речная, 87	Казань
106	Гранд Резорт	ул. Садовая, 63	Сочи
107	Гранд Плаза Премиум	пл. Набережная, 75	Калининград
108	Исторический Резорт	ул. Парковая, 41	Москва
109	Лесная Лодж Премиум	пер. Набережная, 4	Санкт-Петербург
110	Деловой Хаус	пл. Садовая, 49	Крым
111	Гранд Курорт	пр. Набережная, 14	Крым
112	Царский Лодж	ул. Морская, 35	Москва
113	Гранд Хаус	пер. Главная, 2	Владивосток
114	Золотой Плаза Премиум	ул. Курортная, 26	Краснодар
115	Царский Дворец	наб. Садовая, 33	Краснодар
116	Деловой Клуб	пер. Центральная, 60	Казань
117	Лесная Курорт	пл. Центральная, 85	Краснодар
118	Деловой Плаза	пр. Горная, 50	Казань
119	Золотой Дом Премиум	ул. Лесная, 88	Москва
120	Царский Дворец Элит	пл. Лесная, 93	Казань
121	Деловой Отель Резиденс	пр. Набережная, 19	Краснодар
122	Исторический Хаус	ул. Главная, 74	Сочи
123	Царский Лодж Де Люкс	наб. Набережная, 29	Екатеринбург
124	Гранд Дворец Де Люкс	ул. Парковая, 16	Калининград
125	Золотой Курорт Резиденс	ул. Центральная, 25	Владивосток
126	Гранд Отель	ул. Речная, 8	Москва
127	Исторический Лодж	ул. Горная, 21	Санкт-Петербург
128	Лесная Резорт	наб. Главная, 42	Сочи
129	Гранд Палас Резиденс	пл. Речная, 72	Сочи
130	Деловой Хаус	пр. Парковая, 67	Краснодар
131	Серебряный Хаус	ул. Горная, 15	Краснодар
132	Приморский Лодж Премиум	наб. Центральная, 40	Санкт-Петербург
133	Царский Дом	ул. Лесная, 67	Калининград
134	Гранд Клуб	ул. Курортная, 19	Калининград
135	Лесная Дворец	пл. Курортная, 79	Москва
136	Исторический Палас Элит	ул. Морская, 56	Калининград
137	Золотой Резорт	ул. Центральная, 84	Казань
138	Деловой Хаус	ул. Курортная, 56	Санкт-Петербург
139	Лесная Хаус	ул. Садовая, 49	Сочи
140	Императорский Палас	пр. Морская, 86	Новосибирск
141	Гранд Дом	ул. Набережная, 93	Краснодар
142	Приморский Дом	ул. Горная, 77	Москва
284	Лесная Палас	ул. Морская, 59	Москва
143	Царский Лодж Премиум	ул. Главная, 88	Екатеринбург
144	Деловой Дом Премиум	ул. Горная, 75	Калининград
145	Императорский Лодж	пер. Парковая, 10	Екатеринбург
146	Царский Резорт Элит	ул. Набережная, 67	Краснодар
147	Царский Дом Резиденс	ул. Центральная, 86	Калининград
148	Приморский Дом	пер. Речная, 87	Калининград
149	Золотой Палас Элит	пр. Речная, 24	Калининград
150	Императорский Палас	пл. Набережная, 83	Владивосток
151	Гранд Курорт	пл. Садовая, 82	Казань
152	Золотой Хаус	ул. Речная, 57	Москва
153	Гранд Лодж	ул. Курортная, 42	Калининград
154	Царский Резорт Элит	пер. Лесная, 34	Сочи
155	Лесная Лодж Резиденс	пл. Курортная, 95	Крым
156	Серебряный Дворец Премиум	наб. Лесная, 48	Екатеринбург
157	Золотой Палас Премиум	пер. Набережная, 1	Калининград
158	Царский Отель Премиум	наб. Курортная, 86	Калининград
159	Деловой Дом Де Люкс	пер. Курортная, 29	Калининград
160	Золотой Резорт Де Люкс	пл. Набережная, 56	Екатеринбург
161	Исторический Плаза	пер. Центральная, 72	Казань
162	Царский Палас	пр. Садовая, 43	Новосибирск
163	Золотой Резорт Резиденс	ул. Садовая, 60	Казань
164	Исторический Резорт	ул. Садовая, 31	Владивосток
165	Приморский Резорт	пл. Главная, 52	Новосибирск
166	Деловой Дворец	пер. Парковая, 91	Санкт-Петербург
167	Исторический Плаза	ул. Горная, 37	Екатеринбург
168	Императорский Хаус Резиденс	пр. Горная, 45	Москва
169	Деловой Палас Резиденс	ул. Главная, 2	Санкт-Петербург
170	Царский Палас Элит	наб. Парковая, 64	Новосибирск
171	Гранд Хаус Элит	наб. Садовая, 95	Краснодар
172	Императорский Клуб	ул. Набережная, 97	Крым
173	Серебряный Дом	ул. Парковая, 66	Санкт-Петербург
174	Серебряный Резорт	ул. Центральная, 88	Крым
175	Исторический Отель Де Люкс	пер. Парковая, 54	Екатеринбург
176	Исторический Лодж	ул. Лесная, 11	Москва
177	Исторический Палас	пер. Морская, 68	Владивосток
178	Деловой Палас	ул. Садовая, 18	Казань
179	Императорский Резорт	ул. Речная, 84	Владивосток
180	Приморский Лодж	пр. Парковая, 76	Краснодар
181	Серебряный Палас	пер. Центральная, 94	Санкт-Петербург
182	Деловой Плаза	пл. Горная, 70	Краснодар
183	Исторический Плаза	пер. Курортная, 57	Новосибирск
184	Исторический Курорт	ул. Набережная, 58	Новосибирск
185	Серебряный Хаус Премиум	ул. Центральная, 65	Новосибирск
186	Лесная Курорт	пр. Набережная, 95	Краснодар
187	Лесная Отель Резиденс	пер. Морская, 40	Сочи
188	Гранд Дворец	пл. Курортная, 32	Крым
189	Лесная Дворец	наб. Парковая, 5	Сочи
190	Деловой Дом	ул. Садовая, 55	Калининград
191	Императорский Лодж	пл. Речная, 37	Калининград
192	Деловой Клуб	ул. Морская, 43	Крым
193	Деловой Хаус	ул. Горная, 69	Краснодар
194	Серебряный Отель	ул. Морская, 45	Москва
195	Царский Дворец	ул. Центральная, 40	Краснодар
196	Императорский Клуб	ул. Морская, 26	Владивосток
197	Исторический Резорт Премиум	пр. Набережная, 32	Краснодар
198	Гранд Хаус	ул. Горная, 83	Краснодар
199	Серебряный Резорт	ул. Морская, 61	Краснодар
200	Золотой Курорт	пл. Курортная, 43	Казань
201	Гранд Отель Премиум	пр. Главная, 100	Сочи
202	Царский Дом Де Люкс	ул. Морская, 58	Краснодар
203	Императорский Плаза Премиум	ул. Морская, 53	Владивосток
204	Императорский Дворец Премиум	ул. Главная, 30	Екатеринбург
205	Приморский Клуб	пер. Парковая, 74	Владивосток
206	Царский Отель Премиум	пл. Набережная, 49	Санкт-Петербург
207	Деловой Лодж	ул. Садовая, 61	Крым
208	Исторический Клуб	пер. Горная, 90	Екатеринбург
209	Исторический Дворец	ул. Речная, 52	Краснодар
210	Золотой Курорт	ул. Горная, 58	Москва
211	Деловой Дворец	ул. Парковая, 2	Владивосток
212	Деловой Дом	ул. Горная, 14	Калининград
213	Деловой Курорт Резиденс	пр. Садовая, 32	Крым
214	Лесная Палас	ул. Парковая, 15	Сочи
215	Гранд Отель Де Люкс	ул. Речная, 66	Москва
216	Приморский Резорт	ул. Центральная, 57	Новосибирск
217	Приморский Лодж	пл. Морская, 1	Сочи
218	Серебряный Отель	ул. Парковая, 10	Екатеринбург
219	Серебряный Лодж	ул. Главная, 43	Санкт-Петербург
220	Деловой Хаус	наб. Курортная, 54	Калининград
221	Лесная Отель	ул. Садовая, 98	Екатеринбург
222	Деловой Курорт	ул. Морская, 50	Краснодар
223	Серебряный Палас Де Люкс	пер. Садовая, 56	Казань
224	Гранд Клуб	ул. Центральная, 96	Калининград
225	Царский Дом	ул. Парковая, 20	Крым
226	Деловой Резорт	наб. Курортная, 95	Новосибирск
227	Деловой Клуб	ул. Горная, 52	Владивосток
228	Лесная Отель	пл. Центральная, 14	Калининград
229	Исторический Клуб	ул. Парковая, 26	Сочи
230	Гранд Клуб	пр. Морская, 12	Краснодар
231	Царский Курорт Элит	пр. Морская, 76	Казань
232	Исторический Курорт	пл. Главная, 61	Москва
233	Серебряный Резорт Элит	ул. Главная, 91	Владивосток
234	Гранд Хаус	наб. Курортная, 80	Сочи
235	Серебряный Резорт	ул. Лесная, 76	Краснодар
236	Гранд Резорт	ул. Набережная, 13	Екатеринбург
237	Лесная Плаза	ул. Лесная, 54	Екатеринбург
238	Деловой Клуб	пр. Садовая, 5	Москва
239	Императорский Палас	пер. Курортная, 19	Краснодар
240	Приморский Хаус	пер. Морская, 43	Калининград
241	Приморский Дворец Де Люкс	наб. Набережная, 58	Калининград
242	Императорский Плаза	пл. Курортная, 95	Москва
243	Деловой Лодж	пр. Лесная, 85	Владивосток
244	Царский Палас Премиум	пер. Набережная, 21	Краснодар
245	Лесная Дворец Резиденс	ул. Курортная, 96	Крым
246	Царский Дворец	ул. Главная, 100	Казань
247	Гранд Дом	ул. Лесная, 10	Владивосток
248	Царский Палас Элит	ул. Главная, 49	Владивосток
249	Гранд Клуб	ул. Центральная, 76	Крым
250	Исторический Дом	ул. Речная, 58	Владивосток
251	Лесная Клуб	ул. Морская, 63	Калининград
252	Золотой Лодж	ул. Морская, 8	Екатеринбург
253	Исторический Хаус	пр. Главная, 9	Крым
254	Царский Плаза	пер. Центральная, 42	Крым
255	Исторический Резорт	пр. Курортная, 40	Москва
256	Серебряный Дворец	ул. Курортная, 90	Калининград
257	Гранд Клуб Резиденс	ул. Лесная, 23	Санкт-Петербург
258	Серебряный Дворец	наб. Морская, 75	Екатеринбург
259	Серебряный Хаус	пер. Центральная, 82	Владивосток
260	Приморский Курорт Премиум	ул. Набережная, 88	Владивосток
261	Императорский Лодж	ул. Парковая, 24	Краснодар
262	Деловой Дом Резиденс	ул. Садовая, 4	Казань
263	Императорский Клуб Премиум	пер. Садовая, 27	Калининград
264	Лесная Хаус	ул. Центральная, 85	Новосибирск
265	Лесная Отель	ул. Речная, 15	Санкт-Петербург
266	Гранд Дворец	ул. Главная, 63	Новосибирск
267	Приморский Палас Резиденс	наб. Набережная, 93	Владивосток
268	Золотой Дворец	наб. Курортная, 67	Калининград
269	Исторический Дворец Резиденс	ул. Лесная, 71	Москва
270	Деловой Резорт	ул. Горная, 37	Москва
271	Лесная Курорт	пр. Набережная, 93	Новосибирск
272	Лесная Плаза Элит	ул. Центральная, 91	Казань
273	Приморский Лодж	пер. Садовая, 36	Москва
274	Золотой Палас Резиденс	ул. Набережная, 89	Владивосток
275	Исторический Курорт Премиум	ул. Морская, 71	Екатеринбург
276	Лесная Дом	пр. Парковая, 65	Новосибирск
277	Гранд Дом Резиденс	ул. Курортная, 66	Новосибирск
278	Императорский Хаус	пл. Садовая, 91	Сочи
279	Императорский Палас Резиденс	ул. Парковая, 14	Новосибирск
280	Императорский Плаза	пл. Центральная, 34	Казань
281	Серебряный Хаус	наб. Набережная, 97	Казань
282	Лесная Дом	пер. Морская, 33	Новосибирск
283	Гранд Клуб Резиденс	ул. Парковая, 38	Калининград
285	Императорский Резорт	пр. Курортная, 95	Новосибирск
286	Лесная Дворец	пр. Курортная, 41	Краснодар
287	Царский Плаза	ул. Центральная, 32	Сочи
288	Лесная Палас	пл. Садовая, 55	Новосибирск
289	Золотой Хаус	наб. Курортная, 98	Санкт-Петербург
290	Деловой Отель	пер. Парковая, 100	Сочи
291	Царский Отель	наб. Набережная, 68	Сочи
292	Лесная Дом	ул. Центральная, 90	Санкт-Петербург
293	Золотой Курорт Премиум	ул. Парковая, 39	Калининград
294	Гранд Клуб Де Люкс	ул. Морская, 46	Сочи
295	Лесная Дом	наб. Набережная, 9	Новосибирск
296	Серебряный Хаус	наб. Лесная, 65	Санкт-Петербург
297	Золотой Курорт	ул. Морская, 55	Сочи
298	Золотой Резорт	пер. Лесная, 82	Владивосток
299	Серебряный Дворец Премиум	ул. Парковая, 84	Крым
300	Серебряный Клуб	ул. Лесная, 37	Краснодар
301	Приморский Резорт	ул. Морская, 58	Краснодар
302	Исторический Резорт Де Люкс	наб. Горная, 80	Новосибирск
303	Исторический Отель Элит	ул. Набережная, 42	Краснодар
304	Серебряный Клуб Элит	пер. Главная, 25	Калининград
305	Лесная Курорт	ул. Лесная, 9	Калининград
306	Гранд Клуб	ул. Набережная, 68	Новосибирск
307	Серебряный Курорт	наб. Садовая, 27	Владивосток
308	Золотой Палас	ул. Речная, 48	Калининград
309	Царский Хаус	пл. Лесная, 14	Сочи
310	Царский Палас	пер. Центральная, 82	Екатеринбург
311	Деловой Плаза Де Люкс	ул. Горная, 6	Владивосток
312	Серебряный Резорт	ул. Садовая, 51	Владивосток
313	Серебряный Отель	пл. Речная, 84	Владивосток
314	Приморский Дворец Премиум	ул. Садовая, 94	Екатеринбург
315	Гранд Плаза	пр. Главная, 66	Калининград
316	Императорский Клуб	наб. Набережная, 11	Новосибирск
317	Приморский Резорт	ул. Главная, 44	Казань
318	Гранд Палас	пр. Садовая, 38	Сочи
319	Гранд Дворец	ул. Речная, 93	Казань
320	Гранд Лодж	ул. Садовая, 77	Краснодар
321	Приморский Палас Премиум	ул. Морская, 70	Москва
322	Царский Курорт	пр. Речная, 88	Москва
323	Гранд Резорт	ул. Речная, 66	Москва
324	Царский Дом	пер. Лесная, 27	Сочи
325	Исторический Лодж	ул. Парковая, 87	Крым
326	Золотой Хаус Резиденс	наб. Главная, 9	Владивосток
327	Приморский Дворец	пер. Речная, 56	Сочи
328	Золотой Курорт Премиум	ул. Набережная, 82	Новосибирск
329	Царский Плаза Резиденс	пл. Курортная, 97	Москва
330	Золотой Дом	наб. Речная, 26	Крым
331	Приморский Дом	наб. Парковая, 63	Крым
332	Серебряный Палас	пр. Морская, 93	Санкт-Петербург
333	Серебряный Курорт	пер. Парковая, 30	Екатеринбург
334	Деловой Дворец	ул. Речная, 35	Казань
335	Гранд Дворец Элит	ул. Морская, 16	Казань
336	Исторический Палас Премиум	ул. Центральная, 69	Калининград
337	Императорский Резорт	ул. Горная, 87	Владивосток
338	Царский Лодж	ул. Речная, 17	Крым
339	Царский Лодж	пер. Лесная, 68	Сочи
340	Царский Дом	пл. Парковая, 50	Калининград
341	Серебряный Плаза	пер. Главная, 46	Екатеринбург
342	Исторический Палас Резиденс	ул. Центральная, 72	Владивосток
343	Золотой Дворец Де Люкс	пр. Горная, 20	Краснодар
344	Приморский Лодж	пер. Набережная, 77	Новосибирск
345	Приморский Плаза Де Люкс	пр. Горная, 83	Владивосток
346	Золотой Плаза Премиум	наб. Морская, 25	Краснодар
347	Приморский Плаза Элит	пр. Морская, 88	Крым
348	Приморский Плаза	наб. Главная, 5	Сочи
349	Лесная Хаус	пер. Речная, 71	Краснодар
350	Золотой Отель	пл. Горная, 5	Новосибирск
351	Гранд Палас	ул. Лесная, 15	Екатеринбург
352	Лесная Резорт	пер. Главная, 41	Краснодар
353	Гранд Палас Де Люкс	пл. Морская, 63	Калининград
354	Гранд Дворец	ул. Морская, 87	Сочи
355	Гранд Лодж Премиум	ул. Морская, 52	Казань
356	Деловой Резорт	ул. Горная, 53	Краснодар
357	Гранд Курорт	ул. Садовая, 2	Краснодар
358	Императорский Палас	пл. Главная, 28	Сочи
359	Лесная Хаус	пер. Лесная, 40	Москва
360	Приморский Палас	ул. Горная, 24	Санкт-Петербург
361	Императорский Лодж	наб. Морская, 60	Казань
362	Золотой Лодж Резиденс	пер. Морская, 83	Владивосток
363	Исторический Хаус	ул. Набережная, 17	Санкт-Петербург
364	Гранд Лодж	пр. Парковая, 88	Москва
365	Золотой Хаус	ул. Речная, 92	Санкт-Петербург
366	Серебряный Дворец Де Люкс	ул. Морская, 23	Владивосток
367	Деловой Плаза	наб. Садовая, 31	Сочи
368	Приморский Дворец Резиденс	ул. Лесная, 47	Владивосток
369	Лесная Клуб Де Люкс	ул. Курортная, 47	Новосибирск
370	Серебряный Дворец	наб. Морская, 83	Владивосток
371	Серебряный Лодж	пер. Морская, 82	Санкт-Петербург
372	Царский Клуб Де Люкс	ул. Морская, 14	Екатеринбург
373	Императорский Плаза	пр. Речная, 63	Калининград
374	Приморский Дом	пр. Садовая, 92	Екатеринбург
375	Приморский Клуб	ул. Центральная, 45	Сочи
376	Гранд Хаус	пер. Курортная, 22	Крым
377	Царский Хаус Элит	ул. Центральная, 63	Сочи
378	Деловой Плаза	ул. Горная, 36	Екатеринбург
379	Исторический Отель	ул. Курортная, 85	Сочи
380	Серебряный Плаза Де Люкс	пер. Парковая, 34	Новосибирск
381	Лесная Лодж Резиденс	ул. Речная, 10	Калининград
382	Деловой Отель	ул. Курортная, 15	Казань
383	Приморский Хаус	пер. Морская, 49	Крым
384	Деловой Клуб	ул. Курортная, 71	Сочи
385	Исторический Хаус Резиденс	пр. Речная, 97	Москва
386	Гранд Резорт	ул. Главная, 3	Сочи
387	Деловой Клуб Премиум	пер. Садовая, 85	Калининград
388	Лесная Клуб Резиденс	ул. Центральная, 90	Новосибирск
389	Деловой Лодж	наб. Лесная, 21	Новосибирск
390	Царский Клуб Де Люкс	ул. Главная, 90	Москва
391	Императорский Курорт	ул. Центральная, 23	Екатеринбург
392	Императорский Дом	пл. Набережная, 87	Екатеринбург
393	Серебряный Лодж	наб. Горная, 74	Сочи
394	Деловой Курорт	ул. Парковая, 57	Владивосток
395	Деловой Курорт	ул. Курортная, 76	Москва
396	Царский Лодж	наб. Лесная, 27	Санкт-Петербург
397	Царский Курорт	ул. Горная, 74	Крым
398	Царский Отель	пер. Центральная, 49	Крым
399	Серебряный Хаус	пл. Курортная, 69	Сочи
400	Приморский Клуб	ул. Речная, 78	Екатеринбург
401	Царский Плаза	ул. Центральная, 88	Новосибирск
402	Исторический Палас	ул. Центральная, 12	Сочи
403	Деловой Курорт	ул. Главная, 79	Санкт-Петербург
404	Исторический Хаус Резиденс	пр. Парковая, 31	Санкт-Петербург
405	Лесная Хаус	ул. Курортная, 33	Екатеринбург
406	Гранд Дворец	пр. Морская, 66	Крым
407	Гранд Хаус	ул. Садовая, 88	Калининград
408	Царский Курорт	пр. Морская, 21	Казань
409	Царский Палас Премиум	ул. Речная, 36	Екатеринбург
410	Лесная Лодж Премиум	пер. Морская, 13	Крым
411	Золотой Курорт	ул. Морская, 62	Екатеринбург
412	Исторический Палас	ул. Парковая, 4	Крым
413	Гранд Палас Премиум	наб. Курортная, 66	Санкт-Петербург
414	Гранд Палас Премиум	наб. Набережная, 62	Казань
415	Лесная Отель	ул. Курортная, 60	Калининград
416	Императорский Дом Элит	пер. Горная, 62	Екатеринбург
417	Деловой Палас	ул. Морская, 87	Калининград
418	Приморский Хаус	наб. Горная, 39	Москва
419	Исторический Клуб	пер. Главная, 51	Краснодар
420	Гранд Дворец Де Люкс	наб. Набережная, 42	Санкт-Петербург
421	Лесная Клуб Премиум	ул. Морская, 13	Екатеринбург
422	Золотой Плаза	ул. Парковая, 80	Калининград
423	Лесная Клуб	ул. Центральная, 79	Санкт-Петербург
424	Исторический Дом	пл. Центральная, 14	Екатеринбург
425	Золотой Хаус	ул. Лесная, 91	Крым
426	Императорский Лодж	ул. Лесная, 81	Калининград
427	Серебряный Дворец Де Люкс	пл. Набережная, 55	Сочи
428	Золотой Отель Элит	ул. Речная, 95	Крым
429	Императорский Плаза	пер. Садовая, 55	Казань
430	Деловой Клуб	ул. Морская, 72	Казань
431	Исторический Плаза Де Люкс	пер. Лесная, 23	Новосибирск
432	Серебряный Лодж Премиум	пл. Речная, 50	Москва
433	Приморский Хаус	наб. Курортная, 89	Новосибирск
434	Исторический Дворец	пл. Горная, 78	Калининград
435	Царский Отель	ул. Садовая, 39	Новосибирск
436	Гранд Дом	ул. Курортная, 2	Сочи
437	Царский Лодж	пр. Речная, 9	Калининград
438	Серебряный Хаус Резиденс	ул. Набережная, 56	Сочи
439	Деловой Дом	пл. Морская, 11	Крым
440	Приморский Палас	пр. Набережная, 67	Сочи
441	Гранд Отель	пр. Садовая, 88	Санкт-Петербург
442	Лесная Курорт Резиденс	наб. Парковая, 99	Краснодар
443	Золотой Плаза	пер. Центральная, 90	Сочи
444	Императорский Резорт	пер. Садовая, 85	Казань
445	Гранд Клуб	пер. Набережная, 90	Казань
446	Царский Хаус	пр. Речная, 6	Казань
447	Царский Лодж Резиденс	ул. Садовая, 20	Сочи
448	Императорский Резорт Премиум	пл. Набережная, 5	Калининград
449	Серебряный Клуб Резиденс	ул. Лесная, 72	Казань
450	Царский Отель Резиденс	ул. Центральная, 12	Калининград
451	Деловой Курорт	пер. Речная, 51	Москва
452	Царский Хаус	ул. Центральная, 81	Краснодар
453	Серебряный Дом	ул. Горная, 22	Москва
454	Приморский Резорт	ул. Морская, 40	Москва
455	Царский Клуб	ул. Морская, 37	Крым
456	Серебряный Клуб	пр. Набережная, 49	Калининград
457	Золотой Курорт Резиденс	пер. Морская, 37	Казань
458	Императорский Хаус Резиденс	пер. Горная, 12	Новосибирск
459	Императорский Плаза	ул. Морская, 2	Крым
460	Деловой Лодж Премиум	наб. Садовая, 37	Краснодар
461	Золотой Клуб Резиденс	ул. Главная, 56	Краснодар
462	Исторический Палас	наб. Садовая, 12	Санкт-Петербург
463	Деловой Курорт Элит	ул. Набережная, 35	Владивосток
464	Деловой Резорт	пл. Горная, 38	Санкт-Петербург
465	Императорский Резорт	наб. Лесная, 24	Санкт-Петербург
466	Деловой Клуб	ул. Главная, 57	Краснодар
467	Золотой Клуб	наб. Морская, 90	Калининград
468	Серебряный Плаза	пр. Лесная, 84	Казань
469	Деловой Дом Резиденс	наб. Парковая, 85	Новосибирск
470	Исторический Лодж	ул. Центральная, 68	Санкт-Петербург
471	Лесная Отель	наб. Морская, 29	Сочи
472	Золотой Лодж Резиденс	ул. Горная, 86	Новосибирск
473	Лесная Дом	пр. Горная, 74	Владивосток
474	Гранд Курорт Де Люкс	пер. Главная, 15	Сочи
475	Золотой Хаус	ул. Морская, 3	Крым
476	Приморский Резорт Де Люкс	ул. Набережная, 74	Калининград
477	Деловой Отель Резиденс	пл. Горная, 82	Новосибирск
478	Серебряный Лодж	ул. Горная, 100	Казань
479	Золотой Резорт Премиум	ул. Речная, 11	Москва
480	Серебряный Клуб	пл. Горная, 26	Краснодар
481	Исторический Хаус	ул. Садовая, 80	Казань
482	Деловой Хаус	ул. Морская, 73	Екатеринбург
483	Царский Дом	пер. Набережная, 69	Санкт-Петербург
484	Деловой Лодж	ул. Курортная, 28	Краснодар
485	Исторический Отель	наб. Морская, 70	Краснодар
486	Лесная Хаус	ул. Набережная, 52	Казань
487	Приморский Клуб Резиденс	пл. Главная, 58	Владивосток
488	Царский Клуб Резиденс	ул. Парковая, 73	Владивосток
489	Лесная Резорт Элит	ул. Главная, 54	Екатеринбург
490	Исторический Хаус Премиум	ул. Морская, 43	Краснодар
491	Царский Лодж	наб. Речная, 94	Калининград
492	Золотой Клуб Премиум	ул. Парковая, 90	Казань
493	Золотой Хаус	ул. Центральная, 35	Новосибирск
494	Исторический Лодж Резиденс	пер. Садовая, 16	Сочи
495	Гранд Палас Де Люкс	пр. Набережная, 58	Санкт-Петербург
496	Лесная Дом	ул. Парковая, 24	Казань
497	Императорский Палас	пер. Курортная, 71	Казань
498	Приморский Дом	наб. Речная, 84	Санкт-Петербург
499	Приморский Дворец	ул. Главная, 35	Краснодар
500	Исторический Хаус Де Люкс	ул. Набережная, 68	Крым
501	Золотой Курорт Де Люкс	наб. Садовая, 1	Краснодар
502	Лесная Клуб Де Люкс	пл. Садовая, 84	Новосибирск
503	Деловой Палас Премиум	ул. Главная, 54	Москва
504	Императорский Курорт Резиденс	наб. Лесная, 66	Сочи
505	Царский Клуб Резиденс	ул. Лесная, 65	Сочи
506	Деловой Палас	наб. Морская, 53	Новосибирск
507	Царский Дворец	пер. Лесная, 89	Екатеринбург
508	Царский Плаза	пл. Парковая, 73	Калининград
509	Царский Курорт	ул. Речная, 11	Новосибирск
510	Лесная Дворец Премиум	ул. Набережная, 88	Новосибирск
511	Золотой Дом	пр. Лесная, 46	Екатеринбург
512	Серебряный Хаус	наб. Садовая, 17	Екатеринбург
513	Исторический Хаус Элит	ул. Лесная, 75	Крым
514	Золотой Дом	пер. Морская, 3	Краснодар
515	Царский Резорт	наб. Курортная, 67	Крым
516	Лесная Резорт	наб. Набережная, 25	Краснодар
517	Золотой Палас	ул. Речная, 55	Москва
518	Исторический Палас	пл. Центральная, 98	Санкт-Петербург
519	Гранд Лодж	ул. Лесная, 46	Екатеринбург
520	Золотой Курорт	ул. Речная, 29	Крым
521	Императорский Лодж	ул. Парковая, 81	Сочи
522	Лесная Хаус Резиденс	ул. Парковая, 90	Екатеринбург
523	Исторический Курорт Элит	пр. Речная, 60	Калининград
524	Приморский Плаза	ул. Парковая, 15	Москва
525	Императорский Курорт	ул. Главная, 78	Санкт-Петербург
526	Лесная Хаус Элит	пер. Набережная, 29	Калининград
527	Деловой Хаус	пер. Морская, 37	Казань
528	Императорский Дом	пер. Лесная, 38	Краснодар
529	Деловой Дворец	ул. Горная, 47	Крым
530	Исторический Хаус	ул. Главная, 81	Сочи
531	Деловой Лодж	пер. Речная, 89	Владивосток
532	Лесная Резорт	пр. Набережная, 31	Краснодар
533	Императорский Курорт	пер. Садовая, 64	Москва
534	Императорский Палас	ул. Главная, 7	Новосибирск
535	Приморский Палас	ул. Речная, 18	Крым
536	Исторический Дворец	пер. Горная, 90	Крым
537	Исторический Отель	пер. Горная, 13	Екатеринбург
538	Лесная Лодж	ул. Парковая, 89	Москва
539	Приморский Курорт	ул. Курортная, 18	Крым
540	Серебряный Отель	ул. Речная, 62	Калининград
541	Императорский Лодж Элит	наб. Парковая, 82	Краснодар
542	Императорский Палас Резиденс	пер. Курортная, 54	Крым
543	Императорский Палас Де Люкс	пер. Морская, 67	Владивосток
544	Серебряный Плаза Де Люкс	ул. Морская, 64	Новосибирск
545	Золотой Резорт	пр. Садовая, 16	Сочи
546	Царский Лодж Премиум	ул. Набережная, 88	Санкт-Петербург
547	Деловой Хаус	пл. Горная, 65	Крым
548	Золотой Курорт	пл. Лесная, 29	Казань
549	Приморский Резорт Премиум	пер. Лесная, 72	Владивосток
550	Лесная Дом Де Люкс	ул. Садовая, 40	Санкт-Петербург
551	Деловой Хаус	ул. Речная, 2	Сочи
552	Серебряный Курорт Премиум	пр. Горная, 46	Крым
553	Царский Лодж Де Люкс	пл. Набережная, 13	Новосибирск
554	Деловой Палас	пр. Садовая, 61	Сочи
555	Императорский Дворец	пр. Горная, 51	Екатеринбург
556	Деловой Курорт Премиум	ул. Горная, 21	Сочи
557	Лесная Дворец	пер. Садовая, 57	Новосибирск
558	Исторический Клуб	ул. Речная, 8	Владивосток
559	Гранд Хаус	пл. Морская, 56	Крым
560	Приморский Отель Де Люкс	ул. Речная, 50	Казань
561	Императорский Хаус	ул. Набережная, 83	Екатеринбург
562	Деловой Отель	пр. Речная, 41	Екатеринбург
563	Царский Дворец	ул. Центральная, 31	Краснодар
564	Деловой Отель	ул. Морская, 70	Крым
565	Деловой Палас	ул. Морская, 21	Новосибирск
566	Исторический Дом	ул. Горная, 90	Екатеринбург
567	Исторический Хаус	ул. Главная, 17	Санкт-Петербург
568	Золотой Резорт Элит	ул. Морская, 35	Калининград
569	Приморский Резорт	ул. Речная, 50	Калининград
570	Гранд Дворец	ул. Горная, 75	Владивосток
571	Деловой Курорт	ул. Лесная, 53	Краснодар
572	Приморский Отель	пр. Лесная, 72	Краснодар
573	Приморский Курорт	наб. Парковая, 58	Казань
574	Деловой Резорт Премиум	ул. Морская, 3	Краснодар
575	Серебряный Хаус	ул. Набережная, 76	Казань
576	Золотой Дом	ул. Горная, 82	Владивосток
577	Гранд Резорт	ул. Морская, 1	Калининград
578	Золотой Плаза	наб. Речная, 68	Казань
579	Императорский Дом	пр. Морская, 87	Казань
580	Серебряный Клуб Премиум	пер. Морская, 91	Екатеринбург
581	Царский Палас	пр. Лесная, 82	Екатеринбург
582	Исторический Клуб	пер. Горная, 84	Калининград
583	Серебряный Хаус Элит	ул. Речная, 36	Екатеринбург
584	Деловой Клуб	пл. Морская, 24	Москва
585	Царский Курорт	пер. Речная, 20	Москва
586	Царский Дворец	пер. Главная, 40	Новосибирск
587	Императорский Лодж	ул. Речная, 20	Краснодар
588	Приморский Дом	ул. Центральная, 37	Краснодар
589	Императорский Хаус Элит	пр. Набережная, 37	Владивосток
590	Серебряный Резорт	пр. Главная, 52	Екатеринбург
591	Золотой Палас	пл. Курортная, 92	Владивосток
592	Императорский Дворец	пер. Парковая, 63	Калининград
593	Серебряный Курорт	ул. Речная, 41	Казань
594	Гранд Отель	ул. Набережная, 79	Сочи
595	Золотой Лодж	ул. Парковая, 81	Владивосток
596	Царский Лодж	ул. Горная, 27	Москва
597	Приморский Палас	ул. Садовая, 90	Казань
598	Серебряный Плаза	пр. Лесная, 30	Санкт-Петербург
599	Гранд Лодж Резиденс	ул. Садовая, 24	Санкт-Петербург
600	Гранд Лодж Элит	ул. Горная, 88	Крым
601	Деловой Плаза Де Люкс	ул. Морская, 74	Москва
602	Гранд Лодж	наб. Набережная, 58	Крым
603	Лесная Клуб	ул. Главная, 42	Москва
604	Приморский Плаза	пр. Курортная, 64	Краснодар
605	Императорский Резорт	наб. Парковая, 18	Москва
606	Императорский Хаус	пр. Лесная, 3	Новосибирск
607	Приморский Клуб	ул. Набережная, 13	Калининград
608	Деловой Плаза	ул. Морская, 76	Новосибирск
609	Императорский Лодж	ул. Горная, 81	Калининград
610	Деловой Клуб	наб. Садовая, 39	Екатеринбург
611	Золотой Лодж	ул. Морская, 78	Санкт-Петербург
612	Царский Резорт	пр. Садовая, 89	Санкт-Петербург
613	Гранд Дом	наб. Садовая, 38	Москва
614	Императорский Курорт	пер. Горная, 25	Калининград
615	Лесная Палас Резиденс	наб. Центральная, 34	Владивосток
616	Гранд Отель	ул. Морская, 31	Краснодар
617	Гранд Резорт	ул. Курортная, 88	Санкт-Петербург
618	Императорский Курорт	ул. Горная, 48	Крым
619	Приморский Резорт Де Люкс	наб. Речная, 13	Сочи
620	Исторический Дворец	ул. Морская, 40	Краснодар
621	Деловой Палас	ул. Садовая, 90	Калининград
622	Лесная Плаза	пр. Лесная, 45	Сочи
623	Деловой Палас	ул. Речная, 90	Екатеринбург
624	Золотой Клуб Премиум	пр. Лесная, 17	Калининград
625	Серебряный Курорт	ул. Садовая, 50	Санкт-Петербург
626	Гранд Курорт Резиденс	пер. Главная, 91	Сочи
627	Серебряный Дом	ул. Главная, 37	Новосибирск
628	Серебряный Лодж Элит	пр. Лесная, 84	Крым
629	Золотой Хаус	ул. Речная, 52	Калининград
630	Гранд Дворец	ул. Центральная, 85	Новосибирск
631	Императорский Клуб	пер. Лесная, 41	Краснодар
632	Золотой Лодж Де Люкс	ул. Набережная, 95	Крым
633	Приморский Палас	пл. Набережная, 37	Калининград
634	Исторический Хаус	пр. Курортная, 56	Казань
635	Императорский Плаза	пр. Набережная, 34	Сочи
636	Серебряный Палас Резиденс	ул. Горная, 51	Калининград
637	Императорский Курорт	пер. Садовая, 55	Санкт-Петербург
638	Серебряный Курорт	пр. Лесная, 55	Калининград
639	Деловой Дворец	ул. Главная, 6	Казань
640	Исторический Резорт	ул. Набережная, 68	Сочи
641	Гранд Хаус Премиум	пл. Центральная, 21	Сочи
642	Царский Резорт	ул. Центральная, 84	Краснодар
643	Золотой Лодж Резиденс	ул. Лесная, 64	Новосибирск
644	Лесная Палас	пр. Парковая, 48	Санкт-Петербург
645	Лесная Дом	ул. Главная, 79	Крым
646	Царский Курорт Элит	наб. Горная, 6	Екатеринбург
647	Деловой Плаза	ул. Центральная, 21	Крым
648	Серебряный Отель	ул. Морская, 76	Краснодар
649	Исторический Лодж Де Люкс	ул. Речная, 40	Новосибирск
650	Гранд Дворец Элит	ул. Морская, 4	Сочи
651	Лесная Лодж	наб. Садовая, 17	Москва
652	Деловой Клуб	пл. Лесная, 28	Владивосток
653	Лесная Отель	ул. Курортная, 51	Крым
654	Исторический Курорт	ул. Морская, 67	Калининград
655	Серебряный Плаза	ул. Центральная, 10	Краснодар
656	Серебряный Палас	наб. Лесная, 25	Крым
657	Исторический Плаза Премиум	ул. Главная, 37	Владивосток
658	Императорский Плаза	наб. Центральная, 86	Екатеринбург
659	Лесная Плаза	наб. Главная, 48	Сочи
660	Гранд Клуб Элит	пер. Речная, 51	Екатеринбург
661	Золотой Лодж	ул. Набережная, 5	Москва
662	Серебряный Дворец	пер. Главная, 99	Крым
663	Императорский Плаза	ул. Главная, 86	Владивосток
664	Императорский Курорт	наб. Садовая, 27	Краснодар
665	Исторический Лодж Элит	наб. Главная, 52	Новосибирск
666	Золотой Резорт	пл. Речная, 35	Казань
667	Гранд Курорт	пр. Лесная, 68	Новосибирск
668	Золотой Дворец	наб. Парковая, 57	Калининград
669	Императорский Лодж Де Люкс	наб. Набережная, 74	Калининград
670	Царский Резорт	ул. Лесная, 84	Екатеринбург
671	Серебряный Палас Элит	ул. Садовая, 5	Новосибирск
672	Серебряный Дворец	ул. Парковая, 16	Калининград
673	Императорский Резорт Премиум	ул. Морская, 13	Москва
674	Серебряный Клуб	ул. Курортная, 1	Крым
675	Серебряный Лодж	ул. Речная, 32	Новосибирск
676	Царский Резорт	пер. Морская, 68	Калининград
677	Императорский Дом Де Люкс	пл. Морская, 16	Крым
678	Приморский Дом Премиум	ул. Морская, 30	Калининград
679	Императорский Отель Премиум	пр. Морская, 93	Екатеринбург
680	Гранд Дворец Премиум	ул. Горная, 26	Краснодар
681	Приморский Резорт	ул. Парковая, 39	Казань
682	Золотой Курорт	ул. Парковая, 26	Краснодар
683	Императорский Резорт	наб. Речная, 28	Санкт-Петербург
684	Исторический Дом	ул. Курортная, 62	Владивосток
685	Серебряный Клуб	пр. Горная, 28	Сочи
686	Золотой Хаус Премиум	наб. Садовая, 10	Москва
687	Лесная Лодж	наб. Набережная, 43	Екатеринбург
688	Деловой Хаус	ул. Лесная, 7	Краснодар
689	Деловой Палас Резиденс	ул. Горная, 56	Казань
690	Исторический Хаус	пер. Горная, 46	Москва
691	Лесная Лодж	пл. Центральная, 68	Крым
692	Деловой Резорт Де Люкс	ул. Морская, 59	Владивосток
693	Деловой Дом Резиденс	ул. Садовая, 29	Владивосток
694	Деловой Резорт	пл. Речная, 41	Санкт-Петербург
695	Исторический Клуб Элит	пр. Лесная, 69	Москва
696	Лесная Курорт Элит	пл. Морская, 52	Новосибирск
697	Императорский Палас	пер. Центральная, 47	Краснодар
698	Деловой Курорт	ул. Морская, 44	Калининград
699	Императорский Отель	ул. Набережная, 64	Краснодар
700	Серебряный Отель	пл. Главная, 53	Крым
701	Золотой Дворец	ул. Набережная, 25	Москва
702	Приморский Клуб Премиум	ул. Главная, 28	Новосибирск
703	Серебряный Дом	ул. Лесная, 49	Владивосток
704	Лесная Курорт Премиум	наб. Горная, 53	Крым
705	Гранд Лодж	пр. Садовая, 8	Краснодар
706	Приморский Клуб Резиденс	наб. Парковая, 37	Сочи
707	Царский Хаус	пер. Лесная, 51	Краснодар
708	Приморский Резорт	пер. Речная, 18	Крым
709	Царский Резорт	пл. Главная, 61	Казань
710	Царский Клуб Премиум	пр. Центральная, 45	Казань
711	Деловой Дворец	пл. Набережная, 38	Владивосток
712	Лесная Клуб	ул. Парковая, 19	Владивосток
713	Лесная Плаза	пр. Морская, 62	Владивосток
714	Императорский Отель	ул. Горная, 64	Сочи
715	Деловой Хаус	пл. Лесная, 89	Сочи
716	Золотой Резорт	пер. Парковая, 19	Санкт-Петербург
717	Гранд Палас Элит	ул. Садовая, 53	Екатеринбург
718	Лесная Лодж	пл. Лесная, 69	Санкт-Петербург
719	Лесная Палас	наб. Лесная, 75	Санкт-Петербург
720	Гранд Палас	ул. Садовая, 5	Калининград
721	Приморский Хаус	пер. Лесная, 48	Владивосток
722	Императорский Клуб Премиум	наб. Лесная, 52	Новосибирск
723	Лесная Плаза	наб. Набережная, 38	Сочи
724	Лесная Курорт	наб. Морская, 59	Сочи
725	Лесная Лодж Де Люкс	ул. Набережная, 86	Крым
726	Гранд Лодж	наб. Курортная, 18	Краснодар
727	Лесная Клуб	ул. Морская, 19	Санкт-Петербург
728	Золотой Отель	ул. Лесная, 48	Сочи
729	Серебряный Дом Премиум	пр. Парковая, 70	Санкт-Петербург
730	Исторический Клуб	ул. Набережная, 62	Крым
731	Исторический Курорт	пер. Лесная, 85	Калининград
732	Гранд Лодж Премиум	наб. Парковая, 26	Краснодар
733	Императорский Клуб	ул. Главная, 30	Краснодар
734	Приморский Дворец	пер. Курортная, 61	Краснодар
735	Золотой Дворец Де Люкс	пр. Набережная, 60	Краснодар
736	Серебряный Отель	ул. Парковая, 29	Калининград
737	Приморский Курорт	ул. Набережная, 72	Владивосток
738	Императорский Лодж Де Люкс	пер. Курортная, 89	Казань
739	Исторический Резорт	ул. Горная, 55	Калининград
740	Приморский Дворец	ул. Садовая, 63	Москва
741	Гранд Плаза	пер. Парковая, 44	Сочи
742	Лесная Отель	ул. Садовая, 23	Калининград
743	Гранд Курорт	ул. Садовая, 82	Екатеринбург
744	Царский Хаус Резиденс	пер. Курортная, 37	Краснодар
745	Царский Резорт	ул. Парковая, 41	Владивосток
746	Золотой Дом	наб. Центральная, 27	Казань
747	Лесная Резорт	пл. Горная, 41	Новосибирск
748	Лесная Резорт Премиум	наб. Набережная, 84	Екатеринбург
749	Исторический Курорт	ул. Речная, 10	Екатеринбург
750	Царский Плаза	наб. Центральная, 16	Новосибирск
751	Императорский Дом	пр. Горная, 71	Крым
752	Серебряный Отель	ул. Лесная, 35	Казань
753	Приморский Хаус	ул. Лесная, 66	Владивосток
754	Лесная Палас Резиденс	пл. Центральная, 15	Крым
755	Исторический Плаза	ул. Центральная, 92	Крым
756	Гранд Дом	ул. Речная, 46	Санкт-Петербург
757	Царский Курорт	ул. Садовая, 79	Москва
758	Царский Резорт	ул. Набережная, 13	Владивосток
759	Гранд Курорт	ул. Курортная, 85	Москва
760	Серебряный Курорт Элит	пл. Горная, 22	Казань
761	Царский Отель	пер. Лесная, 100	Екатеринбург
762	Гранд Резорт	ул. Речная, 12	Сочи
763	Деловой Дворец	пер. Главная, 71	Владивосток
764	Приморский Резорт	наб. Речная, 42	Сочи
765	Серебряный Плаза	наб. Центральная, 40	Екатеринбург
766	Золотой Отель Премиум	ул. Речная, 51	Крым
767	Гранд Палас Элит	ул. Садовая, 51	Новосибирск
768	Императорский Палас	ул. Речная, 90	Санкт-Петербург
769	Деловой Дворец	ул. Лесная, 18	Калининград
770	Деловой Резорт	пер. Набережная, 17	Крым
771	Серебряный Отель	наб. Набережная, 18	Новосибирск
772	Серебряный Дом Элит	ул. Лесная, 48	Москва
773	Золотой Лодж	ул. Курортная, 91	Москва
774	Царский Хаус Элит	ул. Речная, 52	Санкт-Петербург
775	Серебряный Палас	ул. Курортная, 60	Екатеринбург
776	Императорский Дом	ул. Садовая, 5	Новосибирск
777	Исторический Дворец	пл. Набережная, 67	Казань
778	Гранд Резорт Резиденс	ул. Горная, 48	Крым
779	Серебряный Плаза	пер. Главная, 61	Краснодар
780	Серебряный Курорт Премиум	наб. Набережная, 90	Казань
781	Лесная Дом	пер. Парковая, 38	Москва
782	Лесная Клуб	пр. Центральная, 88	Владивосток
783	Золотой Дом Де Люкс	ул. Лесная, 61	Краснодар
784	Гранд Дом	ул. Центральная, 74	Владивосток
785	Царский Хаус	ул. Набережная, 72	Новосибирск
786	Золотой Курорт	пр. Морская, 59	Краснодар
787	Золотой Курорт	ул. Центральная, 49	Казань
788	Исторический Дворец	пл. Лесная, 68	Крым
789	Приморский Дом Де Люкс	пер. Речная, 12	Сочи
790	Царский Хаус Де Люкс	наб. Лесная, 30	Владивосток
791	Императорский Лодж	ул. Набережная, 57	Калининград
792	Приморский Отель	наб. Набережная, 61	Санкт-Петербург
793	Лесная Хаус	пер. Набережная, 74	Крым
794	Гранд Плаза Резиденс	пер. Лесная, 17	Екатеринбург
795	Императорский Курорт	наб. Горная, 39	Новосибирск
796	Золотой Лодж	пер. Лесная, 89	Калининград
797	Императорский Дом	ул. Морская, 67	Сочи
798	Золотой Резорт	наб. Главная, 78	Краснодар
799	Императорский Дворец	наб. Морская, 21	Владивосток
800	Императорский Плаза	ул. Парковая, 48	Екатеринбург
801	Деловой Лодж	наб. Центральная, 2	Владивосток
802	Гранд Отель	пл. Центральная, 18	Калининград
803	Деловой Дом Премиум	ул. Парковая, 4	Крым
804	Исторический Клуб	ул. Садовая, 92	Крым
805	Царский Палас	ул. Лесная, 31	Калининград
806	Серебряный Курорт	наб. Речная, 60	Москва
807	Серебряный Дворец Де Люкс	ул. Речная, 60	Сочи
808	Приморский Плаза	ул. Главная, 38	Москва
809	Приморский Палас	ул. Садовая, 26	Краснодар
810	Золотой Отель	пер. Набережная, 87	Калининград
811	Исторический Курорт	ул. Речная, 42	Краснодар
812	Приморский Резорт Элит	наб. Курортная, 7	Казань
813	Лесная Клуб	пр. Центральная, 94	Казань
814	Императорский Хаус Элит	пер. Набережная, 37	Сочи
815	Исторический Резорт Премиум	пер. Главная, 89	Владивосток
816	Деловой Лодж	наб. Курортная, 20	Владивосток
817	Императорский Плаза	ул. Морская, 52	Крым
818	Приморский Резорт Премиум	пер. Речная, 32	Санкт-Петербург
819	Приморский Резорт Элит	ул. Парковая, 93	Крым
820	Гранд Курорт Элит	ул. Курортная, 3	Екатеринбург
821	Золотой Курорт	ул. Главная, 89	Калининград
822	Приморский Дом	ул. Курортная, 77	Калининград
823	Лесная Плаза	пр. Речная, 70	Москва
824	Царский Лодж	пл. Парковая, 52	Крым
825	Императорский Дворец	ул. Парковая, 82	Москва
826	Приморский Курорт Де Люкс	ул. Парковая, 4	Москва
827	Гранд Курорт	ул. Морская, 24	Казань
828	Императорский Клуб Премиум	ул. Центральная, 73	Крым
829	Исторический Резорт Элит	ул. Речная, 53	Екатеринбург
830	Гранд Плаза	ул. Садовая, 72	Краснодар
831	Серебряный Отель	пл. Центральная, 26	Краснодар
832	Приморский Лодж Резиденс	наб. Парковая, 7	Калининград
833	Приморский Курорт	пл. Лесная, 87	Калининград
834	Золотой Отель	ул. Курортная, 58	Екатеринбург
835	Гранд Палас	пл. Центральная, 39	Крым
836	Серебряный Лодж	ул. Главная, 79	Владивосток
837	Гранд Отель	пер. Горная, 45	Москва
838	Деловой Курорт	пл. Главная, 86	Екатеринбург
839	Приморский Дворец	пер. Лесная, 11	Сочи
840	Лесная Палас	наб. Парковая, 61	Новосибирск
841	Царский Курорт	наб. Набережная, 3	Екатеринбург
842	Приморский Хаус Резиденс	ул. Набережная, 29	Владивосток
843	Царский Хаус	ул. Горная, 15	Санкт-Петербург
844	Приморский Хаус Резиденс	пер. Курортная, 94	Крым
845	Серебряный Хаус Де Люкс	пл. Речная, 62	Краснодар
846	Серебряный Дворец Де Люкс	ул. Речная, 92	Екатеринбург
847	Деловой Курорт	ул. Речная, 3	Крым
848	Приморский Отель	пр. Морская, 5	Санкт-Петербург
849	Царский Лодж	ул. Курортная, 21	Санкт-Петербург
850	Гранд Клуб Премиум	ул. Садовая, 92	Санкт-Петербург
851	Серебряный Хаус	наб. Главная, 86	Краснодар
852	Золотой Хаус	пер. Центральная, 58	Владивосток
853	Исторический Резорт	ул. Лесная, 6	Сочи
854	Исторический Курорт	ул. Садовая, 39	Санкт-Петербург
855	Исторический Резорт	ул. Центральная, 19	Калининград
856	Царский Плаза Резиденс	ул. Курортная, 39	Калининград
857	Золотой Палас	пр. Морская, 4	Сочи
858	Серебряный Лодж Премиум	пр. Морская, 7	Москва
859	Лесная Хаус	пл. Курортная, 52	Сочи
860	Императорский Курорт Де Люкс	ул. Главная, 24	Сочи
861	Деловой Хаус	пер. Главная, 33	Сочи
862	Императорский Курорт Резиденс	наб. Центральная, 81	Новосибирск
863	Исторический Отель Премиум	пр. Морская, 40	Сочи
864	Императорский Лодж	пер. Морская, 43	Новосибирск
865	Гранд Резорт	ул. Набережная, 77	Екатеринбург
866	Императорский Дворец	наб. Садовая, 78	Санкт-Петербург
867	Исторический Хаус	ул. Парковая, 10	Крым
868	Деловой Плаза Де Люкс	пер. Главная, 17	Крым
869	Серебряный Курорт	ул. Парковая, 77	Сочи
870	Гранд Дом	ул. Центральная, 42	Владивосток
871	Золотой Дворец Элит	пер. Парковая, 78	Крым
872	Императорский Лодж	ул. Главная, 42	Краснодар
873	Серебряный Дворец Премиум	пл. Речная, 22	Новосибирск
874	Деловой Дом Элит	пл. Центральная, 72	Москва
875	Лесная Палас	пр. Лесная, 30	Новосибирск
876	Серебряный Лодж	ул. Центральная, 26	Москва
877	Серебряный Хаус	пл. Главная, 62	Казань
878	Деловой Резорт Премиум	пер. Набережная, 2	Новосибирск
879	Серебряный Резорт	ул. Набережная, 39	Крым
880	Серебряный Дворец Де Люкс	пер. Речная, 26	Калининград
881	Императорский Лодж Резиденс	наб. Садовая, 35	Краснодар
882	Исторический Курорт	ул. Морская, 95	Казань
883	Золотой Лодж	ул. Садовая, 69	Казань
884	Деловой Клуб	ул. Садовая, 89	Новосибирск
885	Гранд Плаза Премиум	ул. Садовая, 26	Владивосток
886	Императорский Хаус Элит	ул. Курортная, 61	Крым
887	Императорский Хаус	ул. Морская, 85	Санкт-Петербург
888	Лесная Лодж	пр. Лесная, 56	Крым
889	Царский Лодж	ул. Садовая, 24	Калининград
890	Гранд Лодж	ул. Парковая, 51	Владивосток
891	Деловой Палас	ул. Курортная, 39	Крым
892	Царский Курорт	наб. Лесная, 15	Сочи
893	Императорский Клуб	ул. Лесная, 83	Казань
894	Исторический Лодж Де Люкс	наб. Набережная, 39	Екатеринбург
895	Золотой Плаза Де Люкс	ул. Морская, 7	Санкт-Петербург
896	Исторический Хаус	ул. Главная, 34	Владивосток
897	Царский Плаза	ул. Набережная, 87	Казань
898	Гранд Клуб	ул. Садовая, 8	Владивосток
899	Царский Резорт Премиум	ул. Центральная, 14	Краснодар
900	Гранд Курорт	пл. Центральная, 24	Калининград
901	Гранд Хаус Премиум	ул. Морская, 47	Москва
902	Гранд Резорт	пр. Набережная, 81	Москва
903	Гранд Дворец Элит	ул. Курортная, 74	Санкт-Петербург
904	Лесная Лодж	ул. Центральная, 99	Сочи
905	Исторический Хаус Элит	наб. Главная, 53	Санкт-Петербург
906	Деловой Дворец	наб. Морская, 7	Москва
907	Серебряный Дом	ул. Лесная, 94	Москва
908	Исторический Отель	пр. Морская, 65	Казань
909	Императорский Хаус Де Люкс	пер. Лесная, 72	Калининград
910	Царский Лодж Премиум	пр. Курортная, 75	Калининград
911	Серебряный Отель	пр. Речная, 67	Крым
912	Царский Дворец Де Люкс	ул. Горная, 41	Москва
913	Серебряный Лодж Элит	пр. Парковая, 21	Санкт-Петербург
914	Гранд Курорт	пл. Главная, 99	Казань
915	Гранд Отель Элит	ул. Курортная, 69	Казань
916	Деловой Курорт	ул. Курортная, 8	Новосибирск
917	Царский Хаус	пл. Горная, 72	Новосибирск
918	Исторический Дворец	наб. Парковая, 100	Казань
919	Исторический Плаза	пр. Садовая, 50	Казань
920	Исторический Лодж	пр. Центральная, 82	Владивосток
921	Приморский Клуб	ул. Горная, 76	Сочи
922	Деловой Дворец	ул. Курортная, 59	Казань
923	Золотой Курорт	наб. Садовая, 90	Краснодар
924	Императорский Плаза	наб. Центральная, 12	Крым
925	Исторический Плаза	ул. Парковая, 4	Крым
926	Лесная Плаза	ул. Главная, 41	Сочи
927	Гранд Курорт	пр. Центральная, 32	Москва
928	Лесная Палас Премиум	ул. Горная, 10	Санкт-Петербург
929	Лесная Дворец	ул. Центральная, 82	Владивосток
930	Гранд Клуб	ул. Центральная, 36	Новосибирск
931	Приморский Палас Элит	ул. Морская, 72	Казань
932	Деловой Курорт	пр. Горная, 6	Владивосток
933	Деловой Дворец	ул. Горная, 100	Новосибирск
934	Золотой Клуб	пр. Набережная, 31	Владивосток
935	Деловой Лодж Резиденс	ул. Горная, 43	Калининград
936	Лесная Палас Резиденс	пр. Лесная, 72	Калининград
937	Деловой Дом Премиум	ул. Морская, 58	Калининград
938	Приморский Резорт Резиденс	пл. Садовая, 7	Москва
939	Деловой Клуб	пл. Лесная, 80	Новосибирск
940	Приморский Плаза	ул. Лесная, 71	Владивосток
941	Деловой Плаза Резиденс	ул. Курортная, 84	Новосибирск
942	Гранд Курорт	пл. Лесная, 60	Калининград
943	Исторический Палас	ул. Горная, 15	Сочи
944	Серебряный Лодж	пер. Садовая, 97	Калининград
945	Деловой Плаза	пл. Парковая, 15	Москва
946	Приморский Палас	наб. Лесная, 65	Калининград
947	Исторический Плаза Де Люкс	ул. Парковая, 69	Владивосток
948	Приморский Курорт	пр. Садовая, 57	Москва
949	Императорский Резорт	ул. Садовая, 24	Краснодар
950	Гранд Хаус	наб. Центральная, 4	Новосибирск
951	Приморский Курорт	пл. Курортная, 83	Владивосток
952	Императорский Палас	пер. Речная, 30	Краснодар
953	Деловой Плаза Резиденс	ул. Лесная, 82	Санкт-Петербург
954	Исторический Плаза	наб. Горная, 96	Калининград
955	Деловой Курорт	ул. Курортная, 46	Екатеринбург
956	Гранд Дворец	пл. Горная, 37	Санкт-Петербург
957	Приморский Хаус Премиум	пер. Горная, 23	Казань
958	Серебряный Дворец	ул. Парковая, 63	Екатеринбург
959	Лесная Плаза	наб. Морская, 34	Казань
960	Царский Палас	наб. Курортная, 57	Екатеринбург
961	Гранд Дом Элит	ул. Горная, 56	Екатеринбург
962	Гранд Палас	пер. Курортная, 50	Сочи
963	Императорский Дворец Резиденс	пер. Речная, 100	Санкт-Петербург
964	Лесная Дом	пр. Горная, 79	Москва
965	Лесная Дом Резиденс	ул. Морская, 62	Новосибирск
966	Царский Дворец	ул. Центральная, 56	Сочи
967	Деловой Отель	ул. Горная, 12	Казань
968	Гранд Курорт	ул. Центральная, 48	Сочи
969	Гранд Курорт Резиденс	пер. Лесная, 36	Крым
970	Исторический Лодж Премиум	пр. Главная, 29	Казань
971	Золотой Плаза Премиум	ул. Парковая, 49	Новосибирск
972	Золотой Резорт	пер. Парковая, 60	Казань
973	Серебряный Дворец	пр. Речная, 17	Сочи
974	Серебряный Отель	наб. Горная, 88	Екатеринбург
975	Царский Отель	наб. Морская, 80	Казань
976	Императорский Плаза	ул. Набережная, 70	Калининград
977	Исторический Плаза	ул. Главная, 8	Екатеринбург
978	Лесная Дворец	пл. Главная, 91	Санкт-Петербург
979	Гранд Резорт	ул. Главная, 44	Краснодар
980	Императорский Дом Элит	ул. Курортная, 65	Екатеринбург
981	Серебряный Палас	пер. Парковая, 15	Калининград
982	Лесная Хаус Премиум	ул. Главная, 10	Новосибирск
983	Лесная Резорт Резиденс	пл. Главная, 85	Казань
984	Золотой Плаза Де Люкс	пер. Курортная, 28	Екатеринбург
985	Серебряный Лодж	ул. Главная, 42	Сочи
986	Императорский Лодж	ул. Парковая, 56	Екатеринбург
987	Золотой Дом Элит	наб. Набережная, 86	Казань
988	Царский Палас	наб. Центральная, 2	Санкт-Петербург
989	Приморский Лодж	ул. Курортная, 6	Екатеринбург
990	Царский Дом	ул. Речная, 60	Краснодар
991	Серебряный Курорт	пер. Набережная, 81	Екатеринбург
992	Императорский Курорт Резиденс	ул. Главная, 35	Калининград
993	Серебряный Дворец	ул. Центральная, 65	Крым
994	Золотой Лодж	пл. Морская, 36	Крым
995	Исторический Курорт	ул. Морская, 22	Новосибирск
996	Лесная Дом	пер. Морская, 61	Казань
997	Гранд Плаза	пл. Парковая, 82	Крым
998	Серебряный Дворец	пр. Курортная, 50	Крым
999	Гранд Клуб	ул. Главная, 89	Казань
1000	Серебряный Дом Премиум	пр. Морская, 44	Сочи
\.


                                                                                                                     4929.dat                                                                                            0000600 0004000 0002000 00000001030 14771407746 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2518 365664	Кузнецов Алексей Петрович	г. Екатеринбург, ул. Гагарина, 47	1980-09-04
4487 223473	Петров Андрей Алексеевич	г. Санкт-Петербург, ул. Советская, 86	1968-03-22
4870 936719	Сидоров Андрей Петрович	г. Санкт-Петербург, ул. Гагарина, 58	1972-11-11
7005 217801	Кузнецов Алексей Сергеевич	г. Санкт-Петербург, ул. Советская, 62	2005-06-27
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        4926.dat                                                                                            0000600 0004000 0002000 00000223556 14771407746 0014314 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Петров Максим	+79674698215	петров.мак@yandex.ru
2	Попов Максим	+79424967858	попов.м@example.com
3	Иванов Александр	+79209046273	иванов_а@yandex.ru
4	Попов Александр	+79588604900	попов_а@yandex.ru
5	Сидоров Максим	+79685964260	сидоровмак@hotmail.com
6	Попов Андрей	+79431279712	попован@hotmail.com
7	Сидоров Андрей	+79724557967	сидоров.анд@gmail.com
8	Кузнецова Ольга	+79924683088	кузнецова_ол@example.com
9	Смирнов Сергей	+79894985802	смирновс@hotmail.com
10	Петров Александр	+79228547584	петровал@yandex.ru
11	Иванова Анна	+79934466003	иванова_анн@gmail.com
12	Сидорова Ольга	+79671968939	сидорова.оль@yandex.ru
13	Петрова Наталья	+79735094536	петрова.н@yandex.ru
14	Васильева Мария	+79775845194	васильевам@mail.ru
15	Петров Александр	+79633956682	петровал@yandex.ru
16	Иванов Алексей	+79867665032	ивановале@mail.ru
17	Иванов Алексей	+79993095218	иванов_ал@mail.ru
18	Попова Наталья	+79852431841	попова.н@example.com
19	Кузнецов Андрей	+79108304810	кузнецов.а@example.com
20	Петров Сергей	+79952801946	петровс@example.com
21	Петрова Наталья	+79453756135	петрова_н@mail.ru
22	Петрова Елена	+79757180461	петрова.ел@hotmail.com
23	Смирнов Александр	+79462354422	смирнов.а@yandex.ru
24	Попова Анна	+79908936518	попова.анн@gmail.com
25	Иванов Максим	+79877249853	иванов.мак@yandex.ru
26	Сидоров Александр	+79843351619	сидоровале@gmail.com
27	Смирнов Андрей	+79219681729	смирнов.анд@mail.ru
28	Петрова Анна	+79308628811	петрова.ан@mail.ru
29	Кузнецов Дмитрий	+79652173694	кузнецов_дми@mail.ru
30	Смирнов Алексей	+79231990983	смирнов_але@yandex.ru
31	Сидорова Ирина	+79918136100	сидорова.ири@gmail.com
32	Кузнецова Анна	+79682405541	кузнецова_анн@example.com
33	Попов Алексей	+79633101355	попов_але@gmail.com
34	Попова Елена	+79184326450	поповае@gmail.com
35	Смирнов Александр	+79156125727	смирнов_а@hotmail.com
36	Сидорова Ольга	+79629428194	сидорова.о@example.com
37	Смирнова Елена	+79805974855	смирнова_еле@gmail.com
38	Смирнов Сергей	+79384851629	смирнов.се@yandex.ru
39	Смирнов Александр	+79235207302	смирнова@mail.ru
40	Попов Сергей	+79731676635	попов.с@yandex.ru
41	Васильева Анна	+79785093532	васильева.ан@gmail.com
42	Смирнова Мария	+79521141754	смирнова.мар@hotmail.com
43	Петров Максим	+79509069237	петров.ма@example.com
44	Петрова Наталья	+79574621891	петрован@yandex.ru
45	Смирнова Наталья	+79105717855	смирнована@yandex.ru
46	Иванова Ольга	+79316478312	иванова_оль@hotmail.com
47	Кузнецов Андрей	+79994093305	кузнецов.а@hotmail.com
48	Кузнецов Сергей	+79966753466	кузнецов_сер@example.com
49	Попов Максим	+79591738559	попов.мак@example.com
50	Смирнова Анна	+79655003778	смирнова_а@hotmail.com
51	Попова Ирина	+79577627711	попова_ир@hotmail.com
52	Петров Максим	+79394972783	петров.ма@yandex.ru
53	Сидорова Ирина	+79199848488	сидорова.ири@yandex.ru
54	Васильева Мария	+79172637194	васильева.м@hotmail.com
55	Сидоров Александр	+79898834240	сидоров_але@mail.ru
56	Кузнецов Андрей	+79398083330	кузнецов_а@yandex.ru
57	Петрова Анна	+79845568498	петрова_а@hotmail.com
58	Иванова Ольга	+79835150308	иванова_о@example.com
59	Васильев Сергей	+79127117430	васильевс@example.com
60	Смирнов Алексей	+79424656606	смирновал@yandex.ru
61	Петрова Ирина	+79503309551	петроваи@gmail.com
62	Смирнова Мария	+79323615500	смирновамар@yandex.ru
63	Иванов Дмитрий	+79408367408	ивановдм@mail.ru
64	Сидорова Наталья	+79242236945	сидорована@mail.ru
65	Васильева Ирина	+79326373563	васильева_ир@gmail.com
66	Сидорова Елена	+79715845697	сидорова_ел@gmail.com
67	Кузнецова Ольга	+79128215346	кузнецова_оль@yandex.ru
68	Петров Дмитрий	+79981998451	петров.д@gmail.com
69	Васильева Елена	+79734550322	васильева.ел@mail.ru
70	Попов Максим	+79262684980	попов_ма@gmail.com
71	Иванова Ирина	+79893215951	иванова.ири@gmail.com
72	Васильева Наталья	+79408168644	васильева_н@example.com
73	Петров Андрей	+79282813779	петров_ан@yandex.ru
74	Кузнецов Максим	+79486389984	кузнецовмак@yandex.ru
75	Попова Наталья	+79242948721	попова_нат@yandex.ru
76	Попов Максим	+79486678257	поповм@mail.ru
77	Попов Сергей	+79609006257	попов.се@mail.ru
78	Сидорова Елена	+79826053451	сидорова.еле@hotmail.com
79	Иванов Дмитрий	+79422755602	ивановд@yandex.ru
80	Петров Дмитрий	+79172851769	петров_дми@mail.ru
81	Сидорова Ольга	+79544704509	сидорова_о@hotmail.com
82	Сидорова Анна	+79966918652	сидороваанн@yandex.ru
83	Иванов Алексей	+79906552814	иванов_а@yandex.ru
84	Кузнецов Алексей	+79446766468	кузнецовал@hotmail.com
85	Петрова Наталья	+79646753569	петрова_на@example.com
86	Петрова Мария	+79231932924	петровамар@gmail.com
87	Сидоров Дмитрий	+79667413434	сидоров_дми@example.com
88	Петрова Ольга	+79987886013	петрова_оль@example.com
89	Попова Мария	+79584022314	попова_м@example.com
90	Попова Анна	+79351544555	попова_ан@yandex.ru
91	Смирнов Сергей	+79388448857	смирновс@mail.ru
92	Сидорова Наталья	+79558449184	сидорована@mail.ru
93	Попова Ирина	+79627838655	попова_и@hotmail.com
94	Смирнова Ольга	+79885026314	смирновао@mail.ru
95	Попов Сергей	+79628557528	попов.се@gmail.com
96	Попова Мария	+79232134092	попова_м@hotmail.com
97	Попова Ирина	+79761962541	попова.ири@hotmail.com
98	Кузнецов Сергей	+79146221252	кузнецов.с@example.com
99	Васильев Дмитрий	+79541942900	васильевдм@mail.ru
100	Васильева Мария	+79302360004	васильева.мар@example.com
101	Попов Алексей	+79602660211	попов_а@mail.ru
102	Васильева Анна	+79123862135	васильева_анн@example.com
103	Попов Максим	+79528972610	попов_м@hotmail.com
104	Иванов Дмитрий	+79739025920	ивановдм@example.com
105	Попов Александр	+79757381955	попов.а@mail.ru
106	Смирнов Андрей	+79375677209	смирнов.анд@hotmail.com
107	Кузнецов Максим	+79181693975	кузнецов_м@yandex.ru
108	Кузнецов Алексей	+79591842079	кузнецов.ал@mail.ru
109	Иванов Сергей	+79314274677	иванов.с@gmail.com
110	Кузнецов Александр	+79472271668	кузнецов_а@yandex.ru
111	Попов Андрей	+79899806688	попова@yandex.ru
112	Васильева Наталья	+79669457904	васильева.на@example.com
113	Попова Наталья	+79489375612	попова_нат@yandex.ru
114	Иванова Мария	+79866672555	иванова_м@example.com
115	Сидоров Андрей	+79336972502	сидорова@mail.ru
116	Кузнецов Максим	+79524662065	кузнецовма@mail.ru
117	Кузнецова Ольга	+79331675574	кузнецоваол@yandex.ru
118	Попов Андрей	+79596563643	попованд@example.com
119	Сидорова Елена	+79958796209	сидорова_ел@gmail.com
120	Сидорова Ольга	+79195509239	сидорова_о@hotmail.com
121	Сидорова Елена	+79647249672	сидорова_ел@gmail.com
122	Попов Сергей	+79264732636	поповс@yandex.ru
123	Кузнецова Мария	+79842422332	кузнецова_м@example.com
124	Сидорова Наталья	+79713550112	сидорова_н@gmail.com
125	Кузнецова Ирина	+79727816587	кузнецоваи@example.com
126	Кузнецов Максим	+79253485938	кузнецовмак@example.com
127	Иванова Наталья	+79304433074	иванова_н@example.com
128	Сидоров Алексей	+79958495012	сидоров.ал@gmail.com
129	Васильев Алексей	+79829605287	васильевал@yandex.ru
130	Смирнов Андрей	+79521561625	смирнова@yandex.ru
131	Смирнов Алексей	+79351920680	смирнов.а@example.com
132	Петров Дмитрий	+79209014870	петров.дми@yandex.ru
133	Кузнецов Сергей	+79502585779	кузнецов_с@example.com
134	Петрова Ольга	+79275551728	петрова.о@gmail.com
135	Кузнецов Андрей	+79536533981	кузнецов_ан@mail.ru
136	Смирнов Алексей	+79606403792	смирнов.але@hotmail.com
137	Попов Алексей	+79231154627	попов_але@hotmail.com
138	Кузнецова Ольга	+79348545491	кузнецова.ол@mail.ru
139	Кузнецова Ольга	+79732526060	кузнецова.о@mail.ru
140	Кузнецова Ольга	+79306149382	кузнецоваоль@yandex.ru
141	Васильева Мария	+79199621586	васильева_м@gmail.com
142	Васильев Сергей	+79238998953	васильевсер@hotmail.com
143	Сидорова Анна	+79184788513	сидорова.а@yandex.ru
144	Иванова Елена	+79805471470	ивановаел@yandex.ru
145	Смирнов Дмитрий	+79943634255	смирнов_дми@example.com
146	Иванова Ирина	+79619778881	ивановаи@gmail.com
147	Смирнова Ирина	+79157357143	смирнова_и@mail.ru
148	Кузнецов Сергей	+79168795235	кузнецов.се@mail.ru
149	Кузнецова Елена	+79632410746	кузнецова_ел@example.com
150	Петрова Ирина	+79463688659	петрова.ири@example.com
151	Сидорова Елена	+79715724778	сидороваел@hotmail.com
152	Смирнов Алексей	+79229766353	смирнов.а@yandex.ru
153	Попова Ирина	+79492894943	поповаири@hotmail.com
154	Петрова Елена	+79341867167	петрова_ел@example.com
155	Сидоров Александр	+79335627663	сидоров_ал@hotmail.com
156	Смирнова Ольга	+79445707441	смирнова.о@example.com
157	Васильева Елена	+79936047747	васильеваел@yandex.ru
158	Сидорова Анна	+79621848608	сидорова.а@yandex.ru
159	Васильев Александр	+79914051813	васильев.але@hotmail.com
160	Кузнецов Максим	+79945383266	кузнецовм@mail.ru
161	Попова Наталья	+79551628534	попована@gmail.com
162	Васильев Дмитрий	+79998129048	васильев_дми@hotmail.com
163	Васильева Мария	+79776350432	васильева.м@yandex.ru
164	Попова Ольга	+79638811909	поповаоль@gmail.com
165	Смирнова Елена	+79375383758	смирнова_е@gmail.com
166	Петров Александр	+79508627599	петров.але@yandex.ru
167	Петров Дмитрий	+79919419319	петров_д@gmail.com
168	Кузнецов Дмитрий	+79454411616	кузнецов_дм@mail.ru
169	Иванова Наталья	+79353143961	иванова.на@example.com
170	Сидоров Сергей	+79335961200	сидоров_се@gmail.com
171	Попов Алексей	+79577620086	попов.а@mail.ru
172	Попов Алексей	+79907118369	поповале@yandex.ru
173	Попова Ирина	+79383449258	попова.ир@mail.ru
174	Васильев Андрей	+79435463379	васильеванд@example.com
175	Кузнецов Александр	+79439480767	кузнецовале@hotmail.com
176	Сидоров Дмитрий	+79252442295	сидоров_д@hotmail.com
177	Попова Наталья	+79394908368	попова_на@example.com
178	Сидоров Андрей	+79724286180	сидорован@mail.ru
179	Попова Анна	+79997904066	попова.анн@mail.ru
180	Попов Алексей	+79554627154	попов.але@example.com
181	Васильева Ольга	+79694863247	васильева_оль@example.com
182	Смирнов Дмитрий	+79301033881	смирнов_д@yandex.ru
183	Иванова Наталья	+79437002659	иванова_н@example.com
184	Васильев Сергей	+79242870104	васильев.сер@example.com
185	Иванова Ирина	+79965135927	иванова.ири@hotmail.com
186	Иванов Александр	+79963112859	иванов_ал@mail.ru
187	Попов Алексей	+79857345967	попов_ал@example.com
188	Кузнецова Анна	+79192000095	кузнецова.а@example.com
189	Попова Елена	+79423880433	попова.ел@example.com
190	Петрова Ольга	+79137129090	петровао@mail.ru
191	Васильева Мария	+79623612471	васильева_м@hotmail.com
192	Смирнова Анна	+79198172536	смирноваанн@hotmail.com
193	Кузнецов Андрей	+79242244171	кузнецов.а@gmail.com
194	Кузнецова Наталья	+79972030392	кузнецова.н@gmail.com
195	Попова Елена	+79249060501	попова_еле@mail.ru
196	Попова Анна	+79785973074	попова.а@yandex.ru
197	Смирнова Ольга	+79903857718	смирнова_оль@example.com
198	Васильева Ирина	+79787994822	васильеваир@gmail.com
199	Васильева Наталья	+79287430662	васильева.на@yandex.ru
200	Иванов Дмитрий	+79441116544	иванов_д@gmail.com
201	Петрова Елена	+79381824760	петрова_е@example.com
202	Сидорова Ирина	+79271016277	сидороваири@gmail.com
203	Петрова Анна	+79446013201	петрова_а@mail.ru
204	Попов Андрей	+79462498677	попов_анд@yandex.ru
205	Сидорова Наталья	+79439417982	сидорова.нат@example.com
206	Васильева Анна	+79672763171	васильева.анн@gmail.com
207	Кузнецов Дмитрий	+79282137101	кузнецов_дми@hotmail.com
208	Попова Мария	+79576312138	попова_м@yandex.ru
209	Кузнецов Андрей	+79134577551	кузнецов_а@mail.ru
210	Смирнов Александр	+79508144948	смирнова@hotmail.com
211	Смирнов Сергей	+79476949367	смирновс@gmail.com
212	Кузнецова Ольга	+79304188439	кузнецоваоль@hotmail.com
213	Петрова Ирина	+79543860930	петрова_ир@mail.ru
214	Иванова Наталья	+79866759189	иванова.н@hotmail.com
215	Петрова Елена	+79795109680	петрова_еле@yandex.ru
216	Попова Ольга	+79652797893	попова_о@example.com
217	Васильев Алексей	+79713615217	васильев_але@hotmail.com
218	Петров Дмитрий	+79302015207	петров_д@mail.ru
219	Кузнецова Ирина	+79711070606	кузнецова_ир@hotmail.com
220	Иванов Максим	+79221512860	иванов.ма@example.com
221	Кузнецова Мария	+79338719792	кузнецова.м@example.com
222	Иванова Наталья	+79749253216	иванованат@yandex.ru
223	Попов Алексей	+79254328158	попов_а@example.com
224	Смирнова Мария	+79534199496	смирнова.м@example.com
225	Иванов Алексей	+79576553588	иванова@gmail.com
226	Петров Александр	+79245281704	петров.ал@mail.ru
227	Смирнова Елена	+79697688594	смирнова.ел@gmail.com
908	Смирнова Ольга	+79763534087	смирновао@mail.ru
228	Кузнецова Наталья	+79811164932	кузнецова.н@example.com
229	Попова Мария	+79998962214	попова_мар@example.com
230	Смирнов Андрей	+79394532708	смирнов_а@example.com
231	Смирнов Дмитрий	+79974483794	смирнов_дми@example.com
232	Кузнецова Анна	+79999581909	кузнецова.ан@gmail.com
233	Смирнов Дмитрий	+79303711876	смирнов_дми@mail.ru
234	Иванова Анна	+79986080422	иванова.ан@mail.ru
235	Сидоров Александр	+79903231728	сидоров_ал@yandex.ru
236	Петрова Ирина	+79657065203	петрова.и@yandex.ru
237	Кузнецова Наталья	+79262969698	кузнецова_н@yandex.ru
238	Кузнецов Алексей	+79201720014	кузнецов.але@gmail.com
239	Иванова Анна	+79733768159	иванова.ан@example.com
240	Петрова Анна	+79887781963	петроваан@mail.ru
241	Петров Максим	+79119970094	петров.ма@example.com
242	Сидоров Максим	+79523418186	сидоров_ма@hotmail.com
243	Попова Ольга	+79855094150	поповаол@example.com
244	Сидоров Дмитрий	+79612269417	сидоров_д@mail.ru
245	Сидорова Анна	+79165177886	сидороваа@mail.ru
246	Попова Ольга	+79418429296	поповао@gmail.com
247	Попова Анна	+79601360272	попова_а@yandex.ru
248	Иванов Алексей	+79168017309	иванова@yandex.ru
249	Смирнов Александр	+79547721990	смирнов_а@gmail.com
250	Сидорова Ирина	+79686642520	сидорова_ири@yandex.ru
251	Васильев Дмитрий	+79417422784	васильевд@mail.ru
252	Кузнецова Ольга	+79557063910	кузнецовао@hotmail.com
253	Петрова Наталья	+79611269292	петрова.на@example.com
254	Попов Сергей	+79967996678	попов.сер@mail.ru
255	Петров Максим	+79749616118	петров_ма@gmail.com
256	Смирнова Ирина	+79393162326	смирнова_ир@mail.ru
257	Петров Алексей	+79894655603	петров_але@mail.ru
258	Иванова Наталья	+79609201601	иванованат@mail.ru
259	Иванов Максим	+79897181021	иванов_м@gmail.com
260	Сидорова Наталья	+79301358840	сидорованат@gmail.com
261	Васильева Елена	+79145413172	васильева_е@example.com
262	Васильев Сергей	+79543208706	васильев.сер@example.com
263	Иванова Елена	+79784674419	ивановаеле@hotmail.com
264	Смирнов Алексей	+79782900607	смирнов_а@yandex.ru
265	Иванов Дмитрий	+79436493059	иванов.дм@hotmail.com
266	Кузнецова Ольга	+79609879495	кузнецова_о@hotmail.com
267	Смирнов Андрей	+79162648616	смирнов.а@yandex.ru
268	Петров Александр	+79541787922	петров.а@mail.ru
269	Васильев Максим	+79155274358	васильев_м@gmail.com
270	Иванова Ольга	+79581279445	иванова_о@gmail.com
271	Васильев Андрей	+79887300263	васильева@hotmail.com
272	Кузнецова Ирина	+79797231975	кузнецова.ир@mail.ru
273	Кузнецова Ольга	+79296957691	кузнецоваол@yandex.ru
274	Васильев Дмитрий	+79761593276	васильев.д@gmail.com
275	Кузнецова Анна	+79653879368	кузнецова_анн@gmail.com
276	Кузнецов Дмитрий	+79795044197	кузнецов.д@example.com
277	Сидоров Алексей	+79996780468	сидоров.а@mail.ru
278	Смирнова Елена	+79582090693	смирноваел@gmail.com
279	Иванова Елена	+79364044277	иванова.ел@hotmail.com
280	Кузнецов Сергей	+79493778109	кузнецов_се@yandex.ru
281	Смирнова Мария	+79125445840	смирнова.м@mail.ru
282	Попова Наталья	+79477346546	попова_н@yandex.ru
283	Иванова Ирина	+79952392460	иванова.ир@yandex.ru
284	Попов Алексей	+79647976824	попов_але@gmail.com
285	Васильев Алексей	+79206500510	васильев.ал@hotmail.com
286	Кузнецова Наталья	+79715710162	кузнецован@mail.ru
287	Смирнова Елена	+79175461838	смирнова.ел@yandex.ru
288	Иванова Наталья	+79727651164	иванова_на@hotmail.com
289	Петрова Елена	+79762704091	петрова_ел@yandex.ru
290	Васильева Анна	+79108089706	васильева.ан@mail.ru
291	Петров Андрей	+79526594055	петров.а@yandex.ru
292	Петрова Наталья	+79686736360	петрова_нат@gmail.com
293	Смирнова Елена	+79573687377	смирнова.ел@hotmail.com
294	Кузнецов Александр	+79706687565	кузнецова@example.com
295	Попова Анна	+79291190218	попова.ан@example.com
296	Смирнова Мария	+79368949595	смирновамар@hotmail.com
297	Сидоров Сергей	+79252901997	сидоровс@yandex.ru
298	Кузнецова Ирина	+79738863795	кузнецова.ир@example.com
299	Петрова Анна	+79283189442	петрова_ан@mail.ru
300	Васильев Алексей	+79221462184	васильев_а@gmail.com
301	Сидоров Сергей	+79511783616	сидоровсер@example.com
302	Васильева Ирина	+79985034142	васильева.ир@yandex.ru
303	Смирнова Ирина	+79484869252	смирноваир@example.com
304	Петров Алексей	+79577143672	петровале@gmail.com
305	Петрова Елена	+79275223792	петрова_е@gmail.com
306	Петров Алексей	+79484625310	петров_а@hotmail.com
307	Сидоров Алексей	+79951925734	сидоров.але@mail.ru
308	Иванов Сергей	+79945653311	иванов_се@yandex.ru
309	Иванова Ольга	+79935463697	иванова.о@yandex.ru
310	Попова Ольга	+79645784912	попова.о@mail.ru
311	Иванов Дмитрий	+79849863683	иванов.дм@yandex.ru
312	Попова Наталья	+79331801477	попова_на@yandex.ru
313	Смирнова Ольга	+79198456613	смирнова.ол@gmail.com
314	Попов Алексей	+79701830212	поповал@hotmail.com
315	Петрова Елена	+79522924347	петрова.еле@mail.ru
316	Попова Елена	+79576944834	поповаеле@yandex.ru
317	Васильева Наталья	+79634464863	васильева.нат@gmail.com
318	Смирнова Ирина	+79813718215	смирнова.ир@hotmail.com
319	Васильева Ирина	+79578697309	васильеваири@hotmail.com
320	Кузнецов Александр	+79357579317	кузнецов_ал@example.com
321	Петрова Анна	+79458284495	петрова_ан@example.com
322	Сидорова Ольга	+79728336515	сидороваоль@mail.ru
323	Смирнов Дмитрий	+79455526873	смирнов_д@hotmail.com
324	Смирнов Александр	+79175299720	смирновале@example.com
325	Васильев Андрей	+79223091897	васильеванд@example.com
326	Иванов Сергей	+79174452178	ивановсер@gmail.com
327	Сидоров Александр	+79513618938	сидоровал@yandex.ru
328	Сидорова Наталья	+79982313344	сидорована@yandex.ru
329	Сидорова Анна	+79113715457	сидорова.ан@hotmail.com
330	Кузнецов Дмитрий	+79632813869	кузнецов_д@yandex.ru
331	Васильев Сергей	+79884533889	васильев_сер@hotmail.com
332	Петров Максим	+79817939235	петров_м@yandex.ru
333	Петрова Наталья	+79752558605	петрованат@yandex.ru
334	Иванова Анна	+79139904789	ивановаанн@yandex.ru
335	Кузнецова Анна	+79915304427	кузнецоваан@hotmail.com
336	Сидорова Елена	+79309695735	сидорова_е@mail.ru
337	Васильев Алексей	+79289091001	васильев.а@mail.ru
338	Васильев Сергей	+79248035073	васильев_с@gmail.com
339	Васильев Александр	+79627839422	васильевал@gmail.com
340	Смирнова Елена	+79812201020	смирноваеле@hotmail.com
341	Васильев Александр	+79782887622	васильев.а@gmail.com
342	Иванова Ольга	+79492796905	иванова_о@yandex.ru
343	Сидоров Александр	+79598002142	сидоров.а@yandex.ru
344	Смирнов Александр	+79876269351	смирнов_але@hotmail.com
345	Смирнова Анна	+79283677774	смирнова.анн@gmail.com
346	Смирнов Максим	+79999220160	смирновм@yandex.ru
347	Сидоров Алексей	+79513966473	сидорова@mail.ru
348	Петрова Ирина	+79417224447	петрова_ир@gmail.com
349	Попова Елена	+79478348622	попова.еле@hotmail.com
350	Петрова Наталья	+79666359306	петрова.на@mail.ru
351	Смирнова Елена	+79334931365	смирнова_еле@example.com
352	Васильев Дмитрий	+79585989938	васильевдми@mail.ru
353	Иванов Сергей	+79289347351	ивановсе@gmail.com
354	Смирнова Наталья	+79882643901	смирнова_на@yandex.ru
355	Попов Дмитрий	+79825747866	поповдми@yandex.ru
356	Попов Александр	+79291267521	попов.ал@mail.ru
357	Петрова Мария	+79605815743	петрова_ма@yandex.ru
358	Попов Сергей	+79832295777	попов.с@yandex.ru
359	Иванов Максим	+79595256551	ивановм@hotmail.com
360	Васильева Ольга	+79808706602	васильева_ол@example.com
361	Попова Ольга	+79656244265	попова_оль@hotmail.com
362	Кузнецов Сергей	+79895320414	кузнецов.с@hotmail.com
363	Смирнова Ирина	+79132431995	смирнова.ир@gmail.com
364	Попова Елена	+79433654217	попова_ел@gmail.com
365	Смирнов Максим	+79615365864	смирновма@yandex.ru
366	Попова Ольга	+79297151086	попова.оль@gmail.com
367	Кузнецова Анна	+79946881079	кузнецова.а@yandex.ru
368	Иванова Ирина	+79739351415	иванова_и@mail.ru
369	Иванов Дмитрий	+79466602300	ивановдм@mail.ru
370	Кузнецова Анна	+79192936211	кузнецоваа@mail.ru
371	Иванов Дмитрий	+79316525761	ивановд@mail.ru
372	Попова Ирина	+79279454768	попова.и@example.com
373	Смирнова Мария	+79589062851	смирновамар@yandex.ru
374	Иванов Андрей	+79959178209	иванов_анд@mail.ru
375	Кузнецова Мария	+79534722996	кузнецова.м@mail.ru
376	Иванова Елена	+79946834303	иванова_е@hotmail.com
377	Иванова Мария	+79244257472	ивановамар@yandex.ru
378	Васильева Ирина	+79498087103	васильеваири@mail.ru
379	Сидорова Елена	+79149246431	сидорова_ел@hotmail.com
380	Смирнова Ольга	+79396347407	смирнова.оль@example.com
381	Сидорова Ирина	+79189565748	сидорова_ир@gmail.com
382	Иванова Елена	+79611155829	ивановаеле@hotmail.com
383	Попова Мария	+79221870661	попова_мар@gmail.com
384	Васильев Дмитрий	+79637252024	васильевдм@hotmail.com
385	Сидоров Алексей	+79356488337	сидоров_але@gmail.com
386	Петров Алексей	+79705953993	петров_але@mail.ru
387	Смирнов Дмитрий	+79254575611	смирновдм@hotmail.com
388	Попова Мария	+79211859599	поповама@mail.ru
389	Петрова Анна	+79555902867	петроваан@yandex.ru
390	Петрова Наталья	+79589019665	петрован@mail.ru
391	Сидоров Алексей	+79435611887	сидоров_але@gmail.com
392	Петров Сергей	+79977551834	петров.с@example.com
393	Сидорова Елена	+79961511210	сидорова.ел@gmail.com
394	Попова Ирина	+79425150843	поповаир@example.com
395	Васильева Елена	+79714981897	васильевае@yandex.ru
396	Сидоров Максим	+79876941663	сидоровм@mail.ru
397	Иванов Андрей	+79961506452	иванованд@mail.ru
398	Кузнецова Анна	+79373095131	кузнецоваа@mail.ru
399	Иванов Андрей	+79361210708	иванова@gmail.com
400	Сидорова Елена	+79933379714	сидорова_е@mail.ru
401	Сидорова Мария	+79574048841	сидоровама@example.com
402	Смирнова Анна	+79464590151	смирнова_ан@example.com
403	Петрова Ольга	+79533882311	петрова.о@example.com
404	Петрова Анна	+79468516435	петроваанн@gmail.com
405	Смирнов Дмитрий	+79989176513	смирновдми@mail.ru
406	Кузнецова Мария	+79425208805	кузнецовам@hotmail.com
407	Попов Алексей	+79977919947	попов.ал@hotmail.com
408	Сидорова Ольга	+79817668256	сидорова_ол@example.com
409	Сидорова Анна	+79123676944	сидорова_ан@gmail.com
410	Петрова Мария	+79518084658	петрова_м@yandex.ru
411	Кузнецова Наталья	+79472580502	кузнецова.нат@yandex.ru
412	Сидорова Наталья	+79624246546	сидорован@gmail.com
413	Сидоров Алексей	+79384189165	сидоров_але@yandex.ru
414	Васильев Сергей	+79936172962	васильевсе@yandex.ru
415	Иванов Дмитрий	+79847627317	иванов.д@mail.ru
416	Петров Андрей	+79874651187	петров_ан@hotmail.com
417	Кузнецов Александр	+79204935474	кузнецов_але@example.com
418	Сидорова Елена	+79808654728	сидорова.е@hotmail.com
419	Сидоров Андрей	+79555453809	сидорованд@gmail.com
420	Иванова Наталья	+79936941093	иванова.на@mail.ru
421	Иванова Елена	+79277983633	ивановаел@yandex.ru
422	Смирнов Алексей	+79147168705	смирнова@yandex.ru
423	Сидоров Андрей	+79222753038	сидоров.анд@hotmail.com
424	Сидорова Ирина	+79512316430	сидорова_и@gmail.com
425	Попов Александр	+79999058108	попов.але@yandex.ru
426	Кузнецова Анна	+79829996332	кузнецова_анн@mail.ru
427	Сидоров Алексей	+79157180744	сидоров.ал@gmail.com
428	Сидоров Дмитрий	+79231755137	сидоров_дм@yandex.ru
429	Попова Ольга	+79597766639	попова.ол@mail.ru
430	Сидоров Дмитрий	+79821840310	сидоров_д@gmail.com
431	Васильев Александр	+79304051435	васильев_а@mail.ru
432	Васильев Андрей	+79887359449	васильеванд@hotmail.com
433	Васильева Анна	+79766448611	васильеваанн@hotmail.com
434	Васильева Ольга	+79291507089	васильева.ол@gmail.com
435	Васильева Ольга	+79751218407	васильева_оль@hotmail.com
436	Смирнов Андрей	+79248212411	смирнов.ан@yandex.ru
437	Иванова Елена	+79669249021	иванова.ел@gmail.com
438	Попов Дмитрий	+79441104787	попов_дм@mail.ru
439	Сидорова Наталья	+79278216972	сидорован@gmail.com
440	Васильева Анна	+79407374057	васильева_а@gmail.com
441	Сидоров Алексей	+79621391943	сидоров.але@yandex.ru
442	Сидорова Елена	+79701006926	сидороваел@yandex.ru
443	Васильев Алексей	+79816360418	васильев_а@hotmail.com
444	Петров Александр	+79849828402	петровале@gmail.com
445	Сидоров Максим	+79571921920	сидоровмак@mail.ru
446	Петрова Анна	+79806648213	петроваан@example.com
447	Петров Александр	+79684065878	петров_але@mail.ru
448	Иванов Алексей	+79295499870	иванов_ал@gmail.com
449	Иванов Андрей	+79728063784	иванова@mail.ru
450	Кузнецова Ирина	+79223865393	кузнецоваир@yandex.ru
451	Сидорова Мария	+79801369516	сидорова_ма@hotmail.com
452	Смирнова Ирина	+79101521531	смирнова.ир@mail.ru
453	Петров Алексей	+79646049732	петрова@yandex.ru
454	Васильева Наталья	+79101508064	васильева.нат@yandex.ru
455	Сидорова Елена	+79651648272	сидорова_еле@hotmail.com
456	Иванов Максим	+79203743478	иванов.м@yandex.ru
457	Иванов Сергей	+79109513268	иванов_сер@yandex.ru
458	Попова Наталья	+79563780112	попова.нат@hotmail.com
459	Иванов Сергей	+79516599324	иванов_с@hotmail.com
460	Сидорова Мария	+79663776131	сидорова_ма@example.com
461	Иванов Дмитрий	+79157898327	ивановдм@example.com
462	Васильев Алексей	+79982882356	васильев.ал@yandex.ru
463	Сидоров Максим	+79388962569	сидоров_мак@mail.ru
464	Кузнецова Анна	+79616480804	кузнецова.ан@gmail.com
465	Попов Дмитрий	+79808845167	поповд@hotmail.com
466	Кузнецова Ирина	+79969936940	кузнецова_ир@example.com
467	Сидорова Наталья	+79818237879	сидорова_нат@yandex.ru
468	Попова Елена	+79532986510	попова.еле@mail.ru
469	Петров Дмитрий	+79214994198	петровд@yandex.ru
470	Иванова Наталья	+79273792565	иванова.на@hotmail.com
471	Смирнова Мария	+79608879410	смирнова.мар@example.com
472	Попов Александр	+79397640731	попов.але@mail.ru
473	Кузнецова Елена	+79626865000	кузнецова.еле@gmail.com
474	Петров Андрей	+79262831080	петров_ан@example.com
475	Попова Ольга	+79563553364	попова.оль@hotmail.com
476	Смирнов Андрей	+79226465784	смирнованд@hotmail.com
477	Кузнецова Ирина	+79954986130	кузнецоваири@gmail.com
478	Петров Андрей	+79769623382	петров.анд@gmail.com
479	Попова Ольга	+79793762886	поповаол@yandex.ru
480	Кузнецов Максим	+79312931992	кузнецов_мак@gmail.com
481	Смирнова Мария	+79683588157	смирнова_мар@hotmail.com
482	Смирнов Дмитрий	+79165637019	смирновд@gmail.com
483	Кузнецова Мария	+79256204298	кузнецова.мар@example.com
484	Кузнецова Наталья	+79907657879	кузнецован@example.com
485	Сидорова Ольга	+79345813123	сидорова.о@mail.ru
486	Васильев Алексей	+79556679658	васильева@example.com
487	Сидоров Сергей	+79252913522	сидоровсер@example.com
488	Петрова Наталья	+79193132141	петрова.нат@example.com
489	Петрова Анна	+79505314900	петроваа@gmail.com
490	Попова Елена	+79525469668	поповаел@mail.ru
491	Попова Анна	+79185808075	поповаан@gmail.com
492	Петров Дмитрий	+79884734102	петров_дм@mail.ru
493	Попов Сергей	+79588899146	поповс@mail.ru
494	Попова Мария	+79225646030	попова_мар@gmail.com
495	Сидоров Дмитрий	+79383826659	сидоров_дм@hotmail.com
496	Сидоров Дмитрий	+79401452955	сидоровд@hotmail.com
497	Иванова Анна	+79544119215	иванова.а@example.com
498	Попов Максим	+79201461910	попов_м@yandex.ru
499	Иванов Александр	+79487997790	иванова@mail.ru
500	Смирнов Максим	+79984848682	смирнов_мак@gmail.com
501	Иванова Наталья	+79927840246	иванова_на@yandex.ru
502	Смирнова Елена	+79958651863	смирноваеле@gmail.com
503	Сидоров Дмитрий	+79826350257	сидоровд@yandex.ru
504	Кузнецова Анна	+79107539473	кузнецоваа@gmail.com
505	Сидоров Александр	+79755065052	сидоров_але@example.com
506	Петрова Елена	+79182051081	петрова_еле@mail.ru
507	Васильева Анна	+79108130264	васильева.анн@example.com
508	Смирнов Александр	+79603974556	смирнов_ал@yandex.ru
509	Смирнова Мария	+79678159976	смирнова_м@gmail.com
510	Кузнецов Максим	+79998580484	кузнецов_м@yandex.ru
511	Попова Елена	+79131284693	поповаел@gmail.com
512	Сидорова Елена	+79287967555	сидорова.ел@example.com
513	Иванов Сергей	+79971422319	иванов_се@mail.ru
514	Попов Дмитрий	+79533703846	попов_д@gmail.com
515	Смирнов Максим	+79213625881	смирновмак@example.com
516	Иванова Елена	+79462893865	иванова_ел@yandex.ru
517	Попов Алексей	+79324063787	попов_ал@yandex.ru
518	Васильев Максим	+79857329541	васильев_мак@hotmail.com
519	Иванов Андрей	+79139030107	иванов_а@mail.ru
520	Кузнецов Сергей	+79363247548	кузнецовс@hotmail.com
521	Попов Александр	+79837384651	попов.а@hotmail.com
522	Сидоров Андрей	+79164991371	сидоров_а@hotmail.com
523	Сидоров Александр	+79303312966	сидоров_але@mail.ru
524	Кузнецов Дмитрий	+79405496956	кузнецов.дми@hotmail.com
525	Попов Максим	+79496503357	поповма@hotmail.com
526	Васильева Анна	+79202104996	васильеваа@mail.ru
527	Попов Александр	+79877719795	попов.але@mail.ru
528	Смирнова Анна	+79875818141	смирноваа@hotmail.com
529	Сидоров Сергей	+79539196713	сидоров_се@hotmail.com
530	Иванова Анна	+79262517131	иванова_ан@example.com
531	Петрова Анна	+79775985401	петрова.а@mail.ru
532	Попова Елена	+79317149927	поповае@gmail.com
533	Петров Алексей	+79539573147	петровале@mail.ru
534	Кузнецов Сергей	+79237577267	кузнецов.се@hotmail.com
535	Иванов Алексей	+79552079100	иванов.але@yandex.ru
536	Васильев Дмитрий	+79632536725	васильевдми@example.com
537	Иванова Ирина	+79794105400	иванова.ир@yandex.ru
538	Петров Максим	+79826485817	петровма@yandex.ru
539	Васильев Максим	+79777391744	васильев_ма@example.com
540	Смирнов Дмитрий	+79609526763	смирнов.дми@hotmail.com
541	Попова Ирина	+79342979413	поповаири@gmail.com
542	Попов Сергей	+79317195277	попов.сер@example.com
543	Петрова Ольга	+79643671711	петровао@mail.ru
544	Сидорова Ольга	+79156532364	сидорова_о@gmail.com
545	Сидоров Максим	+79701990699	сидоровмак@hotmail.com
546	Попова Наталья	+79445681377	попова_нат@mail.ru
547	Попов Сергей	+79235168888	попов_се@mail.ru
548	Иванов Алексей	+79749571690	иванов_але@mail.ru
549	Петров Алексей	+79308618312	петров.ал@gmail.com
550	Кузнецов Дмитрий	+79828880237	кузнецовдм@example.com
551	Иванова Елена	+79103866673	иванова.ел@example.com
552	Петрова Ирина	+79892713824	петрова_и@mail.ru
553	Иванов Дмитрий	+79848504647	иванов.дм@hotmail.com
554	Иванов Сергей	+79911357961	ивановсер@gmail.com
555	Смирнов Максим	+79391286623	смирновм@mail.ru
556	Кузнецов Александр	+79825655363	кузнецов.а@gmail.com
557	Попова Ольга	+79768112358	попова_о@yandex.ru
558	Иванов Дмитрий	+79497193003	иванов.дми@example.com
559	Васильев Алексей	+79548484880	васильев.але@gmail.com
560	Смирнова Ольга	+79745335889	смирноваол@yandex.ru
561	Васильев Александр	+79902687282	васильевале@gmail.com
562	Смирнова Мария	+79833900428	смирнова_ма@mail.ru
563	Кузнецов Андрей	+79659393965	кузнецов.анд@example.com
564	Сидоров Максим	+79839169236	сидоров_ма@gmail.com
565	Кузнецова Елена	+79684586892	кузнецова.ел@hotmail.com
566	Попова Ирина	+79569500637	попова_ири@example.com
567	Петров Андрей	+79188845265	петров.анд@gmail.com
568	Смирнов Александр	+79991919948	смирнов_а@mail.ru
569	Попова Ирина	+79299534844	попова.ири@hotmail.com
570	Кузнецова Наталья	+79391024981	кузнецован@yandex.ru
571	Иванова Ольга	+79461744325	ивановаол@example.com
572	Попова Елена	+79954627150	попова.еле@mail.ru
573	Сидоров Александр	+79869761215	сидоров_ал@mail.ru
574	Кузнецова Елена	+79685820036	кузнецова.еле@mail.ru
575	Попова Ольга	+79837386910	поповао@gmail.com
576	Сидорова Анна	+79905314632	сидорова_а@mail.ru
577	Попова Елена	+79447489689	поповаел@example.com
578	Васильева Мария	+79728225511	васильева_мар@yandex.ru
579	Иванов Сергей	+79949404470	ивановс@hotmail.com
580	Сидорова Ирина	+79915653256	сидороваи@mail.ru
581	Васильева Наталья	+79877375064	васильевана@gmail.com
582	Кузнецова Ольга	+79131690773	кузнецовао@yandex.ru
583	Кузнецова Ирина	+79815199498	кузнецова_ири@gmail.com
584	Смирнова Елена	+79658875577	смирнова.еле@yandex.ru
585	Васильева Елена	+79795334101	васильева.еле@hotmail.com
586	Попова Ольга	+79697713086	попова_о@gmail.com
587	Попов Максим	+79629655871	попов.ма@yandex.ru
588	Васильев Дмитрий	+79528264123	васильев.дми@yandex.ru
589	Кузнецов Максим	+79908252579	кузнецовмак@gmail.com
590	Васильев Сергей	+79919483540	васильевсе@example.com
591	Кузнецов Андрей	+79706038197	кузнецов.а@example.com
592	Смирнова Ольга	+79173489648	смирнова.ол@gmail.com
593	Васильева Ирина	+79692165931	васильева.ир@hotmail.com
594	Васильева Елена	+79688051839	васильева.ел@gmail.com
595	Васильев Андрей	+79341947898	васильеван@hotmail.com
596	Иванова Ольга	+79661103007	иванова_о@mail.ru
597	Попова Наталья	+79281522345	попована@yandex.ru
598	Смирнова Мария	+79662414506	смирнова.мар@hotmail.com
599	Иванова Елена	+79969298277	иванова.еле@example.com
600	Кузнецов Сергей	+79809986589	кузнецов_се@yandex.ru
601	Васильева Мария	+79189575531	васильевам@mail.ru
602	Сидоров Максим	+79564710757	сидоровма@yandex.ru
603	Сидорова Ольга	+79181555467	сидорова.о@hotmail.com
604	Сидорова Елена	+79505532127	сидороваеле@yandex.ru
605	Кузнецова Елена	+79491868089	кузнецовае@hotmail.com
606	Сидорова Ирина	+79884209956	сидорова_и@gmail.com
607	Попова Елена	+79509481295	попова_еле@yandex.ru
608	Кузнецова Наталья	+79347604297	кузнецованат@mail.ru
609	Иванова Анна	+79804366623	иванова.а@example.com
610	Смирнов Сергей	+79701746533	смирнов_сер@hotmail.com
611	Сидоров Александр	+79838525985	сидоров.ал@gmail.com
612	Петрова Мария	+79824079353	петрова_м@gmail.com
613	Васильев Александр	+79884568315	васильев.але@mail.ru
614	Смирнова Ирина	+79656468350	смирнова_ири@example.com
615	Сидоров Сергей	+79948014311	сидоров_сер@gmail.com
616	Васильева Ольга	+79842535074	васильева_ол@mail.ru
617	Петрова Наталья	+79393303370	петрова_на@yandex.ru
618	Сидорова Елена	+79453255756	сидорова.ел@mail.ru
619	Иванов Андрей	+79796054342	иванованд@example.com
620	Петрова Мария	+79934381835	петрова_м@example.com
621	Смирнова Елена	+79612453218	смирноваел@gmail.com
622	Петрова Наталья	+79996293938	петрована@example.com
623	Петров Сергей	+79656380334	петровс@yandex.ru
624	Смирнов Андрей	+79219269607	смирнов_анд@example.com
625	Сидоров Александр	+79636911000	сидоров.а@mail.ru
626	Сидорова Мария	+79205067597	сидорова.ма@gmail.com
627	Сидоров Сергей	+79108539314	сидоров.сер@hotmail.com
628	Васильев Александр	+79868019263	васильев_ал@mail.ru
629	Петров Сергей	+79703351382	петров.се@mail.ru
630	Попов Андрей	+79492051402	попованд@gmail.com
631	Кузнецов Александр	+79555446346	кузнецовал@gmail.com
632	Сидорова Елена	+79207675386	сидороваеле@mail.ru
633	Попова Наталья	+79195228607	попова_на@mail.ru
634	Попов Максим	+79618815311	поповмак@mail.ru
635	Васильева Мария	+79514853181	васильева_ма@example.com
636	Смирнов Андрей	+79279058397	смирнов_ан@yandex.ru
637	Петров Дмитрий	+79208870068	петров.д@gmail.com
638	Иванова Наталья	+79322234059	иванова_на@hotmail.com
639	Васильева Анна	+79437852589	васильева_анн@hotmail.com
640	Петров Александр	+79478716347	петрова@gmail.com
641	Кузнецова Мария	+79679326474	кузнецова_ма@example.com
642	Васильева Елена	+79729046119	васильевае@yandex.ru
643	Васильева Анна	+79699267361	васильева_ан@example.com
644	Сидоров Максим	+79832100085	сидоровм@gmail.com
645	Смирнов Александр	+79246571768	смирнов_ал@mail.ru
646	Иванова Ирина	+79669311971	ивановаи@yandex.ru
647	Петров Сергей	+79887083421	петров_сер@mail.ru
648	Сидоров Александр	+79778119085	сидоров.а@hotmail.com
649	Васильева Наталья	+79733123691	васильеван@hotmail.com
650	Петров Дмитрий	+79302133731	петровдми@gmail.com
651	Смирнов Дмитрий	+79179696614	смирновдми@yandex.ru
652	Кузнецов Алексей	+79114639859	кузнецов.а@yandex.ru
653	Попов Сергей	+79924761010	попов_с@gmail.com
654	Сидорова Анна	+79564810028	сидорова_ан@gmail.com
655	Попов Максим	+79858295812	поповм@example.com
656	Кузнецова Мария	+79491528997	кузнецовам@mail.ru
657	Смирнова Ирина	+79658446815	смирнова.ири@mail.ru
658	Кузнецова Наталья	+79311013817	кузнецован@mail.ru
659	Попов Сергей	+79482341239	попов_сер@example.com
660	Васильева Ирина	+79568177190	васильеваир@hotmail.com
661	Васильев Алексей	+79587988390	васильевал@mail.ru
662	Сидоров Андрей	+79917660718	сидоров.анд@example.com
663	Иванова Елена	+79507190455	ивановаеле@hotmail.com
664	Васильева Ольга	+79852312027	васильева_о@yandex.ru
665	Смирнов Дмитрий	+79499949628	смирновд@yandex.ru
666	Попов Александр	+79907444253	попов_а@example.com
667	Иванов Максим	+79797882742	иванов_мак@gmail.com
668	Сидорова Елена	+79812616238	сидороваеле@mail.ru
669	Сидоров Дмитрий	+79645461212	сидоровдм@yandex.ru
670	Смирнова Ольга	+79225615580	смирнова.ол@yandex.ru
671	Попова Наталья	+79915217528	попован@yandex.ru
672	Иванова Ольга	+79551652477	ивановаоль@mail.ru
673	Петров Максим	+79787529829	петров_м@gmail.com
674	Васильева Елена	+79623894927	васильева.еле@gmail.com
675	Сидорова Мария	+79326718374	сидорова.ма@example.com
676	Сидорова Ольга	+79359263687	сидорова.о@example.com
677	Петрова Наталья	+79735158999	петрован@example.com
678	Смирнова Анна	+79859580153	смирноваан@hotmail.com
679	Васильев Андрей	+79398818222	васильева@hotmail.com
680	Смирнова Мария	+79714072204	смирнова.ма@hotmail.com
681	Попов Андрей	+79942142061	попов_а@example.com
682	Сидоров Алексей	+79959979596	сидоров.ал@gmail.com
683	Смирнов Максим	+79207660784	смирнов.ма@yandex.ru
684	Иванова Анна	+79793792213	иванова_а@yandex.ru
685	Петрова Наталья	+79609802324	петрова_н@example.com
686	Сидоров Максим	+79735262519	сидоров_ма@mail.ru
687	Кузнецов Сергей	+79523911166	кузнецовс@gmail.com
688	Кузнецова Мария	+79497122355	кузнецова.мар@example.com
689	Сидоров Андрей	+79323416662	сидоров_а@hotmail.com
690	Иванов Дмитрий	+79734079547	иванов.дм@mail.ru
691	Кузнецова Наталья	+79213406060	кузнецова.н@gmail.com
692	Петров Алексей	+79774743842	петровал@hotmail.com
693	Петров Андрей	+79387192319	петров.а@example.com
694	Петров Алексей	+79537009869	петров_але@hotmail.com
695	Попова Анна	+79507360177	попова_ан@gmail.com
696	Сидорова Мария	+79994637934	сидорова_ма@hotmail.com
697	Кузнецова Ольга	+79503986963	кузнецова.оль@hotmail.com
698	Васильева Анна	+79199440871	васильева_ан@yandex.ru
699	Кузнецов Сергей	+79674420169	кузнецовс@example.com
700	Попова Анна	+79408466271	поповаанн@mail.ru
701	Васильев Андрей	+79574676091	васильев.анд@gmail.com
702	Петров Александр	+79733549139	петров.ал@mail.ru
703	Кузнецова Анна	+79836548100	кузнецоваанн@example.com
704	Попов Сергей	+79115476440	попов.сер@mail.ru
705	Кузнецов Александр	+79891176091	кузнецов.а@yandex.ru
706	Кузнецов Дмитрий	+79577809442	кузнецов.д@example.com
707	Кузнецов Андрей	+79867681439	кузнецованд@mail.ru
708	Смирнова Анна	+79995425784	смирнова_ан@gmail.com
709	Попова Анна	+79826537652	попова.ан@example.com
710	Кузнецова Ирина	+79376254115	кузнецова_и@yandex.ru
711	Попов Максим	+79937006620	поповм@gmail.com
712	Попова Ирина	+79468134334	попова.ири@mail.ru
713	Петров Александр	+79771327619	петров_а@hotmail.com
714	Иванов Александр	+79882818714	иванов_але@hotmail.com
715	Кузнецов Алексей	+79483794809	кузнецовал@yandex.ru
716	Петров Андрей	+79513772491	петрова@hotmail.com
717	Смирнов Максим	+79634732551	смирнов.ма@hotmail.com
718	Попов Александр	+79614857659	попов.ал@yandex.ru
719	Кузнецов Александр	+79429290706	кузнецов.ал@yandex.ru
720	Иванов Сергей	+79229702488	ивановс@example.com
721	Петров Андрей	+79307052068	петрованд@hotmail.com
722	Васильев Александр	+79416348392	васильевале@hotmail.com
723	Иванов Дмитрий	+79872878787	иванов.дми@hotmail.com
724	Смирнов Алексей	+79194552140	смирнова@hotmail.com
725	Кузнецов Александр	+79445865191	кузнецовал@hotmail.com
726	Смирнова Мария	+79198972444	смирнова_м@hotmail.com
727	Петрова Ирина	+79575161604	петрова_ир@hotmail.com
728	Петрова Ольга	+79307893935	петрова.о@yandex.ru
729	Попов Сергей	+79597459308	поповсе@yandex.ru
730	Сидорова Анна	+79795192762	сидорова.а@hotmail.com
731	Петрова Ольга	+79678087505	петровао@hotmail.com
732	Петрова Ольга	+79657910144	петроваоль@yandex.ru
733	Васильев Сергей	+79397427567	васильевс@gmail.com
734	Смирнова Мария	+79953101937	смирнова.м@yandex.ru
735	Петрова Ольга	+79573626738	петрова.оль@gmail.com
736	Васильева Ирина	+79659948945	васильева.и@yandex.ru
737	Попова Мария	+79291529088	поповама@yandex.ru
738	Смирнов Александр	+79291595824	смирнов_але@hotmail.com
739	Сидорова Наталья	+79126897098	сидорова.нат@example.com
740	Петров Андрей	+79888812832	петров.а@mail.ru
741	Петрова Мария	+79375081625	петровама@yandex.ru
742	Кузнецов Алексей	+79688007573	кузнецовал@yandex.ru
743	Иванов Сергей	+79716329597	ивановс@gmail.com
744	Петрова Мария	+79379504765	петровам@yandex.ru
745	Петрова Мария	+79307647284	петрова_ма@yandex.ru
746	Васильев Александр	+79942430296	васильев.але@yandex.ru
747	Петрова Наталья	+79144424076	петрова.н@mail.ru
748	Смирнов Алексей	+79728415088	смирновал@yandex.ru
749	Смирнова Елена	+79467604463	смирнова_ел@gmail.com
750	Смирнова Мария	+79856970999	смирнова_мар@gmail.com
751	Иванова Ольга	+79496964158	иванова_о@example.com
752	Васильев Максим	+79899657660	васильев.ма@hotmail.com
753	Сидоров Алексей	+79967240412	сидоров.а@yandex.ru
754	Иванов Алексей	+79674608205	иванов_а@gmail.com
755	Кузнецов Дмитрий	+79572116630	кузнецов.д@hotmail.com
756	Кузнецова Ирина	+79356244038	кузнецоваи@example.com
757	Васильева Ирина	+79949614490	васильева.и@mail.ru
758	Васильев Максим	+79842587488	васильевмак@gmail.com
759	Кузнецова Анна	+79452078960	кузнецоваан@yandex.ru
760	Петрова Мария	+79872002345	петрова_ма@example.com
761	Петров Сергей	+79733361074	петров_се@hotmail.com
762	Петрова Ольга	+79546961478	петроваол@example.com
763	Смирнов Сергей	+79871089963	смирновс@gmail.com
764	Попова Ольга	+79717791870	поповао@example.com
765	Попов Максим	+79861883068	попов.м@gmail.com
766	Васильев Алексей	+79699686960	васильев_ал@example.com
767	Попова Анна	+79587951940	попова.ан@mail.ru
768	Петров Сергей	+79257842325	петров_се@yandex.ru
769	Смирнова Елена	+79189580646	смирнова.е@gmail.com
770	Васильева Елена	+79235967508	васильеваел@gmail.com
771	Кузнецов Андрей	+79756537676	кузнецованд@yandex.ru
772	Попов Александр	+79129434460	попов.а@yandex.ru
773	Попов Сергей	+79796939716	попов.с@mail.ru
774	Попова Ольга	+79284743350	поповаол@gmail.com
775	Петрова Наталья	+79997409160	петрова_нат@hotmail.com
776	Смирнова Наталья	+79811808793	смирнова_на@gmail.com
777	Петрова Наталья	+79501040489	петрова_на@hotmail.com
778	Васильева Наталья	+79521974917	васильева_на@gmail.com
779	Сидоров Алексей	+79183446208	сидоров.але@hotmail.com
780	Васильева Анна	+79154476348	васильеваа@mail.ru
781	Сидоров Максим	+79921547704	сидоровмак@example.com
782	Попов Дмитрий	+79282333540	поповд@yandex.ru
783	Васильева Ольга	+79617438675	васильева.о@yandex.ru
784	Сидоров Александр	+79274571855	сидоров.а@mail.ru
785	Васильева Ольга	+79455411506	васильевао@yandex.ru
786	Попов Алексей	+79486200384	попов_але@yandex.ru
787	Петрова Мария	+79331033316	петрова_ма@mail.ru
788	Сидорова Наталья	+79845067090	сидорова.н@mail.ru
789	Васильев Андрей	+79165785483	васильев_а@mail.ru
790	Кузнецова Наталья	+79786317784	кузнецова.на@mail.ru
791	Петров Максим	+79835404381	петровмак@yandex.ru
792	Сидорова Анна	+79343679016	сидорова_ан@gmail.com
793	Смирнова Наталья	+79305612501	смирнова.нат@gmail.com
794	Петрова Мария	+79265684013	петрова_ма@mail.ru
795	Сидоров Сергей	+79151022301	сидоров.се@mail.ru
796	Иванов Максим	+79682645244	ивановма@example.com
797	Кузнецова Ольга	+79631474236	кузнецова_о@mail.ru
798	Кузнецов Александр	+79242618105	кузнецов.але@example.com
799	Сидорова Ирина	+79165026607	сидорова.ири@hotmail.com
800	Сидорова Мария	+79961504414	сидорова_мар@mail.ru
801	Васильева Елена	+79443993317	васильева_е@yandex.ru
802	Попов Дмитрий	+79161596571	попов.дм@hotmail.com
803	Кузнецова Ирина	+79251131047	кузнецова_и@example.com
804	Сидоров Андрей	+79534902134	сидорованд@hotmail.com
805	Кузнецова Елена	+79404567402	кузнецоваел@hotmail.com
806	Петров Дмитрий	+79264463076	петров.дм@gmail.com
807	Сидоров Андрей	+79564244829	сидоров_анд@yandex.ru
808	Кузнецова Ирина	+79278458340	кузнецова.и@mail.ru
809	Кузнецов Максим	+79688303205	кузнецов_ма@yandex.ru
810	Смирнов Алексей	+79138348792	смирнов_але@yandex.ru
811	Иванова Мария	+79749488755	иванова_ма@hotmail.com
812	Попов Александр	+79444077655	попов.а@mail.ru
813	Смирнов Максим	+79883382729	смирновм@gmail.com
814	Иванов Максим	+79181482913	ивановмак@example.com
815	Петрова Ольга	+79691015515	петровао@hotmail.com
816	Петров Сергей	+79677361339	петров.се@mail.ru
817	Смирнов Александр	+79401441789	смирнов_а@example.com
818	Кузнецов Сергей	+79646305459	кузнецов_сер@hotmail.com
819	Попов Сергей	+79781135399	поповсе@gmail.com
820	Петров Максим	+79162193497	петровма@gmail.com
821	Кузнецова Ирина	+79267755290	кузнецова.ир@gmail.com
822	Кузнецов Алексей	+79167148415	кузнецова@gmail.com
823	Смирнова Анна	+79525580906	смирнова.ан@example.com
824	Кузнецов Андрей	+79356802608	кузнецов.ан@mail.ru
825	Васильева Ирина	+79504515640	васильеваири@yandex.ru
826	Васильева Анна	+79503366995	васильева.а@mail.ru
827	Сидоров Дмитрий	+79554627870	сидоров_дми@mail.ru
828	Кузнецова Анна	+79655372765	кузнецоваа@hotmail.com
829	Попова Наталья	+79839161887	попован@mail.ru
830	Петрова Наталья	+79401899852	петрова.на@gmail.com
831	Смирнов Дмитрий	+79596022275	смирнов_д@mail.ru
832	Сидорова Анна	+79176079989	сидорова_анн@mail.ru
833	Сидоров Максим	+79962626087	сидоров_м@yandex.ru
834	Кузнецова Наталья	+79626233669	кузнецова.нат@hotmail.com
835	Петрова Елена	+79825348265	петрова_ел@mail.ru
836	Смирнов Максим	+79929763062	смирнов.м@mail.ru
837	Попова Анна	+79572075981	попова.а@hotmail.com
838	Сидоров Алексей	+79135094679	сидоров_але@gmail.com
839	Васильева Мария	+79384849022	васильевамар@example.com
840	Кузнецов Сергей	+79453658739	кузнецов_сер@example.com
841	Смирнова Мария	+79851519480	смирнова.ма@gmail.com
842	Петров Андрей	+79573438547	петрова@yandex.ru
843	Петрова Мария	+79754093635	петрова.мар@hotmail.com
844	Попов Андрей	+79104219049	попов.анд@yandex.ru
845	Иванова Ирина	+79969316720	иванова_ир@gmail.com
846	Сидоров Андрей	+79357775127	сидоров_а@mail.ru
847	Иванова Ирина	+79805703763	иванова_и@mail.ru
848	Петрова Мария	+79457469177	петрова_м@gmail.com
849	Иванов Максим	+79775369670	иванов_ма@yandex.ru
850	Попова Наталья	+79516010159	попованат@gmail.com
851	Васильев Дмитрий	+79291115421	васильевдм@mail.ru
852	Кузнецова Анна	+79481889730	кузнецоваа@mail.ru
853	Сидоров Александр	+79885457314	сидоровале@gmail.com
854	Смирнова Мария	+79168681720	смирнова_м@example.com
855	Кузнецова Наталья	+79961538341	кузнецова_на@mail.ru
856	Иванова Елена	+79306410859	иванова.е@hotmail.com
857	Сидоров Алексей	+79511764870	сидоров.ал@gmail.com
858	Иванов Андрей	+79779621424	иванов.анд@gmail.com
859	Петрова Анна	+79383800101	петрова_а@mail.ru
860	Петрова Мария	+79716476687	петровамар@example.com
861	Попов Андрей	+79631243256	попов_ан@yandex.ru
862	Попов Алексей	+79619182229	попов.а@gmail.com
863	Петрова Наталья	+79551588517	петрова_на@gmail.com
864	Петрова Ирина	+79371330505	петрова_и@yandex.ru
865	Иванова Елена	+79332237381	иванова.е@hotmail.com
866	Попова Анна	+79952954770	поповаа@example.com
867	Васильев Александр	+79549276992	васильев.але@hotmail.com
868	Сидоров Андрей	+79511068335	сидоров.анд@mail.ru
869	Иванов Максим	+79659924321	иванов_м@hotmail.com
870	Попова Мария	+79457709401	попова.ма@example.com
871	Сидорова Елена	+79297456402	сидоровае@hotmail.com
872	Иванова Наталья	+79773066440	иванова_н@example.com
873	Петров Алексей	+79282348863	петровал@yandex.ru
874	Иванова Елена	+79636440929	иванова.е@hotmail.com
875	Кузнецова Ирина	+79695175814	кузнецоваири@yandex.ru
876	Васильева Анна	+79973740976	васильева_ан@hotmail.com
877	Смирнова Ирина	+79538937770	смирнова.и@mail.ru
878	Кузнецов Дмитрий	+79997558505	кузнецовдми@example.com
879	Кузнецова Елена	+79719195785	кузнецова_ел@hotmail.com
880	Петров Дмитрий	+79534061368	петровдми@hotmail.com
881	Иванов Сергей	+79245813173	иванов.се@mail.ru
882	Васильев Максим	+79599165593	васильев_м@hotmail.com
883	Попов Андрей	+79814047480	попов_а@mail.ru
884	Смирнов Алексей	+79315585864	смирновал@gmail.com
885	Смирнова Елена	+79476800207	смирноваеле@hotmail.com
886	Попов Алексей	+79414259910	попова@gmail.com
887	Кузнецов Андрей	+79118860853	кузнецов_а@hotmail.com
888	Попов Андрей	+79999432709	попов.анд@gmail.com
889	Кузнецов Алексей	+79582552538	кузнецов_ал@hotmail.com
890	Кузнецов Дмитрий	+79269145797	кузнецов.д@gmail.com
891	Петрова Ирина	+79489657393	петрова_ир@gmail.com
892	Попов Максим	+79465386161	попов_ма@example.com
893	Сидорова Ирина	+79461875429	сидороваи@gmail.com
894	Петров Александр	+79595755633	петрова@hotmail.com
895	Сидоров Алексей	+79313005197	сидоровале@example.com
896	Сидорова Мария	+79831145094	сидоровам@yandex.ru
897	Иванова Ольга	+79207899825	ивановаоль@hotmail.com
898	Смирнов Андрей	+79116959991	смирнов_анд@gmail.com
899	Кузнецов Дмитрий	+79853418820	кузнецов_дми@example.com
900	Васильев Сергей	+79542655889	васильев.се@hotmail.com
901	Кузнецова Мария	+79512845896	кузнецова.мар@yandex.ru
902	Петрова Елена	+79538752260	петрова_е@example.com
903	Петров Андрей	+79885019286	петрован@yandex.ru
904	Смирнов Александр	+79497202923	смирновале@hotmail.com
905	Попов Алексей	+79314624349	попов_ал@hotmail.com
906	Петров Дмитрий	+79641951519	петров_д@yandex.ru
907	Васильева Наталья	+79191378044	васильеван@hotmail.com
909	Сидорова Анна	+79784084918	сидороваанн@yandex.ru
910	Кузнецов Алексей	+79395100811	кузнецов.ал@example.com
911	Сидорова Мария	+79668561882	сидорова_м@yandex.ru
912	Сидоров Дмитрий	+79604082620	сидоров_дм@yandex.ru
913	Смирнова Елена	+79227060167	смирнова_еле@yandex.ru
914	Кузнецова Ольга	+79937521021	кузнецоваоль@yandex.ru
915	Сидорова Анна	+79567217032	сидороваан@example.com
916	Иванова Ирина	+79826860610	иванова.и@yandex.ru
917	Васильев Дмитрий	+79971496067	васильев.д@gmail.com
918	Смирнова Анна	+79112240569	смирноваанн@hotmail.com
919	Сидоров Алексей	+79375963909	сидоров_але@yandex.ru
920	Смирнова Елена	+79615635499	смирновае@example.com
921	Кузнецов Александр	+79617562859	кузнецов_ал@gmail.com
922	Попов Дмитрий	+79666459208	попов_дми@yandex.ru
923	Смирнова Мария	+79219200214	смирнова_мар@yandex.ru
924	Васильева Ирина	+79285225788	васильева.ири@example.com
925	Васильев Алексей	+79867327474	васильев.ал@example.com
926	Сидоров Сергей	+79435878227	сидоров.с@hotmail.com
927	Сидорова Анна	+79938200838	сидорова_а@gmail.com
928	Попов Александр	+79483923873	попов_а@yandex.ru
929	Васильева Мария	+79711482421	васильева_ма@mail.ru
930	Сидорова Елена	+79817813266	сидорова_ел@example.com
931	Смирнова Ольга	+79309394608	смирноваол@yandex.ru
932	Сидорова Анна	+79967768803	сидорова_ан@yandex.ru
933	Петрова Елена	+79205451156	петрова_еле@gmail.com
934	Кузнецова Анна	+79611466581	кузнецова_анн@gmail.com
935	Попова Наталья	+79355867161	попова.на@hotmail.com
936	Кузнецова Анна	+79888248737	кузнецоваа@example.com
937	Попова Мария	+79254586452	попова.мар@yandex.ru
938	Попова Ирина	+79122075839	попова_ири@yandex.ru
939	Попова Анна	+79332743959	попова_анн@example.com
940	Кузнецова Мария	+79864081101	кузнецовам@hotmail.com
941	Сидоров Алексей	+79419662902	сидорова@gmail.com
942	Попова Елена	+79325532715	поповаел@gmail.com
943	Васильев Андрей	+79339619202	васильев.анд@yandex.ru
944	Сидоров Сергей	+79398634999	сидоровсер@example.com
945	Смирнова Ирина	+79523670518	смирнова_ири@hotmail.com
946	Кузнецова Елена	+79593671166	кузнецова_е@yandex.ru
947	Васильева Анна	+79646735740	васильева.а@hotmail.com
948	Смирнов Андрей	+79704703334	смирнов_анд@gmail.com
949	Васильева Анна	+79186699090	васильеваа@yandex.ru
950	Васильев Алексей	+79355377101	васильев_а@example.com
951	Сидорова Елена	+79712016875	сидорова_е@yandex.ru
952	Смирнов Александр	+79726347924	смирнов_але@gmail.com
953	Петров Алексей	+79199473785	петров.але@hotmail.com
954	Сидоров Андрей	+79555729309	сидоров_ан@mail.ru
955	Кузнецов Алексей	+79947716635	кузнецов_ал@yandex.ru
956	Петрова Наталья	+79497870035	петрована@gmail.com
957	Попова Наталья	+79771939016	попова.на@example.com
958	Сидорова Мария	+79316236896	сидоровама@example.com
959	Сидорова Ирина	+79222696628	сидорова.и@hotmail.com
960	Васильев Александр	+79155550984	васильевал@hotmail.com
961	Петров Сергей	+79589634812	петровсер@gmail.com
962	Кузнецов Андрей	+79522074572	кузнецова@mail.ru
963	Петров Андрей	+79606630604	петров.анд@gmail.com
964	Попова Елена	+79498427056	поповаел@mail.ru
965	Иванов Дмитрий	+79806088627	иванов_дм@hotmail.com
966	Кузнецов Алексей	+79659045552	кузнецова@gmail.com
967	Васильев Сергей	+79752574804	васильев_с@example.com
968	Кузнецова Елена	+79756916192	кузнецова.ел@yandex.ru
969	Васильева Анна	+79643321304	васильева_анн@yandex.ru
970	Попов Дмитрий	+79145205663	поповд@example.com
971	Кузнецов Андрей	+79128030053	кузнецов.а@hotmail.com
972	Сидоров Дмитрий	+79983938860	сидоров_дми@example.com
973	Петрова Ольга	+79362738616	петрова.ол@yandex.ru
974	Васильев Александр	+79138248882	васильева@mail.ru
975	Иванов Андрей	+79443599174	иванов.а@gmail.com
976	Петрова Елена	+79322223100	петроваеле@mail.ru
977	Сидорова Ирина	+79633510465	сидорова_и@yandex.ru
978	Смирнов Александр	+79584430432	смирнов_а@example.com
979	Иванов Александр	+79578882293	ивановал@mail.ru
980	Попова Анна	+79551296228	попова_анн@hotmail.com
981	Васильева Наталья	+79176773262	васильева_на@yandex.ru
982	Попов Сергей	+79114620827	попов_с@yandex.ru
983	Смирнов Дмитрий	+79902674305	смирновд@mail.ru
984	Сидоров Александр	+79115651014	сидоров_але@example.com
985	Попов Александр	+79264126763	поповал@yandex.ru
986	Кузнецов Андрей	+79876252053	кузнецован@example.com
987	Васильев Сергей	+79309148095	васильев_сер@example.com
988	Васильев Дмитрий	+79603808720	васильев_д@gmail.com
989	Васильева Мария	+79578540223	васильева.ма@gmail.com
990	Смирнова Мария	+79626733602	смирновама@mail.ru
991	Иванов Дмитрий	+79916531048	ивановд@gmail.com
992	Смирнов Александр	+79675191138	смирнова@mail.ru
993	Иванова Анна	+79771884074	ивановаан@gmail.com
994	Кузнецов Андрей	+79945674324	кузнецова@mail.ru
995	Сидоров Андрей	+79457536805	сидоров_анд@example.com
996	Петров Сергей	+79704609601	петровс@yandex.ru
997	Сидоров Алексей	+79527407926	сидоров.а@hotmail.com
998	Сидорова Наталья	+79862483133	сидорова_н@mail.ru
999	Кузнецов Сергей	+79702918751	кузнецов.сер@gmail.com
1000	Попов Алексей	+79229985725	поповале@gmail.com
\.


                                                                                                                                                  4938.dat                                                                                            0000600 0004000 0002000 00000007410 14771407746 0014304 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2023-01-01	2023-08-29	SPA
2	2023-04-01	2024-02-17	Wi-Fi
3	2023-04-01	2023-09-03	Wi-Fi
4	2023-07-01	2024-01-09	Кондиционер
5	2023-09-01	2024-08-22	Бассейн
6	2023-12-01	2024-09-08	Бассейн
7	2023-11-01	2024-09-06	Завтрак
8	2023-10-01	2024-03-21	Кондиционер
9	2023-12-01	2024-04-07	Бассейн
10	2023-04-01	2023-07-10	Бар
11	2023-10-01	2024-04-02	Тренажерный зал
12	2023-07-01	2024-01-21	Бассейн
13	2023-04-01	2023-07-29	Бассейн
14	2023-07-01	2024-03-27	SPA
15	2023-05-01	2023-09-13	SPA
16	2023-02-01	2023-10-27	Терраса
17	2023-06-01	2023-10-19	Бассейн
18	2023-05-01	2024-04-04	Бар
19	2023-03-01	2023-03-31	SPA
20	2023-07-01	2024-03-14	SPA
21	2023-02-01	2023-03-16	Терраса
22	2023-12-01	2024-02-01	Бар
23	2023-07-01	2023-12-14	SPA
24	2023-06-01	2023-11-13	Wi-Fi
25	2023-04-01	2024-03-06	Бар
26	2023-11-01	2024-04-24	Тренажерный зал
27	2023-01-01	2023-12-27	Wi-Fi
28	2023-12-01	2024-07-25	Терраса
29	2023-01-01	2023-09-22	Парковка
30	2023-07-01	2023-08-11	Кондиционер
31	2023-12-01	2024-06-18	Завтрак
32	2023-12-01	2024-03-22	Бар
33	2023-11-01	2024-04-02	Wi-Fi
34	2023-06-01	2023-08-05	Бассейн
35	2023-08-01	2024-05-16	Кондиционер
36	2023-08-01	2023-10-12	Тренажерный зал
37	2023-01-01	2023-10-20	Wi-Fi
38	2023-03-01	2024-02-29	SPA
39	2023-04-01	2023-09-21	Бар
40	2023-11-01	2024-02-11	SPA
41	2023-08-01	2024-06-07	Бассейн
42	2023-01-01	2023-07-27	Тренажерный зал
43	2023-06-01	2023-10-16	Тренажерный зал
44	2023-01-01	2023-08-23	Бассейн
45	2023-04-01	2023-09-20	Wi-Fi
46	2023-12-01	2024-06-18	Парковка
47	2023-04-01	2024-02-19	Тренажерный зал
48	2023-01-01	2023-06-14	Wi-Fi
49	2023-10-01	2024-04-06	Бар
50	2023-12-01	2024-11-14	Бассейн
51	2023-03-01	2023-05-18	Терраса
52	2023-04-01	2023-08-29	Тренажерный зал
53	2023-04-01	2024-01-24	Бар
54	2023-08-01	2024-04-20	SPA
55	2023-10-01	2023-11-05	Wi-Fi
56	2023-01-01	2023-02-17	Бассейн
57	2023-07-01	2023-10-03	Завтрак
58	2023-06-01	2024-03-06	Wi-Fi
59	2023-12-01	2024-02-19	Кондиционер
60	2023-04-01	2023-11-04	Бар
61	2023-09-01	2024-02-26	Тренажерный зал
62	2023-01-01	2023-09-04	Парковка
63	2023-11-01	2024-10-22	Wi-Fi
64	2023-10-01	2024-08-02	Терраса
65	2023-04-01	2024-01-21	Терраса
66	2023-08-01	2024-05-31	Терраса
67	2023-05-01	2023-09-01	Бар
68	2023-01-01	2023-05-16	SPA
69	2023-03-01	2023-12-16	Терраса
70	2023-01-01	2023-04-05	Терраса
71	2023-06-01	2024-05-17	Терраса
72	2023-11-01	2024-06-21	Бассейн
73	2023-02-01	2023-08-30	SPA
74	2023-04-01	2023-11-23	Бар
75	2023-07-01	2024-06-10	SPA
76	2023-03-01	2023-10-15	Бассейн
77	2023-09-01	2023-10-09	Тренажерный зал
78	2023-04-01	2023-12-27	SPA
79	2023-12-01	2024-01-15	Парковка
80	2023-06-01	2024-02-02	Бар
81	2023-08-01	2024-06-22	Бар
82	2023-02-01	2023-12-14	Кондиционер
83	2023-02-01	2023-09-14	Парковка
84	2023-06-01	2023-11-15	Парковка
85	2023-07-01	2024-04-28	Wi-Fi
86	2023-05-01	2023-09-05	Парковка
87	2023-05-01	2024-04-26	Терраса
88	2023-03-01	2023-09-09	Бар
89	2023-03-01	2023-10-02	Парковка
90	2023-09-01	2024-03-03	Кондиционер
91	2023-07-01	2024-04-05	SPA
92	2023-08-01	2024-05-04	Завтрак
93	2023-10-01	2024-03-15	Кондиционер
94	2023-07-01	2023-12-21	Бассейн
95	2023-07-01	2024-05-22	Wi-Fi
96	2023-05-01	2023-06-15	Кондиционер
97	2023-07-01	2023-12-31	Бар
98	2023-09-01	2023-12-09	Парковка
99	2023-05-01	2024-04-20	Тренажерный зал
100	2023-05-01	2023-07-29	Парковка
\.


                                                                                                                                                                                                                                                        4920.dat                                                                                            0000600 0004000 0002000 00000152771 14771407746 0014306 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	Делюкс стандарт для людей с ограниченными возможностями	\N
2	2	Президентский студия с балконом	\N
3	3	Сьюит улучшенный	\N
4	4	Полулюкс стандарт	\N
5	5	Президентский люкс	\N
6	6	Дабл премиум	\N
7	7	Трехместный премиум угловой	\N
8	8	Пятиместный люкс	\N
9	9	Четырехместный стандарт	\N
10	10	Сьюит эконом с видом на море	\N
11	11	Трехместный премиум	\N
12	12	Сьюит апартаменты	\N
13	13	Четырехместный стандарт	\N
14	14	Четырехместный семейный	\N
15	15	Одноместный люкс	\N
16	16	Люкс люкс угловой	\N
17	17	Четырехместный улучшенный	\N
18	18	Одноместный улучшенный	\N
19	19	Пятиместный студия	\N
20	20	Делюкс улучшенный с видом на море	\N
21	21	Двухместный комфорт с камином	\N
22	22	Трехместный улучшенный	\N
23	23	Делюкс стандарт	\N
24	24	Пятиместный апартаменты с видом на море	\N
25	25	Трехместный улучшенный	\N
26	26	Четырехместный премиум	\N
27	27	Пятиместный семейный	\N
28	28	Полулюкс улучшенный	\N
29	29	Делюкс стандарт	\N
30	30	Люкс люкс	\N
31	31	Одноместный улучшенный	\N
32	32	Четырехместный эконом	\N
33	33	Четырехместный улучшенный с камином	\N
34	34	Трехместный студия	\N
35	35	Одноместный студия	\N
36	36	Люкс апартаменты с балконом	\N
37	37	Четырехместный комфорт угловой	\N
38	38	Полулюкс стандарт тематический	\N
39	39	Одноместный бизнес	\N
40	40	Одноместный семейный с видом на море	\N
41	41	Полулюкс бизнес для новобрачных	\N
42	42	Одноместный улучшенный	\N
43	43	Четырехместный стандарт для новобрачных	\N
44	44	Пятиместный студия	\N
45	45	Четырехместный люкс	\N
46	46	Делюкс люкс	\N
47	47	Пятиместный бизнес	\N
48	48	Люкс улучшенный	\N
49	49	Делюкс семейный угловой	\N
50	50	Люкс премиум	\N
51	51	Полулюкс люкс	\N
52	52	Четырехместный эконом	\N
53	53	Четырехместный стандарт	\N
54	54	Четырехместный бизнес	\N
55	55	Люкс студия	\N
56	56	Пятиместный комфорт	\N
57	57	Пятиместный семейный	\N
58	58	Люкс бизнес для новобрачных	\N
59	59	Сьюит комфорт	\N
60	60	Люкс комфорт	\N
61	61	Двухместный комфорт	\N
62	62	Пятиместный семейный	\N
63	63	Четырехместный комфорт	\N
64	64	Одноместный бизнес	\N
65	65	Делюкс премиум угловой	\N
66	66	Люкс улучшенный угловой	\N
67	67	Люкс студия для новобрачных	\N
68	68	Президентский студия	\N
69	69	Сьюит бизнес с балконом	\N
70	70	Делюкс студия для новобрачных	\N
71	71	Пятиместный студия	\N
72	72	Люкс премиум	\N
73	73	Четырехместный премиум	\N
74	74	Одноместный премиум	\N
75	75	Трехместный улучшенный	\N
76	76	Президентский апартаменты	\N
77	77	Пятиместный улучшенный	\N
78	78	Трехместный апартаменты	\N
79	79	Президентский апартаменты	\N
80	80	Дабл комфорт с балконом	\N
81	81	Сьюит семейный	\N
82	82	Делюкс бизнес	\N
83	83	Четырехместный студия	\N
84	84	Полулюкс эконом с камином	\N
85	85	Четырехместный улучшенный	\N
86	86	Одноместный студия с камином	\N
87	87	Сьюит апартаменты для новобрачных	\N
88	88	Двухместный студия	\N
89	89	Полулюкс стандарт	\N
90	90	Четырехместный студия для новобрачных	\N
91	91	Полулюкс стандарт	\N
92	92	Президентский семейный с камином	\N
93	93	Полулюкс премиум тематический	\N
94	94	Трехместный люкс с видом на море	\N
95	95	Одноместный эконом для новобрачных	\N
96	96	Четырехместный люкс тематический	\N
97	97	Сьюит бизнес с балконом	\N
390	390	Дабл семейный	\N
98	98	Сьюит премиум угловой	\N
99	99	Одноместный люкс для новобрачных	\N
100	100	Люкс премиум с балконом	\N
101	101	Люкс комфорт	\N
102	102	Люкс комфорт с балконом	\N
103	103	Двухместный бизнес	\N
104	104	Одноместный студия	\N
105	105	Четырехместный стандарт с камином	\N
106	106	Сьюит эконом для людей с ограниченными возможностями	\N
107	107	Сьюит улучшенный	\N
108	108	Люкс бизнес	\N
109	109	Делюкс стандарт	\N
110	110	Полулюкс апартаменты	\N
111	111	Трехместный стандарт	\N
112	112	Сьюит бизнес	\N
113	113	Президентский студия тематический	\N
114	114	Четырехместный премиум	\N
115	115	Двухместный студия	\N
116	116	Трехместный эконом	\N
117	117	Делюкс комфорт	\N
118	118	Пятиместный люкс	\N
119	119	Четырехместный люкс с видом на море	\N
120	120	Одноместный премиум	\N
121	121	Сьюит апартаменты	\N
122	122	Четырехместный люкс	\N
123	123	Президентский эконом	\N
124	124	Трехместный премиум	\N
125	125	Президентский комфорт угловой	\N
126	126	Трехместный люкс с видом на море	\N
127	127	Президентский семейный тематический	\N
128	128	Люкс стандарт	\N
129	129	Одноместный премиум	\N
130	130	Трехместный люкс для новобрачных	\N
131	131	Одноместный люкс	\N
132	132	Делюкс студия угловой	\N
133	133	Одноместный эконом угловой	\N
134	134	Люкс стандарт	\N
135	135	Полулюкс апартаменты с балконом	\N
136	136	Люкс комфорт	\N
137	137	Делюкс апартаменты	\N
138	138	Четырехместный премиум тематический	\N
139	139	Трехместный комфорт	\N
140	140	Люкс студия с камином	\N
141	141	Пятиместный семейный	\N
142	142	Президентский бизнес	\N
143	143	Трехместный комфорт с камином	\N
144	144	Четырехместный люкс	\N
145	145	Полулюкс студия для людей с ограниченными возможностями	\N
146	146	Делюкс студия тематический	\N
147	147	Президентский студия	\N
148	148	Люкс комфорт	\N
149	149	Двухместный стандарт	\N
150	150	Одноместный семейный с балконом	\N
151	151	Четырехместный эконом	\N
152	152	Четырехместный комфорт	\N
153	153	Делюкс студия	\N
154	154	Двухместный комфорт	\N
155	155	Сьюит премиум с балконом	\N
156	156	Люкс улучшенный	\N
157	157	Президентский комфорт	\N
158	158	Пятиместный комфорт с видом на море	\N
159	159	Люкс студия	\N
160	160	Пятиместный премиум	\N
161	161	Одноместный улучшенный	\N
162	162	Двухместный люкс	\N
163	163	Четырехместный премиум	\N
164	164	Сьюит эконом	\N
165	165	Сьюит апартаменты	\N
166	166	Двухместный апартаменты	\N
167	167	Четырехместный премиум с балконом	\N
168	168	Президентский стандарт тематический	\N
169	169	Полулюкс студия	\N
170	170	Двухместный стандарт	\N
171	171	Двухместный бизнес	\N
172	172	Одноместный люкс	\N
173	173	Четырехместный студия	\N
174	174	Полулюкс люкс для новобрачных	\N
175	175	Пятиместный семейный	\N
176	176	Двухместный люкс	\N
177	177	Четырехместный бизнес	\N
178	178	Делюкс люкс	\N
179	179	Президентский комфорт угловой	\N
180	180	Двухместный семейный	\N
181	181	Полулюкс люкс с балконом	\N
182	182	Двухместный премиум	\N
183	183	Люкс люкс	\N
184	184	Одноместный комфорт тематический	\N
185	185	Делюкс люкс	\N
186	186	Пятиместный комфорт	\N
187	187	Люкс апартаменты для людей с ограниченными возможностями	\N
188	188	Президентский стандарт	\N
189	189	Люкс студия с балконом	\N
190	190	Пятиместный бизнес	\N
191	191	Четырехместный комфорт	\N
192	192	Одноместный бизнес	\N
193	193	Одноместный стандарт угловой	\N
194	194	Двухместный бизнес	\N
195	195	Люкс стандарт	\N
196	196	Делюкс бизнес	\N
197	197	Полулюкс люкс с видом на море	\N
198	198	Делюкс комфорт	\N
199	199	Люкс премиум	\N
200	200	Полулюкс комфорт	\N
201	201	Президентский премиум угловой	\N
202	202	Полулюкс стандарт	\N
203	203	Одноместный семейный для людей с ограниченными возможностями	\N
204	204	Президентский улучшенный	\N
205	205	Трехместный бизнес	\N
206	206	Делюкс люкс	\N
207	207	Пятиместный комфорт	\N
208	208	Одноместный премиум	\N
209	209	Одноместный премиум	\N
210	210	Люкс комфорт	\N
211	211	Президентский люкс	\N
212	212	Сьюит апартаменты для новобрачных	\N
213	213	Люкс люкс	\N
214	214	Четырехместный семейный угловой	\N
215	215	Люкс стандарт	\N
216	216	Люкс семейный для людей с ограниченными возможностями	\N
217	217	Трехместный студия	\N
218	218	Сьюит улучшенный	\N
219	219	Делюкс стандарт	\N
220	220	Делюкс семейный	\N
221	221	Четырехместный улучшенный	\N
222	222	Одноместный семейный для людей с ограниченными возможностями	\N
223	223	Президентский бизнес для людей с ограниченными возможностями	\N
224	224	Делюкс комфорт	\N
225	225	Четырехместный семейный	\N
226	226	Четырехместный улучшенный	\N
227	227	Делюкс люкс	\N
228	228	Полулюкс бизнес	\N
229	229	Трехместный апартаменты	\N
230	230	Трехместный премиум	\N
231	231	Делюкс апартаменты	\N
232	232	Четырехместный улучшенный	\N
233	233	Четырехместный апартаменты с видом на море	\N
234	234	Делюкс бизнес с камином	\N
235	235	Люкс студия	\N
236	236	Полулюкс комфорт для людей с ограниченными возможностями	\N
237	237	Пятиместный премиум	\N
238	238	Люкс комфорт для людей с ограниченными возможностями	\N
239	239	Дабл семейный	\N
240	240	Полулюкс семейный	\N
241	241	Четырехместный семейный	\N
242	242	Трехместный бизнес с видом на море	\N
243	243	Делюкс семейный с балконом	\N
244	244	Пятиместный семейный для новобрачных	\N
245	245	Одноместный бизнес	\N
246	246	Одноместный улучшенный для новобрачных	\N
247	247	Четырехместный комфорт	\N
248	248	Четырехместный эконом	\N
249	249	Делюкс люкс	\N
250	250	Одноместный стандарт	\N
251	251	Сьюит эконом	\N
252	252	Пятиместный люкс	\N
253	253	Сингл эконом	\N
254	254	Делюкс улучшенный	\N
255	255	Пятиместный премиум с видом на море	\N
256	256	Сьюит семейный	\N
257	257	Сьюит премиум для новобрачных	\N
258	258	Люкс бизнес с камином	\N
259	259	Пятиместный комфорт с балконом	\N
260	260	Дабл апартаменты с видом на море	\N
261	261	Четырехместный люкс	\N
262	262	Президентский комфорт	\N
263	263	Одноместный бизнес	\N
264	264	Делюкс семейный	\N
265	265	Президентский эконом	\N
266	266	Двухместный комфорт с балконом	\N
267	267	Сьюит премиум	\N
268	268	Президентский улучшенный тематический	\N
269	269	Пятиместный эконом	\N
270	270	Трехместный эконом	\N
271	271	Двухместный эконом с камином	\N
272	272	Сьюит студия	\N
273	273	Делюкс улучшенный	\N
274	274	Сьюит семейный	\N
275	275	Пятиместный эконом	\N
276	276	Трехместный премиум	\N
277	277	Полулюкс студия	\N
278	278	Сингл эконом	\N
279	279	Делюкс улучшенный для людей с ограниченными возможностями	\N
280	280	Трехместный стандарт с камином	\N
281	281	Люкс бизнес с камином	\N
282	282	Одноместный стандарт	\N
283	283	Двухместный улучшенный	\N
284	284	Президентский эконом	\N
285	285	Сьюит бизнес	\N
286	286	Пятиместный апартаменты	\N
287	287	Полулюкс стандарт	\N
288	288	Сьюит стандарт угловой	\N
289	289	Сьюит комфорт	\N
290	290	Пятиместный улучшенный с видом на море	\N
291	291	Сьюит люкс	\N
292	292	Одноместный семейный	\N
293	293	Делюкс студия	\N
294	294	Трехместный комфорт	\N
295	295	Полулюкс студия	\N
296	296	Двухместный комфорт с балконом	\N
297	297	Президентский студия с камином	\N
298	298	Четырехместный эконом	\N
299	299	Сьюит улучшенный с камином	\N
300	300	Делюкс эконом	\N
301	301	Люкс комфорт	\N
302	302	Президентский эконом с камином	\N
303	303	Одноместный эконом для новобрачных	\N
304	304	Президентский комфорт	\N
305	305	Одноместный эконом	\N
306	306	Четырехместный люкс	\N
307	307	Сьюит студия	\N
308	308	Четырехместный бизнес с видом на море	\N
309	309	Пятиместный бизнес	\N
310	310	Делюкс комфорт с балконом	\N
311	311	Одноместный люкс	\N
312	312	Четырехместный люкс	\N
313	313	Одноместный бизнес	\N
314	314	Трехместный комфорт	\N
315	315	Одноместный студия для новобрачных	\N
316	316	Делюкс бизнес	\N
317	317	Пятиместный студия	\N
318	318	Президентский стандарт угловой	\N
319	319	Двухместный премиум с балконом	\N
320	320	Двухместный студия	\N
321	321	Президентский апартаменты с балконом	\N
322	322	Люкс эконом с видом на море	\N
323	323	Сьюит люкс для людей с ограниченными возможностями	\N
324	324	Президентский семейный тематический	\N
325	325	Одноместный семейный	\N
326	326	Четырехместный эконом	\N
327	327	Четырехместный стандарт	\N
328	328	Делюкс улучшенный	\N
329	329	Делюкс семейный	\N
330	330	Люкс стандарт	\N
331	331	Люкс семейный	\N
332	332	Полулюкс люкс	\N
333	333	Делюкс улучшенный угловой	\N
334	334	Трехместный комфорт	\N
335	335	Люкс люкс	\N
336	336	Полулюкс семейный с видом на море	\N
337	337	Одноместный премиум для людей с ограниченными возможностями	\N
338	338	Люкс семейный с балконом	\N
339	339	Трехместный улучшенный с балконом	\N
340	340	Четырехместный люкс	\N
341	341	Четырехместный премиум	\N
342	342	Сьюит студия угловой	\N
343	343	Одноместный апартаменты угловой	\N
344	344	Четырехместный эконом	\N
345	345	Четырехместный апартаменты	\N
346	346	Полулюкс стандарт	\N
347	347	Люкс комфорт	\N
348	348	Одноместный улучшенный	\N
349	349	Четырехместный семейный с видом на море	\N
350	350	Сьюит эконом	\N
351	351	Люкс семейный угловой	\N
352	352	Люкс апартаменты	\N
353	353	Двухместный студия с балконом	\N
354	354	Президентский комфорт	\N
355	355	Полулюкс эконом для людей с ограниченными возможностями	\N
356	356	Трехместный комфорт	\N
357	357	Президентский комфорт	\N
358	358	Президентский студия	\N
359	359	Четырехместный эконом	\N
360	360	Одноместный стандарт	\N
361	361	Делюкс комфорт для новобрачных	\N
362	362	Пятиместный улучшенный	\N
363	363	Президентский апартаменты	\N
364	364	Люкс студия	\N
365	365	Президентский эконом с балконом	\N
366	366	Делюкс люкс с балконом	\N
367	367	Одноместный улучшенный	\N
368	368	Президентский комфорт для новобрачных	\N
369	369	Президентский апартаменты	\N
370	370	Пятиместный студия	\N
371	371	Делюкс комфорт для новобрачных	\N
372	372	Двухместный комфорт с камином	\N
373	373	Четырехместный студия для людей с ограниченными возможностями	\N
374	374	Четырехместный люкс	\N
375	375	Трехместный бизнес	\N
376	376	Сьюит улучшенный	\N
377	377	Президентский улучшенный	\N
378	378	Полулюкс премиум	\N
379	379	Люкс комфорт	\N
380	380	Полулюкс премиум	\N
381	381	Делюкс улучшенный с видом на море	\N
382	382	Трехместный апартаменты с балконом	\N
383	383	Двухместный бизнес	\N
384	384	Люкс бизнес	\N
385	385	Пятиместный улучшенный тематический	\N
386	386	Пятиместный студия	\N
387	387	Люкс бизнес	\N
388	388	Сьюит стандарт	\N
389	389	Сьюит эконом	\N
391	391	Президентский апартаменты	\N
392	392	Пятиместный стандарт	\N
393	393	Сьюит апартаменты	\N
394	394	Пятиместный апартаменты	\N
395	395	Сьюит стандарт	\N
396	396	Люкс бизнес угловой	\N
397	397	Одноместный улучшенный для новобрачных	\N
398	398	Одноместный бизнес с камином	\N
399	399	Четырехместный премиум тематический	\N
400	400	Люкс премиум	\N
401	401	Делюкс бизнес	\N
402	402	Сьюит бизнес	\N
403	403	Сьюит стандарт с камином	\N
404	404	Двухместный премиум	\N
405	405	Делюкс стандарт	\N
406	406	Одноместный комфорт с камином	\N
407	407	Трехместный эконом для людей с ограниченными возможностями	\N
408	408	Сьюит эконом	\N
409	409	Одноместный эконом	\N
410	410	Четырехместный апартаменты угловой	\N
411	411	Пятиместный бизнес	\N
412	412	Четырехместный эконом	\N
413	413	Трехместный бизнес	\N
414	414	Сьюит премиум	\N
415	415	Полулюкс комфорт с видом на море	\N
416	416	Трехместный апартаменты	\N
417	417	Пятиместный апартаменты	\N
418	418	Президентский эконом угловой	\N
419	419	Люкс стандарт для новобрачных	\N
420	420	Одноместный эконом	\N
421	421	Четырехместный студия с балконом	\N
422	422	Президентский студия	\N
423	423	Люкс премиум	\N
424	424	Делюкс премиум	\N
425	425	Полулюкс люкс	\N
426	426	Трехместный бизнес	\N
427	427	Президентский эконом с камином	\N
428	428	Сьюит семейный	\N
429	429	Пятиместный стандарт с балконом	\N
430	430	Делюкс улучшенный	\N
431	431	Одноместный люкс угловой	\N
432	432	Одноместный семейный	\N
433	433	Четырехместный бизнес	\N
434	434	Полулюкс премиум	\N
435	435	Двухместный бизнес	\N
436	436	Люкс бизнес для новобрачных	\N
437	437	Пятиместный студия	\N
438	438	Люкс стандарт	\N
439	439	Двухместный семейный	\N
440	440	Пятиместный премиум	\N
441	441	Сьюит стандарт	\N
442	442	Пятиместный студия	\N
443	443	Полулюкс стандарт	\N
444	444	Делюкс эконом	\N
445	445	Пятиместный люкс	\N
446	446	Трехместный эконом	\N
447	447	Трехместный студия	\N
448	448	Трехместный люкс с балконом	\N
449	449	Люкс стандарт	\N
450	450	Трехместный стандарт	\N
451	451	Дабл семейный	\N
452	452	Люкс стандарт	\N
453	453	Трехместный комфорт	\N
454	454	Сьюит бизнес	\N
455	455	Президентский премиум с балконом	\N
456	456	Одноместный эконом	\N
457	457	Полулюкс семейный	\N
458	458	Президентский люкс угловой	\N
459	459	Двухместный люкс	\N
460	460	Одноместный улучшенный	\N
461	461	Четырехместный эконом тематический	\N
462	462	Четырехместный эконом с видом на море	\N
463	463	Полулюкс студия	\N
464	464	Одноместный бизнес	\N
465	465	Четырехместный стандарт	\N
466	466	Трехместный эконом	\N
467	467	Люкс улучшенный	\N
468	468	Трехместный семейный	\N
469	469	Делюкс апартаменты	\N
470	470	Четырехместный студия	\N
471	471	Люкс эконом с камином	\N
472	472	Одноместный премиум	\N
473	473	Президентский люкс	\N
474	474	Сьюит эконом	\N
475	475	Сьюит премиум	\N
476	476	Пятиместный эконом	\N
477	477	Делюкс премиум	\N
478	478	Пятиместный улучшенный	\N
479	479	Двухместный семейный тематический	\N
480	480	Четырехместный эконом	\N
481	481	Делюкс эконом	\N
482	482	Трехместный стандарт	\N
483	483	Двухместный семейный	\N
484	484	Люкс улучшенный	\N
485	485	Люкс улучшенный	\N
486	486	Делюкс стандарт	\N
487	487	Президентский стандарт с камином	\N
488	488	Люкс комфорт	\N
489	489	Делюкс комфорт угловой	\N
490	490	Сьюит люкс	\N
491	491	Сьюит студия	\N
492	492	Четырехместный эконом	\N
588	588	Полулюкс люкс	\N
493	493	Делюкс апартаменты тематический	\N
494	494	Люкс улучшенный	\N
495	495	Президентский люкс	\N
496	496	Президентский семейный с камином	\N
497	497	Четырехместный студия для людей с ограниченными возможностями	\N
498	498	Президентский премиум	\N
499	499	Двухместный премиум	\N
500	500	Пятиместный семейный	\N
501	501	Трехместный эконом	\N
502	502	Делюкс эконом с камином	\N
503	503	Двухместный апартаменты с камином	\N
504	504	Президентский стандарт	\N
505	505	Трехместный апартаменты	\N
506	506	Люкс апартаменты для людей с ограниченными возможностями	\N
507	507	Трехместный комфорт с камином	\N
508	508	Делюкс студия	\N
509	509	Делюкс люкс для новобрачных	\N
510	510	Сьюит улучшенный с балконом	\N
511	511	Четырехместный стандарт	\N
512	512	Полулюкс апартаменты	\N
513	513	Люкс стандарт	\N
514	514	Полулюкс улучшенный	\N
515	515	Делюкс стандарт	\N
516	516	Полулюкс апартаменты с камином	\N
517	517	Люкс эконом	\N
518	518	Пятиместный комфорт	\N
519	519	Пятиместный улучшенный с балконом	\N
520	520	Президентский семейный	\N
521	521	Делюкс семейный тематический	\N
522	522	Полулюкс улучшенный	\N
523	523	Трехместный бизнес	\N
524	524	Четырехместный стандарт угловой	\N
525	525	Президентский студия	\N
526	526	Двухместный апартаменты	\N
527	527	Полулюкс стандарт	\N
528	528	Полулюкс комфорт	\N
529	529	Трехместный улучшенный для новобрачных	\N
530	530	Делюкс эконом	\N
531	531	Двухместный апартаменты	\N
532	532	Одноместный стандарт	\N
533	533	Полулюкс люкс	\N
534	534	Четырехместный стандарт с видом на море	\N
535	535	Двухместный люкс тематический	\N
536	536	Двухместный люкс	\N
537	537	Одноместный премиум	\N
538	538	Трехместный студия	\N
539	539	Одноместный апартаменты с балконом	\N
540	540	Люкс люкс для новобрачных	\N
541	541	Сьюит стандарт	\N
542	542	Сьюит эконом угловой	\N
543	543	Двухместный премиум	\N
544	544	Делюкс улучшенный	\N
545	545	Одноместный семейный	\N
546	546	Одноместный комфорт тематический	\N
547	547	Полулюкс апартаменты угловой	\N
548	548	Сьюит апартаменты	\N
549	549	Трехместный стандарт	\N
550	550	Полулюкс комфорт	\N
551	551	Пятиместный бизнес с видом на море	\N
552	552	Президентский эконом	\N
553	553	Люкс бизнес	\N
554	554	Люкс семейный	\N
555	555	Трехместный семейный	\N
556	556	Люкс стандарт для людей с ограниченными возможностями	\N
557	557	Пятиместный бизнес	\N
558	558	Полулюкс апартаменты	\N
559	559	Сьюит комфорт	\N
560	560	Трехместный бизнес	\N
561	561	Сьюит премиум	\N
562	562	Полулюкс семейный	\N
563	563	Пятиместный семейный с балконом	\N
564	564	Делюкс стандарт	\N
565	565	Люкс апартаменты	\N
566	566	Люкс стандарт угловой	\N
567	567	Делюкс апартаменты с балконом	\N
568	568	Президентский премиум угловой	\N
569	569	Люкс студия с камином	\N
570	570	Двухместный премиум	\N
571	571	Президентский люкс	\N
572	572	Делюкс улучшенный с камином	\N
573	573	Люкс студия для новобрачных	\N
574	574	Делюкс бизнес	\N
575	575	Двухместный эконом для людей с ограниченными возможностями	\N
576	576	Сьюит эконом тематический	\N
577	577	Сьюит комфорт	\N
578	578	Люкс комфорт для новобрачных	\N
579	579	Двухместный улучшенный	\N
580	580	Дабл премиум	\N
581	581	Сьюит апартаменты	\N
582	582	Президентский апартаменты	\N
583	583	Президентский стандарт для людей с ограниченными возможностями	\N
584	584	Президентский улучшенный тематический	\N
585	585	Полулюкс комфорт	\N
586	586	Сьюит апартаменты с видом на море	\N
587	587	Пятиместный студия с балконом	\N
589	589	Двухместный бизнес	\N
590	590	Делюкс комфорт	\N
591	591	Президентский семейный	\N
592	592	Двухместный апартаменты	\N
593	593	Делюкс премиум	\N
594	594	Сьюит люкс	\N
595	595	Полулюкс эконом с балконом	\N
596	596	Двухместный люкс	\N
597	597	Сьюит люкс	\N
598	598	Делюкс семейный	\N
599	599	Президентский семейный угловой	\N
600	600	Сьюит бизнес	\N
601	601	Президентский комфорт	\N
602	602	Трехместный стандарт тематический	\N
603	603	Делюкс комфорт	\N
604	604	Полулюкс комфорт	\N
605	605	Делюкс студия тематический	\N
606	606	Одноместный бизнес	\N
607	607	Делюкс эконом	\N
608	608	Люкс студия	\N
609	609	Президентский премиум	\N
610	610	Президентский студия	\N
611	611	Пятиместный люкс	\N
612	612	Полулюкс комфорт для людей с ограниченными возможностями	\N
613	613	Делюкс апартаменты	\N
614	614	Двухместный люкс	\N
615	615	Президентский эконом	\N
616	616	Сьюит бизнес угловой	\N
617	617	Люкс улучшенный для людей с ограниченными возможностями	\N
618	618	Президентский семейный с балконом	\N
619	619	Пятиместный комфорт	\N
620	620	Полулюкс улучшенный	\N
621	621	Трехместный стандарт для людей с ограниченными возможностями	\N
622	622	Сингл комфорт	\N
623	623	Люкс улучшенный	\N
624	624	Полулюкс семейный	\N
625	625	Сьюит студия	\N
626	626	Люкс улучшенный с балконом	\N
627	627	Сьюит семейный	\N
628	628	Трехместный улучшенный	\N
629	629	Двухместный улучшенный	\N
630	630	Люкс бизнес	\N
631	631	Полулюкс комфорт с балконом	\N
632	632	Полулюкс эконом	\N
633	633	Четырехместный люкс	\N
634	634	Люкс стандарт	\N
635	635	Президентский премиум	\N
636	636	Трипл премиум	\N
637	637	Трехместный бизнес для людей с ограниченными возможностями	\N
638	638	Одноместный комфорт для людей с ограниченными возможностями	\N
639	639	Сьюит люкс	\N
640	640	Четырехместный улучшенный	\N
641	641	Делюкс премиум	\N
642	642	Сьюит апартаменты с балконом	\N
643	643	Трехместный эконом	\N
644	644	Одноместный премиум с балконом	\N
645	645	Одноместный люкс с балконом	\N
646	646	Трехместный семейный	\N
647	647	Трехместный стандарт с балконом	\N
648	648	Четырехместный премиум с видом на море	\N
649	649	Сьюит улучшенный	\N
650	650	Трехместный стандарт	\N
651	651	Президентский комфорт	\N
652	652	Делюкс семейный для новобрачных	\N
653	653	Полулюкс премиум	\N
654	654	Полулюкс апартаменты с камином	\N
655	655	Президентский апартаменты	\N
656	656	Люкс комфорт угловой	\N
657	657	Делюкс бизнес для людей с ограниченными возможностями	\N
658	658	Полулюкс семейный	\N
659	659	Пятиместный стандарт	\N
660	660	Сьюит семейный	\N
661	661	Двухместный люкс тематический	\N
662	662	Делюкс эконом	\N
663	663	Президентский стандарт	\N
664	664	Одноместный бизнес	\N
665	665	Пятиместный стандарт угловой	\N
666	666	Сьюит улучшенный	\N
667	667	Президентский стандарт	\N
668	668	Президентский семейный	\N
669	669	Двухместный апартаменты для людей с ограниченными возможностями	\N
670	670	Люкс эконом	\N
671	671	Трехместный студия	\N
672	672	Одноместный улучшенный для новобрачных	\N
673	673	Двухместный семейный	\N
674	674	Делюкс семейный	\N
675	675	Дабл комфорт	\N
676	676	Президентский апартаменты	\N
677	677	Полулюкс бизнес	\N
678	678	Пятиместный студия	\N
679	679	Сьюит комфорт с балконом	\N
680	680	Делюкс бизнес	\N
681	681	Пятиместный улучшенный тематический	\N
682	682	Полулюкс апартаменты	\N
683	683	Трехместный люкс с балконом	\N
684	684	Президентский студия тематический	\N
685	685	Люкс бизнес	\N
686	686	Полулюкс эконом с камином	\N
687	687	Трехместный студия	\N
688	688	Полулюкс премиум	\N
689	689	Двухместный бизнес	\N
690	690	Четырехместный люкс	\N
691	691	Президентский апартаменты	\N
692	692	Одноместный семейный	\N
693	693	Люкс премиум	\N
694	694	Президентский эконом для новобрачных	\N
695	695	Президентский бизнес угловой	\N
696	696	Пятиместный премиум для людей с ограниченными возможностями	\N
697	697	Делюкс улучшенный тематический	\N
698	698	Двухместный бизнес	\N
699	699	Делюкс люкс с видом на море	\N
700	700	Двухместный апартаменты	\N
701	701	Трехместный семейный с камином	\N
702	702	Трехместный улучшенный	\N
703	703	Сьюит стандарт	\N
704	704	Президентский эконом	\N
705	705	Сьюит семейный	\N
706	706	Двухместный апартаменты	\N
707	707	Четырехместный комфорт	\N
708	708	Делюкс бизнес	\N
709	709	Люкс бизнес для людей с ограниченными возможностями	\N
710	710	Пятиместный премиум для людей с ограниченными возможностями	\N
711	711	Президентский эконом	\N
712	712	Президентский эконом	\N
713	713	Четырехместный эконом	\N
714	714	Сьюит премиум	\N
715	715	Трехместный бизнес для людей с ограниченными возможностями	\N
716	716	Двухместный премиум	\N
717	717	Одноместный комфорт	\N
718	718	Трехместный эконом	\N
719	719	Трехместный комфорт тематический	\N
720	720	Пятиместный семейный	\N
721	721	Четырехместный эконом	\N
722	722	Полулюкс улучшенный для новобрачных	\N
723	723	Двухместный премиум	\N
724	724	Одноместный эконом с балконом	\N
725	725	Трехместный стандарт	\N
726	726	Сьюит премиум	\N
727	727	Люкс комфорт	\N
728	728	Делюкс апартаменты	\N
729	729	Четырехместный комфорт	\N
730	730	Люкс апартаменты	\N
731	731	Люкс комфорт	\N
732	732	Одноместный эконом	\N
733	733	Делюкс апартаменты	\N
734	734	Двухместный апартаменты	\N
735	735	Люкс семейный	\N
736	736	Двухместный эконом угловой	\N
737	737	Четырехместный улучшенный	\N
738	738	Пятиместный семейный с камином	\N
739	739	Делюкс эконом	\N
740	740	Президентский улучшенный с камином	\N
741	741	Делюкс студия с камином	\N
742	742	Пятиместный стандарт	\N
743	743	Полулюкс бизнес	\N
744	744	Пятиместный улучшенный тематический	\N
745	745	Полулюкс апартаменты	\N
746	746	Двухместный улучшенный	\N
747	747	Люкс эконом	\N
748	748	Трехместный премиум	\N
749	749	Сьюит улучшенный	\N
750	750	Сьюит семейный тематический	\N
751	751	Трехместный эконом угловой	\N
752	752	Одноместный семейный	\N
753	753	Сьюит стандарт для людей с ограниченными возможностями	\N
754	754	Люкс эконом с камином	\N
755	755	Одноместный стандарт	\N
756	756	Делюкс апартаменты	\N
757	757	Пятиместный бизнес	\N
758	758	Одноместный премиум с балконом	\N
759	759	Полулюкс премиум с видом на море	\N
760	760	Люкс семейный	\N
761	761	Одноместный апартаменты	\N
762	762	Делюкс апартаменты	\N
763	763	Двухместный семейный для людей с ограниченными возможностями	\N
764	764	Люкс студия тематический	\N
765	765	Дабл комфорт тематический	\N
766	766	Трехместный люкс с видом на море	\N
767	767	Четырехместный улучшенный	\N
768	768	Сьюит апартаменты	\N
769	769	Сьюит стандарт с видом на море	\N
770	770	Одноместный эконом	\N
771	771	Делюкс стандарт с балконом	\N
772	772	Делюкс люкс	\N
773	773	Люкс премиум	\N
774	774	Делюкс стандарт	\N
775	775	Президентский апартаменты	\N
776	776	Люкс студия	\N
777	777	Четырехместный люкс	\N
778	778	Сьюит стандарт	\N
779	779	Люкс комфорт	\N
780	780	Полулюкс бизнес	\N
781	781	Четырехместный семейный	\N
782	782	Сьюит эконом	\N
783	783	Сьюит люкс	\N
784	784	Сьюит бизнес	\N
785	785	Делюкс семейный	\N
786	786	Одноместный премиум для людей с ограниченными возможностями	\N
787	787	Двухместный семейный	\N
788	788	Люкс эконом	\N
789	789	Делюкс люкс с видом на море	\N
790	790	Президентский улучшенный	\N
791	791	Трехместный премиум	\N
792	792	Люкс студия	\N
793	793	Двухместный улучшенный с балконом	\N
794	794	Двухместный улучшенный	\N
795	795	Делюкс премиум для новобрачных	\N
796	796	Трехместный премиум с камином	\N
797	797	Делюкс эконом	\N
798	798	Двухместный комфорт	\N
799	799	Сьюит улучшенный	\N
800	800	Президентский стандарт	\N
801	801	Одноместный комфорт	\N
802	802	Сьюит премиум	\N
803	803	Трехместный семейный	\N
804	804	Пятиместный улучшенный	\N
805	805	Сьюит студия	\N
806	806	Полулюкс стандарт	\N
807	807	Одноместный бизнес с камином	\N
808	808	Пятиместный эконом	\N
809	809	Четырехместный стандарт	\N
810	810	Трехместный эконом	\N
811	811	Трехместный студия угловой	\N
812	812	Четырехместный бизнес тематический	\N
813	813	Президентский студия	\N
814	814	Делюкс премиум	\N
815	815	Трехместный люкс с видом на море	\N
816	816	Одноместный премиум	\N
817	817	Одноместный семейный	\N
818	818	Люкс студия с балконом	\N
819	819	Делюкс стандарт	\N
820	820	Пятиместный семейный	\N
821	821	Одноместный студия для людей с ограниченными возможностями	\N
822	822	Двухместный эконом	\N
823	823	Двухместный эконом	\N
824	824	Четырехместный улучшенный	\N
825	825	Президентский стандарт угловой	\N
826	826	Президентский комфорт	\N
827	827	Сьюит стандарт	\N
828	828	Полулюкс комфорт с балконом	\N
829	829	Люкс комфорт угловой	\N
830	830	Пятиместный люкс с балконом	\N
831	831	Четырехместный студия для новобрачных	\N
832	832	Люкс комфорт	\N
833	833	Сингл студия	\N
834	834	Делюкс премиум	\N
835	835	Пятиместный бизнес угловой	\N
836	836	Одноместный улучшенный	\N
837	837	Президентский стандарт	\N
838	838	Люкс эконом	\N
839	839	Четырехместный семейный	\N
840	840	Двухместный премиум	\N
841	841	Четырехместный апартаменты	\N
842	842	Двухместный эконом для людей с ограниченными возможностями	\N
843	843	Люкс семейный	\N
844	844	Четырехместный студия для людей с ограниченными возможностями	\N
845	845	Трехместный стандарт	\N
846	846	Люкс улучшенный	\N
847	847	Трехместный комфорт	\N
848	848	Трехместный бизнес	\N
849	849	Трехместный премиум	\N
850	850	Полулюкс студия	\N
851	851	Делюкс эконом с камином	\N
852	852	Четырехместный комфорт	\N
853	853	Трипл стандарт с балконом	\N
854	854	Двухместный апартаменты с балконом	\N
855	855	Трехместный бизнес для новобрачных	\N
856	856	Делюкс комфорт с камином	\N
857	857	Трипл студия тематический	\N
858	858	Полулюкс премиум с камином	\N
859	859	Двухместный студия	\N
860	860	Пятиместный стандарт	\N
861	861	Четырехместный премиум	\N
862	862	Делюкс стандарт для новобрачных	\N
863	863	Сьюит апартаменты	\N
864	864	Одноместный студия	\N
865	865	Четырехместный стандарт	\N
866	866	Делюкс комфорт с видом на море	\N
867	867	Люкс студия с балконом	\N
868	868	Пятиместный семейный	\N
869	869	Президентский премиум	\N
870	870	Трехместный комфорт	\N
871	871	Двухместный премиум	\N
872	872	Президентский апартаменты	\N
873	873	Делюкс апартаменты угловой	\N
874	874	Четырехместный семейный	\N
875	875	Президентский бизнес с балконом	\N
876	876	Трехместный люкс	\N
877	877	Делюкс стандарт	\N
878	878	Делюкс студия с камином	\N
879	879	Президентский премиум тематический	\N
880	880	Дабл семейный	\N
881	881	Одноместный стандарт	\N
882	882	Одноместный студия	\N
883	883	Двухместный стандарт	\N
884	884	Полулюкс комфорт	\N
885	885	Одноместный бизнес для новобрачных	\N
886	886	Сьюит апартаменты	\N
887	887	Сьюит премиум	\N
888	888	Трехместный улучшенный	\N
889	889	Трехместный премиум	\N
890	890	Сьюит семейный	\N
891	891	Сьюит студия с камином	\N
892	892	Одноместный люкс	\N
893	893	Четырехместный эконом с балконом	\N
894	894	Трехместный люкс тематический	\N
895	895	Четырехместный бизнес с видом на море	\N
896	896	Делюкс премиум с видом на море	\N
897	897	Сьюит люкс	\N
898	898	Полулюкс апартаменты с балконом	\N
899	899	Одноместный эконом	\N
900	900	Полулюкс апартаменты	\N
901	901	Одноместный стандарт	\N
902	902	Делюкс семейный	\N
903	903	Трипл премиум	\N
904	904	Делюкс улучшенный с камином	\N
905	905	Полулюкс бизнес	\N
906	906	Делюкс комфорт	\N
907	907	Сьюит эконом	\N
908	908	Четырехместный люкс	\N
909	909	Президентский эконом	\N
910	910	Трехместный стандарт	\N
911	911	Пятиместный студия	\N
912	912	Делюкс студия	\N
913	913	Делюкс семейный	\N
914	914	Одноместный премиум	\N
915	915	Четырехместный комфорт	\N
916	916	Люкс студия для новобрачных	\N
917	917	Трехместный семейный	\N
918	918	Люкс эконом с видом на море	\N
919	919	Сьюит студия	\N
920	920	Пятиместный стандарт	\N
921	921	Полулюкс эконом	\N
922	922	Трехместный стандарт	\N
923	923	Четырехместный премиум тематический	\N
924	924	Трипл улучшенный с камином	\N
925	925	Люкс премиум	\N
926	926	Люкс комфорт для людей с ограниченными возможностями	\N
927	927	Двухместный комфорт	\N
928	928	Двухместный апартаменты	\N
929	929	Пятиместный эконом	\N
930	930	Президентский стандарт угловой	\N
931	931	Люкс студия	\N
932	932	Полулюкс эконом	\N
933	933	Трехместный улучшенный с камином	\N
934	934	Сьюит люкс для новобрачных	\N
935	935	Пятиместный апартаменты	\N
936	936	Двухместный люкс	\N
937	937	Делюкс люкс	\N
938	938	Четырехместный апартаменты	\N
939	939	Сингл люкс тематический	\N
940	940	Делюкс бизнес для людей с ограниченными возможностями	\N
941	941	Сьюит семейный	\N
942	942	Полулюкс семейный	\N
943	943	Одноместный премиум для людей с ограниченными возможностями	\N
944	944	Сьюит апартаменты	\N
945	945	Люкс премиум	\N
946	946	Президентский комфорт угловой	\N
947	947	Пятиместный студия с балконом	\N
948	948	Сьюит семейный	\N
949	949	Делюкс премиум	\N
950	950	Четырехместный эконом угловой	\N
951	951	Полулюкс люкс	\N
952	952	Люкс комфорт	\N
953	953	Трехместный семейный	\N
954	954	Сьюит премиум с камином	\N
955	955	Президентский улучшенный	\N
956	956	Одноместный улучшенный	\N
957	957	Пятиместный премиум	\N
958	958	Люкс эконом	\N
959	959	Четырехместный комфорт	\N
960	960	Четырехместный премиум	\N
961	961	Полулюкс семейный тематический	\N
962	962	Пятиместный стандарт	\N
963	963	Сингл люкс	\N
964	964	Полулюкс бизнес	\N
965	965	Трехместный комфорт	\N
966	966	Президентский апартаменты	\N
967	967	Двухместный стандарт	\N
968	968	Трехместный студия	\N
969	969	Сьюит эконом	\N
970	970	Трехместный улучшенный	\N
971	971	Полулюкс люкс	\N
972	972	Пятиместный семейный	\N
973	973	Президентский бизнес	\N
974	974	Трехместный люкс тематический	\N
975	975	Сьюит семейный	\N
976	976	Четырехместный комфорт для людей с ограниченными возможностями	\N
977	977	Пятиместный студия	\N
978	978	Двухместный премиум	\N
979	979	Пятиместный семейный	\N
980	980	Четырехместный стандарт	\N
981	981	Президентский улучшенный	\N
982	982	Делюкс бизнес тематический	\N
983	983	Сьюит апартаменты	\N
984	984	Сьюит комфорт	\N
985	985	Дабл комфорт	\N
986	986	Двухместный семейный с камином	\N
987	987	Президентский студия	\N
988	988	Делюкс апартаменты с балконом	\N
989	989	Президентский премиум с балконом	\N
990	990	Президентский люкс	\N
991	991	Одноместный семейный тематический	\N
992	992	Трехместный премиум для новобрачных	\N
993	993	Сьюит премиум	\N
994	994	Пятиместный стандарт	\N
995	995	Одноместный люкс	\N
996	996	Полулюкс эконом для новобрачных	\N
997	997	Люкс студия с балконом	\N
998	998	Полулюкс студия	\N
999	999	Делюкс премиум	\N
1000	1000	Одноместный улучшенный	\N
\.


       4935.dat                                                                                            0000600 0004000 0002000 00000137433 14771407746 0014312 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2023-03-03	t	Иванова А.Н.	70	440
2	2023-01-02	t	Николаева Л.М.	365	442
3	2023-10-15	t	Сидорова Е.В.	10	597
4	2023-08-27	t	Петрова М.С.	780	376
5	2023-06-06	t	Смирнова Т.Д.	413	777
6	2023-09-01	t	Кузнецова О.П.	575	989
7	2023-01-03	t	Васильева И.А.	591	704
8	2023-07-16	t	Кузнецова О.П.	613	593
9	2023-08-12	t	Петрова М.С.	851	74
10	2023-09-05	t	Смирнова Т.Д.	218	769
11	2023-10-03	t	Сидорова Е.В.	890	654
12	2023-05-04	t	Федорова С.В.	413	379
13	2023-03-11	t	Федорова С.В.	482	796
14	2023-11-06	t	Николаева Л.М.	160	956
15	2023-11-24	t	Иванова А.Н.	537	495
16	2023-09-19	t	Сидорова Е.В.	487	379
17	2023-01-03	t	Федорова С.В.	471	901
18	2023-11-21	t	Смирнова Т.Д.	374	505
19	2023-06-20	t	Федорова С.В.	991	97
20	2023-08-25	t	Сидорова Е.В.	44	572
21	2023-09-22	t	Иванова А.Н.	750	910
22	2023-02-13	t	Петрова М.С.	822	557
23	2023-09-06	f	Николаева Л.М.	669	627
24	2023-02-14	t	Николаева Л.М.	237	14
25	2023-07-17	f	Кузнецова О.П.	702	438
26	2023-08-23	t	Иванова А.Н.	278	235
27	2023-08-09	t	Сидорова Е.В.	636	105
28	2023-08-03	t	Федорова С.В.	732	488
29	2023-01-08	t	Сидорова Е.В.	638	642
30	2023-04-21	t	Федорова С.В.	850	300
31	2023-10-20	t	Смирнова Т.Д.	387	814
32	2023-04-22	t	Николаева Л.М.	741	460
33	2023-06-01	t	Смирнова Т.Д.	280	770
34	2023-10-24	f	Кузнецова О.П.	647	54
35	2023-03-19	t	Петрова М.С.	929	537
36	2023-02-22	t	Иванова А.Н.	282	706
37	2023-09-03	t	Петрова М.С.	319	983
38	2023-11-20	t	Кузнецова О.П.	438	697
39	2023-06-26	t	Федорова С.В.	880	514
40	2023-11-03	t	Петрова М.С.	468	521
41	2023-05-26	t	Петрова М.С.	409	861
42	2023-12-06	t	Николаева Л.М.	208	359
43	2023-09-01	t	Федорова С.В.	25	767
44	2023-11-06	t	Кузнецова О.П.	695	377
45	2023-02-19	t	Сидорова Е.В.	14	354
46	2023-03-15	t	Петрова М.С.	291	105
47	2023-05-25	t	Кузнецова О.П.	266	198
48	2023-06-08	f	Смирнова Т.Д.	802	272
49	2023-07-24	t	Кузнецова О.П.	103	967
50	2023-08-21	t	Васильева И.А.	197	967
51	2023-11-30	f	Федорова С.В.	556	627
52	2023-08-14	t	Иванова А.Н.	155	624
53	2023-05-27	t	Иванова А.Н.	108	191
54	2023-11-29	t	Смирнова Т.Д.	635	413
55	2023-11-04	t	Федорова С.В.	975	167
56	2023-01-23	t	Васильева И.А.	79	385
57	2023-02-07	t	Петрова М.С.	953	816
58	2023-03-27	t	Кузнецова О.П.	931	57
59	2023-04-14	t	Николаева Л.М.	174	171
60	2023-11-19	t	Иванова А.Н.	744	107
61	2023-10-19	f	Иванова А.Н.	757	469
62	2023-12-13	t	Смирнова Т.Д.	745	882
63	2023-12-29	t	Васильева И.А.	225	849
64	2023-03-10	t	Смирнова Т.Д.	504	130
65	2023-05-12	t	Сидорова Е.В.	987	221
66	2023-07-19	t	Иванова А.Н.	453	427
67	2023-10-31	t	Васильева И.А.	391	126
68	2023-04-14	t	Смирнова Т.Д.	336	2
69	2023-01-29	f	Николаева Л.М.	255	967
70	2023-07-20	f	Иванова А.Н.	353	470
71	2023-04-17	t	Сидорова Е.В.	240	34
72	2023-08-09	t	Сидорова Е.В.	649	641
73	2023-03-12	t	Иванова А.Н.	997	21
74	2023-11-25	t	Федорова С.В.	383	204
75	2023-04-29	t	Смирнова Т.Д.	124	400
76	2023-04-02	t	Иванова А.Н.	956	552
77	2023-07-27	t	Николаева Л.М.	850	155
78	2023-04-12	t	Кузнецова О.П.	224	756
79	2023-10-22	t	Кузнецова О.П.	215	381
80	2023-12-02	t	Петрова М.С.	493	690
81	2023-10-14	t	Петрова М.С.	379	332
82	2023-01-22	t	Николаева Л.М.	345	300
83	2023-04-20	t	Кузнецова О.П.	154	939
84	2023-09-15	t	Федорова С.В.	302	796
85	2023-07-30	t	Федорова С.В.	896	516
86	2023-06-28	t	Кузнецова О.П.	354	441
87	2023-05-09	t	Васильева И.А.	377	882
88	2023-01-17	t	Петрова М.С.	831	345
89	2023-07-31	t	Иванова А.Н.	864	293
90	2023-07-06	t	Николаева Л.М.	729	56
91	2023-07-20	t	Николаева Л.М.	402	819
92	2023-05-13	t	Петрова М.С.	347	807
93	2023-12-19	t	Сидорова Е.В.	127	148
94	2023-02-09	t	Федорова С.В.	991	976
95	2023-02-22	t	Смирнова Т.Д.	796	586
96	2023-12-20	t	Иванова А.Н.	480	435
97	2023-02-24	t	Иванова А.Н.	333	52
98	2023-05-02	f	Кузнецова О.П.	768	618
99	2023-10-07	t	Иванова А.Н.	121	839
100	2023-03-27	t	Сидорова Е.В.	109	368
101	2023-09-18	t	Николаева Л.М.	481	152
102	2023-05-17	t	Петрова М.С.	478	485
103	2023-08-09	t	Петрова М.С.	202	22
104	2023-07-16	t	Сидорова Е.В.	908	676
105	2023-11-10	t	Кузнецова О.П.	207	786
106	2023-08-14	t	Васильева И.А.	768	782
107	2023-02-13	t	Иванова А.Н.	702	382
108	2023-03-17	t	Сидорова Е.В.	417	854
109	2023-04-08	t	Иванова А.Н.	721	89
110	2023-02-10	t	Петрова М.С.	988	581
111	2023-05-12	t	Иванова А.Н.	422	592
112	2023-12-07	f	Петрова М.С.	880	923
113	2023-01-23	t	Иванова А.Н.	110	168
114	2023-12-23	t	Федорова С.В.	541	796
115	2023-08-17	t	Николаева Л.М.	847	167
116	2023-10-04	t	Николаева Л.М.	666	957
117	2023-07-05	t	Иванова А.Н.	662	450
118	2023-03-27	t	Петрова М.С.	848	612
119	2023-06-25	t	Смирнова Т.Д.	276	446
120	2023-04-27	t	Смирнова Т.Д.	22	585
121	2023-11-05	t	Васильева И.А.	647	28
122	2023-04-08	t	Сидорова Е.В.	437	471
123	2023-04-06	t	Сидорова Е.В.	105	192
124	2023-06-07	t	Сидорова Е.В.	660	687
125	2023-10-11	t	Кузнецова О.П.	942	545
126	2023-10-11	t	Петрова М.С.	684	479
127	2023-04-28	t	Васильева И.А.	404	624
128	2023-03-22	t	Иванова А.Н.	484	788
129	2023-07-25	t	Петрова М.С.	227	471
130	2023-11-21	t	Иванова А.Н.	617	773
131	2023-08-09	t	Смирнова Т.Д.	815	389
132	2023-06-10	t	Федорова С.В.	978	391
133	2023-03-05	t	Петрова М.С.	336	808
134	2023-04-10	t	Кузнецова О.П.	18	989
135	2023-11-04	t	Петрова М.С.	70	492
136	2023-01-28	f	Иванова А.Н.	354	975
137	2023-01-22	t	Федорова С.В.	982	96
138	2023-12-22	t	Кузнецова О.П.	734	972
139	2023-01-08	t	Васильева И.А.	665	793
140	2023-02-03	t	Петрова М.С.	602	569
141	2023-08-23	t	Николаева Л.М.	270	965
142	2023-05-15	t	Кузнецова О.П.	867	726
143	2023-02-07	t	Иванова А.Н.	562	153
144	2023-04-06	t	Петрова М.С.	454	30
145	2023-05-05	t	Васильева И.А.	637	348
146	2023-02-01	t	Васильева И.А.	340	989
147	2023-07-20	t	Иванова А.Н.	790	384
148	2023-08-09	t	Петрова М.С.	985	571
149	2023-03-27	t	Федорова С.В.	462	880
150	2023-11-19	t	Кузнецова О.П.	874	139
151	2023-02-13	t	Николаева Л.М.	111	631
152	2023-12-06	t	Васильева И.А.	250	553
153	2023-11-25	t	Сидорова Е.В.	719	675
154	2023-04-25	t	Кузнецова О.П.	854	927
155	2023-02-12	f	Васильева И.А.	545	185
156	2023-09-01	t	Васильева И.А.	67	367
157	2023-03-06	t	Иванова А.Н.	183	75
158	2023-08-10	t	Иванова А.Н.	841	333
159	2023-05-28	t	Кузнецова О.П.	611	562
160	2023-06-19	t	Кузнецова О.П.	649	228
161	2023-11-06	t	Федорова С.В.	690	516
162	2023-05-30	t	Николаева Л.М.	27	142
163	2023-10-30	t	Николаева Л.М.	765	750
164	2023-09-30	t	Николаева Л.М.	897	926
165	2023-01-13	t	Николаева Л.М.	955	183
166	2023-04-14	t	Васильева И.А.	664	309
167	2023-05-01	t	Сидорова Е.В.	994	278
168	2023-01-01	t	Васильева И.А.	178	812
169	2023-06-18	t	Смирнова Т.Д.	331	658
170	2023-05-27	t	Петрова М.С.	461	485
171	2023-06-01	t	Федорова С.В.	897	782
172	2023-07-23	t	Сидорова Е.В.	492	229
173	2023-10-23	t	Кузнецова О.П.	235	948
174	2023-07-12	t	Николаева Л.М.	286	571
175	2023-12-11	t	Николаева Л.М.	231	359
176	2023-11-03	f	Кузнецова О.П.	316	729
177	2023-06-09	t	Сидорова Е.В.	401	850
178	2023-01-14	t	Кузнецова О.П.	708	669
179	2023-03-13	t	Сидорова Е.В.	906	897
180	2023-11-02	t	Иванова А.Н.	242	416
181	2023-05-19	f	Смирнова Т.Д.	684	369
182	2023-10-12	t	Кузнецова О.П.	762	849
183	2023-11-14	t	Федорова С.В.	410	981
184	2023-04-18	t	Николаева Л.М.	177	747
185	2023-05-13	t	Кузнецова О.П.	535	340
186	2023-03-19	t	Кузнецова О.П.	322	850
187	2023-01-23	t	Иванова А.Н.	835	12
188	2023-05-24	t	Васильева И.А.	570	995
189	2023-03-14	f	Смирнова Т.Д.	751	460
190	2023-02-27	t	Иванова А.Н.	813	278
191	2023-06-22	t	Смирнова Т.Д.	339	186
192	2023-06-23	t	Сидорова Е.В.	756	453
193	2023-07-30	t	Смирнова Т.Д.	766	255
194	2023-12-20	t	Николаева Л.М.	879	758
195	2023-05-20	t	Сидорова Е.В.	999	490
196	2023-02-17	t	Иванова А.Н.	556	877
197	2023-03-25	t	Иванова А.Н.	405	462
198	2023-10-29	t	Иванова А.Н.	195	677
199	2023-11-16	t	Сидорова Е.В.	742	305
200	2023-08-03	t	Васильева И.А.	868	45
201	2023-05-25	t	Смирнова Т.Д.	512	98
202	2023-12-01	t	Сидорова Е.В.	986	484
203	2023-11-13	t	Васильева И.А.	560	736
204	2023-08-28	f	Иванова А.Н.	819	749
205	2023-07-05	t	Иванова А.Н.	254	31
206	2023-09-27	t	Иванова А.Н.	575	217
207	2023-09-07	f	Николаева Л.М.	207	346
208	2023-11-29	t	Сидорова Е.В.	803	588
209	2023-12-12	t	Кузнецова О.П.	600	198
210	2023-09-17	t	Федорова С.В.	955	136
211	2023-01-01	t	Кузнецова О.П.	471	781
212	2023-09-27	t	Сидорова Е.В.	121	803
213	2023-02-18	t	Иванова А.Н.	953	853
214	2023-12-21	t	Федорова С.В.	277	866
215	2023-10-03	t	Смирнова Т.Д.	9	904
216	2023-12-16	t	Смирнова Т.Д.	19	493
217	2023-12-31	t	Федорова С.В.	414	719
218	2023-03-14	t	Петрова М.С.	971	297
219	2023-05-02	f	Федорова С.В.	838	460
220	2023-03-08	t	Петрова М.С.	583	815
221	2023-01-23	t	Смирнова Т.Д.	215	513
222	2023-11-24	t	Смирнова Т.Д.	501	243
223	2023-04-22	t	Петрова М.С.	110	275
224	2023-11-21	f	Кузнецова О.П.	426	321
225	2023-10-20	t	Иванова А.Н.	979	110
226	2023-08-24	t	Смирнова Т.Д.	914	358
227	2023-03-27	f	Николаева Л.М.	828	21
228	2023-07-15	t	Петрова М.С.	29	145
229	2023-07-28	t	Иванова А.Н.	717	210
230	2023-11-18	t	Васильева И.А.	523	323
231	2023-02-13	t	Сидорова Е.В.	352	237
232	2023-12-12	t	Васильева И.А.	804	946
233	2023-09-27	t	Смирнова Т.Д.	849	775
234	2023-07-27	t	Кузнецова О.П.	626	704
235	2023-08-03	t	Смирнова Т.Д.	241	94
236	2023-08-23	t	Федорова С.В.	755	905
237	2023-10-20	t	Иванова А.Н.	669	721
238	2023-05-02	t	Смирнова Т.Д.	479	211
239	2023-11-30	t	Николаева Л.М.	210	754
240	2023-05-20	t	Николаева Л.М.	740	221
241	2023-02-03	t	Николаева Л.М.	811	783
242	2023-10-10	t	Николаева Л.М.	31	658
243	2023-05-05	t	Федорова С.В.	479	535
244	2023-08-19	t	Смирнова Т.Д.	442	243
245	2023-10-04	t	Федорова С.В.	6	987
246	2023-09-11	t	Николаева Л.М.	33	953
247	2023-03-17	t	Иванова А.Н.	687	829
248	2023-05-25	t	Николаева Л.М.	522	179
249	2023-04-17	t	Смирнова Т.Д.	87	563
250	2023-04-04	t	Петрова М.С.	283	135
251	2023-10-15	t	Петрова М.С.	485	557
252	2023-04-22	t	Николаева Л.М.	20	496
253	2023-06-28	t	Иванова А.Н.	594	922
254	2023-04-24	t	Петрова М.С.	631	730
255	2023-09-17	t	Сидорова Е.В.	419	88
256	2023-12-30	t	Николаева Л.М.	43	739
257	2023-05-13	f	Федорова С.В.	202	515
258	2023-01-09	t	Кузнецова О.П.	916	166
259	2023-10-07	t	Васильева И.А.	167	952
260	2023-02-12	t	Петрова М.С.	303	341
261	2023-06-04	t	Петрова М.С.	120	237
262	2023-11-20	t	Сидорова Е.В.	605	989
263	2023-02-23	t	Николаева Л.М.	515	825
264	2023-08-30	t	Иванова А.Н.	376	766
265	2023-07-04	f	Кузнецова О.П.	132	137
266	2023-02-05	f	Кузнецова О.П.	761	839
267	2023-12-27	t	Иванова А.Н.	863	470
268	2023-03-03	t	Федорова С.В.	930	771
269	2023-02-08	t	Сидорова Е.В.	352	732
270	2023-12-17	t	Петрова М.С.	661	412
271	2023-03-28	t	Кузнецова О.П.	91	500
272	2023-07-04	t	Сидорова Е.В.	872	975
273	2023-09-09	t	Смирнова Т.Д.	273	708
274	2023-07-04	t	Смирнова Т.Д.	258	608
275	2023-07-22	t	Сидорова Е.В.	536	25
276	2023-10-20	t	Кузнецова О.П.	69	680
277	2023-09-18	t	Петрова М.С.	673	947
278	2023-02-03	t	Петрова М.С.	330	485
279	2023-08-26	t	Васильева И.А.	442	894
280	2023-11-04	t	Сидорова Е.В.	413	888
281	2023-03-18	t	Васильева И.А.	98	589
282	2023-04-17	t	Сидорова Е.В.	606	595
283	2023-03-05	t	Николаева Л.М.	507	657
284	2023-03-13	t	Васильева И.А.	726	926
285	2023-06-16	t	Николаева Л.М.	96	598
286	2023-05-16	f	Петрова М.С.	686	836
287	2023-04-21	t	Сидорова Е.В.	223	615
288	2023-12-26	t	Федорова С.В.	488	182
289	2023-08-20	t	Николаева Л.М.	336	688
290	2023-05-14	t	Иванова А.Н.	971	617
291	2023-05-07	t	Кузнецова О.П.	651	530
292	2023-06-06	t	Васильева И.А.	565	375
293	2023-02-26	t	Петрова М.С.	254	60
294	2023-12-04	t	Николаева Л.М.	335	743
295	2023-04-05	t	Петрова М.С.	714	621
296	2023-02-25	t	Васильева И.А.	602	568
297	2023-04-20	f	Сидорова Е.В.	746	397
298	2023-01-25	t	Васильева И.А.	62	144
299	2023-06-11	t	Петрова М.С.	679	62
300	2023-07-23	f	Петрова М.С.	466	463
301	2023-07-07	t	Сидорова Е.В.	581	828
302	2023-02-20	t	Петрова М.С.	258	190
303	2023-03-24	t	Петрова М.С.	148	501
304	2023-09-09	t	Николаева Л.М.	731	37
305	2023-09-13	t	Смирнова Т.Д.	7	113
306	2023-09-27	t	Васильева И.А.	148	198
307	2023-09-09	t	Федорова С.В.	88	452
308	2023-01-14	f	Васильева И.А.	437	391
309	2023-11-10	t	Васильева И.А.	706	514
310	2023-03-19	t	Кузнецова О.П.	898	373
311	2023-07-19	t	Федорова С.В.	768	216
312	2023-08-05	t	Николаева Л.М.	682	715
313	2023-09-29	t	Кузнецова О.П.	835	388
314	2023-02-20	t	Иванова А.Н.	804	380
315	2023-01-14	t	Смирнова Т.Д.	390	951
316	2023-10-16	t	Петрова М.С.	144	681
317	2023-04-12	t	Николаева Л.М.	167	499
318	2023-11-17	t	Иванова А.Н.	71	949
319	2023-01-06	t	Смирнова Т.Д.	463	678
320	2023-06-15	t	Иванова А.Н.	560	877
321	2023-02-15	f	Васильева И.А.	858	666
322	2023-11-27	t	Иванова А.Н.	747	147
323	2023-11-08	t	Федорова С.В.	498	260
324	2023-06-09	f	Сидорова Е.В.	509	652
325	2023-10-26	t	Кузнецова О.П.	860	322
326	2023-08-07	t	Федорова С.В.	856	856
327	2023-11-17	t	Сидорова Е.В.	977	499
328	2023-01-01	t	Петрова М.С.	775	764
329	2023-12-15	t	Федорова С.В.	841	708
330	2023-01-30	t	Сидорова Е.В.	692	96
331	2023-03-08	t	Иванова А.Н.	848	471
332	2023-05-08	t	Васильева И.А.	670	447
333	2023-05-19	t	Кузнецова О.П.	262	172
334	2023-09-22	t	Петрова М.С.	135	279
335	2023-04-08	t	Иванова А.Н.	980	216
336	2023-07-10	t	Петрова М.С.	557	983
337	2023-05-13	t	Кузнецова О.П.	325	708
338	2023-09-09	t	Сидорова Е.В.	373	946
339	2023-04-16	t	Петрова М.С.	511	905
340	2023-05-22	t	Смирнова Т.Д.	502	375
341	2023-03-13	t	Петрова М.С.	287	537
342	2023-02-09	t	Петрова М.С.	764	410
343	2023-08-11	t	Иванова А.Н.	340	860
344	2023-12-24	t	Васильева И.А.	458	285
345	2023-04-27	t	Кузнецова О.П.	990	117
346	2023-07-28	t	Васильева И.А.	665	38
347	2023-07-12	t	Федорова С.В.	853	593
348	2023-08-01	f	Васильева И.А.	695	281
349	2023-10-11	t	Сидорова Е.В.	425	539
350	2023-07-31	t	Смирнова Т.Д.	803	614
351	2023-03-25	t	Сидорова Е.В.	949	381
352	2023-01-26	t	Смирнова Т.Д.	292	382
353	2023-10-31	t	Иванова А.Н.	197	244
354	2023-04-24	t	Федорова С.В.	460	624
355	2023-11-28	t	Васильева И.А.	57	999
356	2023-11-21	t	Васильева И.А.	783	744
357	2023-02-04	t	Сидорова Е.В.	412	36
358	2023-03-06	t	Петрова М.С.	776	286
359	2023-12-09	f	Смирнова Т.Д.	743	522
360	2023-10-21	t	Смирнова Т.Д.	674	83
361	2023-01-28	t	Смирнова Т.Д.	724	844
362	2023-09-01	t	Федорова С.В.	658	164
363	2023-11-24	t	Иванова А.Н.	411	789
364	2023-06-14	t	Федорова С.В.	611	772
365	2023-02-08	t	Федорова С.В.	329	111
366	2023-07-07	t	Васильева И.А.	763	933
367	2023-10-12	t	Смирнова Т.Д.	422	572
368	2023-06-16	t	Федорова С.В.	444	463
369	2023-02-22	t	Сидорова Е.В.	301	579
370	2023-10-11	t	Николаева Л.М.	984	216
371	2023-11-30	t	Петрова М.С.	715	720
372	2023-04-22	t	Николаева Л.М.	884	907
373	2023-01-15	t	Кузнецова О.П.	179	802
374	2023-08-22	t	Николаева Л.М.	565	795
375	2023-03-19	t	Сидорова Е.В.	475	249
376	2023-03-17	t	Федорова С.В.	651	902
377	2023-02-07	t	Сидорова Е.В.	304	810
378	2023-09-08	t	Сидорова Е.В.	337	950
379	2023-02-13	t	Иванова А.Н.	586	98
380	2023-08-21	t	Федорова С.В.	300	810
381	2023-12-17	t	Федорова С.В.	476	278
382	2023-05-07	t	Иванова А.Н.	658	743
383	2023-08-02	f	Сидорова Е.В.	682	204
384	2023-07-31	f	Иванова А.Н.	53	351
385	2023-12-27	t	Сидорова Е.В.	816	695
386	2023-09-25	t	Смирнова Т.Д.	274	420
387	2023-01-20	t	Сидорова Е.В.	593	328
388	2023-02-05	t	Николаева Л.М.	985	933
389	2023-02-04	t	Николаева Л.М.	893	123
390	2023-03-17	t	Иванова А.Н.	713	529
391	2023-03-09	t	Николаева Л.М.	310	522
392	2023-09-11	t	Иванова А.Н.	124	714
393	2023-10-29	f	Васильева И.А.	792	771
394	2023-09-22	t	Сидорова Е.В.	112	32
395	2023-06-29	t	Сидорова Е.В.	142	470
396	2023-03-31	t	Петрова М.С.	40	585
397	2023-09-15	f	Васильева И.А.	817	62
398	2023-06-29	t	Николаева Л.М.	987	911
399	2023-07-11	t	Петрова М.С.	978	809
400	2023-01-24	t	Иванова А.Н.	863	276
401	2023-10-13	t	Иванова А.Н.	577	961
402	2023-09-15	f	Васильева И.А.	197	448
403	2023-05-30	t	Иванова А.Н.	643	169
404	2023-09-30	t	Николаева Л.М.	319	249
405	2023-09-17	t	Смирнова Т.Д.	600	900
406	2023-05-12	t	Васильева И.А.	634	599
407	2023-02-10	t	Смирнова Т.Д.	463	376
408	2023-12-01	t	Васильева И.А.	200	458
409	2023-12-21	t	Николаева Л.М.	640	425
410	2023-03-14	t	Федорова С.В.	624	290
411	2023-04-18	t	Николаева Л.М.	238	781
412	2023-09-23	t	Сидорова Е.В.	43	919
413	2023-05-02	t	Сидорова Е.В.	748	893
414	2023-06-24	t	Сидорова Е.В.	27	168
415	2023-02-02	t	Кузнецова О.П.	671	74
416	2023-07-27	t	Федорова С.В.	747	252
417	2023-10-28	f	Смирнова Т.Д.	925	678
418	2023-08-13	f	Иванова А.Н.	938	983
419	2023-04-09	t	Кузнецова О.П.	530	165
420	2023-09-05	t	Кузнецова О.П.	690	649
421	2023-06-24	t	Николаева Л.М.	86	268
422	2023-03-27	t	Кузнецова О.П.	49	24
423	2023-12-08	f	Иванова А.Н.	473	796
424	2023-05-24	t	Васильева И.А.	417	172
425	2023-04-11	t	Федорова С.В.	351	210
426	2023-04-19	t	Федорова С.В.	479	254
427	2023-12-02	t	Петрова М.С.	319	924
428	2023-07-08	t	Федорова С.В.	669	820
429	2023-12-21	t	Николаева Л.М.	219	309
430	2023-04-21	t	Николаева Л.М.	458	722
431	2023-05-22	t	Федорова С.В.	891	852
432	2023-09-02	t	Иванова А.Н.	605	601
433	2023-11-05	t	Васильева И.А.	820	231
434	2023-11-22	t	Смирнова Т.Д.	225	710
435	2023-04-23	t	Васильева И.А.	447	935
436	2023-02-21	t	Сидорова Е.В.	564	400
437	2023-08-10	t	Кузнецова О.П.	343	75
438	2023-05-14	t	Иванова А.Н.	466	416
439	2023-07-29	t	Николаева Л.М.	788	639
440	2023-05-24	t	Кузнецова О.П.	878	816
441	2023-09-21	t	Федорова С.В.	373	893
442	2023-06-20	t	Петрова М.С.	361	34
443	2023-08-25	t	Иванова А.Н.	392	960
444	2023-12-26	t	Петрова М.С.	827	86
445	2023-07-28	f	Петрова М.С.	818	911
446	2023-02-02	t	Федорова С.В.	480	817
447	2023-12-04	t	Федорова С.В.	159	715
448	2023-11-30	t	Сидорова Е.В.	388	982
449	2023-09-08	t	Смирнова Т.Д.	279	267
450	2023-06-10	t	Николаева Л.М.	487	949
451	2023-04-30	f	Иванова А.Н.	421	980
452	2023-12-15	f	Николаева Л.М.	391	424
453	2023-01-31	t	Петрова М.С.	207	652
454	2023-06-15	t	Сидорова Е.В.	282	495
455	2023-07-14	t	Федорова С.В.	462	778
456	2023-11-02	t	Иванова А.Н.	720	471
457	2023-02-22	t	Федорова С.В.	324	340
458	2023-12-07	t	Смирнова Т.Д.	874	294
459	2023-04-16	t	Иванова А.Н.	832	344
460	2023-04-14	t	Петрова М.С.	356	310
461	2023-08-03	t	Николаева Л.М.	677	64
462	2023-10-31	t	Смирнова Т.Д.	444	406
463	2023-01-24	t	Кузнецова О.П.	944	563
464	2023-07-14	t	Иванова А.Н.	327	855
465	2023-02-28	t	Кузнецова О.П.	568	176
466	2023-06-20	t	Сидорова Е.В.	965	741
467	2023-01-15	f	Федорова С.В.	195	203
468	2023-10-14	t	Сидорова Е.В.	24	671
469	2023-04-19	t	Кузнецова О.П.	574	129
470	2023-02-03	t	Васильева И.А.	351	301
471	2023-03-18	f	Иванова А.Н.	267	180
472	2023-09-24	t	Смирнова Т.Д.	499	109
473	2023-05-27	t	Николаева Л.М.	321	10
474	2023-01-08	t	Петрова М.С.	778	199
475	2023-01-01	t	Иванова А.Н.	493	961
476	2023-11-21	t	Николаева Л.М.	256	721
477	2023-05-02	t	Николаева Л.М.	802	519
478	2023-09-07	t	Николаева Л.М.	95	130
479	2023-09-30	t	Васильева И.А.	474	897
480	2023-09-25	t	Иванова А.Н.	57	541
481	2023-07-20	t	Васильева И.А.	864	844
482	2023-11-29	t	Петрова М.С.	359	989
483	2023-01-02	t	Васильева И.А.	805	113
484	2023-10-14	t	Сидорова Е.В.	185	398
485	2023-03-29	t	Иванова А.Н.	849	963
486	2023-11-19	t	Николаева Л.М.	375	650
487	2023-08-15	t	Петрова М.С.	261	774
488	2023-12-02	t	Кузнецова О.П.	763	106
489	2023-08-30	t	Смирнова Т.Д.	396	612
490	2023-10-19	t	Иванова А.Н.	834	592
491	2023-07-04	t	Сидорова Е.В.	605	571
492	2023-03-28	t	Сидорова Е.В.	674	850
493	2023-06-10	t	Федорова С.В.	827	398
494	2023-10-22	t	Николаева Л.М.	498	857
495	2023-01-15	t	Сидорова Е.В.	581	236
496	2023-11-14	t	Сидорова Е.В.	250	243
497	2023-06-07	t	Иванова А.Н.	564	191
498	2023-11-04	t	Иванова А.Н.	790	384
499	2023-05-20	t	Федорова С.В.	426	792
500	2023-05-07	t	Смирнова Т.Д.	702	587
501	2023-12-07	t	Кузнецова О.П.	389	254
502	2023-05-23	t	Кузнецова О.П.	542	149
503	2023-07-24	f	Васильева И.А.	40	876
504	2023-02-07	t	Кузнецова О.П.	834	431
505	2023-12-16	f	Федорова С.В.	982	796
506	2023-06-21	t	Иванова А.Н.	795	14
507	2023-10-30	f	Кузнецова О.П.	912	490
508	2023-04-27	f	Кузнецова О.П.	384	245
509	2023-02-17	t	Иванова А.Н.	548	247
510	2023-04-08	t	Петрова М.С.	904	546
511	2023-02-14	t	Федорова С.В.	522	956
512	2023-01-23	t	Смирнова Т.Д.	707	454
513	2023-06-03	f	Петрова М.С.	434	890
514	2023-09-27	t	Петрова М.С.	571	299
515	2023-07-18	t	Васильева И.А.	145	885
516	2023-09-26	t	Васильева И.А.	799	12
517	2023-03-24	t	Иванова А.Н.	591	385
518	2023-09-24	t	Сидорова Е.В.	757	688
519	2023-05-01	t	Петрова М.С.	114	658
520	2023-01-04	t	Сидорова Е.В.	824	64
521	2023-05-03	t	Иванова А.Н.	264	128
522	2023-05-02	t	Николаева Л.М.	871	176
523	2023-09-10	t	Федорова С.В.	356	129
524	2023-03-17	t	Николаева Л.М.	209	91
525	2023-06-04	t	Петрова М.С.	687	801
526	2023-04-09	t	Петрова М.С.	391	961
527	2023-07-16	t	Иванова А.Н.	859	901
528	2023-01-11	t	Смирнова Т.Д.	589	513
529	2023-05-05	t	Сидорова Е.В.	17	831
530	2023-11-11	t	Петрова М.С.	918	795
531	2023-10-31	t	Николаева Л.М.	23	732
532	2023-08-22	f	Смирнова Т.Д.	265	923
533	2023-07-07	t	Петрова М.С.	559	834
534	2023-06-20	t	Петрова М.С.	22	985
535	2023-07-28	t	Петрова М.С.	376	243
536	2023-04-24	t	Васильева И.А.	929	995
537	2023-06-16	f	Иванова А.Н.	270	677
538	2023-05-05	t	Васильева И.А.	964	732
539	2023-12-03	t	Петрова М.С.	856	789
540	2023-04-10	t	Кузнецова О.П.	319	9
541	2023-08-28	t	Петрова М.С.	898	618
542	2023-05-18	t	Николаева Л.М.	301	389
543	2023-11-11	t	Кузнецова О.П.	230	475
544	2023-12-24	t	Николаева Л.М.	592	32
545	2023-02-27	t	Кузнецова О.П.	870	658
546	2023-12-20	t	Смирнова Т.Д.	937	717
547	2023-04-25	t	Николаева Л.М.	347	277
548	2023-11-10	f	Сидорова Е.В.	33	74
549	2023-12-04	t	Смирнова Т.Д.	434	675
550	2023-06-14	t	Федорова С.В.	556	919
551	2023-11-01	t	Сидорова Е.В.	310	940
552	2023-05-21	t	Петрова М.С.	619	701
553	2023-07-09	t	Петрова М.С.	836	119
554	2023-04-02	t	Федорова С.В.	947	899
555	2023-04-08	t	Иванова А.Н.	468	491
556	2023-01-30	t	Николаева Л.М.	70	396
557	2023-12-11	t	Кузнецова О.П.	859	279
558	2023-07-12	t	Сидорова Е.В.	394	310
559	2023-03-13	t	Николаева Л.М.	163	113
560	2023-12-20	t	Федорова С.В.	426	562
561	2023-06-11	t	Смирнова Т.Д.	419	914
562	2023-08-15	t	Федорова С.В.	511	605
563	2023-05-03	t	Иванова А.Н.	706	734
564	2023-09-30	f	Николаева Л.М.	599	292
565	2023-08-24	t	Кузнецова О.П.	117	991
566	2023-02-04	t	Васильева И.А.	75	86
567	2023-05-08	t	Николаева Л.М.	454	162
568	2023-11-17	t	Смирнова Т.Д.	954	599
569	2023-09-19	t	Смирнова Т.Д.	99	979
570	2023-03-20	t	Николаева Л.М.	410	450
571	2023-02-04	f	Кузнецова О.П.	454	3
572	2023-09-05	t	Иванова А.Н.	542	741
573	2023-01-29	f	Сидорова Е.В.	465	701
574	2023-09-16	t	Смирнова Т.Д.	645	176
575	2023-10-04	t	Сидорова Е.В.	799	852
576	2023-08-17	t	Николаева Л.М.	306	404
577	2023-03-14	t	Кузнецова О.П.	918	178
578	2023-09-01	t	Сидорова Е.В.	674	703
579	2023-09-29	t	Николаева Л.М.	394	740
580	2023-08-11	t	Смирнова Т.Д.	400	128
581	2023-09-30	f	Кузнецова О.П.	324	650
582	2023-12-21	t	Смирнова Т.Д.	865	12
583	2023-07-11	t	Иванова А.Н.	214	111
584	2023-12-01	t	Николаева Л.М.	78	964
585	2023-06-26	t	Иванова А.Н.	657	43
586	2023-01-04	t	Сидорова Е.В.	837	85
587	2023-10-05	t	Кузнецова О.П.	973	532
588	2023-08-17	t	Кузнецова О.П.	880	992
589	2023-12-09	t	Сидорова Е.В.	877	671
590	2023-08-05	t	Иванова А.Н.	313	678
591	2023-03-16	t	Петрова М.С.	913	385
592	2023-09-26	t	Сидорова Е.В.	52	214
593	2023-08-30	t	Кузнецова О.П.	175	957
594	2023-08-27	f	Васильева И.А.	468	198
595	2023-10-22	f	Николаева Л.М.	367	265
596	2023-12-25	t	Смирнова Т.Д.	371	449
597	2023-03-05	t	Смирнова Т.Д.	314	761
598	2023-04-23	f	Кузнецова О.П.	636	279
599	2023-01-11	t	Сидорова Е.В.	647	765
600	2023-10-17	t	Иванова А.Н.	645	827
601	2023-12-25	t	Кузнецова О.П.	635	360
602	2023-04-09	t	Кузнецова О.П.	663	511
603	2023-08-19	t	Васильева И.А.	364	51
604	2023-06-25	f	Петрова М.С.	470	610
605	2023-07-01	t	Сидорова Е.В.	567	17
606	2023-07-20	t	Смирнова Т.Д.	2	402
607	2023-03-08	t	Кузнецова О.П.	21	90
608	2023-03-03	t	Кузнецова О.П.	940	577
609	2023-06-16	t	Кузнецова О.П.	17	892
610	2023-02-14	t	Иванова А.Н.	215	180
611	2023-06-02	t	Кузнецова О.П.	379	716
612	2023-08-11	t	Федорова С.В.	78	123
613	2023-01-20	t	Смирнова Т.Д.	45	274
614	2023-03-17	t	Иванова А.Н.	741	194
615	2023-08-06	t	Сидорова Е.В.	823	8
616	2023-03-17	t	Кузнецова О.П.	312	252
617	2023-12-04	t	Петрова М.С.	702	901
618	2023-01-13	t	Николаева Л.М.	74	52
619	2023-12-19	t	Кузнецова О.П.	610	229
620	2023-01-31	t	Федорова С.В.	833	277
621	2023-06-08	f	Петрова М.С.	858	229
622	2023-07-04	t	Смирнова Т.Д.	875	849
623	2023-11-16	t	Васильева И.А.	550	534
624	2023-09-08	t	Сидорова Е.В.	210	997
625	2023-01-20	t	Смирнова Т.Д.	947	952
626	2023-06-26	t	Николаева Л.М.	146	776
627	2023-09-25	t	Смирнова Т.Д.	430	775
628	2023-03-16	t	Николаева Л.М.	660	481
629	2023-01-15	t	Николаева Л.М.	954	764
630	2023-05-28	t	Васильева И.А.	931	394
631	2023-04-29	f	Федорова С.В.	516	196
632	2023-08-23	t	Васильева И.А.	955	19
633	2023-12-25	t	Васильева И.А.	142	27
634	2023-02-22	t	Николаева Л.М.	147	147
635	2023-01-14	t	Смирнова Т.Д.	3	665
636	2023-12-09	t	Васильева И.А.	173	796
637	2023-03-18	t	Кузнецова О.П.	199	868
638	2023-02-17	t	Смирнова Т.Д.	534	861
639	2023-09-18	t	Петрова М.С.	91	994
640	2023-10-19	t	Николаева Л.М.	867	485
641	2023-10-30	t	Смирнова Т.Д.	693	700
642	2023-12-19	t	Смирнова Т.Д.	975	375
643	2023-09-25	t	Сидорова Е.В.	874	16
644	2023-07-06	t	Кузнецова О.П.	409	667
645	2023-06-23	t	Васильева И.А.	407	39
646	2023-09-11	t	Кузнецова О.П.	316	221
647	2023-01-06	t	Петрова М.С.	824	548
648	2023-09-20	t	Кузнецова О.П.	170	653
649	2023-09-01	f	Петрова М.С.	15	838
650	2023-08-11	t	Васильева И.А.	100	45
651	2023-06-03	f	Сидорова Е.В.	875	924
652	2023-01-07	t	Федорова С.В.	246	905
653	2023-10-31	t	Сидорова Е.В.	267	355
654	2023-07-10	t	Кузнецова О.П.	536	134
655	2023-10-20	t	Васильева И.А.	889	912
656	2023-09-08	t	Васильева И.А.	526	363
657	2023-08-25	t	Федорова С.В.	288	908
658	2023-06-28	t	Васильева И.А.	466	827
659	2023-07-27	t	Федорова С.В.	380	975
660	2023-04-25	t	Федорова С.В.	230	884
661	2023-10-02	t	Николаева Л.М.	46	158
662	2023-10-29	t	Петрова М.С.	349	171
663	2023-09-26	t	Смирнова Т.Д.	204	6
664	2023-01-19	t	Иванова А.Н.	670	76
665	2023-10-11	t	Федорова С.В.	56	135
666	2023-07-20	t	Кузнецова О.П.	1000	144
667	2023-11-22	t	Николаева Л.М.	164	107
668	2023-06-24	f	Иванова А.Н.	166	638
669	2023-11-20	t	Сидорова Е.В.	911	683
670	2023-01-26	t	Смирнова Т.Д.	990	355
671	2023-08-22	t	Федорова С.В.	893	159
672	2023-02-04	t	Смирнова Т.Д.	233	502
673	2023-08-15	t	Иванова А.Н.	348	132
674	2023-08-26	t	Николаева Л.М.	867	493
675	2023-05-26	t	Кузнецова О.П.	6	6
676	2023-08-02	t	Смирнова Т.Д.	2	414
677	2023-01-23	t	Кузнецова О.П.	341	321
678	2023-01-09	t	Кузнецова О.П.	120	565
679	2023-01-28	t	Петрова М.С.	469	989
680	2023-01-03	f	Сидорова Е.В.	668	3
681	2023-06-09	f	Смирнова Т.Д.	529	34
682	2023-12-02	f	Федорова С.В.	849	611
683	2023-12-05	t	Иванова А.Н.	641	565
684	2023-09-20	t	Смирнова Т.Д.	894	438
685	2023-01-16	t	Смирнова Т.Д.	492	450
686	2023-01-13	t	Смирнова Т.Д.	358	130
687	2023-06-23	t	Васильева И.А.	478	462
688	2023-08-26	t	Кузнецова О.П.	346	406
689	2023-08-10	f	Кузнецова О.П.	506	711
690	2023-06-26	t	Петрова М.С.	821	119
691	2023-09-04	t	Кузнецова О.П.	895	206
692	2023-01-19	t	Сидорова Е.В.	799	201
693	2023-02-16	t	Петрова М.С.	391	409
694	2023-09-16	t	Сидорова Е.В.	309	341
695	2023-10-28	t	Смирнова Т.Д.	134	366
696	2023-04-07	t	Петрова М.С.	561	355
697	2023-01-11	f	Федорова С.В.	845	737
698	2023-09-02	t	Васильева И.А.	329	945
699	2023-08-28	t	Васильева И.А.	675	796
700	2023-03-28	t	Кузнецова О.П.	489	62
701	2023-09-16	t	Кузнецова О.П.	773	792
702	2023-07-06	t	Петрова М.С.	817	228
703	2023-02-27	t	Кузнецова О.П.	339	959
704	2023-10-27	t	Кузнецова О.П.	891	298
705	2023-07-17	t	Федорова С.В.	389	140
706	2023-07-08	t	Федорова С.В.	740	262
707	2023-09-26	t	Николаева Л.М.	994	577
708	2023-08-17	t	Николаева Л.М.	667	371
709	2023-11-25	t	Васильева И.А.	336	978
710	2023-12-26	t	Федорова С.В.	336	95
711	2023-02-16	t	Федорова С.В.	731	201
712	2023-08-20	t	Смирнова Т.Д.	456	861
713	2023-05-27	t	Сидорова Е.В.	616	144
714	2023-11-07	t	Сидорова Е.В.	250	901
715	2023-11-29	t	Васильева И.А.	136	960
716	2023-11-27	t	Петрова М.С.	262	337
717	2023-09-11	t	Кузнецова О.П.	850	556
718	2023-08-04	t	Васильева И.А.	50	677
719	2023-08-20	t	Васильева И.А.	6	417
720	2023-12-06	t	Николаева Л.М.	166	752
721	2023-08-20	t	Кузнецова О.П.	415	226
722	2023-12-20	t	Федорова С.В.	331	300
723	2023-06-23	t	Кузнецова О.П.	879	667
724	2023-09-09	t	Николаева Л.М.	517	10
725	2023-12-02	t	Иванова А.Н.	633	904
726	2023-12-11	t	Смирнова Т.Д.	245	623
727	2023-08-09	t	Смирнова Т.Д.	222	167
728	2023-06-03	t	Кузнецова О.П.	7	270
729	2023-02-05	t	Кузнецова О.П.	397	743
730	2023-07-28	t	Федорова С.В.	157	238
731	2023-04-13	t	Васильева И.А.	404	464
732	2023-05-26	f	Иванова А.Н.	494	836
733	2023-10-18	t	Кузнецова О.П.	248	208
734	2023-10-06	f	Смирнова Т.Д.	91	29
735	2023-11-09	t	Николаева Л.М.	384	371
736	2023-10-09	t	Смирнова Т.Д.	892	603
737	2023-08-23	t	Сидорова Е.В.	325	948
738	2023-04-28	t	Федорова С.В.	342	462
739	2023-06-15	t	Смирнова Т.Д.	562	653
740	2023-08-02	t	Васильева И.А.	92	658
741	2023-01-26	t	Смирнова Т.Д.	714	531
742	2023-04-11	t	Сидорова Е.В.	954	588
743	2023-11-28	t	Федорова С.В.	862	428
744	2023-10-13	t	Петрова М.С.	290	963
745	2023-11-28	f	Смирнова Т.Д.	888	856
746	2023-08-27	t	Васильева И.А.	980	830
747	2023-06-01	t	Иванова А.Н.	66	70
748	2023-06-21	t	Васильева И.А.	466	313
749	2023-11-06	t	Николаева Л.М.	866	161
750	2023-03-20	t	Иванова А.Н.	310	357
751	2023-09-10	t	Петрова М.С.	141	9
752	2023-01-24	t	Иванова А.Н.	41	426
753	2023-10-28	t	Николаева Л.М.	859	975
754	2023-11-10	t	Сидорова Е.В.	986	134
755	2023-04-07	t	Иванова А.Н.	178	829
756	2023-05-02	t	Николаева Л.М.	136	773
757	2023-03-09	t	Федорова С.В.	792	444
758	2023-01-25	t	Смирнова Т.Д.	683	86
759	2023-12-29	t	Петрова М.С.	662	553
760	2023-09-05	f	Кузнецова О.П.	308	585
761	2023-09-20	t	Петрова М.С.	262	659
762	2023-12-05	t	Николаева Л.М.	362	233
763	2023-08-05	t	Васильева И.А.	381	819
764	2023-07-12	t	Васильева И.А.	993	822
765	2023-05-19	t	Петрова М.С.	282	618
766	2023-05-22	t	Смирнова Т.Д.	138	226
767	2023-09-22	t	Федорова С.В.	131	421
768	2023-05-16	t	Петрова М.С.	992	501
769	2023-12-02	t	Кузнецова О.П.	918	653
770	2023-12-14	t	Федорова С.В.	873	934
990	2023-03-24	f	Петрова М.С.	332	956
771	2023-11-17	t	Васильева И.А.	428	945
772	2023-11-30	t	Федорова С.В.	154	42
773	2023-05-19	t	Петрова М.С.	265	243
774	2023-12-01	t	Васильева И.А.	464	851
775	2023-02-04	t	Петрова М.С.	464	265
776	2023-11-14	t	Смирнова Т.Д.	297	62
777	2023-08-19	t	Петрова М.С.	184	557
778	2023-06-20	t	Петрова М.С.	510	195
779	2023-09-15	t	Федорова С.В.	536	986
780	2023-09-04	t	Николаева Л.М.	451	667
781	2023-11-09	f	Сидорова Е.В.	205	537
782	2023-12-21	t	Петрова М.С.	435	820
783	2023-01-21	t	Сидорова Е.В.	37	782
784	2023-08-02	t	Сидорова Е.В.	741	110
785	2023-03-15	t	Иванова А.Н.	112	742
786	2023-03-23	t	Петрова М.С.	340	651
787	2023-12-06	t	Смирнова Т.Д.	315	432
788	2023-07-02	t	Петрова М.С.	589	316
789	2023-03-18	t	Кузнецова О.П.	602	123
790	2023-02-28	t	Кузнецова О.П.	691	60
791	2023-02-05	t	Сидорова Е.В.	358	986
792	2023-08-12	t	Сидорова Е.В.	161	846
793	2023-02-21	t	Смирнова Т.Д.	115	493
794	2023-06-28	t	Петрова М.С.	612	280
795	2023-01-16	t	Сидорова Е.В.	401	71
796	2023-10-20	t	Иванова А.Н.	32	480
797	2023-09-28	t	Васильева И.А.	474	158
798	2023-11-07	t	Петрова М.С.	885	457
799	2023-09-10	t	Николаева Л.М.	284	622
800	2023-06-06	t	Иванова А.Н.	667	954
801	2023-08-25	t	Иванова А.Н.	809	935
802	2023-01-26	t	Федорова С.В.	723	852
803	2023-12-23	t	Смирнова Т.Д.	224	799
804	2023-07-21	t	Васильева И.А.	944	361
805	2023-11-30	t	Николаева Л.М.	154	732
806	2023-09-24	t	Смирнова Т.Д.	575	545
807	2023-12-26	t	Николаева Л.М.	898	517
808	2023-06-01	t	Николаева Л.М.	101	820
809	2023-03-04	t	Петрова М.С.	676	235
810	2023-12-10	t	Васильева И.А.	634	889
811	2023-01-22	t	Кузнецова О.П.	980	974
812	2023-12-13	t	Николаева Л.М.	343	988
813	2023-04-06	t	Кузнецова О.П.	114	293
814	2023-01-29	t	Федорова С.В.	836	197
815	2023-01-14	t	Петрова М.С.	21	950
816	2023-11-05	t	Петрова М.С.	724	236
817	2023-05-18	t	Николаева Л.М.	70	322
818	2023-01-24	t	Петрова М.С.	183	701
819	2023-05-03	t	Кузнецова О.П.	71	965
820	2023-08-10	t	Васильева И.А.	248	119
821	2023-08-08	f	Федорова С.В.	475	710
822	2023-06-17	t	Николаева Л.М.	615	1
823	2023-11-19	t	Кузнецова О.П.	807	558
824	2023-08-12	t	Иванова А.Н.	887	708
825	2023-09-19	t	Николаева Л.М.	921	227
826	2023-12-31	t	Кузнецова О.П.	250	110
827	2023-08-05	t	Федорова С.В.	642	122
828	2023-08-28	t	Смирнова Т.Д.	742	176
829	2023-01-19	t	Кузнецова О.П.	181	706
830	2023-01-12	t	Кузнецова О.П.	802	211
831	2023-04-27	t	Васильева И.А.	444	558
832	2023-01-08	t	Смирнова Т.Д.	728	776
833	2023-02-06	t	Васильева И.А.	493	145
834	2023-04-21	t	Николаева Л.М.	922	733
835	2023-11-21	t	Иванова А.Н.	470	593
836	2023-04-14	t	Николаева Л.М.	724	814
837	2023-05-14	t	Сидорова Е.В.	66	940
838	2023-12-04	t	Николаева Л.М.	579	595
839	2023-09-19	t	Васильева И.А.	562	427
840	2023-03-18	t	Петрова М.С.	967	287
841	2023-02-17	t	Федорова С.В.	574	626
842	2023-12-07	t	Петрова М.С.	678	392
843	2023-01-06	f	Смирнова Т.Д.	708	218
844	2023-12-07	t	Кузнецова О.П.	112	46
845	2023-09-06	t	Сидорова Е.В.	595	144
846	2023-02-02	t	Сидорова Е.В.	63	153
847	2023-09-15	t	Васильева И.А.	725	932
848	2023-03-24	t	Иванова А.Н.	103	468
849	2023-11-13	f	Сидорова Е.В.	452	889
850	2023-08-06	t	Смирнова Т.Д.	342	49
851	2023-09-06	t	Васильева И.А.	89	529
852	2023-06-15	t	Смирнова Т.Д.	193	600
853	2023-02-03	t	Иванова А.Н.	438	411
854	2023-04-04	f	Иванова А.Н.	688	597
855	2023-03-24	t	Сидорова Е.В.	40	838
856	2023-01-14	t	Кузнецова О.П.	442	12
857	2023-06-18	f	Смирнова Т.Д.	90	737
858	2023-01-25	t	Смирнова Т.Д.	10	241
859	2023-03-28	t	Смирнова Т.Д.	210	618
860	2023-08-13	t	Сидорова Е.В.	525	862
861	2023-02-04	t	Сидорова Е.В.	476	350
862	2023-12-05	t	Кузнецова О.П.	562	803
863	2023-04-04	t	Петрова М.С.	249	398
864	2023-07-21	t	Петрова М.С.	84	655
865	2023-10-16	t	Сидорова Е.В.	549	791
866	2023-02-11	t	Федорова С.В.	307	686
867	2023-10-06	t	Петрова М.С.	727	483
868	2023-08-18	t	Федорова С.В.	743	958
869	2023-01-25	t	Кузнецова О.П.	126	605
870	2023-08-07	t	Федорова С.В.	746	792
871	2023-04-06	t	Сидорова Е.В.	87	777
872	2023-05-28	t	Сидорова Е.В.	649	434
873	2023-10-15	t	Васильева И.А.	374	179
874	2023-01-23	t	Федорова С.В.	943	909
875	2023-06-17	f	Федорова С.В.	121	818
876	2023-01-01	t	Иванова А.Н.	198	890
877	2023-01-08	t	Иванова А.Н.	869	528
878	2023-01-31	t	Федорова С.В.	859	28
879	2023-01-17	t	Иванова А.Н.	344	607
880	2023-03-19	t	Кузнецова О.П.	961	633
881	2023-06-22	t	Николаева Л.М.	469	633
882	2023-12-15	t	Петрова М.С.	647	6
883	2023-06-21	t	Иванова А.Н.	756	429
884	2023-02-23	t	Васильева И.А.	455	541
885	2023-09-06	t	Смирнова Т.Д.	373	914
886	2023-04-24	t	Кузнецова О.П.	351	977
887	2023-11-25	t	Федорова С.В.	287	404
888	2023-08-08	t	Иванова А.Н.	151	341
889	2023-10-29	t	Федорова С.В.	927	921
890	2023-08-23	t	Петрова М.С.	770	103
891	2023-03-23	t	Васильева И.А.	801	210
892	2023-02-24	f	Николаева Л.М.	794	530
893	2023-04-16	t	Иванова А.Н.	275	100
894	2023-06-01	t	Кузнецова О.П.	364	806
895	2023-05-15	t	Федорова С.В.	624	807
896	2023-09-13	t	Кузнецова О.П.	992	23
897	2023-05-18	t	Смирнова Т.Д.	344	268
898	2023-10-10	t	Николаева Л.М.	860	327
899	2023-12-26	f	Николаева Л.М.	84	783
900	2023-02-27	t	Смирнова Т.Д.	995	970
901	2023-07-24	t	Петрова М.С.	338	903
902	2023-08-05	t	Федорова С.В.	648	406
903	2023-03-19	t	Васильева И.А.	127	380
904	2023-10-11	t	Смирнова Т.Д.	219	215
905	2023-01-13	t	Федорова С.В.	880	431
906	2023-02-11	t	Федорова С.В.	696	701
907	2023-07-08	t	Кузнецова О.П.	815	213
908	2023-04-11	f	Иванова А.Н.	848	474
909	2023-06-14	t	Кузнецова О.П.	412	768
910	2023-08-20	t	Кузнецова О.П.	89	445
911	2023-07-13	t	Смирнова Т.Д.	890	539
912	2023-08-11	t	Федорова С.В.	544	973
913	2023-05-13	t	Николаева Л.М.	518	107
914	2023-03-12	t	Федорова С.В.	273	553
915	2023-03-24	t	Иванова А.Н.	367	833
916	2023-05-14	t	Петрова М.С.	157	130
917	2023-12-12	t	Васильева И.А.	636	809
918	2023-11-01	t	Кузнецова О.П.	264	637
919	2023-06-16	t	Кузнецова О.П.	952	799
920	2023-12-12	t	Смирнова Т.Д.	666	264
921	2023-02-09	t	Петрова М.С.	536	339
922	2023-10-11	t	Сидорова Е.В.	717	429
923	2023-08-31	t	Кузнецова О.П.	936	839
924	2023-01-07	f	Николаева Л.М.	609	155
925	2023-11-21	t	Николаева Л.М.	746	430
926	2023-09-20	t	Иванова А.Н.	33	858
927	2023-11-28	t	Кузнецова О.П.	829	275
928	2023-05-13	t	Николаева Л.М.	253	20
929	2023-10-20	t	Смирнова Т.Д.	387	20
930	2023-08-04	t	Петрова М.С.	757	884
931	2023-09-04	t	Васильева И.А.	158	913
932	2023-08-16	t	Кузнецова О.П.	20	505
933	2023-01-19	t	Смирнова Т.Д.	422	222
934	2023-12-07	t	Федорова С.В.	100	492
935	2023-07-05	t	Николаева Л.М.	990	232
936	2023-09-27	t	Сидорова Е.В.	954	265
937	2023-08-15	t	Иванова А.Н.	826	609
938	2023-04-27	t	Смирнова Т.Д.	948	311
939	2023-02-08	t	Сидорова Е.В.	983	13
940	2023-08-20	t	Кузнецова О.П.	377	752
941	2023-01-22	t	Николаева Л.М.	827	88
942	2023-06-21	t	Николаева Л.М.	175	772
943	2023-01-05	t	Сидорова Е.В.	211	858
944	2023-10-16	t	Сидорова Е.В.	158	277
945	2023-12-01	t	Кузнецова О.П.	759	493
946	2023-05-29	t	Иванова А.Н.	197	755
947	2023-08-26	f	Петрова М.С.	45	459
948	2023-09-02	f	Федорова С.В.	627	225
949	2023-10-19	t	Кузнецова О.П.	421	607
950	2023-06-18	t	Кузнецова О.П.	698	153
951	2023-10-27	t	Петрова М.С.	897	59
952	2023-07-04	t	Смирнова Т.Д.	39	542
953	2023-02-23	t	Кузнецова О.П.	441	336
954	2023-06-07	t	Кузнецова О.П.	34	8
955	2023-05-14	t	Сидорова Е.В.	575	753
956	2023-10-10	t	Кузнецова О.П.	778	454
957	2023-06-18	t	Федорова С.В.	439	307
958	2023-04-09	t	Петрова М.С.	471	979
959	2023-10-14	t	Смирнова Т.Д.	811	495
960	2023-01-14	t	Федорова С.В.	88	952
961	2023-01-23	f	Васильева И.А.	314	403
962	2023-12-01	t	Кузнецова О.П.	896	112
963	2023-12-17	t	Федорова С.В.	854	626
964	2023-03-11	t	Николаева Л.М.	379	406
965	2023-11-13	t	Васильева И.А.	557	784
966	2023-09-12	t	Васильева И.А.	275	641
967	2023-03-14	t	Николаева Л.М.	219	937
968	2023-11-02	t	Сидорова Е.В.	278	17
969	2023-03-05	t	Николаева Л.М.	38	358
970	2023-03-27	t	Петрова М.С.	638	394
971	2023-08-13	t	Васильева И.А.	967	848
972	2023-01-13	t	Кузнецова О.П.	49	298
973	2023-03-19	t	Иванова А.Н.	660	652
974	2023-12-13	t	Николаева Л.М.	52	117
975	2023-02-11	t	Иванова А.Н.	642	210
976	2023-04-19	f	Николаева Л.М.	601	321
977	2023-08-02	t	Николаева Л.М.	479	50
978	2023-03-13	t	Смирнова Т.Д.	592	412
979	2023-04-06	t	Николаева Л.М.	111	204
980	2023-01-01	t	Васильева И.А.	98	465
981	2023-12-24	t	Петрова М.С.	725	335
982	2023-10-30	t	Петрова М.С.	667	438
983	2023-08-27	t	Сидорова Е.В.	994	297
984	2023-10-19	t	Федорова С.В.	829	629
985	2023-10-29	t	Сидорова Е.В.	947	813
986	2023-09-24	t	Васильева И.А.	338	374
987	2023-01-12	t	Сидорова Е.В.	287	769
988	2023-11-27	f	Николаева Л.М.	612	307
989	2023-09-26	t	Смирнова Т.Д.	157	770
991	2023-01-01	t	Петрова М.С.	699	493
992	2023-11-20	t	Иванова А.Н.	560	410
993	2023-02-05	t	Петрова М.С.	819	497
994	2023-08-15	t	Иванова А.Н.	593	8
995	2023-09-26	t	Кузнецова О.П.	721	705
996	2023-06-23	t	Смирнова Т.Д.	343	389
997	2023-10-29	f	Федорова С.В.	557	45
998	2023-02-07	t	Сидорова Е.В.	637	121
999	2023-11-08	t	Николаева Л.М.	656	927
1000	2023-08-14	t	Николаева Л.М.	556	178
\.


                                                                                                                                                                                                                                     4936.dat                                                                                            0000600 0004000 0002000 00000001003 14771407746 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        Wi-Fi	Беспроводной интернет	t
Завтрак	Континентальный завтрак	t
Тренажерный зал	Доступ 24/7	f
Бассейн	Крытый подогреваемый бассейн	t
SPA	Спа-комплекс с сауной	t
Парковка	Охраняемая парковка	t
Терраса	Открытая площадка с видом	t
Бар	Бар у бассейна	t
Кондиционер	Климат-контроль в номере	t
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             4940.dat                                                                                            0000600 0004000 0002000 00000067464 14771407746 0014314 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2023-01-01	2023-12-31	18
2	2023-03-01	2023-12-28	3
3	2023-01-01	2023-12-31	2
4	2023-01-01	2023-12-31	15
5	2023-01-01	2023-12-31	17
6	2023-05-16	2023-07-02	5
7	2023-06-01	2023-10-28	16
8	2023-01-01	2023-07-28	12
9	2023-08-30	2023-10-15	5
10	2023-01-01	2023-12-31	9
11	2023-01-01	2023-12-31	7
12	2023-01-01	2023-12-31	12
13	2023-01-01	2023-12-31	1
14	2023-01-01	2023-12-31	20
15	2023-01-01	2023-12-31	5
16	2023-07-01	2023-12-28	20
17	2023-03-01	2023-10-28	4
18	2023-01-01	2023-12-31	2
19	2023-09-01	2023-12-28	2
20	2023-02-01	2023-09-28	6
21	2023-01-01	2023-12-31	17
22	2023-01-01	2023-12-31	2
23	2023-06-01	2023-12-28	17
24	2023-05-05	2023-06-16	10
25	2023-01-01	2023-12-31	18
26	2023-01-01	2023-12-31	8
27	2023-09-01	2023-12-28	6
28	2023-07-01	2023-12-28	13
29	2023-01-01	2023-12-31	11
30	2023-01-01	2023-12-31	2
31	2023-01-01	2023-12-31	9
32	2023-01-01	2023-12-31	10
33	2023-06-26	2023-08-11	14
34	2023-01-01	2023-12-31	8
35	2023-01-01	2023-12-31	17
36	2023-01-01	2023-12-31	5
37	2023-05-01	2023-09-28	14
38	2023-01-01	2023-12-31	6
39	2023-04-01	2023-12-28	16
40	2023-04-01	2023-10-28	8
41	2023-01-01	2023-12-31	18
42	2023-01-01	2023-12-31	7
43	2023-01-01	2023-12-31	17
44	2023-01-01	2023-12-31	18
45	2023-03-01	2023-10-28	16
46	2023-01-01	2023-12-31	9
47	2023-01-01	2023-12-31	6
48	2023-01-01	2023-12-31	6
49	2023-01-01	2023-12-31	3
50	2023-01-01	2023-12-31	17
51	2023-01-01	2023-12-31	5
52	2023-01-01	2023-12-31	5
53	2023-01-01	2023-12-31	19
54	2023-01-01	2023-12-31	6
55	2023-01-01	2023-12-31	8
56	2023-01-01	2023-12-31	13
57	2023-01-01	2023-12-31	12
58	2023-01-01	2023-12-31	15
59	2023-01-01	2023-12-31	8
60	2023-04-16	2023-05-29	16
61	2023-01-01	2023-12-31	15
62	2023-03-01	2023-09-28	12
63	2023-07-01	2023-12-28	10
64	2023-01-01	2023-12-31	4
65	2023-01-01	2023-12-31	15
66	2023-02-16	2023-03-23	20
67	2023-01-01	2023-12-31	2
68	2023-01-01	2023-12-31	1
69	2023-03-01	2023-07-28	5
70	2023-08-01	2023-12-28	1
71	2023-05-10	2023-06-21	7
72	2023-05-01	2023-11-28	7
73	2023-01-01	2023-12-31	13
74	2023-01-01	2023-12-31	11
75	2023-01-01	2023-12-31	16
76	2023-03-08	2023-04-27	11
77	2023-01-01	2023-12-31	20
78	2023-08-01	2023-12-28	10
79	2023-01-01	2023-12-31	17
80	2023-01-01	2023-12-31	17
81	2023-02-01	2023-05-28	17
82	2023-05-01	2023-12-28	10
83	2023-01-01	2023-12-31	6
84	2023-01-01	2023-12-31	14
85	2023-01-01	2023-12-31	15
86	2023-01-01	2023-12-31	15
87	2023-02-01	2023-08-28	4
88	2023-05-14	2023-07-12	3
89	2023-04-01	2023-10-28	2
90	2023-01-01	2023-12-31	4
91	2023-05-01	2023-09-28	4
92	2023-01-01	2023-12-31	4
93	2023-09-01	2023-12-28	11
94	2023-03-01	2023-09-28	6
95	2023-01-01	2023-07-28	14
96	2023-01-01	2023-12-31	9
97	2023-06-01	2023-12-28	11
98	2023-01-01	2023-12-31	13
99	2023-01-01	2023-12-31	3
100	2023-01-01	2023-12-31	7
101	2023-01-01	2023-12-31	2
102	2023-01-01	2023-12-31	17
103	2023-01-01	2023-12-31	17
104	2023-06-01	2023-09-28	13
105	2023-01-01	2023-12-31	11
106	2023-01-01	2023-12-31	12
107	2023-01-01	2023-12-31	5
108	2023-05-01	2023-11-28	15
109	2023-05-01	2023-09-28	3
110	2023-03-01	2023-11-28	17
111	2023-01-01	2023-12-31	12
112	2023-01-01	2023-12-31	9
113	2023-01-01	2023-12-31	4
114	2023-01-01	2023-12-31	18
115	2023-01-01	2023-12-31	2
116	2023-01-01	2023-12-31	20
117	2023-09-21	2023-11-05	9
118	2023-01-01	2023-12-31	16
119	2023-01-01	2023-12-31	11
120	2023-01-01	2023-12-31	14
121	2023-07-01	2023-12-28	16
122	2023-04-01	2023-12-28	11
123	2023-01-01	2023-12-31	6
124	2023-01-01	2023-12-31	20
125	2023-01-01	2023-05-28	8
126	2023-01-01	2023-12-31	4
127	2023-01-01	2023-12-31	14
128	2023-07-01	2023-12-28	2
129	2023-01-01	2023-12-31	9
130	2023-02-01	2023-11-28	18
131	2023-01-01	2023-12-31	5
132	2023-09-01	2023-12-28	13
133	2023-01-01	2023-12-31	5
134	2023-10-06	2023-11-20	11
135	2023-01-01	2023-12-31	4
136	2023-01-01	2023-12-31	9
137	2023-09-01	2023-12-28	10
138	2023-07-01	2023-10-28	11
139	2023-01-01	2023-12-31	19
140	2023-02-17	2023-03-21	16
141	2023-01-01	2023-12-31	8
142	2023-01-01	2023-12-31	5
143	2023-01-01	2023-12-31	2
144	2023-05-01	2023-11-28	8
145	2023-01-01	2023-12-31	14
146	2023-01-01	2023-12-31	8
147	2023-01-01	2023-12-31	19
148	2023-06-01	2023-12-28	7
149	2023-01-01	2023-12-31	16
150	2023-02-09	2023-04-10	18
151	2023-04-01	2023-12-28	12
152	2023-02-01	2023-05-28	12
153	2023-01-01	2023-12-31	11
154	2023-08-01	2023-12-28	2
155	2023-03-01	2023-12-28	6
156	2023-01-01	2023-12-31	9
157	2023-04-01	2023-11-28	14
158	2023-01-01	2023-12-31	1
159	2023-01-01	2023-12-31	4
160	2023-02-06	2023-03-25	18
161	2023-01-01	2023-12-31	16
162	2023-01-01	2023-12-31	16
163	2023-01-01	2023-12-31	10
164	2023-06-01	2023-09-28	17
165	2023-01-01	2023-12-31	16
166	2023-02-01	2023-08-28	8
167	2023-01-01	2023-12-31	18
168	2023-01-01	2023-12-31	13
169	2023-01-01	2023-12-31	10
170	2023-01-01	2023-12-31	8
171	2023-01-01	2023-12-31	10
172	2023-01-01	2023-12-31	1
173	2023-09-01	2023-12-28	7
174	2023-01-01	2023-12-31	9
175	2023-01-01	2023-12-31	15
176	2023-06-10	2023-08-04	6
177	2023-01-27	2023-03-16	5
178	2023-01-01	2023-12-31	17
179	2023-01-01	2023-12-31	15
180	2023-02-01	2023-07-28	15
181	2023-09-01	2023-12-28	6
182	2023-01-01	2023-06-28	5
183	2023-10-08	2023-12-04	11
184	2023-01-01	2023-12-31	18
185	2023-01-01	2023-12-31	7
186	2023-01-01	2023-12-31	15
187	2023-01-01	2023-12-31	20
188	2023-01-01	2023-12-31	10
189	2023-09-01	2023-12-28	13
190	2023-03-01	2023-08-28	15
191	2023-05-21	2023-06-20	3
192	2023-01-19	2023-03-06	13
193	2023-01-01	2023-12-31	11
194	2023-01-01	2023-12-31	5
195	2023-01-01	2023-12-31	1
196	2023-05-01	2023-09-28	17
197	2023-01-01	2023-12-31	17
198	2023-04-09	2023-05-29	10
199	2023-01-01	2023-12-31	7
200	2023-01-01	2023-12-31	10
201	2023-01-01	2023-12-31	15
202	2023-01-01	2023-12-31	15
203	2023-01-01	2023-12-31	5
204	2023-01-01	2023-12-31	14
205	2023-01-01	2023-12-31	13
206	2023-08-23	2023-09-30	10
207	2023-01-01	2023-12-31	16
208	2023-02-01	2023-06-28	19
209	2023-06-14	2023-08-09	19
210	2023-06-01	2023-10-28	12
211	2023-01-01	2023-12-31	13
212	2023-08-01	2023-12-28	11
213	2023-01-01	2023-12-31	15
214	2023-01-01	2023-12-31	13
215	2023-01-01	2023-12-31	14
216	2023-01-01	2023-12-31	6
217	2023-01-01	2023-12-31	4
218	2023-06-01	2023-12-28	2
219	2023-01-01	2023-12-31	3
220	2023-01-01	2023-12-31	14
221	2023-01-01	2023-12-31	4
222	2023-01-01	2023-12-31	2
223	2023-05-04	2023-06-11	14
224	2023-01-01	2023-12-31	10
225	2023-01-01	2023-05-28	4
226	2023-01-01	2023-12-31	13
227	2023-01-01	2023-12-31	12
228	2023-05-01	2023-10-28	2
229	2023-01-01	2023-12-31	17
230	2023-03-01	2023-09-28	17
231	2023-01-01	2023-12-31	14
232	2023-08-01	2023-12-28	19
233	2023-01-01	2023-04-28	20
234	2023-01-01	2023-12-31	10
235	2023-06-01	2023-12-28	19
236	2023-09-01	2023-12-28	14
237	2023-01-01	2023-12-31	14
238	2023-01-01	2023-12-31	20
239	2023-01-01	2023-12-31	14
240	2023-01-01	2023-12-31	6
241	2023-01-01	2023-12-31	6
242	2023-01-01	2023-12-31	15
243	2023-01-01	2023-12-31	14
244	2023-01-01	2023-12-31	17
245	2023-01-01	2023-12-31	7
246	2023-01-01	2023-12-31	7
247	2023-06-01	2023-12-28	9
248	2023-01-01	2023-12-31	18
249	2023-02-01	2023-07-28	6
250	2023-08-01	2023-12-28	19
251	2023-01-01	2023-12-31	13
252	2023-01-01	2023-12-31	15
253	2023-01-01	2023-12-31	19
254	2023-01-01	2023-12-31	6
255	2023-08-06	2023-09-12	3
256	2023-01-01	2023-12-31	6
257	2023-02-25	2023-04-11	7
258	2023-08-01	2023-12-28	14
259	2023-01-01	2023-12-31	11
260	2023-08-01	2023-12-28	13
261	2023-01-01	2023-12-31	12
262	2023-01-01	2023-12-31	2
263	2023-01-01	2023-12-31	1
264	2023-08-01	2023-12-28	2
265	2023-01-01	2023-12-31	2
266	2023-02-01	2023-08-28	10
267	2023-09-01	2023-12-28	7
268	2023-01-01	2023-12-31	20
269	2023-01-01	2023-12-31	10
270	2023-02-26	2023-03-29	11
271	2023-05-01	2023-12-28	3
272	2023-09-01	2023-12-28	5
273	2023-01-01	2023-12-31	9
274	2023-01-01	2023-12-31	6
275	2023-08-01	2023-11-28	3
276	2023-01-01	2023-12-31	8
277	2023-01-01	2023-12-31	3
278	2023-01-01	2023-12-31	12
279	2023-01-01	2023-12-31	16
280	2023-01-01	2023-12-31	1
281	2023-01-01	2023-12-31	20
282	2023-08-01	2023-12-28	15
283	2023-07-01	2023-11-28	10
284	2023-01-01	2023-08-28	8
285	2023-01-01	2023-12-31	7
286	2023-04-01	2023-12-28	6
287	2023-03-21	2023-05-17	14
288	2023-01-01	2023-12-31	17
289	2023-01-01	2023-12-31	10
290	2023-01-01	2023-12-31	4
291	2023-04-01	2023-08-28	13
292	2023-01-01	2023-12-31	6
293	2023-04-01	2023-07-28	18
294	2023-01-01	2023-12-31	2
295	2023-01-01	2023-12-31	4
296	2023-01-01	2023-12-31	20
297	2023-01-01	2023-12-31	14
298	2023-01-01	2023-12-31	6
299	2023-04-01	2023-09-28	19
300	2023-01-01	2023-12-31	15
301	2023-03-15	2023-04-26	5
302	2023-01-01	2023-12-31	2
303	2023-03-01	2023-11-28	14
304	2023-01-01	2023-12-31	15
305	2023-01-01	2023-12-31	2
306	2023-01-01	2023-12-31	5
307	2023-01-01	2023-12-31	19
308	2023-09-03	2023-10-23	19
309	2023-05-01	2023-12-28	7
310	2023-06-01	2023-11-28	7
311	2023-09-01	2023-12-28	7
312	2023-01-01	2023-05-28	3
313	2023-01-01	2023-12-31	16
314	2023-01-01	2023-12-31	7
315	2023-01-01	2023-12-31	14
316	2023-07-01	2023-11-28	14
317	2023-01-01	2023-12-31	2
318	2023-02-01	2023-09-28	17
319	2023-02-01	2023-07-28	6
320	2023-01-01	2023-12-31	15
321	2023-01-01	2023-12-31	14
322	2023-01-01	2023-12-31	20
323	2023-01-01	2023-12-31	4
324	2023-01-01	2023-12-31	8
325	2023-06-01	2023-12-28	7
326	2023-09-01	2023-12-28	11
327	2023-02-01	2023-06-28	6
328	2023-01-01	2023-05-28	1
329	2023-01-01	2023-12-31	1
330	2023-07-01	2023-12-28	3
331	2023-01-01	2023-12-31	14
332	2023-01-01	2023-12-31	18
333	2023-01-01	2023-12-31	4
334	2023-08-01	2023-12-28	15
335	2023-01-01	2023-12-31	6
336	2023-01-01	2023-12-31	15
337	2023-03-01	2023-06-28	13
338	2023-01-01	2023-12-31	16
339	2023-01-01	2023-12-31	11
340	2023-01-01	2023-12-31	11
341	2023-01-01	2023-12-31	16
342	2023-01-01	2023-12-31	1
343	2023-01-01	2023-12-31	19
344	2023-01-01	2023-12-31	5
345	2023-01-01	2023-12-31	1
346	2023-01-01	2023-12-31	15
347	2023-01-01	2023-12-31	10
348	2023-01-01	2023-12-31	18
349	2023-01-01	2023-12-31	11
350	2023-01-01	2023-12-31	20
351	2023-01-01	2023-12-31	16
352	2023-01-01	2023-12-31	12
353	2023-03-01	2023-06-28	7
354	2023-01-01	2023-12-31	1
355	2023-04-18	2023-06-05	7
356	2023-06-01	2023-12-28	6
357	2023-01-01	2023-12-31	13
358	2023-04-01	2023-12-28	19
359	2023-01-01	2023-12-31	11
360	2023-05-01	2023-12-28	14
361	2023-01-01	2023-12-31	2
362	2023-01-01	2023-12-31	11
363	2023-01-01	2023-12-31	2
364	2023-01-01	2023-12-31	13
365	2023-08-01	2023-12-28	14
366	2023-01-01	2023-12-31	20
367	2023-01-01	2023-12-31	19
368	2023-07-01	2023-12-28	3
369	2023-01-01	2023-12-31	16
370	2023-03-01	2023-07-28	10
371	2023-01-01	2023-12-31	19
372	2023-07-01	2023-12-28	16
373	2023-01-01	2023-12-31	14
374	2023-01-01	2023-12-31	5
375	2023-03-09	2023-04-20	12
376	2023-01-01	2023-12-31	16
377	2023-01-01	2023-12-31	10
378	2023-01-01	2023-12-31	13
379	2023-05-01	2023-12-28	9
380	2023-01-01	2023-08-28	12
381	2023-01-01	2023-12-31	14
382	2023-09-01	2023-12-28	13
383	2023-08-30	2023-10-06	8
384	2023-04-01	2023-07-28	6
385	2023-01-01	2023-12-31	11
386	2023-01-01	2023-12-31	20
387	2023-01-01	2023-12-31	8
388	2023-01-01	2023-12-31	10
389	2023-04-01	2023-10-28	13
390	2023-01-01	2023-12-31	18
391	2023-01-01	2023-12-31	11
392	2023-01-01	2023-12-31	11
393	2023-06-21	2023-08-07	4
394	2023-04-04	2023-05-04	10
395	2023-01-01	2023-12-31	16
396	2023-08-07	2023-09-24	13
397	2023-01-01	2023-12-31	3
398	2023-05-18	2023-07-11	11
399	2023-01-01	2023-12-31	7
400	2023-01-01	2023-12-31	10
401	2023-01-01	2023-12-31	10
402	2023-01-01	2023-12-31	16
403	2023-01-01	2023-12-31	5
404	2023-03-01	2023-12-28	19
405	2023-06-01	2023-12-28	9
406	2023-07-21	2023-09-18	3
407	2023-01-01	2023-12-31	2
408	2023-01-01	2023-12-31	9
409	2023-01-01	2023-12-31	7
410	2023-01-01	2023-12-31	20
411	2023-01-01	2023-12-31	13
412	2023-09-01	2023-12-28	5
413	2023-01-01	2023-12-31	16
414	2023-01-01	2023-12-31	13
415	2023-01-01	2023-12-31	6
416	2023-01-01	2023-12-31	1
417	2023-01-01	2023-12-31	8
418	2023-01-01	2023-12-31	19
419	2023-01-01	2023-12-31	7
420	2023-01-01	2023-12-31	14
421	2023-09-01	2023-12-28	6
422	2023-01-01	2023-12-31	18
423	2023-01-01	2023-12-31	5
424	2023-01-01	2023-12-31	19
425	2023-01-01	2023-12-31	12
426	2023-01-01	2023-12-31	19
427	2023-09-01	2023-12-28	6
428	2023-01-01	2023-12-31	7
429	2023-01-01	2023-12-31	16
430	2023-01-01	2023-12-31	12
431	2023-09-01	2023-12-28	13
432	2023-05-17	2023-07-14	1
433	2023-07-01	2023-12-28	15
434	2023-01-10	2023-02-17	9
435	2023-03-01	2023-07-28	11
436	2023-06-01	2023-12-28	1
437	2023-09-23	2023-10-31	19
438	2023-05-05	2023-06-04	10
439	2023-01-01	2023-12-31	12
440	2023-01-01	2023-12-31	7
441	2023-01-01	2023-12-31	17
442	2023-01-01	2023-12-31	20
443	2023-01-01	2023-06-28	16
444	2023-01-01	2023-12-31	12
445	2023-07-01	2023-12-28	12
446	2023-01-01	2023-12-31	14
447	2023-01-01	2023-12-31	2
448	2023-01-01	2023-12-31	9
449	2023-01-01	2023-12-31	13
450	2023-01-01	2023-12-31	12
451	2023-08-28	2023-10-08	14
452	2023-01-01	2023-12-31	2
453	2023-07-01	2023-12-28	7
454	2023-01-01	2023-12-31	20
455	2023-01-01	2023-12-31	19
456	2023-01-01	2023-12-31	20
457	2023-01-01	2023-12-31	13
458	2023-01-01	2023-12-31	3
459	2023-01-01	2023-12-31	16
460	2023-01-01	2023-12-31	9
461	2023-02-01	2023-08-28	12
462	2023-01-01	2023-12-31	4
463	2023-03-23	2023-05-14	6
464	2023-05-01	2023-11-28	3
465	2023-01-01	2023-12-31	18
466	2023-01-01	2023-12-31	20
467	2023-01-19	2023-03-16	3
468	2023-01-01	2023-12-31	15
469	2023-01-01	2023-12-31	7
470	2023-01-01	2023-12-31	2
471	2023-06-01	2023-10-28	14
472	2023-01-01	2023-12-31	12
473	2023-01-01	2023-12-31	13
474	2023-01-01	2023-12-31	20
475	2023-01-01	2023-12-31	8
476	2023-01-01	2023-12-31	6
477	2023-01-01	2023-12-31	8
478	2023-01-01	2023-12-31	7
479	2023-10-04	2023-11-29	6
480	2023-01-01	2023-12-31	20
481	2023-01-01	2023-12-31	6
482	2023-02-01	2023-05-28	18
483	2023-01-01	2023-12-31	4
484	2023-10-03	2023-11-02	13
485	2023-01-01	2023-12-31	13
486	2023-01-01	2023-12-31	4
487	2023-02-24	2023-04-10	15
488	2023-01-01	2023-12-31	15
489	2023-01-01	2023-12-31	20
490	2023-02-01	2023-08-28	11
491	2023-01-01	2023-12-31	5
492	2023-10-04	2023-11-24	5
493	2023-04-01	2023-12-28	13
494	2023-01-01	2023-12-31	9
495	2023-01-01	2023-12-31	14
496	2023-08-01	2023-11-28	17
497	2023-06-01	2023-12-28	3
498	2023-01-01	2023-12-31	14
499	2023-01-01	2023-12-31	4
500	2023-01-01	2023-12-31	20
501	2023-01-01	2023-04-28	9
502	2023-01-01	2023-12-31	5
503	2023-08-01	2023-11-28	4
504	2023-07-22	2023-09-07	13
505	2023-01-01	2023-12-31	17
506	2023-07-01	2023-11-28	2
507	2023-05-11	2023-07-10	16
508	2023-01-01	2023-12-31	14
509	2023-01-01	2023-12-31	20
510	2023-01-01	2023-12-31	5
511	2023-01-01	2023-12-31	11
512	2023-01-01	2023-12-31	16
513	2023-01-01	2023-12-31	19
514	2023-04-01	2023-12-28	1
515	2023-01-01	2023-12-31	17
516	2023-01-01	2023-12-31	9
517	2023-01-01	2023-12-31	16
518	2023-01-01	2023-12-31	1
519	2023-01-01	2023-12-31	8
520	2023-04-01	2023-10-28	5
521	2023-01-01	2023-12-31	20
522	2023-01-01	2023-12-31	6
523	2023-01-01	2023-12-31	6
524	2023-01-01	2023-07-28	1
525	2023-01-01	2023-12-31	2
526	2023-01-01	2023-12-31	15
527	2023-01-01	2023-12-31	6
528	2023-07-16	2023-09-06	7
529	2023-01-01	2023-12-31	15
530	2023-01-01	2023-12-31	20
531	2023-07-01	2023-12-28	7
532	2023-10-29	2023-12-26	10
533	2023-08-31	2023-10-22	11
534	2023-01-01	2023-05-28	4
535	2023-01-01	2023-12-31	14
536	2023-01-01	2023-12-31	8
537	2023-01-01	2023-12-31	20
538	2023-01-01	2023-12-31	14
539	2023-04-01	2023-08-28	8
540	2023-01-01	2023-12-31	1
541	2023-01-01	2023-12-31	13
542	2023-06-01	2023-10-28	1
543	2023-01-01	2023-12-31	4
544	2023-07-01	2023-11-28	18
545	2023-01-01	2023-12-31	15
546	2023-06-01	2023-12-28	8
547	2023-01-01	2023-12-31	18
548	2023-01-01	2023-12-31	15
549	2023-10-23	2023-12-19	16
550	2023-07-01	2023-11-28	17
551	2023-01-01	2023-12-31	4
552	2023-06-07	2023-07-10	1
553	2023-01-01	2023-12-31	17
554	2023-07-01	2023-12-28	8
555	2023-10-13	2023-11-13	4
556	2023-07-30	2023-09-19	11
557	2023-01-01	2023-12-31	9
558	2023-01-01	2023-07-28	14
559	2023-09-01	2023-12-28	10
560	2023-04-01	2023-10-28	3
561	2023-01-01	2023-12-31	18
562	2023-01-01	2023-12-31	3
563	2023-01-01	2023-12-31	20
564	2023-10-10	2023-11-15	17
565	2023-07-01	2023-12-28	12
566	2023-01-01	2023-12-31	16
567	2023-08-01	2023-12-28	18
568	2023-01-01	2023-12-31	8
569	2023-01-01	2023-12-31	17
570	2023-10-14	2023-12-02	3
571	2023-01-01	2023-12-31	3
572	2023-01-01	2023-12-31	15
573	2023-01-01	2023-12-31	8
574	2023-01-01	2023-12-31	10
575	2023-05-01	2023-12-28	5
576	2023-04-01	2023-09-28	6
577	2023-01-01	2023-12-31	5
578	2023-01-12	2023-03-04	1
579	2023-07-01	2023-11-28	15
580	2023-03-01	2023-06-28	10
581	2023-01-01	2023-12-31	13
582	2023-01-01	2023-12-31	15
583	2023-01-01	2023-12-31	10
584	2023-01-01	2023-12-31	3
585	2023-03-01	2023-07-28	18
586	2023-01-01	2023-12-31	3
587	2023-01-01	2023-12-31	17
588	2023-09-25	2023-11-09	12
589	2023-01-01	2023-12-31	16
590	2023-02-01	2023-09-28	12
591	2023-01-01	2023-12-31	17
592	2023-01-01	2023-12-31	15
593	2023-01-01	2023-12-31	7
594	2023-01-01	2023-12-31	8
595	2023-01-01	2023-12-31	20
596	2023-01-01	2023-12-31	2
597	2023-01-27	2023-03-11	3
598	2023-05-01	2023-12-28	19
599	2023-01-01	2023-12-31	7
600	2023-01-01	2023-12-31	11
601	2023-01-01	2023-12-31	20
602	2023-01-01	2023-12-31	5
603	2023-01-02	2023-02-06	20
604	2023-03-01	2023-08-28	18
605	2023-10-30	2023-12-12	18
606	2023-01-01	2023-12-31	1
607	2023-01-01	2023-12-31	2
608	2023-01-01	2023-12-31	5
609	2023-01-01	2023-12-31	1
610	2023-07-01	2023-12-28	13
611	2023-02-01	2023-07-28	6
612	2023-08-01	2023-12-28	1
613	2023-01-01	2023-12-31	14
614	2023-02-01	2023-09-28	14
615	2023-01-01	2023-12-31	13
616	2023-06-01	2023-12-28	13
617	2023-01-01	2023-12-31	2
618	2023-01-01	2023-12-31	6
619	2023-01-01	2023-12-31	20
620	2023-01-01	2023-12-31	3
621	2023-01-01	2023-12-31	16
622	2023-01-01	2023-12-31	15
623	2023-01-01	2023-12-31	6
624	2023-09-01	2023-12-28	2
625	2023-01-01	2023-12-31	3
626	2023-01-01	2023-12-31	4
627	2023-01-01	2023-12-31	11
628	2023-01-01	2023-12-31	4
629	2023-01-01	2023-12-31	15
630	2023-01-01	2023-12-31	3
631	2023-01-01	2023-12-31	6
632	2023-09-10	2023-10-13	19
633	2023-07-01	2023-12-28	8
634	2023-01-18	2023-03-04	4
635	2023-01-01	2023-12-31	10
636	2023-01-01	2023-12-31	12
637	2023-01-01	2023-12-31	6
638	2023-01-01	2023-12-31	18
639	2023-02-01	2023-05-28	4
640	2023-01-01	2023-12-31	14
641	2023-06-01	2023-12-28	13
642	2023-01-01	2023-04-28	8
643	2023-01-01	2023-12-31	5
644	2023-01-18	2023-02-27	9
645	2023-10-21	2023-12-15	11
646	2023-09-01	2023-12-28	1
647	2023-01-01	2023-12-31	12
648	2023-03-28	2023-05-04	4
649	2023-01-01	2023-12-31	14
650	2023-01-27	2023-03-05	3
651	2023-01-01	2023-12-31	7
652	2023-01-01	2023-09-28	12
653	2023-01-01	2023-12-31	6
654	2023-01-01	2023-12-31	16
655	2023-01-01	2023-12-31	9
656	2023-01-01	2023-12-31	17
657	2023-05-26	2023-07-25	10
658	2023-01-01	2023-12-31	7
659	2023-01-01	2023-12-31	14
660	2023-01-01	2023-12-31	5
661	2023-03-26	2023-05-25	8
662	2023-08-26	2023-10-15	12
663	2023-03-01	2023-06-28	5
664	2023-01-01	2023-12-31	14
665	2023-01-01	2023-12-31	19
666	2023-01-01	2023-12-31	14
667	2023-01-01	2023-12-31	19
668	2023-01-01	2023-12-31	4
669	2023-02-01	2023-07-28	14
670	2023-03-17	2023-04-27	11
671	2023-01-01	2023-12-31	18
672	2023-06-01	2023-11-28	1
673	2023-01-01	2023-12-31	5
674	2023-01-01	2023-06-28	10
675	2023-01-24	2023-03-11	15
676	2023-01-01	2023-12-31	15
677	2023-05-01	2023-09-28	7
678	2023-01-01	2023-12-31	1
679	2023-01-01	2023-12-31	9
680	2023-01-01	2023-12-31	10
681	2023-02-01	2023-09-28	2
682	2023-01-01	2023-12-31	11
683	2023-09-09	2023-11-01	7
684	2023-01-01	2023-12-31	5
685	2023-01-01	2023-12-31	9
686	2023-01-01	2023-12-31	5
687	2023-01-01	2023-12-31	13
688	2023-06-23	2023-07-24	20
689	2023-02-05	2023-03-10	10
690	2023-01-01	2023-12-31	7
691	2023-01-01	2023-12-31	1
692	2023-01-01	2023-12-31	4
693	2023-01-01	2023-12-31	12
694	2023-01-01	2023-12-31	5
695	2023-01-01	2023-12-31	11
696	2023-08-01	2023-12-28	2
697	2023-03-01	2023-07-28	14
698	2023-01-01	2023-12-31	6
699	2023-05-01	2023-10-28	15
700	2023-01-01	2023-12-31	19
701	2023-07-01	2023-12-28	16
702	2023-04-01	2023-09-28	5
703	2023-01-01	2023-12-31	8
704	2023-06-01	2023-09-28	16
705	2023-05-01	2023-10-28	19
706	2023-03-05	2023-05-02	3
707	2023-01-01	2023-09-28	19
708	2023-01-01	2023-12-31	17
709	2023-01-01	2023-12-31	6
710	2023-01-01	2023-12-31	15
711	2023-01-01	2023-12-31	12
712	2023-01-01	2023-12-31	5
713	2023-01-01	2023-12-31	5
714	2023-01-01	2023-12-31	13
715	2023-05-01	2023-12-28	19
716	2023-05-01	2023-10-28	2
717	2023-07-25	2023-09-12	15
718	2023-01-01	2023-12-31	4
719	2023-01-01	2023-12-31	17
720	2023-01-01	2023-12-31	7
721	2023-07-01	2023-12-28	18
722	2023-04-25	2023-06-07	8
723	2023-01-01	2023-12-31	20
724	2023-01-01	2023-12-31	12
725	2023-06-01	2023-12-28	19
726	2023-06-21	2023-08-18	20
727	2023-06-01	2023-12-28	9
728	2023-02-01	2023-05-28	8
729	2023-01-01	2023-12-31	12
730	2023-01-01	2023-12-31	19
731	2023-01-01	2023-12-31	13
732	2023-04-29	2023-06-05	12
733	2023-05-01	2023-12-28	20
734	2023-08-01	2023-11-28	19
735	2023-04-01	2023-10-28	2
736	2023-01-01	2023-12-31	3
737	2023-03-01	2023-10-28	15
738	2023-05-12	2023-06-13	5
739	2023-01-01	2023-12-31	4
740	2023-01-01	2023-12-31	13
741	2023-10-02	2023-12-01	15
742	2023-02-01	2023-06-28	3
743	2023-01-18	2023-02-27	14
744	2023-05-01	2023-11-28	15
745	2023-03-01	2023-12-28	13
746	2023-05-01	2023-11-28	6
747	2023-01-01	2023-12-31	6
748	2023-10-20	2023-12-10	10
749	2023-01-01	2023-12-31	6
750	2023-04-01	2023-10-28	12
751	2023-01-01	2023-12-31	19
752	2023-01-01	2023-12-31	7
753	2023-05-12	2023-07-03	15
754	2023-03-01	2023-08-28	18
755	2023-01-01	2023-12-31	13
756	2023-01-01	2023-12-31	6
757	2023-04-01	2023-10-28	18
758	2023-01-01	2023-12-31	1
759	2023-01-01	2023-08-28	20
760	2023-01-01	2023-12-31	3
761	2023-06-09	2023-07-10	14
762	2023-03-22	2023-05-19	17
763	2023-01-01	2023-12-31	17
764	2023-01-01	2023-12-31	19
765	2023-01-01	2023-12-31	9
766	2023-01-01	2023-12-31	13
767	2023-01-01	2023-12-31	6
768	2023-01-01	2023-12-31	17
769	2023-01-01	2023-12-31	14
770	2023-01-01	2023-12-31	14
771	2023-01-01	2023-12-31	12
772	2023-01-01	2023-12-31	11
773	2023-05-01	2023-09-28	2
774	2023-07-01	2023-12-28	6
775	2023-01-01	2023-10-28	11
776	2023-02-01	2023-07-28	14
777	2023-01-06	2023-02-22	3
778	2023-01-01	2023-12-31	16
779	2023-06-01	2023-10-28	14
780	2023-05-03	2023-06-19	11
781	2023-01-01	2023-12-31	8
782	2023-01-01	2023-12-31	7
783	2023-01-01	2023-12-31	10
784	2023-01-01	2023-12-31	17
785	2023-07-01	2023-11-28	6
786	2023-01-01	2023-12-31	11
787	2023-06-01	2023-12-28	2
788	2023-01-01	2023-10-28	18
789	2023-01-01	2023-12-31	8
790	2023-08-17	2023-10-16	18
791	2023-09-01	2023-12-28	1
792	2023-01-01	2023-12-31	14
793	2023-01-01	2023-12-31	13
794	2023-05-01	2023-12-28	5
795	2023-01-01	2023-12-31	7
796	2023-07-01	2023-12-28	9
797	2023-03-01	2023-12-28	18
798	2023-05-01	2023-10-28	19
799	2023-01-01	2023-12-31	6
800	2023-07-01	2023-11-28	15
801	2023-02-01	2023-06-28	14
802	2023-01-01	2023-12-31	17
803	2023-01-01	2023-12-31	11
804	2023-03-01	2023-07-28	12
805	2023-01-01	2023-12-31	8
806	2023-09-01	2023-12-28	19
807	2023-01-01	2023-12-31	3
808	2023-01-01	2023-12-31	19
809	2023-05-01	2023-11-28	9
810	2023-04-24	2023-05-31	17
811	2023-01-01	2023-12-31	16
812	2023-01-01	2023-12-31	6
813	2023-01-01	2023-12-31	17
814	2023-01-01	2023-12-31	13
815	2023-06-30	2023-07-31	19
816	2023-07-01	2023-12-28	3
817	2023-09-01	2023-12-28	18
818	2023-08-01	2023-12-28	13
819	2023-06-01	2023-12-28	14
820	2023-02-01	2023-11-28	19
821	2023-06-01	2023-09-28	20
822	2023-05-01	2023-09-28	4
823	2023-01-01	2023-12-31	4
824	2023-01-01	2023-12-31	8
825	2023-09-01	2023-12-28	14
826	2023-01-01	2023-12-31	15
827	2023-02-16	2023-03-29	3
828	2023-01-01	2023-12-31	12
829	2023-01-29	2023-03-05	2
830	2023-01-01	2023-12-31	1
831	2023-01-01	2023-12-31	13
832	2023-01-01	2023-12-31	5
833	2023-01-01	2023-12-31	16
834	2023-01-01	2023-12-31	11
835	2023-01-01	2023-12-31	4
836	2023-01-01	2023-12-31	4
837	2023-01-01	2023-12-31	20
838	2023-09-04	2023-10-07	2
839	2023-08-01	2023-11-28	9
840	2023-01-01	2023-12-31	12
841	2023-01-01	2023-12-31	16
842	2023-01-01	2023-12-31	1
843	2023-01-01	2023-12-31	4
844	2023-01-01	2023-06-28	6
845	2023-03-01	2023-08-28	13
846	2023-01-01	2023-12-31	5
847	2023-01-01	2023-12-31	11
848	2023-01-01	2023-12-31	19
849	2023-01-01	2023-12-31	13
850	2023-01-01	2023-12-31	13
851	2023-01-01	2023-12-31	6
852	2023-09-01	2023-12-28	9
853	2023-01-01	2023-12-31	20
854	2023-01-01	2023-08-28	20
855	2023-05-12	2023-06-17	17
856	2023-01-01	2023-12-31	11
857	2023-01-01	2023-12-31	11
858	2023-01-01	2023-12-31	20
859	2023-01-01	2023-12-31	14
860	2023-04-01	2023-12-28	20
861	2023-01-01	2023-12-31	2
862	2023-04-01	2023-09-28	8
863	2023-01-01	2023-12-31	13
864	2023-01-01	2023-12-31	12
865	2023-03-11	2023-04-23	9
866	2023-01-01	2023-12-31	18
867	2023-01-01	2023-12-31	5
868	2023-01-01	2023-12-31	20
869	2023-01-01	2023-12-31	17
870	2023-01-01	2023-12-31	15
871	2023-01-01	2023-12-31	3
872	2023-01-01	2023-12-31	17
873	2023-01-01	2023-12-31	3
874	2023-01-01	2023-12-31	18
875	2023-01-01	2023-12-31	9
876	2023-01-01	2023-12-31	5
877	2023-01-01	2023-12-31	18
878	2023-01-01	2023-12-31	5
879	2023-04-04	2023-05-06	16
880	2023-01-01	2023-12-31	9
881	2023-06-01	2023-10-28	18
882	2023-01-01	2023-12-31	13
883	2023-01-01	2023-12-31	20
884	2023-01-01	2023-12-31	19
885	2023-09-02	2023-10-10	12
886	2023-04-01	2023-12-28	17
887	2023-01-01	2023-12-31	20
888	2023-04-22	2023-06-19	14
889	2023-06-01	2023-12-28	14
890	2023-01-01	2023-12-31	11
891	2023-01-01	2023-12-31	13
892	2023-07-01	2023-11-28	13
893	2023-01-01	2023-12-31	14
894	2023-01-21	2023-03-15	11
895	2023-01-01	2023-12-31	8
896	2023-01-01	2023-12-31	1
897	2023-07-01	2023-11-28	20
898	2023-05-01	2023-09-28	2
899	2023-09-01	2023-12-28	11
900	2023-01-01	2023-12-31	19
901	2023-01-01	2023-12-31	14
902	2023-01-01	2023-12-31	11
903	2023-01-01	2023-12-31	9
904	2023-02-03	2023-03-05	12
905	2023-05-01	2023-12-28	16
906	2023-01-01	2023-12-31	7
907	2023-01-01	2023-12-31	12
908	2023-01-01	2023-12-31	17
909	2023-01-01	2023-12-31	3
910	2023-01-01	2023-12-31	9
911	2023-01-01	2023-12-31	17
912	2023-01-01	2023-12-31	16
913	2023-01-01	2023-12-31	14
914	2023-08-01	2023-11-28	18
915	2023-01-01	2023-12-31	1
916	2023-01-01	2023-12-31	19
917	2023-01-01	2023-12-31	11
918	2023-01-01	2023-12-31	10
919	2023-01-01	2023-12-31	6
920	2023-08-01	2023-12-28	3
921	2023-01-01	2023-12-31	16
922	2023-01-01	2023-12-31	11
923	2023-01-01	2023-12-31	19
924	2023-04-01	2023-08-28	6
925	2023-01-01	2023-12-31	5
926	2023-01-01	2023-12-31	8
927	2023-06-15	2023-08-05	10
928	2023-08-02	2023-09-29	13
929	2023-01-01	2023-12-31	14
930	2023-01-01	2023-12-31	1
931	2023-01-01	2023-12-31	16
932	2023-08-01	2023-12-28	14
933	2023-01-01	2023-12-31	12
934	2023-01-01	2023-12-31	8
935	2023-10-19	2023-12-09	12
936	2023-01-01	2023-12-31	6
937	2023-01-01	2023-12-31	7
938	2023-08-01	2023-12-28	17
939	2023-01-01	2023-04-28	4
940	2023-01-01	2023-12-31	17
941	2023-03-01	2023-10-28	4
942	2023-01-01	2023-12-31	4
943	2023-03-01	2023-09-28	12
944	2023-01-01	2023-12-31	1
945	2023-01-01	2023-12-31	15
946	2023-01-01	2023-12-31	17
947	2023-01-01	2023-12-31	6
948	2023-01-01	2023-12-31	10
949	2023-05-01	2023-12-28	1
950	2023-08-01	2023-12-28	18
951	2023-08-01	2023-12-28	5
952	2023-01-01	2023-12-31	1
953	2023-01-01	2023-12-31	9
954	2023-02-01	2023-07-28	4
955	2023-01-01	2023-12-31	14
956	2023-01-01	2023-12-31	16
957	2023-01-01	2023-12-31	10
958	2023-01-01	2023-06-28	15
959	2023-08-01	2023-11-28	13
960	2023-01-01	2023-12-31	18
961	2023-01-01	2023-12-31	9
962	2023-02-01	2023-10-28	13
963	2023-07-01	2023-12-28	9
964	2023-02-28	2023-04-05	1
965	2023-09-01	2023-12-28	9
966	2023-01-01	2023-12-31	10
967	2023-01-01	2023-12-31	20
968	2023-04-01	2023-09-28	1
969	2023-01-01	2023-12-31	10
970	2023-07-01	2023-10-28	18
971	2023-04-01	2023-09-28	16
972	2023-01-01	2023-12-31	2
973	2023-08-31	2023-10-25	1
974	2023-01-01	2023-12-31	16
975	2023-01-01	2023-12-31	9
976	2023-01-01	2023-12-31	6
977	2023-01-01	2023-12-31	8
978	2023-06-20	2023-08-06	9
979	2023-01-01	2023-12-31	11
980	2023-01-01	2023-12-31	3
981	2023-01-01	2023-12-31	12
982	2023-01-01	2023-12-31	5
983	2023-01-01	2023-12-31	20
984	2023-01-01	2023-08-28	13
985	2023-01-01	2023-12-31	19
986	2023-01-01	2023-12-31	18
987	2023-01-01	2023-12-31	1
988	2023-01-01	2023-12-31	3
989	2023-04-15	2023-05-28	12
990	2023-01-01	2023-12-31	7
991	2023-01-01	2023-12-31	7
992	2023-01-01	2023-06-28	8
993	2023-01-01	2023-12-31	6
994	2023-01-01	2023-12-31	8
995	2023-01-01	2023-12-31	3
996	2023-01-01	2023-12-31	4
997	2023-08-01	2023-12-28	9
998	2023-01-01	2023-12-31	10
999	2023-01-01	2023-12-31	20
1000	2023-02-01	2023-07-28	14
\.


                                                                                                                                                                                                            restore.sql                                                                                         0000600 0004000 0002000 00000117630 14771407746 0015415 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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

DROP DATABASE hotel_db;
--
-- Name: hotel_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE hotel_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru-RU';


ALTER DATABASE hotel_db OWNER TO postgres;

\connect hotel_db

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Акция; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Акция" (
    "идентификатор_акции" integer NOT NULL,
    "название" character varying(80) NOT NULL,
    "процент_скидки" double precision NOT NULL,
    "дата_начала" date NOT NULL,
    "дата_конца" date NOT NULL,
    "идентификатор_типа_комнаты" integer NOT NULL,
    CONSTRAINT "Акция_check" CHECK (("дата_начала" < "дата_конца")),
    CONSTRAINT "Акция_процент_скидки_check" CHECK (("процент_скидки" > (0)::double precision))
);


ALTER TABLE public."Акция" OWNER TO postgres;

--
-- Name: Акция_идентификатор_акции_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Акция_идентификатор_акции_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Акция_идентификатор_акции_seq" OWNER TO postgres;

--
-- Name: Акция_идентификатор_акции_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Акция_идентификатор_акции_seq" OWNED BY public."Акция"."идентификатор_акции";


--
-- Name: Договор; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Договор" (
    "идентификатор_договора" integer NOT NULL,
    "идентификатор_должности" integer NOT NULL,
    "табельный_номер" integer NOT NULL,
    "тип_договора" character varying(80) NOT NULL,
    "условия" character varying(100) NOT NULL,
    "вид" character varying(80),
    "дата_окончания" date NOT NULL,
    "дата_начала" date NOT NULL,
    CONSTRAINT "Договор_check" CHECK (("дата_начала" < "дата_окончания")),
    CONSTRAINT "Договор_тип_договора_check" CHECK ((("тип_договора")::text = ANY ((ARRAY['срочный'::character varying, 'бессрочный'::character varying, 'ГПХ'::character varying])::text[])))
);


ALTER TABLE public."Договор" OWNER TO postgres;

--
-- Name: Договор_идентификатор_договора_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Договор_идентификатор_договора_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Договор_идентификатор_договора_seq" OWNER TO postgres;

--
-- Name: Договор_идентификатор_договора_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Договор_идентификатор_договора_seq" OWNED BY public."Договор"."идентификатор_договора";


--
-- Name: Должность; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Должность" (
    "идентификатор_должности" integer NOT NULL,
    "название" character varying(80) NOT NULL,
    "количество_ставок" integer NOT NULL,
    CONSTRAINT "Должность_количество_ставок_check" CHECK (("количество_ставок" > 0))
);


ALTER TABLE public."Должность" OWNER TO postgres;

--
-- Name: Должность_идентификатор_должно_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Должность_идентификатор_должно_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Должность_идентификатор_должно_seq" OWNER TO postgres;

--
-- Name: Должность_идентификатор_должно_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Должность_идентификатор_должно_seq" OWNED BY public."Должность"."идентификатор_должности";


--
-- Name: Заказ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Заказ" (
    "идентификатор_бронирования" integer NOT NULL,
    "дата_бронирования" date NOT NULL,
    "дата_заезда" date NOT NULL,
    "дата_отъезда" date NOT NULL,
    "итоговая_сумма" double precision NOT NULL,
    "состояние" boolean NOT NULL,
    "идентификатор_комнаты" integer NOT NULL,
    "идентификатор_договора" integer NOT NULL,
    "серия_и_номер" character varying(80) NOT NULL,
    CONSTRAINT "Заказ_check" CHECK (("дата_заезда" < "дата_отъезда")),
    CONSTRAINT "Заказ_итоговая_сумма_check" CHECK (("итоговая_сумма" > (0)::double precision))
);


ALTER TABLE public."Заказ" OWNER TO postgres;

--
-- Name: Заказ_идентификатор_бронирован_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Заказ_идентификатор_бронирован_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Заказ_идентификатор_бронирован_seq" OWNER TO postgres;

--
-- Name: Заказ_идентификатор_бронирован_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Заказ_идентификатор_бронирован_seq" OWNED BY public."Заказ"."идентификатор_бронирования";


--
-- Name: Комната; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Комната" (
    "идентификатор_комнаты" integer NOT NULL,
    "код_филиала" integer NOT NULL,
    "идентификатор_типа_комнаты" integer NOT NULL,
    "статус_занятости" boolean NOT NULL,
    "статус_уборки" boolean NOT NULL,
    "примечание" character varying(80) NOT NULL,
    "номер" integer NOT NULL,
    CONSTRAINT "Комната_номер_check" CHECK (("номер" > 0))
);


ALTER TABLE public."Комната" OWNER TO postgres;

--
-- Name: Комната_идентификатор_комнаты_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Комната_идентификатор_комнаты_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Комната_идентификатор_комнаты_seq" OWNER TO postgres;

--
-- Name: Комната_идентификатор_комнаты_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Комната_идентификатор_комнаты_seq" OWNED BY public."Комната"."идентификатор_комнаты";


--
-- Name: Оплата; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Оплата" (
    "идентификатор_оплаты" integer NOT NULL,
    "идентификатор_бронирования" integer NOT NULL,
    "дата_оплаты" date NOT NULL,
    "сумма" double precision NOT NULL,
    "статус" boolean NOT NULL,
    "метод" character varying(40) NOT NULL,
    CONSTRAINT "Оплата_метод_check" CHECK ((("метод")::text = ANY ((ARRAY['наличные'::character varying, 'карта'::character varying, 'СБП'::character varying, 'криптовалюта'::character varying, 'перевод'::character varying])::text[]))),
    CONSTRAINT "Оплата_сумма_check" CHECK (("сумма" > (0)::double precision))
);


ALTER TABLE public."Оплата" OWNER TO postgres;

--
-- Name: Оплата_идентификатор_оплаты_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Оплата_идентификатор_оплаты_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Оплата_идентификатор_оплаты_seq" OWNER TO postgres;

--
-- Name: Оплата_идентификатор_оплаты_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Оплата_идентификатор_оплаты_seq" OWNED BY public."Оплата"."идентификатор_оплаты";


--
-- Name: Отель; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Отель" (
    "код_филиала" integer NOT NULL,
    "название" character varying(80) NOT NULL,
    "адрес" character varying(80) NOT NULL,
    "город" character varying(80) NOT NULL
);


ALTER TABLE public."Отель" OWNER TO postgres;

--
-- Name: Отель_код_филиала_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Отель_код_филиала_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Отель_код_филиала_seq" OWNER TO postgres;

--
-- Name: Отель_код_филиала_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Отель_код_филиала_seq" OWNED BY public."Отель"."код_филиала";


--
-- Name: Постоялец; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Постоялец" (
    "серия_и_номер" character varying(80) NOT NULL,
    "фио" character varying(80) NOT NULL,
    "прописка" character varying(120) NOT NULL,
    "дата_рождения" date NOT NULL
);


ALTER TABLE public."Постоялец" OWNER TO postgres;

--
-- Name: Сотрудник; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Сотрудник" (
    "табельный_номер" integer NOT NULL,
    "фио" character varying(80) NOT NULL,
    "номер_телефона" character varying(20) NOT NULL,
    "почта" character varying(80),
    CONSTRAINT "Сотрудник_почта_check" CHECK ((("почта")::text ~~ '%@%.%'::text))
);


ALTER TABLE public."Сотрудник" OWNER TO postgres;

--
-- Name: Сотрудник_табельный_номер_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Сотрудник_табельный_номер_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Сотрудник_табельный_номер_seq" OWNER TO postgres;

--
-- Name: Сотрудник_табельный_номер_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Сотрудник_табельный_номер_seq" OWNED BY public."Сотрудник"."табельный_номер";


--
-- Name: Стоимость; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Стоимость" (
    "идентификатор_стоимости" integer NOT NULL,
    "начало_периода_действия" date NOT NULL,
    "конец_периода_действия" date NOT NULL,
    "название" character varying(80) NOT NULL,
    CONSTRAINT "Стоимость_check" CHECK (("начало_периода_действия" < "конец_периода_действия"))
);


ALTER TABLE public."Стоимость" OWNER TO postgres;

--
-- Name: Стоимость_идентификатор_стоимо_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Стоимость_идентификатор_стоимо_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Стоимость_идентификатор_стоимо_seq" OWNER TO postgres;

--
-- Name: Стоимость_идентификатор_стоимо_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Стоимость_идентификатор_стоимо_seq" OWNED BY public."Стоимость"."идентификатор_стоимости";


--
-- Name: Тип_комнаты; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Тип_комнаты" (
    "идентификатор_типа_комнаты" integer NOT NULL,
    "кол_во_мест" integer NOT NULL,
    "наименование" character varying(80),
    "название_удобства" character varying(80),
    CONSTRAINT "Тип_комнаты_кол_во_мест_check" CHECK (("кол_во_мест" > 0))
);


ALTER TABLE public."Тип_комнаты" OWNER TO postgres;

--
-- Name: Тип_комнаты_идентификатор_типа__seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Тип_комнаты_идентификатор_типа__seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Тип_комнаты_идентификатор_типа__seq" OWNER TO postgres;

--
-- Name: Тип_комнаты_идентификатор_типа__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Тип_комнаты_идентификатор_типа__seq" OWNED BY public."Тип_комнаты"."идентификатор_типа_комнаты";


--
-- Name: Уборка; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Уборка" (
    "идентификатор_уборки" integer NOT NULL,
    "дата_уборки" date NOT NULL,
    "статус_уборки" boolean NOT NULL,
    "сотрудник" character varying(80) NOT NULL,
    "идентификатор_комнаты" integer NOT NULL,
    "идентификатор_договора" integer NOT NULL
);


ALTER TABLE public."Уборка" OWNER TO postgres;

--
-- Name: Уборка_идентификатор_уборки_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Уборка_идентификатор_уборки_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Уборка_идентификатор_уборки_seq" OWNER TO postgres;

--
-- Name: Уборка_идентификатор_уборки_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Уборка_идентификатор_уборки_seq" OWNED BY public."Уборка"."идентификатор_уборки";


--
-- Name: Удобства; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Удобства" (
    "название" character varying(80) NOT NULL,
    "описание" character varying(80) NOT NULL,
    "вкл_невкл" boolean NOT NULL
);


ALTER TABLE public."Удобства" OWNER TO postgres;

--
-- Name: Цена; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Цена" (
    "идентификатор_цены" integer NOT NULL,
    "начало_периода_действия" date NOT NULL,
    "конец_периода_действия" date NOT NULL,
    "идентификатор_типа_комнаты" integer NOT NULL,
    CONSTRAINT "Цена_check" CHECK (("начало_периода_действия" < "конец_периода_действия"))
);


ALTER TABLE public."Цена" OWNER TO postgres;

--
-- Name: Цена_идентификатор_цены_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Цена_идентификатор_цены_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Цена_идентификатор_цены_seq" OWNER TO postgres;

--
-- Name: Цена_идентификатор_цены_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Цена_идентификатор_цены_seq" OWNED BY public."Цена"."идентификатор_цены";


--
-- Name: Акция идентификатор_акции; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Акция" ALTER COLUMN "идентификатор_акции" SET DEFAULT nextval('public."Акция_идентификатор_акции_seq"'::regclass);


--
-- Name: Договор идентификатор_договора; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Договор" ALTER COLUMN "идентификатор_договора" SET DEFAULT nextval('public."Договор_идентификатор_договора_seq"'::regclass);


--
-- Name: Должность идентификатор_должности; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Должность" ALTER COLUMN "идентификатор_должности" SET DEFAULT nextval('public."Должность_идентификатор_должно_seq"'::regclass);


--
-- Name: Заказ идентификатор_бронирования; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Заказ" ALTER COLUMN "идентификатор_бронирования" SET DEFAULT nextval('public."Заказ_идентификатор_бронирован_seq"'::regclass);


--
-- Name: Комната идентификатор_комнаты; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Комната" ALTER COLUMN "идентификатор_комнаты" SET DEFAULT nextval('public."Комната_идентификатор_комнаты_seq"'::regclass);


--
-- Name: Оплата идентификатор_оплаты; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Оплата" ALTER COLUMN "идентификатор_оплаты" SET DEFAULT nextval('public."Оплата_идентификатор_оплаты_seq"'::regclass);


--
-- Name: Отель код_филиала; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Отель" ALTER COLUMN "код_филиала" SET DEFAULT nextval('public."Отель_код_филиала_seq"'::regclass);


--
-- Name: Сотрудник табельный_номер; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник" ALTER COLUMN "табельный_номер" SET DEFAULT nextval('public."Сотрудник_табельный_номер_seq"'::regclass);


--
-- Name: Стоимость идентификатор_стоимости; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Стоимость" ALTER COLUMN "идентификатор_стоимости" SET DEFAULT nextval('public."Стоимость_идентификатор_стоимо_seq"'::regclass);


--
-- Name: Тип_комнаты идентификатор_типа_комнаты; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип_комнаты" ALTER COLUMN "идентификатор_типа_комнаты" SET DEFAULT nextval('public."Тип_комнаты_идентификатор_типа__seq"'::regclass);


--
-- Name: Уборка идентификатор_уборки; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уборка" ALTER COLUMN "идентификатор_уборки" SET DEFAULT nextval('public."Уборка_идентификатор_уборки_seq"'::regclass);


--
-- Name: Цена идентификатор_цены; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Цена" ALTER COLUMN "идентификатор_цены" SET DEFAULT nextval('public."Цена_идентификатор_цены_seq"'::regclass);


--
-- Data for Name: Акция; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Акция" ("идентификатор_акции", "название", "процент_скидки", "дата_начала", "дата_конца", "идентификатор_типа_комнаты") FROM stdin;
\.
COPY public."Акция" ("идентификатор_акции", "название", "процент_скидки", "дата_начала", "дата_конца", "идентификатор_типа_комнаты") FROM '$$PATH$$/4942.dat';

--
-- Data for Name: Договор; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Договор" ("идентификатор_договора", "идентификатор_должности", "табельный_номер", "тип_договора", "условия", "вид", "дата_окончания", "дата_начала") FROM stdin;
\.
COPY public."Договор" ("идентификатор_договора", "идентификатор_должности", "табельный_номер", "тип_договора", "условия", "вид", "дата_окончания", "дата_начала") FROM '$$PATH$$/4928.dat';

--
-- Data for Name: Должность; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Должность" ("идентификатор_должности", "название", "количество_ставок") FROM stdin;
\.
COPY public."Должность" ("идентификатор_должности", "название", "количество_ставок") FROM '$$PATH$$/4924.dat';

--
-- Data for Name: Заказ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Заказ" ("идентификатор_бронирования", "дата_бронирования", "дата_заезда", "дата_отъезда", "итоговая_сумма", "состояние", "идентификатор_комнаты", "идентификатор_договора", "серия_и_номер") FROM stdin;
\.
COPY public."Заказ" ("идентификатор_бронирования", "дата_бронирования", "дата_заезда", "дата_отъезда", "итоговая_сумма", "состояние", "идентификатор_комнаты", "идентификатор_договора", "серия_и_номер") FROM '$$PATH$$/4931.dat';

--
-- Data for Name: Комната; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Комната" ("идентификатор_комнаты", "код_филиала", "идентификатор_типа_комнаты", "статус_занятости", "статус_уборки", "примечание", "номер") FROM stdin;
\.
COPY public."Комната" ("идентификатор_комнаты", "код_филиала", "идентификатор_типа_комнаты", "статус_занятости", "статус_уборки", "примечание", "номер") FROM '$$PATH$$/4922.dat';

--
-- Data for Name: Оплата; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Оплата" ("идентификатор_оплаты", "идентификатор_бронирования", "дата_оплаты", "сумма", "статус", "метод") FROM stdin;
\.
COPY public."Оплата" ("идентификатор_оплаты", "идентификатор_бронирования", "дата_оплаты", "сумма", "статус", "метод") FROM '$$PATH$$/4933.dat';

--
-- Data for Name: Отель; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Отель" ("код_филиала", "название", "адрес", "город") FROM stdin;
\.
COPY public."Отель" ("код_филиала", "название", "адрес", "город") FROM '$$PATH$$/4918.dat';

--
-- Data for Name: Постоялец; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Постоялец" ("серия_и_номер", "фио", "прописка", "дата_рождения") FROM stdin;
\.
COPY public."Постоялец" ("серия_и_номер", "фио", "прописка", "дата_рождения") FROM '$$PATH$$/4929.dat';

--
-- Data for Name: Сотрудник; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Сотрудник" ("табельный_номер", "фио", "номер_телефона", "почта") FROM stdin;
\.
COPY public."Сотрудник" ("табельный_номер", "фио", "номер_телефона", "почта") FROM '$$PATH$$/4926.dat';

--
-- Data for Name: Стоимость; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Стоимость" ("идентификатор_стоимости", "начало_периода_действия", "конец_периода_действия", "название") FROM stdin;
\.
COPY public."Стоимость" ("идентификатор_стоимости", "начало_периода_действия", "конец_периода_действия", "название") FROM '$$PATH$$/4938.dat';

--
-- Data for Name: Тип_комнаты; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Тип_комнаты" ("идентификатор_типа_комнаты", "кол_во_мест", "наименование", "название_удобства") FROM stdin;
\.
COPY public."Тип_комнаты" ("идентификатор_типа_комнаты", "кол_во_мест", "наименование", "название_удобства") FROM '$$PATH$$/4920.dat';

--
-- Data for Name: Уборка; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Уборка" ("идентификатор_уборки", "дата_уборки", "статус_уборки", "сотрудник", "идентификатор_комнаты", "идентификатор_договора") FROM stdin;
\.
COPY public."Уборка" ("идентификатор_уборки", "дата_уборки", "статус_уборки", "сотрудник", "идентификатор_комнаты", "идентификатор_договора") FROM '$$PATH$$/4935.dat';

--
-- Data for Name: Удобства; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Удобства" ("название", "описание", "вкл_невкл") FROM stdin;
\.
COPY public."Удобства" ("название", "описание", "вкл_невкл") FROM '$$PATH$$/4936.dat';

--
-- Data for Name: Цена; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Цена" ("идентификатор_цены", "начало_периода_действия", "конец_периода_действия", "идентификатор_типа_комнаты") FROM stdin;
\.
COPY public."Цена" ("идентификатор_цены", "начало_периода_действия", "конец_периода_действия", "идентификатор_типа_комнаты") FROM '$$PATH$$/4940.dat';

--
-- Name: Акция_идентификатор_акции_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Акция_идентификатор_акции_seq"', 1000, true);


--
-- Name: Договор_идентификатор_договора_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Договор_идентификатор_договора_seq"', 1000, true);


--
-- Name: Должность_идентификатор_должно_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Должность_идентификатор_должно_seq"', 1000, true);


--
-- Name: Заказ_идентификатор_бронирован_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Заказ_идентификатор_бронирован_seq"', 1000, true);


--
-- Name: Комната_идентификатор_комнаты_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Комната_идентификатор_комнаты_seq"', 1000, true);


--
-- Name: Оплата_идентификатор_оплаты_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Оплата_идентификатор_оплаты_seq"', 1000, true);


--
-- Name: Отель_код_филиала_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Отель_код_филиала_seq"', 1000, true);


--
-- Name: Сотрудник_табельный_номер_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Сотрудник_табельный_номер_seq"', 1000, true);


--
-- Name: Стоимость_идентификатор_стоимо_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Стоимость_идентификатор_стоимо_seq"', 100, true);


--
-- Name: Тип_комнаты_идентификатор_типа__seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Тип_комнаты_идентификатор_типа__seq"', 1000, true);


--
-- Name: Уборка_идентификатор_уборки_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Уборка_идентификатор_уборки_seq"', 1000, true);


--
-- Name: Цена_идентификатор_цены_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Цена_идентификатор_цены_seq"', 1000, true);


--
-- Name: Акция Акция_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Акция"
    ADD CONSTRAINT "Акция_pkey" PRIMARY KEY ("идентификатор_акции");


--
-- Name: Договор Договор_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Договор"
    ADD CONSTRAINT "Договор_pkey" PRIMARY KEY ("идентификатор_договора");


--
-- Name: Должность Должность_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Должность"
    ADD CONSTRAINT "Должность_pkey" PRIMARY KEY ("идентификатор_должности");


--
-- Name: Заказ Заказ_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Заказ"
    ADD CONSTRAINT "Заказ_pkey" PRIMARY KEY ("идентификатор_бронирования");


--
-- Name: Комната Комната_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Комната"
    ADD CONSTRAINT "Комната_pkey" PRIMARY KEY ("идентификатор_комнаты");


--
-- Name: Оплата Оплата_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Оплата"
    ADD CONSTRAINT "Оплата_pkey" PRIMARY KEY ("идентификатор_оплаты");


--
-- Name: Отель Отель_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Отель"
    ADD CONSTRAINT "Отель_pkey" PRIMARY KEY ("код_филиала");


--
-- Name: Постоялец Постоялец_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Постоялец"
    ADD CONSTRAINT "Постоялец_pkey" PRIMARY KEY ("серия_и_номер");


--
-- Name: Сотрудник Сотрудник_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_pkey" PRIMARY KEY ("табельный_номер");


--
-- Name: Стоимость Стоимость_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Стоимость"
    ADD CONSTRAINT "Стоимость_pkey" PRIMARY KEY ("идентификатор_стоимости");


--
-- Name: Тип_комнаты Тип_комнаты_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип_комнаты"
    ADD CONSTRAINT "Тип_комнаты_pkey" PRIMARY KEY ("идентификатор_типа_комнаты");


--
-- Name: Уборка Уборка_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уборка"
    ADD CONSTRAINT "Уборка_pkey" PRIMARY KEY ("идентификатор_уборки");


--
-- Name: Удобства Удобства_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Удобства"
    ADD CONSTRAINT "Удобства_pkey" PRIMARY KEY ("название");


--
-- Name: Цена Цена_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Цена"
    ADD CONSTRAINT "Цена_pkey" PRIMARY KEY ("идентификатор_цены");


--
-- Name: Акция Акция_идентификатор_типа_комна_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Акция"
    ADD CONSTRAINT "Акция_идентификатор_типа_комна_fkey" FOREIGN KEY ("идентификатор_типа_комнаты") REFERENCES public."Тип_комнаты"("идентификатор_типа_комнаты");


--
-- Name: Договор Договор_идентификатор_должност_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Договор"
    ADD CONSTRAINT "Договор_идентификатор_должност_fkey" FOREIGN KEY ("идентификатор_должности") REFERENCES public."Должность"("идентификатор_должности");


--
-- Name: Договор Договор_табельный_номер_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Договор"
    ADD CONSTRAINT "Договор_табельный_номер_fkey" FOREIGN KEY ("табельный_номер") REFERENCES public."Сотрудник"("табельный_номер");


--
-- Name: Заказ Заказ_идентификатор_договора_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Заказ"
    ADD CONSTRAINT "Заказ_идентификатор_договора_fkey" FOREIGN KEY ("идентификатор_договора") REFERENCES public."Договор"("идентификатор_договора");


--
-- Name: Заказ Заказ_идентификатор_комнаты_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Заказ"
    ADD CONSTRAINT "Заказ_идентификатор_комнаты_fkey" FOREIGN KEY ("идентификатор_комнаты") REFERENCES public."Комната"("идентификатор_комнаты");


--
-- Name: Заказ Заказ_серия_и_номер_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Заказ"
    ADD CONSTRAINT "Заказ_серия_и_номер_fkey" FOREIGN KEY ("серия_и_номер") REFERENCES public."Постоялец"("серия_и_номер");


--
-- Name: Комната Комната_идентификатор_типа_ком_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Комната"
    ADD CONSTRAINT "Комната_идентификатор_типа_ком_fkey" FOREIGN KEY ("идентификатор_типа_комнаты") REFERENCES public."Тип_комнаты"("идентификатор_типа_комнаты");


--
-- Name: Комната Комната_код_филиала_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Комната"
    ADD CONSTRAINT "Комната_код_филиала_fkey" FOREIGN KEY ("код_филиала") REFERENCES public."Отель"("код_филиала");


--
-- Name: Оплата Оплата_идентификатор_бронирова_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Оплата"
    ADD CONSTRAINT "Оплата_идентификатор_бронирова_fkey" FOREIGN KEY ("идентификатор_бронирования") REFERENCES public."Заказ"("идентификатор_бронирования");


--
-- Name: Стоимость Стоимость_название_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Стоимость"
    ADD CONSTRAINT "Стоимость_название_fkey" FOREIGN KEY ("название") REFERENCES public."Удобства"("название");


--
-- Name: Тип_комнаты Тип_комнаты_название_удобства_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип_комнаты"
    ADD CONSTRAINT "Тип_комнаты_название_удобства_fkey" FOREIGN KEY ("название_удобства") REFERENCES public."Удобства"("название") NOT VALID;


--
-- Name: Уборка Уборка_идентификатор_договора_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уборка"
    ADD CONSTRAINT "Уборка_идентификатор_договора_fkey" FOREIGN KEY ("идентификатор_договора") REFERENCES public."Договор"("идентификатор_договора");


--
-- Name: Уборка Уборка_идентификатор_комнаты_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уборка"
    ADD CONSTRAINT "Уборка_идентификатор_комнаты_fkey" FOREIGN KEY ("идентификатор_комнаты") REFERENCES public."Комната"("идентификатор_комнаты");


--
-- Name: Цена Цена_идентификатор_типа_комнат_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Цена"
    ADD CONSTRAINT "Цена_идентификатор_типа_комнат_fkey" FOREIGN KEY ("идентификатор_типа_комнаты") REFERENCES public."Тип_комнаты"("идентификатор_типа_комнаты");


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        