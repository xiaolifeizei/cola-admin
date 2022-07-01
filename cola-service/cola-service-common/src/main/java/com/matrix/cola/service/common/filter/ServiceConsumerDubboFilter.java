package com.matrix.cola.service.common.filter;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.matrix.cola.api.entity.system.user.UserEntity;
import com.matrix.cola.service.common.utils.DubboUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.common.constants.CommonConstants;
import org.apache.dubbo.common.extension.Activate;
import org.apache.dubbo.rpc.*;


/**
 * Dubbo全局生产者拦截器
 *
 * @author : cui_feng
 * @since : 2022-05-13 11:30
 */
@Slf4j
@Activate(group = CommonConstants.CONSUMER)
public class ServiceConsumerDubboFilter implements Filter,BaseFilter.Listener {
    @Override
    public Result invoke(Invoker<?> invoker, Invocation invocation) throws RpcException {

        if (StrUtil.isEmpty(DubboUtil.getInvokeName())){
            log.trace("------------消费者开始调用------------" );
            DubboUtil.setInvokeName(invocation.getServiceName() + "." + invocation.getMethodName());
        }

        UserEntity userPO = DubboUtil.getUser(invocation);
        if (ObjectUtil.isNotNull(userPO)) {
            invocation.setAttachment("Cola_Web_User",JSONUtil.toJsonStr(userPO));
        }
        try {
            // 调用消费者方法
            log.trace("消费者执行->" + invoker.getInterface() + "." + invocation.getMethodName());
            return invoker.invoke(invocation);
        } finally {
            log.trace("消费者执行完成");
        }
    }

    @Override
    public void onResponse(Result appResponse, Invoker<?> invoker, Invocation invocation) {
        if ((invocation.getServiceName() + "." + invocation.getMethodName()).equals(DubboUtil.getInvokeName())) {
            DubboUtil.clearInvokeName();
            DubboUtil.clearUser();
            log.trace("------------消费者全部执行完毕，清除数据------------");
        }
    }

    @Override
    public void onError(Throwable t, Invoker<?> invoker, Invocation invocation) {
        DubboUtil.clearInvokeName();
        DubboUtil.clearUser();
        log.trace("消费者执行出错了:" + t.getMessage());
        log.trace("------------消费者执行出错了，清除数据------------");
    }
}
