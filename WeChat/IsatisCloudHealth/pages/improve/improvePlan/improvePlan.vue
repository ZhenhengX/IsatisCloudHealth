<template>
    <view>
        
    </view>
</template>

<script>
    export default {
        data() {
            return {
                order: {}
            }
        },
        onLoad(urlPara) {
            let orderId = 97;
            // let orderId = urlPara.orderId;
            this.$axios.get('/order/findAllById/' + orderId).then(res => {
                
            })
        }
    }
</script>

<style>

</style>
