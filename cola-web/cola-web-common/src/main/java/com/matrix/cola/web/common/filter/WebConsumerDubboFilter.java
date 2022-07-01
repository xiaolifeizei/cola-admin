package com.matrix.cola.web.common.filter;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONUtil;
import com.matrix.cola.web.common.utils.WebUtil;
import com.matrix.cola.api.entity.system.user.UserEntity;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.common.constants.CommonConstants;
import org.apache.dubbo.common.extension.Activate;
import org.apache.dubbo.rpc.*;

/**
 * Dubbo全局拦截器
 *
 * @author : cui_feng
 * @since : 2022-05-13 11:30
 */
@Slf4j
@Activate(group = CommonConstants.CONSUMER)
public class WebConsumerDubboFilter implements Filter,BaseFilter.Listener {
    @Override
    public Result invoke(Invoker<?> invoker, Invocation invocation) throws RpcException {
        log.trace("------------开始调用------------" );
        log.trace("消费者执行->" + invoker.getInterface() + "." + invocation.getMethodName());
        UserEntity userPO = WebUtil.getUser();
        if (ObjectUtil.isNotNull(userPO)) {
            invocation.setAttachment("Cola_Web_User",JSONUtil.toJsonStr(userPO));
        }
        try {
            return invoker.invoke(invocation);
        } finally {
            log.trace("消费者执行完成");
        }

    }

    @Override
    public void onResponse(Result appResponse, Invoker<?> invoker, Invocation invocation) {
        log.trace("------------消费者全部执行完毕------------" );
    }

    @Override
    public void onError(Throwable t, Invoker<?> invoker, Invocation invocation) {
        log.trace("消费者执行出错了:" + t.getMessage());
        log.trace("------------消费者执行出错了------------" );
    }
}
