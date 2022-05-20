<template>
    <view>
        {{member}}
    </view>
</template>

<script>
    export default {
        data() {
            return {
                member: {}
            }
        },
        onLoad() {
            this.member = uni.getStorageSync('member');
        },
        methods: {
            
        }
    }
</script>

<style>

</style>
