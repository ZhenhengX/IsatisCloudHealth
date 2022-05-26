<template>
    <view>
        <uni-card :isShadow="false" :isFull="true">
            <swiper :indicator-dots="true" :autoplay="true" :interval="3000" :duration="1000" indicator-active-color="#00aaff" :circular="true">
                <swiper-item v-for="(item, index) in swiper_image" :key="index"><image class="swiper_image" :src="item" /></swiper-item>
            </swiper>
        </uni-card>
        <uni-section class="section">
            <navigator url="../setmeal/setmeal"><uni-card title="体检预约" thumbnail="/static/logo.png" :isShadow="true" /></navigator>
            <navigator url="../orderList/orderList"><uni-card title="预约记录" thumbnail="/static/logo.png" :isShadow="true" /></navigator>
            <navigator url="../checkRecord/checkRecord"><uni-card title="报告查询" thumbnail="/static/logo.png" :isShadow="true" /></navigator>
            <navigator url="../improve/improve"><uni-card title="改善方案" thumbnail="/static/logo.png" :isShadow="true" /></navigator>
        </uni-section>
    </view>
</template>

<script>
export default {
    data() {
        return {
            swiper_image: ['../../static/logo1.png', '../../static/logo2.png', '../../static/c3.png']
        };
    }
};
</script>

<style>
.swiper_image {
    display: block;
    margin: auto;
    width: 70%;
    height: 90%;
}
</style>
