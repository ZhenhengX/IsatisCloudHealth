<template>
    <view>
        <uni-section title="基本信息" type="line">
            <uni-card>
                <uni-list :border="false">
                    <uni-list-item title="体检人" :rightText="this.orderName"></uni-list-item>
                    <uni-list-item title="体检日期" :rightText="this.orderDate"></uni-list-item>
                    <uni-list-item title="体检套餐" :rightText="this.setMealName"></uni-list-item>
                    <uni-list-item title="健康管理师" :rightText="this.healthName"></uni-list-item>
                </uni-list>
            </uni-card>
            <br />
        </uni-section>
        <uni-section title="健康建议" type="line">
            <uni-card>
                <text class="text">{{ this.suggestion }}</text>
            </uni-card>
            <br />
        </uni-section>
        <uni-section title="饮食方案" type="line">
            <uni-card>
                <uni-list :border="false"><uni-list-item v-for="(item, index) in food" :key="index" :title="item"></uni-list-item></uni-list>
            </uni-card>
            <br />
        </uni-section>
        <uni-section title="运动方案" type="line">
            <uni-card>
                <uni-list :border="false"><uni-list-item v-for="(item, index) in sport" :key="index" :title="item"></uni-list-item></uni-list>
            </uni-card>
            <br />
        </uni-section>
    </view>
</template>

<script>
export default {
    data() {
        return {
            orderName: '',
            orderDate: '',
            setMealName: '',
            healthName: '',
            suggestion: '',
            food: [],
            sport: []
        };
    },
    onLoad(urlPara) {
        let orderId = urlPara.orderId;
        this.$axios.get('/order/findAllById/' + orderId).then(res => {
            this.orderName = res.data.orderName;
            this.orderDate = res.data.orderDate;
            this.setMealName = res.data.setmealName;
            this.healthName = res.data.healthName;
            this.suggestion = res.data.suggestion;
            this.food = res.data.food.split(',');
            this.sport = res.data.sport.split(',');
        });
    }
};
</script>

<style>
.text {
    font-size: 14px;
    color: #666;
    line-height: 20px;
}
</style>
