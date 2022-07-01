package com.matrix.cola.service.basics.goods.category.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.matrix.cola.api.entity.basics.goods.category.GoodsCategoryDetailEntity;
import org.apache.ibatis.annotations.Delete;

/**
 * 物资分类与物资关联关系Mapper
 *
 * @author : cui_feng
 * @since : 2022-06-24 10:12
 */
public interface CategoryGoodsMapper extends BaseMapper<GoodsCategoryDetailEntity> {

    @Delete("delete from goods_category_detail where goods_id=#{goodsId}")
    int deleteCategoryDetailByGoodsId(Long goodsId);
}
