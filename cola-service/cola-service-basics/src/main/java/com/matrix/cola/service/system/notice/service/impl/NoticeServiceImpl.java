package com.matrix.cola.service.system.notice.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.matrix.cola.api.Result;
import com.matrix.cola.api.entity.system.notice.NoticeEntity;
import com.matrix.cola.api.service.system.notice.NoticeService;
import com.matrix.cola.service.common.service.AbstractColaEntityService;
import com.matrix.cola.service.system.notice.mapper.NoticeMapper;
import org.apache.dubbo.config.annotation.DubboService;

/**
 * 通知公告实体类接口实现类
 *
 * @author : cui_feng
 * @since : 2022-06-29 11:04
 */
@DubboService
public class NoticeServiceImpl extends AbstractColaEntityService<NoticeEntity, NoticeMapper> implements NoticeService {

    @Override
    protected Result validate(NoticeEntity po) {
        if (StrUtil.isEmpty(po.getTitle())) {
            return Result.err("操作失败，标题不能为空");
        }

        if (StrUtil.isEmpty(po.getNoticeDate())) {
            return Result.err("操作失败，通知公告日期不能为空");
        }

        if (ObjectUtil.isNull(po.getNoticeType())) {
            return Result.err("操作失败，通知类型不能为空");
        }

        if (StrUtil.isEmpty(po.getContent())) {
            return Result.err("操作失败，通知内容不能为空");
        }

        return super.validate(po);
    }
}
