##1、批量请求
##batchRequestByPlatform
DROP TABLE IF EXISTS `cmbc_batchRequestByPlatform`;
CREATE TABLE `cmbc_batchRequestByPlatform` (
#输入
id int(11) not null AUTO_INCREMENT,
batch_type tinyint not null comment '批量类开；0-还本付息 1-自动投资 2-项目起息 3-批量代扣',
file_name varchar(1000) not null comment '批量申请文件名',
count int not null comment '总笔数',
total_amount decimal(16,2) not null comment '总金额',
#输出
serial_no char(32) DEFAULT '' comment '系统流水号',
answer_file_name varchar(1000) comment '批量应答文件名',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`),
UNIQUE KEY `batchRequestByPlatform_serial_no` (`serial_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '批量请求接口表';


##2、客户密码设置
##createPassword
DROP TABLE IF EXISTS `cmbc_createPassword`;
CREATE TABLE `cmbc_createPassword` (
#输入
id int(11) not null AUTO_INCREMENT,
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '客户密码设置-迁移客户使用';

##3、手机号修改
##batchRequestByPlatform
DROP TABLE IF EXISTS `cmbc_modifyTelephone`;
CREATE TABLE `cmbc_modifyTelephone` (
#输入
id int(11) not null AUTO_INCREMENT,
input_new_mobile varchar(20) not null comment '新手机号码',
#输出
output_new_mobile varchar(20) not null comment '新手机号码',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '手机号修改';


##4、信息实时推送
##messagePush
DROP TABLE IF EXISTS `cmbc_messagePush`;
CREATE TABLE `cmbc_messagePush` (
#输入
id int(11) not null AUTO_INCREMENT,
info_num int not null comment '各信息总数',
info_type tinyint not null comment '0-项目信息 1-项目角色 2-项目还款计划',
info_data varchar(1000) not null comment '推送信息',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '信息实时推送';


##5、平台发起自动投资
##autoInvestByPlatform
DROP TABLE IF EXISTS `cmbc_autoInvestByPlatform`;
CREATE TABLE `cmbc_autoInvestByPlatform` (
#输入
id int(11) not null AUTO_INCREMENT,
prd_code varchar(20) not null comment '项目代码',
prd_name varchar(120) not null comment '项目名称',
amt decimal(12,2) not null comment '投资金额',
loaner_acc varchar(20) not null comment '融资人帐号',
loaner_name varchar(120) not null comment '融资人名称',
protoco_no varchar(20) not null comment '自动投资协议号',
feeCode1 varchar(20) default null comment '费用编号1, PointType=34',
feeName1 varchar(100) default null comment '费用名称1, 债权转让管理费',
fee1 varchar(20) default null comment '费用1, 债权转让管理费金额',
feeCode2 varchar(20) default null comment '费用编号2, 暂时不用',
feeName2 varchar(100) default null comment '费用名称2, 暂时不用',
fee2 varchar(20) default null comment '费用2, 暂时不用',
feeCode3 varchar(20) default null comment '费用编号3, 暂时不用',
feeName3 varchar(100) default null comment '费用名称3, 暂时不用',
fee3 varchar(20) default null comment '费用3, 暂时不用',
frozen_flag TINYINT not null comment '资金冻结标志;0-不冻结 1-冻结，默认不冻结',
#输出
use_bala decimal(12,2) comment '交易后可用余额',
cash_bala decimal(12,2) comment '交易后可取余额',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '平台发起自动投资';

##6、平台发起自动受让
##messagePush
DROP TABLE IF EXISTS `cmbc_autoTransferByPlatform`;
CREATE TABLE `cmbc_autoTransferByPlatform` (
#输入
id int(11) not null AUTO_INCREMENT,
targ_fund_acc varchar(30) not null comment '转让方资金帐号',
prd_code varchar(20) not null comment '项目代码',
prd_name varchar(120) not null comment '项目名称',
vol int not null comment '交易份额',
buy_amt decimal(12,2) not null comment '承接金额',
protoco_no varchar(20) not null comment '自动投资协议号',
feeCode1 varchar(20) default null comment '费用编号1, PointType=34',
feeName1 varchar(100) default null comment '费用名称1, 债权转让管理费',
fee1 varchar(20) default null comment '费用1, 债权转让管理费金额',
feeCode2 varchar(20) default null comment '费用编号2, 暂时不用',
feeName2 varchar(100) default null comment '费用名称2, 暂时不用',
fee2 varchar(20) default null comment '费用2, 暂时不用',
feeCode3 varchar(20) default null comment '费用编号3, 暂时不用',
feeName3 varchar(100) default null comment '费用名称3, 暂时不用',
fee3 varchar(20) default null comment '费用3, 暂时不用',
frozen_flag TINYINT not null comment '资金冻结标志;0-不冻结 1-冻结，默认不冻结',
#输出
client_name varchar(120) comment '客户名称',
use_bala decimal(12,2) comment '交易后可用余额',
cash_bala decimal(12,2) comment '交易后可取余额',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '平台发起自动受让';

##7、客户发起交易
##messagePush
DROP TABLE IF EXISTS `cmbc_transApplyByCust`;
CREATE TABLE `cmbc_transApplyByCust` (
#输入
id int(11) not null AUTO_INCREMENT,
business_code char(4) not null comment '业务类别',
prd_code varchar(20) not null comment '项目代码',
amt decimal(12,2) not null comment '交易金额',
vol int comment '交易份额',
fee_code varchar(23) comment '费用编号',
targ_fund_acc varchar(20) not null comment '收款帐号',
summary varchar(120) default null comment '摘要信息',
#输出
prd_name varchar(120) comment '项目名称',
client_name varchar(120) comment '客户名称',
balance decimal(12,2) comment '交易后余额',
cash_bala decimal(12,2) comment '交易后可取余额',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '客户发起交易';

##8、平台发起银行卡解除绑定
##messagePush
DROP TABLE IF EXISTS `cmbc_unbindCardByPlatform`;
CREATE TABLE `cmbc_unbindCardByPlatform` (
#输入
id int(11) not null AUTO_INCREMENT,
bank_no varchar(10) not null comment '银行编号',
bank_acc varchar(20) not null comment '银行卡号',
oper_flag char(2) not null comment '解绑标识',
#输出
client_name varchar(120) comment '客户名称',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '平台发起银行卡解除绑定';

##9、平台发起客户信息修改
##clientInfoChangeByPlatform
DROP TABLE IF EXISTS `cmbc_clientInfoChangeByPlatform`;
CREATE TABLE `cmbc_clientInfoChangeByPlatform` (
#输入
id int(11) not null AUTO_INCREMENT,
oper_flag varchar(20) not null comment '操作方式',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '平台发起客户信息修改';

##10、短信重发(没有此接口文档）
##messageResendByCust
DROP TABLE IF EXISTS `cmbc_messageResendByCust`;
CREATE TABLE `cmbc_messageResendByCust` (
#输入
id int(11) not null AUTO_INCREMENT,
info_num int not null comment '各信息总数',
info_type tinyint not null comment '0-项目信息 1-项目角色 2-项目还款计划',
info_data varchar(1000) not null comment '推送信息',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '短信重发';

##11、密码解锁
##passwordStatusActiveByPlatform
DROP TABLE IF EXISTS `cmbc_passwordStatusActiveByPlatform`;
CREATE TABLE `cmbc_passwordStatusActiveByPlatform` (
#输入
id int(11) not null AUTO_INCREMENT,
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '密码解锁';

##12、账户信息查询
##accInfoQuery
DROP TABLE IF EXISTS `cmbc_accInfoQuery`;
CREATE TABLE `cmbc_accInfoQuery` (
#输入
id int(11) not null AUTO_INCREMENT,
account varchar(20) not null comment '查询帐号',
#输出
client_no varchar(30) not null comment '客户编号',
client_name varchar(100) not null comment '客户名称',
secu_acc varchar(32) not null comment '商户方客户帐号',
id_type varchar(10) comment '证件类型',
id_code varchar(32) comment '证件号码',
mobile varchar(20) comment '手机号码',
embail varchar(100) comment '电子邮箱',
secu_name varchar(50) comment '商户名称',
open_date TIMESTAMP comment '开户日期',
status varchar(10) comment '帐户状态',
status_name varchar(30) not null comment '帐户状态名称',
curr_type varchar(10) not null comment '币种',
balance decimal(12,2) not null comment '余额',
use_bala decimal(12,2) not null comment '可用余额',
cash_bala decimal(12,2) comment '可取余额',
repr_name varchar(32) comment '法人代表姓名',
repr_id_type varchar(20) comment '法人代表证件类型',
repr_id_code varchar(100) comment '法人代表证件号码',
actor_name varchar(32) comment '经办人姓名',
actor_id_type varchar(50) comment '经办人证件类型',
actor_id_code varchar(50) comment '经办人证件号码',
summary varchar(100) comment '摘要',
flag1 varchar(100) comment '备用标志1',
flag2 varchar(100) comment '备用标志2',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '账户信息查询';

##13、交易状态查询
##exSerialStatusQuery
DROP TABLE IF EXISTS `cmbc_exSerialStatusQuery`;
CREATE TABLE `cmbc_exSerialStatusQuery` (
#输入
id int(11) not null AUTO_INCREMENT,
asso_serial varchar(32) not null comment '交易流水',
#输出
trans_order_id varchar(32) not null comment '原交易商户订单号',
serial_no varchar(32) not null comment '系统流水号',
secu_acc varchar(32) not null comment '商户方客户帐号',
post_bala decimal(12,2) not null comment '交易后余额',
other_acc varchar(32) comment '对方帐号',
bank_no varchar(20) comment '银行编号',
curr_type varchar(3) comment '币种',
status varchar(2) comment '返回码类型',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '交易状态查询';

##14、资产余额查询
##clientAssetQuery
DROP TABLE IF EXISTS `cmbc_clientAssetQuery`;
CREATE TABLE `cmbc_clientAssetQuery` (
#输入
id int(11) not null AUTO_INCREMENT,
account varchar(20) not null comment '客户标识',
prd_code varchar(32) not null comment '产品代码',
current_page varchar(5) not null comment '当前页',
page_size varchar(5) not null comment '查询行数',
trust_type varchar(1) not null comment '托管类别',
#输出
total_num varchar(5) not null comment '总记录数',
toatl_page varchar(5) not null comment '总页数',
result varchar(1000) comment '结果列表',
secu_name varchar(120) comment '商户名称',
prd_name varchar(32) not null comment '产品名称',
curr_type varchar(32) not null comment '币种',
tot_vol varchar(20) not null comment '总份额',
use_vol varchar(20) not null comment '可用份额',
frozen_vlo varchar(32) comment '交易冻结份额',
long_frozen_vol varchar(20) comment '长期冻结份额',
prd_value varchar(30) comment '产品市值',
cost varchar(20) comment '买入成本',
pay_cost varchar(32) not null comment '已还成本',
tot_income varchar(32) not null comment '累计收益',
onway_amt varchar(32) not null comment '在途资金',
profit varchar(32) not null comment '浮动盈亏',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '资产余额查询';

##15、客户委托查询
##clientTrustQuery
DROP TABLE IF EXISTS `cmbc_clientTrustQuery`;
CREATE TABLE `cmbc_clientTrustQuery` (
#输入
id int(11) not null AUTO_INCREMENT,
account       varchar(20) comment '客户标识',
secuOrderId   varchar(32) comment '商户订单号',
transCode     varchar(20) comment '交易代码',
trustType     varchar(20) comment '托管类别',
startDate     varchar(20) comment '开始日期',
endDate       varchar(20) comment '结束日期',
currentPage   varchar(20) comment '当前页',
pageSize      varchar(20) comment '查询行数',
totalNum      varchar(20) comment '总记录数',
totalPage     varchar(20) comment '总页数',
result        varchar(20) comment '结果列表',
clientNo      varchar(20) comment '客户编号',
transDate     varchar(20) comment '交易日期',
transTime     varchar(20) comment '交易时间',
serialNo      varchar(20) comment '流水号',
transName     varchar(20) comment '交易名称',
secuName      varchar(20) comment '商户名称',
prdCode       varchar(20) comment '产品代码',
prdName       varchar(20) comment '产品名称',
bankAcc       varchar(20) comment '银行账号',
fundAcc       varchar(20) comment '资金账号',
vol           varchar(20) comment '份额',
currType      varchar(20) comment '币种',
amt           varchar(20) comment '金额',
statusName    varchar(20) comment '交易状态名称',
summary       varchar(255) comment '摘要',
errCode       varchar(20) comment '错误代码',
errMsg        varchar(20) comment '错误信息',
cancleFlag    varchar(20) comment '允许撤单标志',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '客户委托查询';

##16、资金明细查询
##fundsDetailQuery
DROP TABLE IF EXISTS `cmbc_fundsDetailQuery`;
CREATE TABLE `cmbc_fundsDetailQuery` (
#输入
id int(11) not null AUTO_INCREMENT,
account      varchar(20) comment '查询账号',
secuOrderId  varchar(32) comment '商户订单号',
businCode    varchar(10) comment '业务类别',
startDate    varchar(8) comment '开始日期',
endDate      varchar(8) comment '结束日期',
currentPage  varchar(5) comment '当前页',
pageSize     varchar(5) comment '查询行数',
totalNum     varchar(5) comment '总记录数',
totalPage    varchar(5) comment '总页数',
result       varchar(200) comment '结果列表',
clientNo     varchar(20) comment '客户编号',
clientName   varchar(120) comment '客户名称',
transDate    varchar(20) comment '交易日期',
transTime    varchar(20) comment '交易时间',
serialNo     varchar(20) comment '系统流水号',
businName    varchar(20) comment '业务名称',
secuName     varchar(20) comment '商户名称',
fundAcc      varchar(20) comment '资金账号',
prdCode      varchar(20) comment '产品代码',
prdName      varchar(60) comment '产品名称',
amt          varchar(20) comment '金额',
postBala     varchar(20) comment '交易后余额',
charge       varchar(20) comment '手续费',
currType     varchar(20) comment '币种',
fromFlag     varchar(20) comment '业务发起人',
fromFlagName varchar(20) comment '业务发起人名称',
bankName     varchar(20) comment '银行名称',
otherAcc     varchar(20) comment '对方账号',
otherAccName varchar(20) comment '对方账号名称',
summary      varchar(120) comment '摘要',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '资金明细查询';

##17、商户余额查询
##merchantBalanceQuery
DROP TABLE IF EXISTS `cmbc_merchantBalanceQuery`;
CREATE TABLE `cmbc_merchantBalanceQuery` (
#输入
id int(11) not null AUTO_INCREMENT,
accAttr     varchar(1) comment '账户属性',
currentPage varchar(5) comment '当前页',
pageSize    varchar(5) comment '查询行数',
totalNum    varchar(5) comment '总记录数',
totalPage   varchar(5) comment '总页数',
result      varchar(200) comment '结果列表',  
bankAcc     varchar(20) comment '账号',
accName     varchar(120) comment '账号名称',
accAttrName varchar(120) comment '账户属性名称',
currType    varchar(20) comment '币种',
balance     varchar(20) comment '余额',
cashBala    varchar(20) comment '可取余额',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '商户余额查询';

##18、授权协议查询
##autoInvestQuery
DROP TABLE IF EXISTS `cmbc_autoInvestQuery`;
CREATE TABLE `cmbc_autoInvestQuery` (
#输入
id int(11) not null AUTO_INCREMENT,
account     varchar(20) comment '资金账号',
currentPage varchar(5) comment '当前页',
pageSize    varchar(5) comment '每页查询条数',
totalNum    varchar(5) comment '总条数',
totalPage   varchar(5) comment '总页数',
result      varchar(200) comment '结果列表',
authorType  varchar(1) comment '协议类型',
protocolNo  varchar(50) comment '协议编号',
paxAmt      varchar(20) comment '单笔最大金额',
dayLimit    varchar(20) comment '单日累计限额',
finishFlag  varchar(1) comment '终止标志',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '授权协议查询';

##19、费用查询
##feeQuery
DROP TABLE IF EXISTS `cmbc_feeQuery`;
CREATE TABLE `cmbc_feeQuery` (
#输入
id int(11) not null AUTO_INCREMENT,
prdCode     varchar(10) comment '产品代码',
feeCode     varchar(10) comment '费用代码',
startDate   varchar(8) comment '开始日期',
endDate     varchar(8) comment '结束日期',
currentPage varchar(5) comment '当前页',
pageSize    varchar(5) comment '查询行数',
trustType   varchar(1) comment '托管类别',
totalNum    varchar(5) comment '总记录数',
totalPage   varchar(5) comment '总页数',
result      varchar(200) comment '结果列表',
secuNo      varchar(20) comment '商户编号',
secuName    varchar(120) comment '商户名称',
prdName     varchar(20) comment '项目名称',
feeName     varchar(100) comment '费用名称',
currType    varchar(3) comment '币种',
totFee      decimal(16,2) comment '总费用',
settleFee   decimal(16,2) comment '已结转费用',
fee         decimal(16,2) comment '待结转费用',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '费用查询';

##20、银行卡绑定信息查询
##cardBindInfoQuery
DROP TABLE IF EXISTS `cmbc_cardBindInfoQuery`;
CREATE TABLE `cmbc_cardBindInfoQuery` (
#输入
id int(11) not null AUTO_INCREMENT,
bankAcc      varchar(32) comment '银行卡号',
result       varchar(200) comment '结果列表',  
clientNo     varchar(8) comment '客户编号',
clientName   varchar(120) comment '客户名称',
fundAcc      varchar(30) comment '资金账号',
secuAcc      varchar(20) comment '商户方账号',
mobile       varchar(11) comment '手机号码',
secuNo       varchar(5) comment '商户编号',
secuName     varchar(120) comment '商户名称',
openDate     varchar(20) comment '开户日期',
bankNo       varchar(4) comment '银行编号',
bankName     varchar(120) comment '绑定银行名称',
bindFlag     varchar(1) comment '绑定标志',
bindFlagName varchar(10) comment '绑定标志名称',
status       varchar(3) comment '绑定状态',
statusName   varchar(10) comment '账户状态名称',
flag1        varchar(1) comment '备用标志1',
flag2        varchar(1) comment '备用标志2',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '银行卡绑定信息查询';

##21、商户流水明细查询
##merchantExSerialDetailQuery
DROP TABLE IF EXISTS `cmbc_merchantExSerialDetailQuery`;
CREATE TABLE `cmbc_merchantExSerialDetailQuery` (
#输入
id int(11) not null AUTO_INCREMENT,
currentPage  varchar(5) comment '当前页',
pageSize     varchar(5) comment '查询行数',
startDate    varchar(20) comment '开始日期',
endDate      varchar(20) comment '结束日期',
accAttr      varchar(20) comment '账户属性',
businCode    varchar(20) comment '业务类别',
totalNum     varchar(5) comment '总记录数',
totalPage    varchar(5) comment '总页数',
result       varchar(200) comment '结果列表',
bankAcc      varchar(20) comment '账号',
accName      varchar(100) comment '账号名称',
accAttrName  varchar(100) comment '账户属性名称',
transDate    varchar(10) comment '交易日期',
transTime    varchar(10) comment '交易时间',
secuOrderId  varchar(32) comment '商户订单号',
fromFlag     varchar(120) comment '业务发起人',
businName    varchar(120) comment '业务名称',
amt          varchar(20) comment '金额',
currType     varchar(3) comment '币种',
otherAcc     varchar(20) comment '对方账号',
otherAccName varchar(120) comment '对方账号名称',
summary      varchar(120) comment '摘要',
statusName   varchar(120) comment '交易状态名称',
errCode      varchar(10) comment '错误代码',
errMsg       varchar(120) comment '错误信息',
postBala     varchar(20) comment '交易后余额',
chgFlagName  varchar(120) comment '变动标志名称',
#通用输入信息
version char(10) not null comment '版本号',
order_id char(32) not null comment '订单号',
secu_no char(16) not null comment '商户编号',
trans_code char(20) not null comment '交易编码',
user_id varchar(30) comment '客户标识',
fund_acc varchar(20) comment '客户帐号',
pri_domain varchar(20) comment '客户域',
notify_url varchar(256) comment '异步通知路径',
return_url varchar(256) comment '跳转路径',
channel char(4) comment '交易渠道',
branch_no char(6) comment '交易机构',
oper_no varchar(10) comment '交易柜员',
trans_date varchar(8) not null comment '交易日期, yyyyMMdd',
trans_time varchar(6) not null comment '交易时间, HHMMSS',
remark varchar(1000) comment '备注',
reserve1 varchar(100) default null comment '备用字段',
reserve2 varchar(100) default null comment '原样返回',
#通用输出信息
trans_name varchar(20) comment '交易名称',
output_time TIMESTAMP comment '响应时间',
type varchar(1) not null comment '执行结果（S:成功，E:失败，R:未知，P:执行中）',
code varchar(20) default null comment '错误码',
message varchar(255) default null comment '错误信息',

PRIMARY KEY (`id`),
UNIQUE KEY `batchRequestByPlatform_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 comment '商户流水明细查询';
