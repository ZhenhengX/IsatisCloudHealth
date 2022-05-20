<template>
    <view>
        <uni-section v-for="(checkGroup, index) in checkReport" :key="index" :title="checkGroup.checkGroupName" type="line">
            <uni-card>
                <uni-list :border="false">
                    <uni-list-item
                        v-for="(checkItemValue, checkItemName, index) in checkGroup"
                        :key="index"
                        v-if="checkItemName !== 'checkGroupName'"
                        :title="checkItemName"
                        :rightText="checkItemValue"
                    ></uni-list-item>
                </uni-list>
            </uni-card>
            <br />
        </uni-section>
    </view>
</template>

<script>
export default {
    data() {
        return {
            checkReport: [{}]
        };
    },
    onLoad(urlPara) {
        let orderId = urlPara.orderId;
        this.$axios.get('/order/findCheckReportByOrderId/' + orderId).then(res => {
            this.checkReport = res.data.data;
        });
    }
};
</script>

<style></style>
