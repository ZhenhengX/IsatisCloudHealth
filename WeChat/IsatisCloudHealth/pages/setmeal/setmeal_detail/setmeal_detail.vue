<template>
    <view>
        <uni-section>
            <uni-card :isFull="true" :title="setmeal.name" :sub-title="setmeal.remark" :cover="'https://isatis.oss-cn-beijing.aliyuncs.com/' + setmeal.img">
                <text class="keyword">{{ setmeal.sex == '0' ? '性别不限' : setmeal.sex == '1' ? '男' : '女' }}</text>
                <text class="keyword">{{ setmeal.age }}</text>
            </uni-card>
            <uni-section title="套餐详情" type="line">
                <uni-card :isFull="true">
                    <uni-table :stripe="true" :loading="this.loading">
                        <uni-tr>
                            <uni-th align="center" width="100rpx">项目名称</uni-th>
                            <uni-th align="center" width="400rpx">项目内容</uni-th>
                            <uni-th align="center" width="100rpx">项目解读</uni-th>
                        </uni-tr>
                        <uni-tr v-for="(checkGroup, index) in setmeal.checkGroups" :key="index">
                            <uni-td align="center">{{ checkGroup.name }}</uni-td>
                            <uni-td align="left">
                                <view v-for="(checkItem, index) in checkGroup.checkItems" :key="index">
                                    <text class="tag">
                                        {{ checkItem.name }}
                                        <br/>
                                    </text>
                                </view>
                            </uni-td>
                            <uni-td align="left">{{ checkGroup.remark }}</uni-td>
                        </uni-tr>
                    </uni-table>
                    <navigator :url="'orderInfo/orderInfo?id=' + setmeal.id"><button type="primary">立即预约</button></navigator>
                </uni-card>
            </uni-section>
        </uni-section>
    </view>
</template>

<script>
export default {
    data() {
        return {
            loading: true,
            setmeal: {}
        };
    },
    onLoad(urlPara) {
        var id = urlPara.id;
        this.$axios.post('/setmeal/findById?id=' + id).then(response => {
            if (response.data.flag) {
                this.setmeal = response.data.data.setmeal;
                this.loading = false;
            }
        });
    }
};
</script>

<style>
.keyword {
    padding: 2px 8px;
    color: #ea5504;
    margin-right: 3.3%;
    border: 1px solid #ffb891;
    border-radius: 2px;
}
.tag {
    padding: 1px 4px;
    color: #18bc37;
    margin-right: 3.3%;
    border: 1px solid #18bc37;
    border-radius: 1px;
}
</style>
