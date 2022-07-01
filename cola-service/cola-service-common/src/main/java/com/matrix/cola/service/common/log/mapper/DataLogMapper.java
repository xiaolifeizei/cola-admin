package com.matrix.cola.service.common.log.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.matrix.cola.api.entity.system.datalog.DataLogEntity;
import org.apache.ibatis.annotations.Delete;
import org.springframework.stereotype.Repository;

/**
 * 操作日志Mapper接口
 *
 * @author cui_feng
 */
@Repository
public interface DataLogMapper extends BaseMapper<DataLogEntity> {

    @Delete("delete from system_data_log where id=#{id}")
    int deleteDataLog(Long id);

    @Delete("delete from system_data_log")
    int clearDataLog();
}
