<template>
    <view>
        <uni-section title="预约记录" type="line">
            <uni-list>
                <uni-list-item
                    v-for="(order, index) in orderList"
                    :key="index"
                    :thumb="'https://isatis.oss-cn-beijing.aliyuncs.com/' + order.img"
                    :title="order.setMealName"
                    :note="order.orderName"
                    :rightText="order.orderDate"
                    :showArrow="true"
                    link="navigateTo"
                    :to="'../setmeal/setmeal_detail/orderInfo/orderSuccess/orderSuccess?orderId=' + order.orderId"
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
