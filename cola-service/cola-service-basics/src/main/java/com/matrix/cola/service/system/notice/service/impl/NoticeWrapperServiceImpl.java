package com.matrix.cola.service.system.notice.service.impl;

import com.matrix.cola.api.entity.system.notice.NoticeEntity;
import com.matrix.cola.api.entity.system.notice.NoticeEntityWrapper;
import com.matrix.cola.api.service.system.notice.NoticeService;
import com.matrix.cola.api.service.system.notice.NoticeWrapperService;
import com.matrix.cola.service.common.service.AbstractColaEntityWrapperService;
import org.apache.dubbo.config.annotation.DubboService;

/**
 * 通知公告包装类接口实现类
 *
 * @author : cui_feng
 * @since : 2022-06-29 11:05
 */
@DubboService
public class NoticeWrapperServiceImpl extends AbstractColaEntityWrapperService<NoticeEntity, NoticeEntityWrapper, NoticeService> implements NoticeWrapperService {

}
