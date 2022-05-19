<template>
    <view>
        <uni-section title="体检预约成功" type="line">
            <view style="margin: 0 auto; text-align: center"><icon type="success" size="120" /></view>
            <uni-card title="预约信息">
                <uni-list :border="false">
                    <uni-list-item :border="false" title="体检人" :rightText="this.orderInfo.member"></uni-list-item>
                    <uni-list-item title="体检套餐" :note="this.orderInfo.setmeal"></uni-list-item>
                    <uni-list-item title="体检日期" :rightText="this.orderInfo.orderDate"></uni-list-item>
                    <uni-list-item title="预约类型" :rightText="this.orderInfo.orderType"></uni-list-item>
                </uni-list>
            </uni-card>
            <uni-card title="注意事项">
                <p>1、体检前三天饮食不宜有太大变化，尽量保证清淡饮食，避免油腻、过甜、过咸的食物，避免饮食不均暴饮暴食，以免影响检查结果。</p>
                <p>2、体检前要注意好好休息，尽量不要做剧烈运动以及情绪也不宜激动，要保证充足的睡眠时间，调整好自己的身体状态。</p>
                <p>3、体检前不要饮酒，酒精会影响到检查的准确性，如导致甘油三酯、转氨酶等检查结果出现异常，干扰到很多检查项目。</p>
                <p>4、体检当天应该保证穿着轻便、简单，另外女士要注意不要穿连裙、连裤袜，以及不要佩戴饰品等，以免影响检查。</p>
                <p>5、女士朋友要注意避开经期，以防经期影响到相关的检查项目。</p>
                <p>6、如果有前列腺或妇科B超检查，需要憋尿，检前可以适当饮水，以保证膀胱充盈后再进行检查。</p>
                <p>7、如果有妇科检查，要注意检前不宜进行夫妻生活，夫妻生活会影响到阴道检查，干扰检查的结果。</p>
                <p>8、做妇科检查前也不宜过度清洁，不宜使用阴道药物，避免过度清洁或是药物干扰，影响到检查的结果。</p>
                <p>9、积极配合医师的检查，保持良好的心态，告知医师自己的真实情况，有助于医师帮助判断身体健康状况。</p>
            </uni-card>
            <navigator open-type="switchTab" url="/pages/index/index"><button type="primary">返回主页</button></navigator>
        </uni-section>
    </view>
</template>

<script>
export default {
    data() {
        return {
            orderInfo: {}
        };
    },
    onLoad(urlPara) {
        let id = urlPara.orderId;
        this.$axios.post('/order/findById/' + id).then(response => {
            this.orderInfo = response.data.data;
        });
    }
};
</script>

<style></style>
