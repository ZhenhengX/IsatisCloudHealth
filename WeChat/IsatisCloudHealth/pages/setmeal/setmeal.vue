<template>
    <view>
        <uni-section>
            <navigator v-for="setmeal in setmealList" :key="setmeal.id" :url="'setmeal_detail/setmeal_detail?id=' + setmeal.id">
                <uni-card :title="setmeal.name" :sub-title="setmeal.remark" :cover="'https://isatis.oss-cn-beijing.aliyuncs.com/' + setmeal.img">
                    <text class="price" :inverted="true">{{ setmeal.price }}元</text>
                    <text class="keywords" :inverted="true">{{ setmeal.sex == '0' ? '性别不限' : setmeal.sex == '1' ? '男' : '女' }}</text>
                    <text class="keywords" :inverted="true">{{ setmeal.age }}</text>
                </uni-card>
            </navigator>
        </uni-section>
    </view>
</template>

<script>
export default {
    data() {
        return {
            setmealList: []
        };
    },
    onLoad() {
        this.$axios.post('/setmeal/getSetmeal').then(response => {
            if (response.data.flag) {
                this.setmealList = response.data.data;
            }
        });
    }
};
</script>

<style>
.price {
    padding: 2px 8px;
    color: #00aaff;
    margin-right: 3.3%;
    border: 1px solid #55aaff;
    border-radius: 2px;
}
.keywords {
    padding: 2px 8px;
    color: #ea5504;
    margin-right: 3.3%;
    border: 1px solid #ffb891;
    border-radius: 2px;
}
</style>
