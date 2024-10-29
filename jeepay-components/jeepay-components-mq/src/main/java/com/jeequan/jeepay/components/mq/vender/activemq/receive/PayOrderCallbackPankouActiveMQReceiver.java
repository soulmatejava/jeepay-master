package com.jeequan.jeepay.components.mq.vender.activemq.receive;


import com.jeequan.jeepay.components.mq.constant.MQVenderCS;
import com.jeequan.jeepay.components.mq.executor.MqThreadExecutor;
import com.jeequan.jeepay.components.mq.model.PayOrderCallbackPankouMQ;
import com.jeequan.jeepay.components.mq.vender.IMQMsgReceiver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * activeMQ 消息接收器：仅在vender=activeMQ时 && 项目实现IMQReceiver接口时 进行实例化
 * 业务：  订单回调盘口
 */
@Component
@ConditionalOnProperty(name = MQVenderCS.YML_VENDER_KEY, havingValue = MQVenderCS.ACTIVE_MQ)
@ConditionalOnBean(PayOrderCallbackPankouMQ.IMQReceiver.class)
public class PayOrderCallbackPankouActiveMQReceiver implements IMQMsgReceiver {

    @Autowired
    private PayOrderCallbackPankouMQ.IMQReceiver mqReceiver;

    @Override
    @Async(MqThreadExecutor.EXECUTOR_PAYORDER_MCH_NOTIFY)
    @JmsListener(destination = PayOrderCallbackPankouMQ.MQ_NAME)
    public void receiveMsg(String msg) {
        mqReceiver.receive(PayOrderCallbackPankouMQ.parse(msg));
    }
}
