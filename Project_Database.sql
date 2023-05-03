drop table customers_table;
drop table business_table;
drop table store_table;
drop table products_table;
drop table call_dibs_on;
drop table basket;
drop table review;
drop table customer_buy_list;
drop table business_sell_list;

-- �� ���� ���̺�
create table customers_table(
    id number not null primary key, -- ����ڸ� ������ ����ID
    userID varchar2(100) unique not null,
    password varchar2(100) not null,
    email varchar2(100) not null,
    phoneNumber varchar2(100) not null,
    address varchar2(100), -- �ּҴ� ����ұ�
    buyPoint number, -- �����
    auth char default 'A', -- �ӽ÷� ���ѳ���
    payPoint number -- ����Ʈ?
);

-- ����� ���� ���̺�
create table business_table(
    id number not null primary key, -- ����ڸ� ������ ����ID
    userID varchar2(100) unique not null,
    password varchar2(100) not null,
    email varchar2(100) not null,
    phoneNumber varchar2(100) not null,
    address varchar2(100), -- �ּҴ� ����ұ�
    auth char default 'A' -- �ӽ÷� ���ѳ���
);

-- ���� ���� ���̺�(����� ID�� ����)
create table store_table(
    id number, -- ����� ����ID�� ����ڿ� ���� ����
    storeID number not null primary key,-- ���Ը� ������ ����ID
    storeName varchar2(100) not null,
    storeAddress varchar2(100) not null,
    storeURL varchar2(100), -- �ִ� ����鸸?
    storeImages varchar2(100), -- �̹����� �ִ� �ּ�
    foreign key (id) references business_table(id)
    -- ���⿡ ���Կ� ���� ������ ������ ���� ��
    -- �̹����� "�̹����ּ�1, �̹����ּ�2, ... ���� �����ؼ� �ҷ��ö� ","�������� �������� ��� ��
);

-- ��ǰ ���� ���̺�(���� ID�� ����)
create table products_table(
    storeID number, -- ���� ����ID�� ���Կ� ��ǰ ����
    productID number not null primary key,
    title varchar2(100) not null, -- ��ǰ �̸�?
    subtitle varchar2(100) not null, -- ��ǰ �Ұ���
    content varchar2(200) not null, -- ��ǰ �󼼼���
    images varchar2(100), -- �̹����� �ִ� �ּ�
    peroid varchar2(100), -- �Ⱓ(�������� ���� ����)
    category varchar2(100), -- ī�װ�
    foreign key (storeID) references store_table(storeID)
    -- �̹����� "�̹����ּ�1, �̹����ּ�2, ... ���� �����ؼ� �ҷ��ö� ","�������� �������� ��� ��
);

-- ���ϰ� ��ٱ��ϴ� �Ȱ��� ������
-- ���� ���̺�(�� ID�� ��ǰ ID�� ����)
create table call_dibs_on( -- ������ �� �ܾ...
    id number,
    productID number,
    productTItle varchar2(100) not null,
    productSubTitle varchar2(100) not null,
    productImage varchar2(100) not null, -- ���� �̹����� (images�� image�� ����)
    -- ���Ḹ �ϰ� ������ �ٸ� ���̺��� �����ñ�?
   foreign key (id) references customers_table(id),
   foreign key (productID) references products_table(productID)
);

-- ��ٱ��� ���̺�(�� ID�� ��ǰ ID�� ����)
create table basket(
    id number,
    productID number,
    productTItle varchar2(100) not null,
    productSubTitle varchar2(100) not null,
    productImage varchar2(100) not null, -- ���� �̹����� (images�� image�� ����)
    -- ���Ḹ �ϰ� ������ �ٸ� ���̺��� �����ñ�?
   foreign key (id) references customers_table(id),
    foreign key (productID) references products_table(productID)
);

-- �����ı� ���̺�(�� ID�� ��ǰ ID�� ����)
create table review(
    id number,
    productID number,
    title varchar2(100) not null, -- ���� ����
    content varchar2(200), -- ���� ����
    images varchar2(100), -- �̹���(�̹����� �ʿ��ұ�)
    foreign key (id) references customers_table(id),
    foreign key (productID) references products_table(productID)
);

-- ���� ������ ��ǰ��(��� ������ �� ��Ȯ�� ����)
create table customer_buy_list(
    id number, -- �� ���� ID
    useMoney number not null,
    productID number,
    buyDate Date default sysdate, -- ������ ��¥(�⺻��=������ ���� ��)
    foreign key (id) references customers_table(id),
    foreign key (productID) references products_table(productID)
);

-- ����ڰ� �Ǹ��� ��ǰ��(��� ������ �� ��Ȯ�� ����)
create table business_sell_list(
    id number, -- ����� ���� ID
    sellMoney number not null,
    productID number,
    sellDate Date default sysdate, -- �Ǹ��� ��¥(�⺻��=������ ���� ��)
    foreign key (id) references business_table(id),
    foreign key (productID) references products_table(productID)
);

--------------------------------------------------------------------
-- �Խ��ǰ� ����� ���߿�