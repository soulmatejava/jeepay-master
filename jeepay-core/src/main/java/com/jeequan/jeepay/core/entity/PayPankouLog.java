package com.jeequan.jeepay.core.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 回调盘口日志表
 * </p>
 *
 * @author [mybatis plus generator]
 * @since 2024-10-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_pay_pankou_log")
public class PayPankouLog implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 主键id
     */
    @TableId(value = "log_id", type = IdType.AUTO)
    private Integer logId;

    /**
     * 发送人
     */
    private String logSend;

    /**
     * 发送内容
     */
    private String logContext;

    /**
     * 发送时间
     */
    private Date logTime;

    /**
     * 发送状态(1：成功   2：失败)
     */
    private String logStatus;

    /**
     * 发送地址
     */
    private String logUrl;


}
