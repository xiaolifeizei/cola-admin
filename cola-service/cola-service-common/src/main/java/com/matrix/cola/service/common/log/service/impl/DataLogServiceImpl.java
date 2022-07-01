package com.matrix.cola.service.common.log.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.alibaba.fastjson.JSON;
import com.matrix.cola.api.ColaConstant;
import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.BaseColaEntity;
import com.matrix.cola.api.entity.system.datalog.DataLogEntity;
import com.matrix.cola.api.service.system.datalog.DataLogService;
import com.matrix.cola.service.common.log.mapper.DataLogMapper;
import com.matrix.cola.service.common.service.AbstractColaEntityService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Date;

/**
 * 操作日志服务实现类
 *
 * @author : cui_feng
 * @since : 2022-04-08 10:09
 */
@Slf4j
@DubboService
public class DataLogServiceImpl extends AbstractColaEntityService<DataLogEntity, DataLogMapper> implements DataLogService {


    @Override
    public void updateLog(String tableName, BaseColaEntity before, BaseColaEntity after) {
        try {
            DataLogEntity dataLogColaEntity = new DataLogEntity();
            dataLogColaEntity.setTableName(tableName);
            dataLogColaEntity.setBeforeData(JSON.toJSONString(before));
            dataLogColaEntity.setAfterData(JSON.toJSONString(after));
            dataLogColaEntity.setOperation("更新");
            dataLogColaEntity.setCreateTime(new Date());
            add(dataLogColaEntity);
        } catch (Exception e) {
            log.error("记录更新日志失败");
            log.error(e.getMessage());
            StringWriter stringWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(stringWriter);
            e.printStackTrace(printWriter);
            log.error(stringWriter.toString());
        }

    }

    @Override
    public void deleteLog(String tableName, BaseColaEntity before) {
        try {
            DataLogEntity dataLogColaEntity = new DataLogEntity();
            dataLogColaEntity.setTableName(tableName);
            dataLogColaEntity.setBeforeData(JSON.toJSONString(before));
            dataLogColaEntity.setOperation("删除");
            dataLogColaEntity.setCreateTime(new Date());
            add(dataLogColaEntity);
        } catch (Exception e) {
            log.error("记录删除日志失败");
            log.error(e.getMessage());
            StringWriter stringWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(stringWriter);
            e.printStackTrace(printWriter);
            log.error(stringWriter.toString());
        }

    }

    @Override
    public Result deleteDataLog(DataLogEntity dataLogEntity) {
        if (ObjectUtil.isNull(dataLogEntity) || ObjectUtil.isNull(dataLogEntity.getId())) {
            return Result.err("删除失败，id不能为空");
        }
        if (getMapper().deleteDataLog(dataLogEntity.getId()) == ColaConstant.YES) {
            return Result.ok();
        }
        return Result.err("删除失败");
    }

    @Override
    public Result clearDataLog() {
        getMapper().clearDataLog();
        return Result.ok();
    }
}
