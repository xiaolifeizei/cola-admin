package com.matrix.cola.web.domain.basics.goods.controller;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.entity.basics.goods.category.GoodsCategoryEntity;
import com.matrix.cola.api.service.basics.goods.category.GoodsCategoryDetailService;
import com.matrix.cola.api.service.basics.goods.category.GoodsCategoryService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 物资分类Controller
 *
 * @author : cui_feng
 * @since : 2022-06-24 10:47
 */
@RestController
@RequestMapping("/basics/goods/category")
public class GoodsCategoryController {

    @DubboReference
    GoodsCategoryService goodsCategoryService;

    @DubboReference
    GoodsCategoryDetailService goodsCategoryDetailService;

    @PostMapping("/getCategoryTree")
    public Result getCategoryTree(@RequestBody Query<GoodsCategoryEntity> query) {
        return goodsCategoryService.getCategoryTree(query);
    }

    @PostMapping("/getCategoryByGoodsId")
    public Result getCategoryByGoodsId(Long goodsId) {
        return goodsCategoryDetailService.getCategoryByGoodsId(goodsId);
    }

    @PostMapping("/addCategory")
    public Result addCategory(@RequestBody GoodsCategoryEntity goodsCategoryPO) {
        return goodsCategoryService.insert(goodsCategoryPO);
    }

    @PostMapping("/updateCategory")
    public Result updateCategory(@RequestBody GoodsCategoryEntity goodsCategoryPO) {
        return goodsCategoryService.modify(goodsCategoryPO);
    }

    @PostMapping("/deleteCategory")
    public Result deleteCategory(@RequestBody GoodsCategoryEntity goodsCategoryPO) {
        return goodsCategoryService.remove(goodsCategoryPO);
    }
}
