package com.matrix.cola.web.domain.basics.goods.controller;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.entity.basics.goods.spec.SpecEntity;
import com.matrix.cola.api.service.basics.goods.spec.SpecService;
import com.matrix.cola.api.service.basics.goods.spec.SpecWrapperService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 规格管理Controller
 *
 * @author : cui_feng
 * @since : 2022-06-21 12:26
 */
@RestController
@RequestMapping("/basics/goods/spec")
public class SpecController {

    @DubboReference
    SpecWrapperService specWrapper;

    @DubboReference
    SpecService specService;

    @PostMapping("/getSpecPage")
    public Result getSpecPage(@RequestBody Query<SpecEntity> query) {
        return Result.page(specWrapper.getWrapperPage(query));
    }

    @PostMapping("/addSpec")
    public Result addSpec(@RequestBody SpecEntity specPO) {
        return specService.insert(specPO);
    }

    @PostMapping("/updateSpec")
    public Result updateSpec(@RequestBody SpecEntity specPO) {
        return specService.modify(specPO);
    }

    @PostMapping("/deleteSpec")
    public Result deleteSpec(@RequestBody SpecEntity specPO) {
        return specService.remove(specPO);
    }
}
