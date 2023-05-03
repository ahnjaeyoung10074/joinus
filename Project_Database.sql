drop table customers_table;
drop table business_table;
drop table store_table;
drop table products_table;
drop table call_dibs_on;
drop table basket;
drop table review;
drop table customer_buy_list;
drop table business_sell_list;

-- 고객 정보 테이블
create table customers_table(
    id number not null primary key, -- 사용자를 구분할 고유ID
    userID varchar2(100) unique not null,
    password varchar2(100) not null,
    email varchar2(100) not null,
    phoneNumber varchar2(100) not null,
    address varchar2(100), -- 주소는 어떻게할까
    buyPoint number, -- 예비용
    auth char default 'A', -- 임시로 권한넣음
    payPoint number -- 포인트?
);

-- 사업자 정보 테이블
create table business_table(
    id number not null primary key, -- 사용자를 구분할 고유ID
    userID varchar2(100) unique not null,
    password varchar2(100) not null,
    email varchar2(100) not null,
    phoneNumber varchar2(100) not null,
    address varchar2(100), -- 주소는 어떻게할까
    auth char default 'A' -- 임시로 권한넣음
);

-- 가게 정보 테이블(사업자 ID와 연결)
create table store_table(
    id number, -- 사용자 고유ID로 사업자와 가게 연결
    storeID number not null primary key,-- 가게를 구분할 고유ID
    storeName varchar2(100) not null,
    storeAddress varchar2(100) not null,
    storeURL varchar2(100), -- 있는 사람들만?
    storeImages varchar2(100), -- 이미지가 있는 주소
    foreign key (id) references business_table(id)
    -- 여기에 가게에 대한 내용을 넣을지 생각 중
    -- 이미지는 "이미지주소1, 이미지주소2, ... 으로 저장해서 불러올때 ","기준으로 분해할지 고민 중
);

-- 상품 정보 테이블(가게 ID와 연결)
create table products_table(
    storeID number, -- 가게 고유ID로 가게와 제품 연결
    productID number not null primary key,
    title varchar2(100) not null, -- 상품 이름?
    subtitle varchar2(100) not null, -- 상품 소개글
    content varchar2(200) not null, -- 상품 상세설명
    images varchar2(100), -- 이미지가 있는 주소
    peroid varchar2(100), -- 기간(저장방법은 아직 미정)
    category varchar2(100), -- 카테고리
    foreign key (storeID) references store_table(storeID)
    -- 이미지는 "이미지주소1, 이미지주소2, ... 으로 저장해서 불러올때 ","기준으로 분해할지 고민 중
);

-- 찜목록과 장바구니는 똑같이 구성함
-- 찜목록 테이블(고객 ID와 상품 ID로 연결)
create table call_dibs_on( -- 찜으로 쓸 단어가...
    id number,
    productID number,
    productTItle varchar2(100) not null,
    productSubTitle varchar2(100) not null,
    productImage varchar2(100) not null, -- 메인 이미지만 (images와 image의 차이)
    -- 연결만 하고 정보는 다른 테이블에서 가져올까?
   foreign key (id) references customers_table(id),
   foreign key (productID) references products_table(productID)
);

-- 장바구니 테이블(고객 ID와 상품 ID로 연결)
create table basket(
    id number,
    productID number,
    productTItle varchar2(100) not null,
    productSubTitle varchar2(100) not null,
    productImage varchar2(100) not null, -- 메인 이미지만 (images와 image의 차이)
    -- 연결만 하고 정보는 다른 테이블에서 가져올까?
   foreign key (id) references customers_table(id),
    foreign key (productID) references products_table(productID)
);

-- 구매후기 테이블(고객 ID와 상품 ID로 연결)
create table review(
    id number,
    productID number,
    title varchar2(100) not null, -- 리뷰 제목
    content varchar2(200), -- 리뷰 내용
    images varchar2(100), -- 이미지(이미지가 필요할까)
    foreign key (id) references customers_table(id),
    foreign key (productID) references products_table(productID)
);

-- 고객이 구매한 제품들(어떻게 연결할 지 정확히 안함)
create table customer_buy_list(
    id number, -- 고객 고유 ID
    useMoney number not null,
    productID number,
    buyDate Date default sysdate, -- 구입한 날짜(기본값=데이터 생성 시)
    foreign key (id) references customers_table(id),
    foreign key (productID) references products_table(productID)
);

-- 사업자가 판매한 제품들(어떻게 연결할 지 정확히 안함)
create table business_sell_list(
    id number, -- 사업자 고유 ID
    sellMoney number not null,
    productID number,
    sellDate Date default sysdate, -- 판매한 날짜(기본값=데이터 생성 시)
    foreign key (id) references business_table(id),
    foreign key (productID) references products_table(productID)
);

--------------------------------------------------------------------
-- 게시판과 댓글은 나중에