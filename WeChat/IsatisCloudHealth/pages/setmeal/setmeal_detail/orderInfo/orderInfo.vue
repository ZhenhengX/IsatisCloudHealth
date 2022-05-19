<template>
    <view>
        <uni-section>
            <uni-card :isFull="true" :title="setmeal.name" :sub-title="setmeal.remark" :cover="'https://isatis.oss-cn-beijing.aliyuncs.com/' + setmeal.img">
                <text class="keyword">{{ setmeal.sex == '0' ? '性别不限' : setmeal.sex == '1' ? '男' : '女' }}</text>
                <text class="keyword">{{ setmeal.age }}</text>
            </uni-card>
            <uni-section title="预约信息" type="line">
                <uni-card :isFull="true">
                    <uni-forms ref="form" :rules="this.rules" :modelValue="this.orderInfo">
                        <uni-forms-item label="体检人" name="name" :required="true"><uni-easyinput v-model="orderInfo.name" placeholder="请输入体检人姓名" /></uni-forms-item>
                        <uni-forms-item label="性别" name="sex"><uni-data-checkbox v-model="orderInfo.sex" :localdata="sexs" /></uni-forms-item>
                        <uni-forms-item label="手机号" name="telephone" :required="true"><uni-easyinput v-model="orderInfo.telephone" placeholder="请输入手机号" /></uni-forms-item>
                        <uni-forms-item label="身份证号" name="idCard"><uni-easyinput v-model="orderInfo.idCard" placeholder="请输入身份证号" /></uni-forms-item>
                        <uni-forms-item label="体检日期" name="orderDate" :required="true"><uni-datetime-picker type="date" v-model="orderInfo.orderDate" /></uni-forms-item>
                    </uni-forms>
                    <button type="primary" @click="submitOrder()">提交</button>
                </uni-card>
            </uni-section>
        </uni-section>
    </view>
</template>

<script>
export default {
    data() {
        return {
            setmeal: {},
            // 表单校验规则
            rules: {
                name: {
                    // 校验规则
                    rules: [
                        {
                            required: true,
                            errorMessage: '请填写体检人姓名'
                        }
                    ],
                    // 校验时机
                    validateTrigger: 'submit'
                },
                telephone: {
                    rules: [
                        {
                            required: true,
                            errorMessage: '请填写体检人手机号'
                        }
                    ],
                    validateTrigger: 'submit'
                },
                idCard: {
                    rules: [
                        {
                            required: true,
                            errorMessage: '请填写体检人身份证号码'
                        }
                    ],
                    validateTrigger: 'submit'
                },
                orderDate: {
                    rules: [
                        {
                            required: true,
                            errorMessage: '请填写体检日期'
                        }
                    ],
                    validateTrigger: 'submit'
                }
            },
            // 单选数据源
            sexs: [
                {
                    text: '男',
                    value: 1
                },
                {
                    text: '女',
                    value: 2
                }
            ],
            orderInfo: {
                name: '',
                sex: '',
                telephone: '',
                idCard: '',
                orderDate: '',
                setmealId: '',
                memberId: ''
            }
        };
    },
    onLoad(urlPara) {
        this.orderInfo.setmealId = urlPara.id;
        let member = uni.getStorageSync('member');
        this.orderInfo.name = member.name;
        this.orderInfo.sex = member.sex;
        this.orderInfo.telephone = member.phoneNumber;
        this.orderInfo.idCard = member.idCard;
        this.orderInfo.memberId = member.id;
        this.$axios.post('/setmeal/findById?id=' + this.orderInfo.setmealId).then(response => {
            if (response.data.flag) {
                this.setmeal = response.data.data.setmeal;
            }
        });
    },
    methods: {
        //提交预约
        submitOrder() {
            this.$axios.post('/order/submit', this.orderInfo).then(response => {
                if (response.data.flag) {
                    //预约成功，跳转到预约成功页面
                    uni.navigateTo({
                        url: 'orderSuccess/orderSuccess?orderId=' + response.data.data
                    });
                } else {
                    //预约失败，提示预约失败信息
                    uni.showToast({
                        title: response.data.message,
                        icon: 'error'
                    });
                }
            });
        }
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
</style>
