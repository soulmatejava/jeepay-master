package com.jeequan.jeepay.mch.mq;

import cn.hutool.Hutool;
import cn.hutool.http.HttpUtil;
import com.jeequan.jeepay.components.mq.model.PayOrderCallbackPankouMQ;
import com.jeequan.jeepay.core.entity.MchApp;
import com.jeequan.jeepay.core.entity.PayOrder;
import com.jeequan.jeepay.core.entity.PayPankouLog;
import com.jeequan.jeepay.service.impl.PayOrderService;
import com.jeequan.jeepay.service.impl.PayPankouLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Component
public class PayOrderCallBackPankouMQReceiver implements PayOrderCallbackPankouMQ.IMQReceiver{

    @Autowired
    private PayOrderService payOrderService;

    @Autowired
    private PayPankouLogService pankouLogService;


    @Override
    public void receive(PayOrderCallbackPankouMQ.MsgPayload payload) {
        log.info("成功接收订单手动回调到盘口的订阅通知, msg={}", payload);
        PayPankouLog pankouLog = new PayPankouLog();
        try {
            PayOrder payOrder = payload.getPayOrder();
            MchApp mchApp = payload.getMchApp();
            String sendBy = payload.getSendBy();
            Map<String, Object> paramMap = new HashMap<>();
            //订单号
            paramMap.put("payOrderId", payOrder.getPayOrderId());
            //金额 ，单位： 分
            paramMap.put("amount", payOrder.getAmount());
            pankouLog.setLogSend(sendBy);
            pankouLog.setLogContext(paramMap.toString());
            pankouLog.setLogUrl(mchApp.getPankouUrl());
            pankouLog.setLogTime(new Date());
            //成功
            pankouLog.setLogStatus("1");
            //TODO: 和盘口定义返回参数
            HttpUtil.post(mchApp.getPankouUrl(), paramMap);
            //记录给盘口日志
            log.info("手动回调盘口地址成功");
            //更新支付订单状态为 支付成功
            payOrder.setState(PayOrder.STATE_SUCCESS);
            payOrderService.updateById(payOrder);
        }catch (Exception e) {
            pankouLog.setLogStatus("2");
        }finally {
            pankouLogService.save(pankouLog);
        }
    }
}
