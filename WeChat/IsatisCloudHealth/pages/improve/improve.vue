<template>
    <view>
        <uni-section title="改善方案" type="line">
            <uni-list>
                <uni-list-item
                    v-for="(order, index) in orderList"
                    :key="index"
                    :thumb="'https://isatis.oss-cn-beijing.aliyuncs.com/' + order.img"
                    :title="order.orderName"
                    :note="order.setMealName"
                    :rightText="order.orderDate"
                    :showArrow="true"
                    link="navigateTo"
                    :to="'improvePlan/improvePlan?orderId=' + order.orderId"
                />
            </uni-list>
        </uni-section>
    </view>
</template>

<script>
export default {
    data() {
        return {
            orderList: []
        };
    },
    onLoad() {
        let member = uni.getStorageSync('member');
        this.$axios.get('/order/findOrderByMemberId/' + member.id).then(res => {
            this.orderList = res.data.data;
        });
    }
};
</script>

<style></style>
